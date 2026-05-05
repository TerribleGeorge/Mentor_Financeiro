import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_screen.dart';
import 'graficos_screen.dart';
import 'historico_screen.dart';
import 'perfil_screen.dart';
import '../services/notification_listener_service.dart';

class MainNavigation extends StatefulWidget {
  final int initialIndex;

  const MainNavigation({super.key, this.initialIndex = 0});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _currentIndex;
  final _notificationListener = NotificationListenerService();

  final List<Widget> _screens = [
    const HomeScreen(),
    const GraficosScreen(),
    const HistoricoScreen(),
    const PerfilScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(0, _screens.length - 1);
    _notificationListener.iniciar();
  }

  @override
  void dispose() {
    _notificationListener.parar();
    super.dispose();
  }

  void _onTabTapped(int index) {
    if (index != _currentIndex) {
      HapticFeedback.lightImpact();
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bright = theme.brightness == Brightness.light;
    final edge = bright
        ? Colors.white.withValues(alpha: 0.7)
        : Colors.black.withValues(alpha: 0.5);
    final bar = theme.colorScheme.surface.withValues(alpha: 0.88);
    final accent = theme.colorScheme.primary;
    final labelIdle = theme.colorScheme.onSurface.withValues(alpha: 0.5);

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 100,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [edge, Colors.transparent],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 120,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [edge, Colors.transparent],
                  ),
                ),
              ),
            ),
          ),
          IndexedStack(index: _currentIndex, children: _screens),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: bar,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: bright ? 0.06 : 0.32),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_outlined, Icons.home, 'Início', accent, labelIdle),
                _buildNavItem(
                  1,
                  Icons.pie_chart_outline,
                  Icons.pie_chart,
                  'Gráficos',
                  accent,
                  labelIdle,
                ),
                _buildNavItem(
                  2,
                  Icons.history_outlined,
                  Icons.history,
                  'Histórico',
                  accent,
                  labelIdle,
                ),
                _buildNavItem(3, Icons.person_outline, Icons.person, 'Perfil', accent, labelIdle),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData icon,
    IconData activeIcon,
    String label,
    Color accent,
    Color labelIdle,
  ) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? accent : labelIdle;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? accent.withValues(alpha: 0.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isSelected ? activeIcon : icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
