/// Disparado após salvar a configuração financeira em [TelaConfiguracao].
/// Telas que exibem limite diário devem escutar e chamar [recarregar].
class FinanceConfigSignals {
  FinanceConfigSignals._();

  static final List<void Function()> _listeners = [];

  static void addListener(void Function() cb) => _listeners.add(cb);

  static void removeListener(void Function() cb) {
    _listeners.remove(cb);
  }

  static void notifySaved() {
    for (final cb in List<void Function()>.from(_listeners)) {
      cb();
    }
  }
}
