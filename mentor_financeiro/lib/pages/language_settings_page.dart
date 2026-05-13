import 'dart:async';

import 'package:flutter/material.dart';

import '../services/locale_controller.dart';
import '../services/user_data_retention_service.dart';

class LanguageSettingsPage extends StatelessWidget {
  const LanguageSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        title: const Text('Idioma do app'),
      ),
      body: ListenableBuilder(
        listenable: LocaleController.instance,
        builder: (context, _) {
          final selectedCode = LocaleController.instance.locale.languageCode;

          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            itemCount: LocaleController.languageOptions.length + 1,
            separatorBuilder: (_, index) => index == 0
                ? const SizedBox(height: 12)
                : const Divider(height: 1),
            itemBuilder: (context, index) {
              if (index == 0) {
                return _InfoCard(
                  icon: Icons.translate_outlined,
                  title: 'Escolha o idioma da interface',
                  text:
                      'Português, inglês e espanhol têm tradução própria. Os demais idiomas usam textos em inglês até receberem tradução completa.',
                );
              }

              final option = LocaleController.languageOptions[index - 1];
              final selected = option.code == selectedCode;
              final translated = LocaleController.isTranslatedLanguageCode(
                option.code,
              );

              return ListTile(
                leading: Icon(
                  selected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: selected ? scheme.primary : scheme.onSurfaceVariant,
                ),
                title: Text(option.label),
                subtitle: translated
                    ? const Text('Tradução nativa disponível')
                    : const Text('Usa textos em inglês por enquanto'),
                onTap: () async {
                  await LocaleController.instance.setLanguageCode(option.code);
                  unawaited(
                    UserDataRetentionService.instance.backupNow(
                      reason: 'language',
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
