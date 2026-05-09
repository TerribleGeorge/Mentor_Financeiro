import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_data_retention_service.dart';

/// Controla [ThemeMode] do [MaterialApp] (claro / escuro / sistema).
class ThemeController extends ChangeNotifier {
  ThemeController._();

  static final ThemeController instance = ThemeController._();

  factory ThemeController() => instance;

  static const String _prefsKey = 'material_theme_mode_v1';

  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getInt(_prefsKey);
    if (raw != null && raw >= 0 && raw < ThemeMode.values.length) {
      _themeMode = ThemeMode.values[raw];
    } else {
      _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_prefsKey, mode.index);
    unawaited(
      UserDataRetentionService.instance.backupNow(reason: 'theme_mode'),
    );
    notifyListeners();
  }
}
