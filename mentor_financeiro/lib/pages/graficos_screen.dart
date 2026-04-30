import 'package:flutter/material.dart';
import 'relatorios_screen.dart';

class GraficosScreen extends StatelessWidget {
  const GraficosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardScreen(
      title: 'Gráficos',
      showBackButton: false,
      chartsOnly: true,
    );
  }
}

