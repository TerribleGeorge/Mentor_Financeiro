/// Lançada quando não há rede antes de chamar APIs remotas (Firebase HTTP, Yahoo, Brapi).
class OfflineException implements Exception {
  const OfflineException([this.message = 'Sem conexão com a internet.']);

  final String message;

  @override
  String toString() => message;
}
