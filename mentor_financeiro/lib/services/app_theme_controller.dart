import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/mentor_adaptive_visuals.dart';

/// Temas predefinidos devvoid (sem imagem de fundo personalizada).
/// [obsidian] e [glacier] correspondem à marca **Grimm** e **Hive** na UI.
enum AppThemeMode { voidTheme, cyber, obsidian, glacier }

extension AppThemeModePremium on AppThemeMode {
  /// Cyber, Grimm (obsidian) e Hive (glacier) exigem entitlement premium RevenueCat.
  bool get requiresPremiumEntitlement =>
      this == AppThemeMode.cyber ||
      this == AppThemeMode.obsidian ||
      this == AppThemeMode.glacier;
}

class AppThemeController extends ChangeNotifier {
  static final AppThemeController instance = AppThemeController._internal();

  factory AppThemeController() => instance;

  AppThemeController._internal();

  static const String _themeKeyV2 = 'app_theme_preset_v2';
  static const String _themeKeyLegacy = 'app_theme_mode';
  static const String _isPremiumKey = 'is_premium';

  AppThemeMode _themeMode = AppThemeMode.voidTheme;
  bool _isLoading = false;
  bool _isPremium = false;
  MentorAdaptiveVisuals _adaptiveVisuals = MentorAdaptiveVisuals.presetVoid;
  Future<void>? _initializeFuture;

  AppThemeMode get themeMode => _themeMode;
  bool get isLoading => _isLoading;
  bool get isPremium => _isPremium;

  Color get textColor => _adaptiveVisuals.textColor;

  Color get widgetColor => _adaptiveVisuals.widgetColor;

  Color get backdropBaseColor {
    switch (_themeMode) {
      case AppThemeMode.voidTheme:
        return const Color(0xFF000000);
      case AppThemeMode.cyber:
        return const Color(0xFF1A1D26);
      case AppThemeMode.obsidian:
        return const Color(0xFF2D3238);
      case AppThemeMode.glacier:
        return const Color(0xFFF0F9FF);
    }
  }

  ThemeData get currentTheme {
    final ThemeData base = switch (_themeMode) {
      AppThemeMode.voidTheme => _voidTheme,
      AppThemeMode.cyber => _cyberTheme,
      AppThemeMode.obsidian => _obsidianTheme,
      AppThemeMode.glacier => _glacierTheme,
    };
    return _mergeAdaptive(base, _adaptiveVisuals);
  }

