import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_notification_listener/flutter_notification_listener.dart';
import 'package:permission_handler/permission_handler.dart';

/// Interceptação via [flutter_notification_listener] (Android).
///
/// Filtra PicPay e Google Wallet e registra no console. A permissão de leitura
/// de notificações é solicitada após o login em [promptAfterLogin].
class FlutterNotificationInterceptor {
  FlutterNotificationInterceptor._();

  static bool _pluginInitialized = false;

  static const Set<String> _exactPackages = {
    'com.picpay',
    'br.com.picpay.partnerapp',
    'com.google.android.apps.walletnfcrel',
  };

  static bool _isTargetPackage(String? packageName) {
    if (packageName == null || packageName.isEmpty) return false;
    final p = packageName.toLowerCase();
    if (_exactPackages.contains(p)) return true;
    if (p.contains('picpay')) return true;
    if (p.contains('walletnfcrel')) return true;
    return false;
  }

  @pragma('vm:entry-point')
  static void _onNotification(NotificationEvent evt) {
    if (!_isTargetPackage(evt.packageName)) return;
    debugPrint(
      '[PicPay/Wallet notification] package=${evt.packageName} '
      'title=${evt.title} text=${evt.text}',
    );
  }

  static Future<void> _ensurePluginInitialized() async {
    if (_pluginInitialized) return;
    _pluginInitialized = true;
    await NotificationsListener.initialize(callbackHandle: _onNotification);
  }

  /// Android 13+: permissão para exibir a notificação do foreground service do plugin.
  static Future<void> _ensurePostNotificationsGranted() async {
    if (!Platform.isAndroid) return;
    final status = await Permission.notification.status;
    if (status.isGranted) return;
    await Permission.notification.request();
  }

  /// Chamado após login bem-sucedido: inicializa o plugin, pede POST_NOTIFICATIONS
  /// se necessário e abre as configurações de acesso a notificações se o listener
  /// ainda não estiver autorizado.
  static Future<void> promptAfterLogin() async {
    if (!Platform.isAndroid) return;
    await _ensurePluginInitialized();
    await _ensurePostNotificationsGranted();

    final hasListener = await NotificationsListener.hasPermission ?? false;
    if (!hasListener) {
      await NotificationsListener.openPermissionSettings();
      return;
    }

    await _startServiceIfNeeded();
  }

  /// Ao abrir a Home (ex.: utilizador voltou das definições), inicia o serviço
  /// sem voltar a abrir o ecrã de permissões.
  static Future<void> tryStartServiceIfPermitted() async {
    if (!Platform.isAndroid) return;
    await _ensurePluginInitialized();
    await _ensurePostNotificationsGranted();

    final hasListener = await NotificationsListener.hasPermission ?? false;
    if (!hasListener) return;

    await _startServiceIfNeeded();
  }

  static Future<void> _startServiceIfNeeded() async {
    final running = await NotificationsListener.isRunning ?? false;
    if (running) return;

    await NotificationsListener.startService(
      foreground: true,
      title: 'Mentor Financeiro',
      description: 'Monitor de notificações',
    );
  }
}
