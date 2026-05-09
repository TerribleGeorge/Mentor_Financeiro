import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Catálogo das preferências locais que precisam sobreviver a mudanças de versão.
///
/// Atualizações normais do Android preservam SharedPreferences, mas este catálogo
/// permite restaurar dados se alguma migração futura mudar chaves ou se o usuário
/// reinstalar e entrar novamente com a mesma conta Firebase.
abstract final class UserDataRetentionPrefs {
  static const int schemaVersion = 1;

  static const Set<String> exactKeys = {
    'nome_usuario',
    'email_usuario',
    'uid',
    'metodo_login',
    'configurado',
    'onboarding_completo',
    'sonho',
    'valor_sonho',
    'moeda',
    'idioma',
    'is_premium',
    'plano_contratado',
    'notif_listener_prompted',
    'notif_monitoring_enabled',
    'material_theme_mode_v1',
    'app_theme_preset_v2',
    'user_persona',
    'mentor_flow_onboarding_done',
    'mentor_flow_persona_setup_done',
    'mentor_flow_legacy_migrated',
    'mentor_flow_tour_completed',
    'mentoria_completed_lessons_v1',
    'regional_country_manual',
    'regional_country_auto',
  };

  static const List<String> prefixes = [
    'valor_',
    'ativo_',
    'gastos_',
    'ganhos_',
  ];

  static bool shouldBackup(String key) {
    if (exactKeys.contains(key)) return true;
    return prefixes.any(key.startsWith);
  }
}

class UserDataRetentionStatus {
  const UserDataRetentionStatus({
    this.lastBackupAt,
    this.lastRestoreAt,
    this.lastError,
  });

  final DateTime? lastBackupAt;
  final DateTime? lastRestoreAt;
  final String? lastError;

  bool get hasBackup => lastBackupAt != null;
}

class UserDataRetentionService {
  UserDataRetentionService._();
  static final UserDataRetentionService instance = UserDataRetentionService._();

  static const _lastBackupKey = 'data_retention_last_backup_at';
  static const _lastRestoreKey = 'data_retention_last_restore_at';
  static const _lastErrorKey = 'data_retention_last_error';
  static const _restoreSchemaKey = 'data_retention_restored_schema_version';

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  DocumentReference<Map<String, dynamic>> _backupRef(String uid) => _firestore
      .collection('usuarios')
      .doc(uid)
      .collection('app_state')
      .doc('local_preferences');

  Future<UserDataRetentionStatus> status() async {
    final prefs = await SharedPreferences.getInstance();
    return UserDataRetentionStatus(
      lastBackupAt: DateTime.tryParse(prefs.getString(_lastBackupKey) ?? ''),
      lastRestoreAt: DateTime.tryParse(prefs.getString(_lastRestoreKey) ?? ''),
      lastError: prefs.getString(_lastErrorKey),
    );
  }

  Future<void> backupNow({String reason = 'auto'}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final prefs = await SharedPreferences.getInstance();
    final entries = <Map<String, Object?>>[];
    final keys = prefs.getKeys().where(UserDataRetentionPrefs.shouldBackup);

    for (final key in keys) {
      final encoded = _encodePreference(key, prefs.get(key));
      if (encoded != null) entries.add(encoded);
    }

    try {
      final info = await PackageInfo.fromPlatform();
      final now = DateTime.now();
      await _backupRef(user.uid).set({
        'schemaVersion': UserDataRetentionPrefs.schemaVersion,
        'appVersion': '${info.version}+${info.buildNumber}',
        'updatedAt': FieldValue.serverTimestamp(),
        'updatedAtMillis': now.millisecondsSinceEpoch,
        'reason': reason,
        'preferences': entries,
      }, SetOptions(merge: true));
      await prefs.setString(_lastBackupKey, now.toIso8601String());
      await prefs.remove(_lastErrorKey);
    } catch (e, st) {
      await prefs.setString(_lastErrorKey, e.toString());
      if (kDebugMode) {
        debugPrint('UserDataRetention backup: $e\n$st');
      }
    }
  }

  /// Restaura preferências a partir da nuvem.
  ///
  /// Por padrão só preenche chaves ausentes/vazias. Mesmo em restauração manual
  /// ([overwrite] true), valores vazios vindos da nuvem não substituem valores
  /// locais preenchidos.
  Future<void> restoreIfNeeded({bool overwrite = false}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final prefs = await SharedPreferences.getInstance();
    try {
      final snap = await _backupRef(user.uid).get();
      final data = snap.data();
      if (data == null) return;

      final schema = (data['schemaVersion'] as num?)?.toInt() ?? 0;
      final rawPreferences = data['preferences'];
      if (rawPreferences is! List) return;

      var restoredAny = false;
      for (final item in rawPreferences) {
        if (item is! Map) continue;
        final key = item['key']?.toString();
        if (key == null || !UserDataRetentionPrefs.shouldBackup(key)) continue;

        final cloudValue = item['value'];
        final localValue = prefs.get(key);
        if (!_shouldRestoreValue(
          localValue,
          cloudValue,
          overwrite: overwrite,
        )) {
          continue;
        }

        final restored = await _restorePreference(
          prefs,
          key,
          item['type']?.toString(),
          cloudValue,
        );
        restoredAny = restoredAny || restored;
      }

      await prefs.setInt(_restoreSchemaKey, schema);
      if (restoredAny) {
        await prefs.setString(
          _lastRestoreKey,
          DateTime.now().toIso8601String(),
        );
      }
      await prefs.remove(_lastErrorKey);
    } catch (e, st) {
      await prefs.setString(_lastErrorKey, e.toString());
      if (kDebugMode) {
        debugPrint('UserDataRetention restore: $e\n$st');
      }
    }
  }

  Future<void> restoreFromCloud() => restoreIfNeeded(overwrite: true);

  Map<String, Object?>? _encodePreference(String key, Object? value) {
    if (value is String) {
      return {'key': key, 'type': 'string', 'value': value};
    }
    if (value is bool) {
      return {'key': key, 'type': 'bool', 'value': value};
    }
    if (value is int) {
      return {'key': key, 'type': 'int', 'value': value};
    }
    if (value is double) {
      return {'key': key, 'type': 'double', 'value': value};
    }
    if (value is List<String>) {
      return {'key': key, 'type': 'stringList', 'value': value};
    }
    return null;
  }

  bool _shouldRestoreValue(
    Object? localValue,
    Object? cloudValue, {
    required bool overwrite,
  }) {
    if (_hasUsefulValue(localValue) && !_hasUsefulValue(cloudValue)) {
      return false;
    }
    if (!overwrite && _hasUsefulValue(localValue)) {
      return false;
    }
    return cloudValue != null;
  }

  bool _hasUsefulValue(Object? value) {
    if (value == null) return false;
    if (value is String) return value.trim().isNotEmpty;
    if (value is List) return value.isNotEmpty;
    return true;
  }

  Future<bool> _restorePreference(
    SharedPreferences prefs,
    String key,
    String? type,
    Object? value,
  ) async {
    switch (type) {
      case 'string':
        if (value is String) return prefs.setString(key, value);
      case 'bool':
        if (value is bool) return prefs.setBool(key, value);
      case 'int':
        if (value is num) return prefs.setInt(key, value.toInt());
      case 'double':
        if (value is num) return prefs.setDouble(key, value.toDouble());
      case 'stringList':
        if (value is List) {
          return prefs.setStringList(
            key,
            value.map((e) => e.toString()).toList(),
          );
        }
    }
    return false;
  }
}
