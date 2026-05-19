import 'dart:async';

import 'package:flutter/material.dart';

import '../services/currency_preference_controller.dart';
import '../services/locale_ui_strings.dart';
import '../services/user_data_retention_service.dart';

class CurrencySettingsPage extends StatelessWidget {
  const CurrencySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final strings = LocaleUiStrings.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        title: Text(strings.settingsDisplayCurrency),
      ),
      body: ListenableBuilder(
        listenable: CurrencyPreferenceController.instance,
        builder: (context, _) {
          final selectedMode = CurrencyPreferenceController.instance.mode;
          final options = CurrencyPreferenceController.currencyOptions;

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            itemCount: options.length + 2,
            separatorBuilder: (_, index) => index == 0
                ? const SizedBox(height: 12)
                : const Divider(height: 1),
            itemBuilder: (context, index) {
              if (index == 0) {
                return _InfoCard(
                  icon: Icons.payments_outlined,
                  title: strings.text(
                    'Escolha como os valores aparecem',
                    en: 'Choose how values appear',
                    es: 'Elige cómo aparecen los valores',
                  ),
                  text: strings.text(
                    'A opção automática segue o idioma/região do app. As opções manuais trocam apenas a moeda exibida nos valores.',
                    en: 'Automatic follows the app language/region. Manual options only change the currency displayed in values.',
                    es: 'La opción automática sigue el idioma/región de la app. Las opciones manuales solo cambian la moneda mostrada en los valores.',
                  ),
                );
              }

              if (index == 1) {
                return _CurrencyTile(
                  code: 'AUTO',
                  title: strings.text(
                    'Automática (idioma)',
                    en: 'Automatic (language)',
                    es: 'Automática (idioma)',
                  ),
                  subtitle: strings.text(
                    'Segue a moeda padrão do idioma/região',
                    en: 'Follows the default currency for the language/region',
                    es: 'Sigue la moneda predeterminada del idioma/región',
                  ),
                  selected: selectedMode == 'AUTO',
                  onTap: () async {
                    await CurrencyPreferenceController.instance.setCurrencyMode(
                      'AUTO',
                    );
                    unawaited(
                      UserDataRetentionService.instance.backupNow(
                        reason: 'currency',
                      ),
                    );
                  },
                );
              }

              final option = options[index - 2];
              return _CurrencyTile(
                code: option.code,
                title: CurrencyPreferenceController.currencyLabel(option.code),
                subtitle: option.symbol,
                selected: selectedMode == option.code,
                onTap: () async {
                  await CurrencyPreferenceController.instance.setCurrencyMode(
                    option.code,
                  );
                  unawaited(
                    UserDataRetentionService.instance.backupNow(
                      reason: 'currency',
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class _CurrencyTile extends StatelessWidget {
  const _CurrencyTile({
    required this.code,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final String code;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(
        selected ? Icons.radio_button_checked : Icons.radio_button_off,
        color: selected ? scheme.primary : scheme.onSurfaceVariant,
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Text(
        code,
        style: TextStyle(
          color: selected ? scheme.primary : scheme.onSurfaceVariant,
          fontWeight: FontWeight.w700,
        ),
      ),
      onTap: onTap,
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.icon,
    required this.title,
    required this.text,
  });

  final IconData icon;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: scheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: scheme.primary),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: scheme.onSurface,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(text, style: TextStyle(color: scheme.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
