import 'package:flutter/material.dart';
import 'relatorios_screen.dart';
import '../services/locale_ui_strings.dart';
import '../widgets/premium_wrapper.dart';

class GraficosScreen extends StatelessWidget {
  const GraficosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PremiumWrapper(
      feature: LocaleUiStrings.of(context).text(
        'Análises personalizadas (dashboards)',
        en: 'Personalized analytics (dashboards)',
        es: 'Análisis personalizados (dashboards)',
      ),
      child: DashboardScreen(
        title: LocaleUiStrings.of(
          context,
        ).text('Gráficos', en: 'Charts', es: 'Gráficos'),
        showBackButton: false,
        chartsOnly: true,
      ),
    );
  }
}
