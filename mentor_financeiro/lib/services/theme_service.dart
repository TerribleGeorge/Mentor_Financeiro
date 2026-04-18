import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

enum AppThemeMode { light, dark, medium }

class ThemeService extends ChangeNotifier {
  static const String _themeKey = 'app_theme_mode';
  static const String _backgroundImageKey = 'background_image_path';

  AppThemeMode _themeMode = AppThemeMode.dark;
  String? _backgroundImagePath;
  bool _isInitialized = false;

  AppThemeMode get themeMode => _themeMode;
  String? get backgroundImagePath => _backgroundImagePath;
  bool get isInitialized => _isInitialized;

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
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF00D9FF),
      brightness: Brightness.dark,
      surface: const Color(0xFF0F172A),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  Future<void> initialize() async {
    if (_isInitialized) return;

    final prefs = await SharedPreferences.getInstance();

    final themeIndex = prefs.getInt(_themeKey) ?? 2;
    _themeMode = AppThemeMode.values[themeIndex];

    _backgroundImagePath = prefs.getString(_backgroundImageKey);

    _isInitialized = true;
    notifyListeners();
  }

  Future<void> setThemeMode(AppThemeMode mode) async {
    if (_themeMode == mode) return;

    _themeMode = mode;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, mode.index);
  }

  Future<void> setBackgroundImage(String? path) async {
    _backgroundImagePath = path;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    if (path != null) {
      await prefs.setString(_backgroundImageKey, path);
    } else {
      await prefs.remove(_backgroundImageKey);
    }
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
      await setBackgroundImage(pickedFile.path);
    }
  }

  Future<void> removeBackgroundImage() async {
    await setBackgroundImage(null);
  }

  Color get backgroundColor {
    if (_backgroundImagePath != null) {
      return Colors.transparent;
    }
    switch (_themeMode) {
      case AppThemeMode.light:
        return const Color(0xFFF5F5F5);
      case AppThemeMode.dark:
        return const Color(0xFF0F172A);
      case AppThemeMode.medium:
        return const Color(0xFF263238);
    }
  }

  bool get hasBackgroundImage =>
      _backgroundImagePath != null && File(_backgroundImagePath!).existsSync();
}

class GlassCard extends StatelessWidget {
  final Widget child;
  final double blur;
  final double opacity;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BorderRadius? borderRadius;

  const GlassCard({
    super.key,
    required this.child,
    this.blur = 10.0,
    this.opacity = 0.2,
    this.padding,
    this.margin,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: margin,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding ?? const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withValues(alpha: opacity)
                  : Colors.black.withValues(alpha: opacity * 0.5),
              borderRadius: borderRadius ?? BorderRadius.circular(16),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.white.withValues(alpha: 0.2),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  final String? imagePath;
  final Widget child;
  final BlendMode blendMode;

  const BackgroundImage({
    super.key,
    this.imagePath,
    required this.child,
    this.blendMode = BlendMode.overlay,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath == null || !File(imagePath!).existsSync()) {
      return child;
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.file(
          File(imagePath!),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
        ),
        Container(color: Colors.black.withValues(alpha: 0.5)),
        child,
      ],
    );
  }
}
