/// Disparado quando transações mudam (notificação bancária, fila → Firestore, manual).
/// [HistoricoScreen], [DashboardScreen] e [HomeDailyLimitPanel] devem escutar para
/// voltar a ler prefs / `LocalTransactionStore` mesmo sem novo evento na stream do Firestore.
class TransactionRefreshSignal {
  TransactionRefreshSignal._();

  static final List<void Function()> _listeners = [];

  static void addListener(void Function() cb) => _listeners.add(cb);

  static void removeListener(void Function() cb) {
    _listeners.remove(cb);
  }

  static void notify() {
    for (final cb in List<void Function()>.from(_listeners)) {
      cb();
    }
  }
}
