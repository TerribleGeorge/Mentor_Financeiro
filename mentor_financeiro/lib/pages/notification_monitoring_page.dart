import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationMonitoringPage extends StatefulWidget {
  const NotificationMonitoringPage({super.key});

  static const String prefsKey = 'notif_monitoring_enabled';

  @override
  State<NotificationMonitoringPage> createState() =>
      _NotificationMonitoringPageState();
}

class _NotificationMonitoringPageState extends State<NotificationMonitoringPage> {
  bool _enabled = true;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getBool(NotificationMonitoringPage.prefsKey);
    if (!mounted) return;
    setState(() {
      _enabled = v ?? true;
      _loading = false;
    });
  }

  Future<void> _setEnabled(bool v) async {
    setState(() => _enabled = v);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(NotificationMonitoringPage.prefsKey, v);
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
                _bullet('Não capturamos códigos (OTP), senha ou mensagens de segurança.'),
                _bullet('Processamos e filtramos apenas gastos (compras/pagamentos).'),
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
                  _enabled ? Icons.notifications_active : Icons.notifications_off,
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
                        _enabled
                            ? 'Lendo apenas notificações de gastos'
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
                  Switch(
                    value: _enabled,
                    onChanged: (v) => _setEnabled(v),
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
}

