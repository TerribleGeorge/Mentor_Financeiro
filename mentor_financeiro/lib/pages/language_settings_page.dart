import 'dart:async';

import 'package:flutter/material.dart';

import '../services/locale_controller.dart';
import '../services/locale_ui_strings.dart';
import '../services/user_data_retention_service.dart';

class LanguageSettingsPage extends StatefulWidget {
  const LanguageSettingsPage({super.key});

  @override
  State<LanguageSettingsPage> createState() => _LanguageSettingsPageState();
}

class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  late String _pendingCode;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _pendingCode = LocaleController.instance.locale.languageCode;
  }

  Future<void> _applyLanguage() async {
    final code = _pendingCode;
    setState(() => _saving = true);

    await LocaleController.instance.setLanguageCode(code);
    unawaited(UserDataRetentionService.instance.backupNow(reason: 'language'));

    if (!mounted) return;
    setState(() => _saving = false);

    final label = LocaleController.languageLabel(code);
    final strings = LocaleUiStrings.forCode(code);
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(strings.languageApplied(label))));
  }

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
        title: Text(strings.languagePageTitle),
      ),
      body: ListenableBuilder(
        listenable: LocaleController.instance,
        builder: (context, _) {
          final selectedCode = LocaleController.instance.locale.languageCode;
          final hasPendingChange = _pendingCode != selectedCode;

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  itemCount: LocaleController.languageOptions.length + 1,
                  separatorBuilder: (_, index) => index == 0
                      ? const SizedBox(height: 12)
                      : const Divider(height: 1),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _InfoCard(
                        icon: Icons.translate_outlined,
                        title: strings.languageInfoTitle,
                        text: strings.languageInfoText,
                      );
                    }

                    final option = LocaleController.languageOptions[index - 1];
                    final selected = option.code == _pendingCode;
                    final translated =
                        LocaleController.isTranslatedLanguageCode(option.code);

                    return ListTile(
                      leading: Icon(
                        selected
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: selected
                            ? scheme.primary
                            : scheme.onSurfaceVariant,
                      ),
                      title: Text(option.label),
                      subtitle: translated
                          ? Text(strings.nativeTranslation)
                          : Text(strings.fallbackTranslation),
                      onTap: _saving
                          ? null
                          : () => setState(() => _pendingCode = option.code),
                    );
                  },
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: hasPendingChange && !_saving
                          ? _applyLanguage
                          : null,
                      icon: _saving
                          ? SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: scheme.onPrimary,
                              ),
                            )
                          : const Icon(Icons.check_circle_outline),
                      label: Text(strings.apply),
                    ),
                  ),
                ),
              ),
            ],
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
