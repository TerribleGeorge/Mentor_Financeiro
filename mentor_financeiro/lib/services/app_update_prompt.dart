import 'dart:convert';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_update/in_app_update.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

/// Verificação leve de atualização na loja + abertura do fluxo nativo (Play / App Store).
class AppUpdatePrompt {
  AppUpdatePrompt._();

  /// Versão na loja (se conhecida), só para texto no diálogo.
  static Future<AppUpdateNotice?> checkForStoreUpdate() async {
    if (kIsWeb) return null;
    try {
      if (Platform.isAndroid) {
        return await _checkAndroid();
      }
      if (Platform.isIOS) {
        return await _checkIos();
      }
    } catch (_) {}
    return null;
  }

  /// Revalida no Android e tenta atualização in-app; caso contrário abre a loja.
  static Future<void> startUpdateFlow() async {
    if (kIsWeb) return;
    try {
      if (Platform.isAndroid) {
        await _startAndroidUpdate();
        return;
      }
      if (Platform.isIOS) {
        await _startIosFromLookup();
      }
    } catch (_) {}
  }

  static Future<AppUpdateNotice?> _checkAndroid() async {
    final info = await InAppUpdate.checkForUpdate();
    if (info.updateAvailability != UpdateAvailability.updateAvailable) {
      return null;
    }
    final code = info.availableVersionCode;
    final label =
        code != null ? 'build Play $code' : null;
    return AppUpdateNotice(versionLabel: label);
  }

  static Future<AppUpdateNotice?> _checkIos() async {
    final pkg = await PackageInfo.fromPlatform();
    final uri = Uri.parse(
      'https://itunes.apple.com/lookup?bundleId=${Uri.encodeComponent(pkg.packageName)}',
    );
    final resp = await http.get(uri).timeout(const Duration(seconds: 12));
    if (resp.statusCode != 200) return null;
    final decoded = jsonDecode(resp.body) as Map<String, dynamic>;
    final count = decoded['resultCount'];
    if (count is! int || count < 1) return null;
    final results = decoded['results'];
    if (results is! List || results.isEmpty) return null;
    final first = results.first;
    if (first is! Map<String, dynamic>) return null;
    final storeVer = first['version'] as String? ?? '';
    if (storeVer.isEmpty) return null;
    if (_compareVersionStrings(storeVer, pkg.version) <= 0) return null;
    return AppUpdateNotice(versionLabel: storeVer);
  }

  static Future<void> _startAndroidUpdate() async {
    try {
      final info = await InAppUpdate.checkForUpdate();
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        if (info.immediateUpdateAllowed) {
          final r = await InAppUpdate.performImmediateUpdate();
          if (r != AppUpdateResult.inAppUpdateFailed) return;
        }
        if (info.flexibleUpdateAllowed) {
          final r = await InAppUpdate.startFlexibleUpdate();
          if (r == AppUpdateResult.success) return;
        }
      }
    } catch (_) {}
    final pkg = await PackageInfo.fromPlatform();
    final market = Uri.parse('market://details?id=${pkg.packageName}');
    if (await canLaunchUrl(market)) {
      await launchUrl(market, mode: LaunchMode.externalApplication);
      return;
    }
    final https = Uri.parse(
      'https://play.google.com/store/apps/details?id=${pkg.packageName}',
    );
    await launchUrl(https, mode: LaunchMode.externalApplication);
  }

  static Future<void> _startIosFromLookup() async {
    final pkg = await PackageInfo.fromPlatform();
    final uri = Uri.parse(
      'https://itunes.apple.com/lookup?bundleId=${Uri.encodeComponent(pkg.packageName)}',
    );
    final resp = await http.get(uri).timeout(const Duration(seconds: 12));
    if (resp.statusCode != 200) return;
    final decoded = jsonDecode(resp.body) as Map<String, dynamic>;
    final results = decoded['results'];
    if (results is! List || results.isEmpty) return;
    final first = results.first;
    if (first is! Map<String, dynamic>) return;
    final trackUrl = first['trackViewUrl'] as String?;
    if (trackUrl == null || trackUrl.isEmpty) return;
    final storeUrl = Uri.parse(trackUrl);
    await launchUrl(storeUrl, mode: LaunchMode.externalApplication);
  }

  /// Compara versões tipo "1.2.10" (sufixos não numéricos são ignorados no segmento).
  static int _compareVersionStrings(String store, String installed) {
    List<int> parts(String v) {
      return v
          .split('.')
          .map((s) => int.tryParse(RegExp(r'^\d+').stringMatch(s) ?? '') ?? 0)
          .toList();
    }

    final a = parts(store);
    final b = parts(installed);
    final n = a.length > b.length ? a.length : b.length;
    for (var i = 0; i < n; i++) {
      final x = i < a.length ? a[i] : 0;
      final y = i < b.length ? b[i] : 0;
      if (x != y) return x.compareTo(y);
    }
    return 0;
  }
}

/// Quando não nulo, deve mostrar aviso ao utilizador.
class AppUpdateNotice {
  const AppUpdateNotice({this.versionLabel});

  final String? versionLabel;
}
