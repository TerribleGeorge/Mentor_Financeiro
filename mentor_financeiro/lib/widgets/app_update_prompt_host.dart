import 'package:flutter/material.dart';

import '../core/navigation/mentor_navigator.dart';
import '../core/navigation/splash_route_observer.dart';
import '../services/app_update_prompt.dart';

/// Após sair da splash, verifica se há atualização na loja e mostra um diálogo.
class AppUpdatePromptHost extends StatefulWidget {
  const AppUpdatePromptHost({super.key, required this.child});

  final Widget child;

  @override
  State<AppUpdatePromptHost> createState() => _AppUpdatePromptHostState();
}

class _AppUpdatePromptHostState extends State<AppUpdatePromptHost> {
  bool _requested = false;
  int _contextRetries = 0;

  @override
  void initState() {
    super.initState();
    splashRouteVisibleNotifier.addListener(_onSplashVisibility);
    _onSplashVisibility();
  }

  @override
  void dispose() {
    splashRouteVisibleNotifier.removeListener(_onSplashVisibility);
    super.dispose();
  }

  void _onSplashVisibility() {
    if (splashRouteVisibleNotifier.value) return;
    if (_requested) return;
    _requested = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future<void>.delayed(const Duration(milliseconds: 900), _runCheck);
    });
  }

  Future<void> _runCheck() async {
    if (!mounted) return;
    final ctx = mentorNavigatorKey.currentContext;
    if (ctx == null) {
      if (_contextRetries < 8) {
        _contextRetries++;
        await Future<void>.delayed(const Duration(milliseconds: 500));
        await _runCheck();
      }
      return;
    }
    _contextRetries = 0;

    final notice = await AppUpdatePrompt.checkForStoreUpdate();
    if (!mounted) return;
    if (notice == null) return;
    final dialogContext = mentorNavigatorKey.currentContext;
    if (dialogContext == null || !dialogContext.mounted) return;

    await showDialog<void>(
      context: dialogContext,
      barrierDismissible: true,
      builder: (innerContext) {
        final theme = Theme.of(innerContext);
        final versionLine = notice.versionLabel != null
            ? '\n\nVersão na loja: ${notice.versionLabel}.'
            : '';
        return AlertDialog(
          title: const Text('Atualização disponível'),
          content: Text(
            'Há uma nova versão do Mentor Financeiro na loja. '
            'Atualize para ter as últimas melhorias e correções.$versionLine',
            style: theme.textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(innerContext).pop(),
              child: const Text('Agora não'),
            ),
            FilledButton(
              onPressed: () async {
                Navigator.of(innerContext).pop();
                await AppUpdatePrompt.startUpdateFlow();
              },
              child: const Text('Atualizar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
