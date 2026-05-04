import 'dart:async';

import '../../domain/entities/market_data_snapshot.dart';
import '../../domain/repositories/i_financial_data_provider.dart';

/// Extensão para consumo reativo sem armazenar histórico no app.
///
/// Descarte a inscrição ao sair da tela para manter o app *data-light*.
extension FinancialDataProviderStreaming on IFinancialDataProvider {
  Stream<MarketDataSnapshot> watchQuotes(
    List<String> symbols, {
    Duration interval = const Duration(minutes: 3),
  }) {
    late StreamController<MarketDataSnapshot> controller;
    Timer? timer;

    controller = StreamController<MarketDataSnapshot>(
      onListen: () async {
        Future<void> emit() async {
          try {
            controller.add(await fetchQuotes(symbols));
          } catch (e, st) {
            controller.addError(e, st);
          }
        }

        await emit();
        timer = Timer.periodic(interval, (_) => emit());
      },
      onCancel: () {
        timer?.cancel();
      },
    );

    return controller.stream;
  }
}
