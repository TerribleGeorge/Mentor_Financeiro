import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

  String _formatDate(DateTime? date) {
    if (date == null) return 'Ainda não executado neste dispositivo';
    return DateFormat('dd/MM/yyyy HH:mm').format(date.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final user = FirebaseAuth.instance.currentUser;
    final signedIn = user != null;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        title: const Text('Backup e restauração'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              children: [
                _InfoCard(
                  icon: Icons.cloud_sync_outlined,
                  title: 'Preservação dos seus dados',
                  text: signedIn
                      ? 'Suas preferências importantes ficam salvas na nuvem e podem ser restauradas ao entrar novamente nesta conta.'
                      : 'Atualizações preservam dados locais. Para recuperar dados após desinstalar ou trocar de aparelho, entre com Google/e-mail antes.',
                ),
                const SizedBox(height: 16),
                _StatusRow(
                  icon: Icons.backup_outlined,
                  label: 'Último backup',
                  value: _formatDate(_status?.lastBackupAt),
                ),
                _StatusRow(
                  icon: Icons.restore_outlined,
                  label: 'Última restauração',
                  value: _formatDate(_status?.lastRestoreAt),
                ),
                if (_status?.lastError != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    'Último aviso: ${_status!.lastError}',
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
                          'Backup salvo na nuvem.',
                        )
                      : null,
                  icon: const Icon(Icons.cloud_upload_outlined),
                  label: Text(_busy ? 'Aguarde...' : 'Salvar agora'),
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: signedIn && !_busy
                      ? () => _runAction(
                          UserDataRetentionService.instance.restoreFromCloud,
                          'Restauração concluída.',
                        )
                      : null,
                  icon: const Icon(Icons.cloud_download_outlined),
                  label: const Text('Restaurar da nuvem'),
                ),
                const SizedBox(height: 16),
                Text(
                  'O app nunca apaga histórico, investimentos, metas ou transações durante essa sincronização.',
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
