import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locale_ui_strings.dart';
import '../theme/mentor_adaptive_visuals.dart';

/// Temas predefinidos devvoid (sem imagem de fundo personalizada).
/// [obsidian] e [glacier] correspondem à marca **Grimm** e **Hive** na UI.
enum AppThemeMode { voidTheme, cyber, obsidian, glacier }

extension AppThemeModePremium on AppThemeMode {
  /// Cyber, Grimm (obsidian) e Hive (glacier) exigem perfil Premium.
  bool get requiresPremiumEntitlement =>
      this == AppThemeMode.cyber ||
      this == AppThemeMode.obsidian ||
      this == AppThemeMode.glacier;
}

extension AppThemeModeLabels on AppThemeMode {
  String get displayName => switch (this) {
    AppThemeMode.voidTheme => 'Void',
    AppThemeMode.cyber => 'Cyber',
    AppThemeMode.obsidian => 'Grimm',
    AppThemeMode.glacier => 'Hive',
  };

  /// Subtítulo na lista de Definições (preset Void).
  String get settingsSubtitle => switch (this) {
    AppThemeMode.voidTheme => 'Preto absoluto · Hollow Knight',
    AppThemeMode.cyber => 'Amarelo neon · cinza escuro · premium',
    AppThemeMode.obsidian => 'Vermelho e preto · premium',
    AppThemeMode.glacier => 'Laranja e preto · vespa · premium',
  };

  String settingsSubtitleText(LocaleUiStrings strings) => switch (this) {
    AppThemeMode.voidTheme => strings.text(
      'Preto absoluto · Hollow Knight',
      en: 'Absolute black · Hollow Knight',
      es: 'Negro absoluto · Hollow Knight',
    ),
    AppThemeMode.cyber => strings.text(
      'Amarelo neon · cinza escuro · premium',
      en: 'Neon yellow · dark gray · premium',
      es: 'Amarillo neón · gris oscuro · premium',
    ),
    AppThemeMode.obsidian => strings.text(
      'Vermelho e preto · premium',
      en: 'Red and black · premium',
      es: 'Rojo y negro · premium',
    ),
    AppThemeMode.glacier => strings.text(
      'Laranja e preto · vespa · premium',
      en: 'Orange and black · wasp · premium',
      es: 'Naranja y negro · avispa · premium',
    ),
  };
}

class AppThemeController extends ChangeNotifier {
  static final AppThemeController instance = AppThemeController._internal();

  factory AppThemeController() => instance;

  AppThemeController._internal();

