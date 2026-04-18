import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

enum AppThemeMode { light, dark, medium }

class AppThemeController extends ChangeNotifier {
  static const String _themeKey = 'app_theme_mode';
  static const String _backgroundImageKey = 'background_image_path';

  AppThemeMode _themeMode = AppThemeMode.dark;
  String? _backgroundImagePath;
  bool _isLoading = false;

  AppThemeMode get themeMode => _themeMode;
  String? get backgroundImagePath => _backgroundImagePath;
  bool get isLoading => _isLoading;
  bool get hasBackgroundImage =>
      _backgroundImagePath != null && File(_backgroundImagePath!).existsSync();

  ThemeData get currentTheme {
    switch (_themeMode) {
      case AppThemeMode.light:
        return _lightTheme;
      case AppThemeMode.dark:
        return _darkTheme;
      case AppThemeMode.medium:
        return _mediumTheme;
    }
  }

  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00D9FF),
      brightness: Brightness.light,
      surface: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    useMaterial3: true,
    cardTheme: const CardThemeData(color: Colors.white, elevation: 2),
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00D9FF),
      brightness: Brightness.dark,
      surface: Color(0xFF0F172A),
    ),
    scaffoldBackgroundColor: const Color(0xFF0F172A),
    useMaterial3: true,
    cardTheme: const CardThemeData(color: Color(0xFF1E293B), elevation: 0),
  );

  static final ThemeData _mediumTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00D9FF),
      brightness: Brightness.dark,
      surface: const Color(0xFF263238),
    ),
    scaffoldBackgroundColor: const Color(0xFF263238),
    useMaterial3: true,
    cardTheme: CardThemeData(
      color: const Color(0xFF37474F).withValues(alpha: 0.7),
      elevation: 0,
    ),
  );

  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey) ?? 2;
    _themeMode = AppThemeMode.values[themeIndex];
    _backgroundImagePath = prefs.getString(_backgroundImageKey);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, mode.index);
  }

  Future<void> pickBackgroundImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1920,
      maxHeight: 1080,
      imageQuality: 85,
    );

    if (pickedFile != null) {
      _backgroundImagePath = pickedFile.path;
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_backgroundImageKey, pickedFile.path);
    }
  }

  Future<void> removeBackgroundImage() async {
    _backgroundImagePath = null;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_backgroundImageKey);
  }

  Color get backgroundColor {
    switch (_themeMode) {
      case AppThemeMode.light:
        return const Color(0xFFF5F5F5);
      case AppThemeMode.dark:
        return const Color(0xFF0F172A);
      case AppThemeMode.medium:
        return const Color(0xFF263238);
    }
  }

  String get themeName {
    switch (_themeMode) {
      case AppThemeMode.light:
        return 'Claro';
      case AppThemeMode.dark:
        return 'Escuro';
      case AppThemeMode.medium:
        return 'Médio';
    }
  }

  void setPremiumStatus(bool isPremium) {
    notifyListeners();
  }
}

class BackgroundWrapper extends StatelessWidget {
  final Widget child;
  final String? backgroundImagePath;

  const BackgroundWrapper({
    super.key,
    required this.child,
    this.backgroundImagePath,
  });

  @override
  Widget build(BuildContext context) {
    if (backgroundImagePath == null ||
        !File(backgroundImagePath!).existsSync()) {
      return child;
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.file(
          File(backgroundImagePath!),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Container(color: Colors.black.withValues(alpha: 0.4)),
        ),
        child,
      ],
    );
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final radius = borderRadius ?? BorderRadius.circular(16);

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark
                ? Colors.white.withValues(alpha: opacity)
                : Colors.black.withValues(alpha: opacity * 0.5),
            borderRadius: radius,
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: child,
        ),
      ),
    );
  }
}
