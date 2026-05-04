import '../../domain/entities/market_data_snapshot.dart';

/// Último snapshot bem-sucedido por provedor (Brapi/Yahoo) para fallback quando a API falha.
class MarketQuotesCache {
  MarketQuotesCache._();
  static final MarketQuotesCache instance = MarketQuotesCache._();

  final Map<String, MarketDataSnapshot> _lastGood = {};

  void remember(String providerId, MarketDataSnapshot snapshot) {
    if (snapshot.quotes.isNotEmpty) {
      _lastGood[providerId] = snapshot;
    }
  }

  MarketDataSnapshot? peek(String providerId) => _lastGood[providerId];
}
