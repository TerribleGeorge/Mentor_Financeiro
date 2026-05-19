import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/locale_ui_strings.dart';
import '../services/user_data_retention_service.dart';

class BackupRestorePage extends StatefulWidget {
  const BackupRestorePage({super.key});

  @override
  State<BackupRestorePage> createState() => _BackupRestorePageState();
}

class _BackupRestorePageState extends State<BackupRestorePage> {
  UserDataRetentionStatus? _status;
  bool _loading = true;
  bool _busy = false;

  @override
  void initState() {
    super.initState();
    _loadStatus();
  }

  Future<void> _loadStatus() async {
    final status = await UserDataRetentionService.instance.status();
    if (!mounted) return;
    setState(() {
      _status = status;
      _loading = false;
    });
  }

  Future<void> _runAction(
    Future<void> Function() action,
    String successMessage,
  ) async {
    setState(() => _busy = true);
    await action();
    await _loadStatus();
    if (!mounted) return;
    setState(() => _busy = false);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(successMessage)));
  }

  String _formatDate(BuildContext context, DateTime? date) {
    if (date == null) {
      return LocaleUiStrings.of(context).text(
        'Ainda não executado neste dispositivo',
        en: 'Not run on this device yet',
        es: 'Aún no se ejecutó en este dispositivo',
      );
    }
    return DateFormat('dd/MM/yyyy HH:mm').format(date.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final user = FirebaseAuth.instance.currentUser;
    final signedIn = user != null;
    final strings = LocaleUiStrings.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        title: Text(
          strings.text(
            'Backup e restauração',
            en: 'Backup and restore',
            es: 'Copia de seguridad y restauración',
          ),
        ),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              children: [
                _InfoCard(
                  icon: Icons.cloud_sync_outlined,
                  title: strings.text(
                    'Preservação dos seus dados',
                    en: 'Your data is preserved',
                    es: 'Tus datos se conservan',
                  ),
                  text: signedIn
                      ? strings.text(
                          'Suas preferências importantes ficam salvas na nuvem e podem ser restauradas ao entrar novamente nesta conta.',
                          en: 'Your important preferences are saved in the cloud and can be restored when you sign in to this account again.',
                          es: 'Tus preferencias importantes se guardan en la nube y se pueden restaurar al iniciar sesión de nuevo en esta cuenta.',
                        )
                      : strings.text(
                          'Atualizações preservam dados locais. Para recuperar dados após desinstalar ou trocar de aparelho, entre com Google/e-mail antes.',
                          en: 'Updates preserve local data. To recover data after uninstalling or changing phones, sign in with Google/email first.',
                          es: 'Las actualizaciones conservan los datos locales. Para recuperar datos tras desinstalar o cambiar de dispositivo, inicia sesión con Google/correo antes.',
                        ),
                ),
                const SizedBox(height: 16),
                _StatusRow(
                  icon: Icons.backup_outlined,
                  label: strings.text(
                    'Último backup',
                    en: 'Last backup',
                    es: 'Última copia',
                  ),
                  value: _formatDate(context, _status?.lastBackupAt),
                ),
                _StatusRow(
                  icon: Icons.restore_outlined,
                  label: strings.text(
                    'Última restauração',
                    en: 'Last restore',
                    es: 'Última restauración',
                  ),
                  value: _formatDate(context, _status?.lastRestoreAt),
                ),
                if (_status?.lastError != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    strings.text(
                      'Último aviso: ${_status!.lastError}',
                      en: 'Last warning: ${_status!.lastError}',
                      es: 'Último aviso: ${_status!.lastError}',
                    ),
                    style: TextStyle(color: scheme.error),
                  ),
                ],
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: signedIn && !_busy
                      ? () => _runAction(
                          () => UserDataRetentionService.instance.backupNow(
                            reason: 'manual_settings',
                          ),
                          strings.text(
                            'Backup salvo na nuvem.',
                            en: 'Backup saved to the cloud.',
                            es: 'Copia guardada en la nube.',
                          ),
                        )
                      : null,
                  icon: const Icon(Icons.cloud_upload_outlined),
                  label: Text(
                    _busy
                        ? strings.text(
                            'Aguarde...',
                            en: 'Please wait...',
                            es: 'Espera...',
                          )
                        : strings.text(
                            'Salvar agora',
                            en: 'Save now',
                            es: 'Guardar ahora',
                          ),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: signedIn && !_busy
                      ? () => _runAction(
                          UserDataRetentionService.instance.restoreFromCloud,
                          strings.text(
                            'Restauração concluída.',
                            en: 'Restore completed.',
                            es: 'Restauración completada.',
                          ),
                        )
                      : null,
                  icon: const Icon(Icons.cloud_download_outlined),
                  label: Text(
                    strings.text(
                      'Restaurar da nuvem',
                      en: 'Restore from cloud',
                      es: 'Restaurar desde la nube',
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  strings.text(
                    'O app nunca apaga histórico, investimentos, metas ou transações durante essa sincronização.',
                    en: 'The app never deletes history, investments, goals, or transactions during this sync.',
                    es: 'La app nunca elimina historial, inversiones, metas ni transacciones durante esta sincronización.',
                  ),
                  style: TextStyle(color: scheme.onSurfaceVariant),
                ),
              ],
            ),
    );
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: scheme.primary),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(value),
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