  static final ThemeData _voidTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00E5FF),
      brightness: Brightness.dark,
      surface: Color(0xFF000000),
      primary: Color(0xFF00E5FF),
    ),
    scaffoldBackgroundColor: const Color(0xFF000000),
    useMaterial3: true,
    cardTheme: const CardThemeData(color: Color(0xFF0A0A0A), elevation: 0),
  );

  static final ThemeData _cyberTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFD946EF),
      brightness: Brightness.dark,
      surface: Color(0xFF1A1D26),
      primary: Color(0xFFE879F9),
    ),
    scaffoldBackgroundColor: const Color(0xFF1A1D26),
    useMaterial3: true,
    cardTheme: CardThemeData(
      color: const Color(0xFF252936).withValues(alpha: 0.55),
      elevation: 0,
    ),
  );

  static final ThemeData _obsidianTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFC0C5CE),
      brightness: Brightness.dark,
      surface: Color(0xFF2D3238),
      primary: Color(0xFFC0C5CE),
    ),
    scaffoldBackgroundColor: const Color(0xFF2D3238),
    useMaterial3: true,
    cardTheme: const CardThemeData(color: Color(0xFF3D444D), elevation: 0),
  );

  static final ThemeData _glacierTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF0EA5E9),
      brightness: Brightness.light,
      surface: Color(0xFFF8FAFC),
      primary: Color(0xFF0284C7),
      onSurface: Color(0xFF0A1628),
    ),
    scaffoldBackgroundColor: const Color(0xFFF0F9FF),
    useMaterial3: true,
    cardTheme: const CardThemeData(color: Color(0xFFEFF6FF), elevation: 0),
  );

  ThemeData _mergeAdaptive(ThemeData base, MentorAdaptiveVisuals v) {
    return base.copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      cardTheme: CardThemeData(
        color: v.widgetColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
      ),
      extensions: <ThemeExtension<dynamic>>[v],
      colorScheme: base.colorScheme.copyWith(
        onSurface: v.textColor,
        onSurfaceVariant: v.secondaryTextColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: v.textColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: v.textColor),
        titleTextStyle: TextStyle(
          color: v.textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      listTileTheme: ListTileThemeData(
        textColor: v.textColor,
        iconColor: v.secondaryTextColor,
      ),
    );
  }

  void _recomputeAdaptiveVisuals() {
    switch (_themeMode) {
      case AppThemeMode.voidTheme:
        _adaptiveVisuals = MentorAdaptiveVisuals.presetVoid;
      case AppThemeMode.cyber:
        _adaptiveVisuals = MentorAdaptiveVisuals.presetCyber;
      case AppThemeMode.obsidian:
        _adaptiveVisuals = MentorAdaptiveVisuals.presetObsidian;
      case AppThemeMode.glacier:
        _adaptiveVisuals = MentorAdaptiveVisuals.presetGlacier;
    }
  }

  Future<void> initialize() {
    return _initializeFuture ??= _initialize();
  }

  Future<void> _initialize() async {
    _isLoading = true;

    final prefs = await SharedPreferences.getInstance();
    final v2 = prefs.getInt(_themeKeyV2);
    if (v2 != null && v2 >= 0 && v2 < AppThemeMode.values.length) {
      _themeMode = AppThemeMode.values[v2];
    } else {
      final legacy = prefs.getInt(_themeKeyLegacy);
      if (legacy != null && legacy >= 0 && legacy <= 2) {
        _themeMode = switch (legacy) {
          0 => AppThemeMode.glacier,
          1 => AppThemeMode.voidTheme,
          _ => AppThemeMode.obsidian,
        };
      } else {
        _themeMode = AppThemeMode.voidTheme;
      }
      await prefs.setInt(_themeKeyV2, _themeMode.index);
    }

    _isPremium = prefs.getBool(_isPremiumKey) ?? false;
    if (!_isPremium && _themeMode.requiresPremiumEntitlement) {
      _themeMode = AppThemeMode.voidTheme;
      await prefs.setInt(_themeKeyV2, _themeMode.index);
    }
    _recomputeAdaptiveVisuals();

    debugPrint(
      'AppThemeController initialized - isPremium: $_isPremium, tema: $_themeMode',
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setPremiumStatus(bool isPremium) async {
    _isPremium = isPremium;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isPremiumKey, isPremium);
    debugPrint('Premium status updated: $isPremium');
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    if (mode.requiresPremiumEntitlement && !_isPremium) {
      return;
    }
    if (_themeMode == mode) return;
    _themeMode = mode;
    _recomputeAdaptiveVisuals();
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKeyV2, mode.index);
  }

  Color get backgroundColor => backdropBaseColor;

  String get themeName {
    switch (_themeMode) {
      case AppThemeMode.voidTheme:
        return 'Void';
      case AppThemeMode.cyber:
        return 'Cyber';
      case AppThemeMode.obsidian:
        return 'Grimm';
      case AppThemeMode.glacier:
        return 'Hive';
    }
  }
}

class GlassCard extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  const GlassCard({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.opacity = 0.15,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final v = context.mentorAdaptive;
    final radius = borderRadius ?? BorderRadius.circular(16);

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: v.widgetColor,
            borderRadius: radius,
            border: Border.all(color: v.textColor.withValues(alpha: 0.12)),
          ),
          child: child,
        ),
      ),
    );
  }
}
