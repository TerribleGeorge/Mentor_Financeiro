import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/notification_listener_service.dart';
import '../services/user_data_retention_service.dart';

class NotificationMonitoringPage extends StatefulWidget {
  const NotificationMonitoringPage({super.key});

  static const String prefsKey = 'notif_monitoring_enabled';

  @override
  State<NotificationMonitoringPage> createState() =>
      _NotificationMonitoringPageState();
}

class _NotificationMonitoringPageState
    extends State<NotificationMonitoringPage> {
  final _listener = NotificationListenerService();
  bool _enabled = true;
  bool _loading = true;
  bool? _androidPermissionGranted;
  List<String> _diagnostics = const <String>[];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getBool(NotificationMonitoringPage.prefsKey);
    final hasPermission = Platform.isAndroid
        ? await _listener.verificarPermissao()
        : null;
    final diagnostics =
        await NotificationListenerService.carregarDiagnosticos();
    if (!mounted) return;
    setState(() {
      _enabled = v ?? true;
      _androidPermissionGranted = hasPermission;
      _diagnostics = diagnostics;
      _loading = false;
    });
  }

  Future<void> _setEnabled(bool v) async {
    setState(() => _enabled = v);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(NotificationMonitoringPage.prefsKey, v);
    unawaited(
      UserDataRetentionService.instance.backupNow(
        reason: 'notification_monitoring',
      ),
    );
    if (v && Platform.isAndroid) {
      await _listener.iniciar();
      await _load();
    }
  }

  Future<void> _openAndroidPermission() async {
    await _listener.solicitarPermissao();
    await Future<void>.delayed(const Duration(milliseconds: 350));
    await _load();
  }

  Future<void> _clearDiagnostics() async {
    await NotificationListenerService.limparDiagnosticos();
    await _load();
  }

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
        title: const Text('Monitoramento por notificações'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.surface.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: scheme.onSurface.withValues(alpha: 0.08),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Segurança em primeiro lugar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 8),
                Text(
                  'O Mentor Financeiro não acessa sua conta bancária e não pede senha. '
                  'Ele apenas lê notificações no seu celular para identificar gastos e registrar no histórico.',
                  style: TextStyle(
                    color: scheme.onSurface.withValues(alpha: 0.75),
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 12),
                _bullet('Não fazemos login em banco / cartão.'),
                _bullet(
                  'Não capturamos códigos (OTP), senha ou mensagens de segurança.',
                ),
                _bullet(
                  'Processamos e filtramos apenas gastos (compras/pagamentos).',
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.surface.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: scheme.onSurface.withValues(alpha: 0.08),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  _enabled
                      ? Icons.notifications_active
                      : Icons.notifications_off,
                  color: _enabled
                      ? const Color(0xFF26DE81)
                      : scheme.onSurface.withValues(alpha: 0.55),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ativar monitoramento',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _enabled && (_androidPermissionGranted ?? true)
                            ? 'Lendo apenas notificações de gastos'
                            : _enabled
                            ? 'Ative o acesso a notificações no Android'
                            : 'Monitoramento pausado',
                        style: TextStyle(
                          color: scheme.onSurface.withValues(alpha: 0.7),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                if (_loading)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  Switch(value: _enabled, onChanged: (v) => _setEnabled(v)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          if (Platform.isAndroid) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: scheme.surface.withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: scheme.onSurface.withValues(alpha: 0.08),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    _androidPermissionGranted == true
                        ? Icons.verified_outlined
                        : Icons.warning_amber_rounded,
                    color: _androidPermissionGranted == true
                        ? const Color(0xFF26DE81)
                        : Colors.amber,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _androidPermissionGranted == true
                          ? 'Permissão Android concedida para o Mentor Financeiro.'
                          : 'Permissão Android ainda não concedida. Sem ela, o app não recebe notificações.',
                      style: TextStyle(
                        color: scheme.onSurface.withValues(alpha: 0.75),
                        height: 1.35,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  TextButton(
                    onPressed: _openAndroidPermission,
                    child: const Text('Abrir'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
          ],
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.surface.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: scheme.onSurface.withValues(alpha: 0.08),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Últimas leituras do listener',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    IconButton(
                      tooltip: 'Atualizar',
                      onPressed: _load,
                      icon: const Icon(Icons.refresh),
                    ),
                    IconButton(
                      tooltip: 'Limpar',
                      onPressed: _diagnostics.isEmpty
                          ? null
                          : _clearDiagnostics,
                      icon: const Icon(Icons.delete_outline),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (_diagnostics.isEmpty)
                  Text(
                    'Nenhuma notificação chegou ao listener ainda.',
                    style: TextStyle(
                      color: scheme.onSurface.withValues(alpha: 0.7),
                      height: 1.35,
                    ),
                  )
                else
                  ..._diagnostics
                      .take(5)
                      .map((entry) => _diagnosticTile(entry)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.surface.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: scheme.onSurface.withValues(alpha: 0.08),
              ),
            ),
            child: Text(
              'Dica: você controla essa permissão também nas configurações do Android '
              '(Acesso a notificações). Se desativar lá, o app não consegue ler nenhuma notificação.',
              style: TextStyle(
                color: scheme.onSurface.withValues(alpha: 0.75),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bullet(String text) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Icon(Icons.check_circle, size: 16, color: scheme.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: scheme.onSurface.withValues(alpha: 0.78),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _diagnosticTile(String entry) {
    final scheme = Theme.of(context).colorScheme;
    final parts = entry.split('|');
    final date = parts.isNotEmpty ? DateTime.tryParse(parts[0]) : null;
    final status = parts.length > 1 ? parts[1] : 'evento';
    final text = parts.length > 2 ? parts.sublist(2).join('|') : entry;
    final time = date == null
        ? ''
        : '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: scheme.surfaceContainerHighest.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time.isEmpty ? status : '$time · $status',
              style: TextStyle(
                color: scheme.primary,
                fontWeight: FontWeight.w800,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: scheme.onSurface.withValues(alpha: 0.72),
                fontSize: 12,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
