import 'package:flutter/material.dart';
import 'relatorios_screen.dart';
import '../widgets/premium_wrapper.dart';

class GraficosScreen extends StatelessWidget {
  const GraficosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PremiumWrapper(
      feature: 'Análises personalizadas (dashboards)',
      child: DashboardScreen(
        title: 'Gráficos',
        showBackButton: false,
        chartsOnly: true,
      ),
    );
  }
}

