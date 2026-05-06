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

  ThemeData get currentTheme {
    // Estética universal (Void): tema único para Free/Premium.
    return _mergeAdaptive(_voidTheme, _adaptiveVisuals);
  }

  static const _neonCyan = Color(0xFF00E5FF);
  static const _neonLime = Color(0xFF26DE81);

  static List<Shadow> _softGlow(Color c) => [
        Shadow(
          color: c.withValues(alpha: 0.35),
          blurRadius: 10,
          offset: const Offset(0, 1.5),
        ),
      ];

  static TextTheme _applyUniversalLegibleTextTheme(TextTheme base) {
    // Tudo claro, sem texto escuro em nenhuma tela.
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        color: Colors.white,
        shadows: _softGlow(_neonCyan),
      ),
      displayMedium: base.displayMedium?.copyWith(
        color: Colors.white,
        shadows: _softGlow(_neonCyan),
      ),
      displaySmall: base.displaySmall?.copyWith(
        color: Colors.white,
        shadows: _softGlow(_neonCyan),
      ),
      headlineLarge: base.headlineLarge?.copyWith(
        color: Colors.white,
        shadows: _softGlow(_neonCyan),
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        color: Colors.white,
        shadows: _softGlow(_neonCyan),
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        color: Colors.white,
        shadows: _softGlow(_neonCyan),
      ),
      titleLarge: base.titleLarge?.copyWith(
        color: Colors.white,
        shadows: _softGlow(_neonCyan),
      ),
      titleMedium: base.titleMedium?.copyWith(
        color: Colors.white,
        shadows: _softGlow(_neonCyan),
      ),
      titleSmall: base.titleSmall?.copyWith(
        color: Colors.white,
        shadows: _softGlow(_neonCyan),
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        color: Colors.white.withValues(alpha: 0.92),
        shadows: _softGlow(_neonCyan),
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        color: Colors.white.withValues(alpha: 0.9),
        shadows: _softGlow(_neonCyan),
      ),
      bodySmall: base.bodySmall?.copyWith(
        color: Colors.white.withValues(alpha: 0.78),
        shadows: _softGlow(_neonCyan),
      ),
      labelLarge: base.labelLarge?.copyWith(
        color: Colors.white,
        shadows: _softGlow(_neonCyan),
      ),
      labelMedium: base.labelMedium?.copyWith(
        color: Colors.white.withValues(alpha: 0.9),
        shadows: _softGlow(_neonCyan),
      ),
      labelSmall: base.labelSmall?.copyWith(
        color: Colors.white.withValues(alpha: 0.78),
        shadows: _softGlow(_neonCyan),
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

  // Temas antigos (Cyber/Grimm/Hive) removidos: estética universal agora é Void.

  ThemeData _mergeAdaptive(ThemeData base, MentorAdaptiveVisuals v) {
    final textTheme = _applyUniversalLegibleTextTheme(base.textTheme);
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
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.8),
          shadows: _softGlow(_neonCyan),
        ),
        hintStyle: TextStyle(
          color: Colors.white.withValues(alpha: 0.55),
          shadows: _softGlow(_neonCyan),
        ),
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
          shadows: _softGlow(_neonCyan),
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
    // Estética universal: sempre Void, independentemente de prefs antigas.
    _themeMode = AppThemeMode.voidTheme;
    await prefs.setInt(_themeKeyV2, _themeMode.index);

    _isPremium = prefs.getBool(_isPremiumKey) ?? false;
    _recomputeAdaptiveVisuals();

    // Evitar poluição do console em produção.

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setPremiumStatus(bool isPremium) async {
    _isPremium = isPremium;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isPremiumKey, isPremium);
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    // Universal Void: ignorar trocas para outros temas.
    if (mode != AppThemeMode.voidTheme) return;
    if (_themeMode == AppThemeMode.voidTheme) return;
    _themeMode = AppThemeMode.voidTheme;
    _recomputeAdaptiveVisuals();
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKeyV2, AppThemeMode.voidTheme.index);
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
