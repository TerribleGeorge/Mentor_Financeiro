import 'package:connectivity_plus/connectivity_plus.dart';

import 'offline_exception.dart';

/// Verifica conectividade antes de chamadas de rede (provedores de cotação, Firestore remoto).
class ConnectivityService {
  ConnectivityService._();
  static final Connectivity _connectivity = Connectivity();

  static Future<bool> isOnline() async {
    final results = await _connectivity.checkConnectivity();
    if (results.isEmpty) return false;
    return !results.every((r) => r == ConnectivityResult.none);
  }

  static Future<void> requireOnline() async {
    if (!await isOnline()) {
      throw const OfflineException();
    }
  }
}