  static const String _themeKeyV2 = 'app_theme_preset_v2';
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
    // Estética universal (Void): sempre preto absoluto.
    return const Color(0xFF000000);
  }

  /// Tema escuro: Void / Cyber / Grimm / Hive com [MentorAdaptiveVisuals] + accent por preset.
  ThemeData get themeDark {
    final v = _adaptiveVisuals;
    final accent = v.accentNeon;
    final base = _voidTheme.copyWith(
      colorScheme: _voidTheme.colorScheme.copyWith(
        primary: accent,
        secondary: _secondaryForDarkPreset(_themeMode),
        onSurface: v.textColor,
        onSurfaceVariant: v.secondaryTextColor,
      ),
    );
    return _mergeAdaptive(base, v);
  }

  /// Tema claro (Material light): um preset claro por [AppThemeMode].
  ThemeData get themeLight {
    final v = switch (_themeMode) {
      AppThemeMode.voidTheme => MentorAdaptiveVisuals.presetVoidLight,
      AppThemeMode.cyber => MentorAdaptiveVisuals.presetCyberLight,
      AppThemeMode.obsidian => MentorAdaptiveVisuals.presetGrimmLight,
      AppThemeMode.glacier => MentorAdaptiveVisuals.presetHiveLight,
    };
    final base = _lightBaseTheme.copyWith(
      colorScheme: _lightBaseTheme.colorScheme.copyWith(
        primary: v.accentNeon,
        secondary: v.secondaryTextColor,
        onSurface: v.textColor,
        onSurfaceVariant: v.secondaryTextColor,
      ),
    );
    return _mergeAdaptiveLight(base, v);
  }

  static Color _secondaryForDarkPreset(AppThemeMode mode) {
    switch (mode) {
      case AppThemeMode.voidTheme:
        return _neonLime;
      case AppThemeMode.cyber:
        return const Color(0xFFFFC107);
      case AppThemeMode.obsidian:
        return const Color(0xFFFF5252);
      case AppThemeMode.glacier:
        return const Color(0xFFFF9100);
    }
  }

  /// Compatível com telas que ainda não usam [Theme.of]; equivale ao tema escuro.
  ThemeData get currentTheme => themeDark;

  static const _neonCyan = Color(0xFF00E5FF);
  static const _neonLime = Color(0xFF26DE81);

  static List<Shadow> _softGlow(Color c) => [
    Shadow(
      color: c.withValues(alpha: 0.35),
      blurRadius: 10,
      offset: const Offset(0, 1.5),
    ),
  ];

  static TextTheme _applyLegibleDarkTextTheme(
    TextTheme base,
    MentorAdaptiveVisuals v,
  ) {
    final accent = v.accentNeon;
    final tc = v.textColor;
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        color: accent,
        shadows: _softGlow(accent),
      ),
      displayMedium: base.displayMedium?.copyWith(
        color: accent,
        shadows: _softGlow(accent),
      ),
      displaySmall: base.displaySmall?.copyWith(
        color: accent,
        shadows: _softGlow(accent),
      ),
      headlineLarge: base.headlineLarge?.copyWith(
        color: accent,
        shadows: _softGlow(accent),
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        color: accent,
        shadows: _softGlow(accent),
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        color: accent,
        shadows: _softGlow(accent),
      ),
      titleLarge: base.titleLarge?.copyWith(
        color: accent,
        shadows: _softGlow(accent),
      ),
      titleMedium: base.titleMedium?.copyWith(
        color: accent,
        shadows: _softGlow(accent),
      ),
      titleSmall: base.titleSmall?.copyWith(
        color: accent,
        shadows: _softGlow(accent),
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        color: tc.withValues(alpha: 0.94),
        shadows: _softGlow(accent.withValues(alpha: 0.45)),
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        color: tc.withValues(alpha: 0.9),
        shadows: _softGlow(accent.withValues(alpha: 0.35)),
      ),
      bodySmall: base.bodySmall?.copyWith(
        color: v.secondaryTextColor,
        shadows: _softGlow(accent.withValues(alpha: 0.28)),
      ),
      labelLarge: base.labelLarge?.copyWith(
        color: tc,
        shadows: _softGlow(accent.withValues(alpha: 0.4)),
      ),
      labelMedium: base.labelMedium?.copyWith(
        color: tc.withValues(alpha: 0.9),
        shadows: _softGlow(accent.withValues(alpha: 0.35)),
      ),
      labelSmall: base.labelSmall?.copyWith(
        color: v.secondaryTextColor,
        shadows: _softGlow(accent.withValues(alpha: 0.25)),
      ),
    );
  }

  static final ThemeData _voidTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: _neonCyan,
      onPrimary: Colors.black,
      secondary: _neonLime,
      onSecondary: Colors.black,
      surface: const Color(0xFF000000),
      onSurface: Colors.white,
      surfaceContainerHighest: const Color(0xFF0D1118),
      outline: const Color(0xFF0B2A35),
      outlineVariant: const Color(0xFF07202A),
    ),
    scaffoldBackgroundColor: const Color(0xFF000000),
    useMaterial3: true,
    cardTheme: const CardThemeData(color: Color(0xFF0D1118), elevation: 0),
  );

  static final ThemeData _lightBaseTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: _neonCyan,
      onPrimary: Colors.black,
      secondary: _neonLime,
      onSecondary: Colors.black,
      surface: const Color(0xFFF8FAFC),
      onSurface: const Color(0xFF0A1628),
      surfaceContainerHighest: const Color(0xFFE2E8F0),
      outline: const Color(0xFFCBD5E1),
      outlineVariant: const Color(0xFFE2E8F0),
    ),
    scaffoldBackgroundColor: Colors.white,
    useMaterial3: true,
    cardTheme: const CardThemeData(color: Color(0xFFF1F5F9), elevation: 0),
  );

  ThemeData _mergeAdaptiveLight(ThemeData base, MentorAdaptiveVisuals v) {
    final textTheme = base.textTheme.apply(
      bodyColor: v.textColor,
      displayColor: v.textColor,
      decorationColor: v.secondaryTextColor,
    );
    return base.copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      cardTheme: CardThemeData(
        color: v.widgetColor.withValues(alpha: 0.85),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
      ),
      extensions: <ThemeExtension<dynamic>>[v],
      colorScheme: base.colorScheme.copyWith(
        onSurface: v.textColor,
        onSurfaceVariant: v.secondaryTextColor,
      ),
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: v.textColor.withValues(alpha: 0.85)),
        hintStyle: TextStyle(color: v.secondaryTextColor),
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

  ThemeData _mergeAdaptive(ThemeData base, MentorAdaptiveVisuals v) {
    final accent = v.accentNeon;
    final textTheme = _applyLegibleDarkTextTheme(base.textTheme, v);
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
      textTheme: textTheme,
      primaryTextTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: v.secondaryTextColor,
          shadows: _softGlow(accent.withValues(alpha: 0.65)),
        ),
        hintStyle: TextStyle(
          color: v.secondaryTextColor.withValues(alpha: 0.85),
          shadows: _softGlow(accent.withValues(alpha: 0.4)),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: accent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: accent),
        titleTextStyle: TextStyle(
          color: accent,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          shadows: _softGlow(accent),
        ),
      ),
      listTileTheme: ListTileThemeData(
        textColor: v.textColor,
        iconColor: accent,
        titleTextStyle: TextStyle(
          color: accent,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        subtitleTextStyle: TextStyle(color: v.secondaryTextColor, fontSize: 13),
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
    final stored = prefs.getInt(_themeKeyV2);
    if (stored != null && stored >= 0 && stored < AppThemeMode.values.length) {
      _themeMode = AppThemeMode.values[stored];
    } else {
      _themeMode = AppThemeMode.voidTheme;
    }

    _isPremium = prefs.getBool(_isPremiumKey) ?? false;

    // Tema premium na prefs sem flag premium → estado inválido (ex.: sub expirou).
    if (_themeMode.requiresPremiumEntitlement && !_isPremium) {
      _themeMode = AppThemeMode.voidTheme;
      await prefs.setInt(_themeKeyV2, _themeMode.index);
    }

    _recomputeAdaptiveVisuals();

    // Evitar poluição do console em produção.

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setPremiumStatus(bool isPremium) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isPremiumKey, isPremium);
    _isPremium = isPremium;

    if (!isPremium && _themeMode.requiresPremiumEntitlement) {
      _themeMode = AppThemeMode.voidTheme;
      _recomputeAdaptiveVisuals();
      await prefs.setInt(_themeKeyV2, _themeMode.index);
    }

    notifyListeners();
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    _recomputeAdaptiveVisuals();
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKeyV2, _themeMode.index);
    notifyListeners();
  }

  Color get backgroundColor => backdropBaseColor;

  String get themeName => _themeMode.displayName;
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
