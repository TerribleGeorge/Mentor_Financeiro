import 'dart:async';
import 'dart:io' show Platform;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
import 'graficos_screen.dart';
import 'historico_screen.dart';
import 'perfil_screen.dart';
import '../services/daily_spend_limit_notifier.dart';
import '../services/market_alert_service.dart';
import '../services/notification_listener_service.dart';
import '../services/transaction_refresh_signal.dart';
import '../services/pending_renda_extra_confirmation_service.dart';
import '../services/user_data_retention_service.dart';

class MainNavigation extends StatefulWidget {
  final int initialIndex;

  const MainNavigation({super.key, this.initialIndex = 0});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  late int _currentIndex;
  final _notificationListener = NotificationListenerService();
  bool _listenerStarted = false;
  late final _Lifecycle _lifecycle = _Lifecycle(this);
  Timer? _listenerHealthTimer;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;
  bool _syncSpendPipelineInFlight = false;

  final List<Widget> _screens = [
    const HomeScreen(),
    const GraficosScreen(),
    const HistoricoScreen(),
    const PerfilScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex.clamp(0, _screens.length - 1);
    WidgetsBinding.instance.addObserver(_lifecycle);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (FirebaseAuth.instance.currentUser != null) {
        unawaited(_notificationListener.flushPendingTransactionsToFirestore());
      }
      // Remove SnackBars pendentes (ex.: erro de foto antigo ao voltar das Definições).
      ScaffoldMessenger.of(context).clearSnackBars();
      unawaited(
        _ensureNotificationListenerStarted().whenComplete(() {
          if (mounted) unawaited(_tryPromptPendingRendaExtra());
        }),
      );
      MarketAlertService.instance.start();
      unawaited(
        UserDataRetentionService.instance.backupNow(reason: 'main_navigation'),
      );
    });
    _listenerHealthTimer = Timer.periodic(const Duration(minutes: 5), (_) {
      if (!mounted) return;
      unawaited(_ensureNotificationListenerStarted());
      unawaited(_notificationListener.sincronizarRecentes());
    });

    // Assim que a rede voltar (sem fechar o app), drena fila → Firestore e relê notificações.
    _connectivitySub = Connectivity().onConnectivityChanged.listen((results) {
      if (!mounted) return;
      final online = results.isNotEmpty &&
          !results.every((r) => r == ConnectivityResult.none);
      if (!online) return;
      unawaited(_syncSpendPipelineAfterNetworkBack());
    });
  }

  @override
  void dispose() {
    _connectivitySub?.cancel();
    _listenerHealthTimer?.cancel();
    MarketAlertService.instance.stop();
    _notificationListener.parar();
    WidgetsBinding.instance.removeObserver(_lifecycle);
    super.dispose();
  }

  /// Fila Dart (`_pendingTxKey`) + notificações nativas em fila / bandeja, depois atualiza UI.
  Future<void> _syncSpendPipelineAfterNetworkBack() async {
    if (!Platform.isAndroid) return;
    if (FirebaseAuth.instance.currentUser == null) return;
    if (_syncSpendPipelineInFlight) return;
    _syncSpendPipelineInFlight = true;
    try {
      final saved =
          await _notificationListener.flushPendingTransactionsToFirestore();
      await _ensureNotificationListenerStarted();
      if (saved == 0) {
        // Streams Firestore podem já ter dados; prefs/locais já foram tratados no flush.
        TransactionRefreshSignal.notify();
      }
      await DailySpendLimitNotifier.evaluateFromPrefsToday();
    } finally {
      _syncSpendPipelineInFlight = false;
    }
    if (mounted) {
      unawaited(_tryPromptPendingRendaExtra());
    }
  }

  /// Diálogo de confirmação para entradas (PIX recebido, etc.) → **Renda extra**.
  Future<void> _tryPromptPendingRendaExtra() async {
    if (!mounted) return;
    if (FirebaseAuth.instance.currentUser == null) return;
    await PendingRendaExtraConfirmationService.tryShowNext(context);
  }

  /// Garante o [NotificationListenerService] no Android: permissão de **leitor de notificações**,
  /// stream ativo, dreno da fila nativa e verificação periódica de saúde.
  Future<void> _ensureNotificationListenerStarted() async {
    if (!Platform.isAndroid) return;
    if (FirebaseAuth.instance.currentUser != null) {
      unawaited(_notificationListener.flushPendingTransactionsToFirestore());
    }

    if (_listenerStarted) {
      final stillOk = await _notificationListener.verificarPermissao();
      if (!stillOk) {
        _notificationListener.parar();
        _listenerStarted = false;
      } else {
        await _notificationListener.sincronizarPendentes();
        unawaited(MarketAlertService.instance.checkNow());
        if (!_notificationListener.estaAtivo) {
          _notificationListener.parar();
          final restarted = await _notificationListener.iniciar();
          _listenerStarted = restarted;
        }
        return;
      }
    }

    final started = await _notificationListener.iniciar();
    if (started) {
      _listenerStarted = true;
      return;
    }

    // Primeira vez: abre ecrã do Android para o utilizador autorizar o listener.
    final prefs = await SharedPreferences.getInstance();
    final prompted = prefs.getBool('notif_listener_prompted') ?? false;
    if (!prompted) {
      await prefs.setBool('notif_listener_prompted', true);
      await _notificationListener.solicitarPermissao();
    }
  }

  void _onTabTapped(int index) {
    if (index != _currentIndex) {
      HapticFeedback.lightImpact();
      // Ao voltar ao Início, remove SnackBars presos (ex.: mensagem antiga de foto).
      if (mounted && index == 0) {
        ScaffoldMessenger.of(context).clearSnackBars();
      }
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bright = theme.brightness == Brightness.light;
    final edge = bright
        ? Colors.white.withValues(alpha: 0.7)
        : Colors.black.withValues(alpha: 0.5);
    final bar = theme.colorScheme.surface.withValues(alpha: 0.88);
    final accent = theme.colorScheme.primary;
    final labelIdle = theme.colorScheme.onSurface.withValues(alpha: 0.5);

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 100,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [edge, Colors.transparent],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 120,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [edge, Colors.transparent],
                  ),
                ),
              ),
            ),
          ),
          IndexedStack(index: _currentIndex, children: _screens),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: bar,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: bright ? 0.06 : 0.32),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  0,
                  Icons.home_outlined,
                  Icons.home,
                  'Início',
                  accent,
                  labelIdle,
                ),
                _buildNavItem(
                  1,
                  Icons.pie_chart_outline,
                  Icons.pie_chart,
                  'Gráficos',
                  accent,
                  labelIdle,
                ),
                _buildNavItem(
                  2,
                  Icons.history_outlined,
                  Icons.history,
                  'Histórico',
                  accent,
                  labelIdle,
                ),
                _buildNavItem(
                  3,
                  Icons.person_outline,
                  Icons.person,
                  'Perfil',
                  accent,
                  labelIdle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData icon,
    IconData activeIcon,
    String label,
    Color accent,
    Color labelIdle,
  ) {
    final isSelected = _currentIndex == index;
    final color = isSelected ? accent : labelIdle;
    return GestureDetector(
      onTap: () => _onTabTapped(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? accent.withValues(alpha: 0.12)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isSelected ? activeIcon : icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Lifecycle extends WidgetsBindingObserver {
  final _MainNavigationState owner;
  _Lifecycle(this.owner);

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      unawaited(owner._syncSpendPipelineAfterNetworkBack());
      unawaited(MarketAlertService.instance.checkNow());
    }
  }
}
