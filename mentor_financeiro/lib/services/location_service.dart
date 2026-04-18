import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  static Future<bool> solicitarLocalizacaoSeNecessario() async {
    final status = await Permission.location.status;

    if (status.isGranted) {
      return true;
    }

    if (status.isDenied) {
      final result = await Permission.location.request();
      return result.isGranted;
    }

    if (status.isPermanentlyDenied) {
      return false;
    }

    return false;
  }

  static Future<bool> verificarPermissaoLocalizacao() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse;
  }

  static Future<Position?> obterPosicao() async {
    try {
      final hasPermission = await verificarPermissaoLocalizacao();
      if (!hasPermission) return null;

      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
          timeLimit: Duration(seconds: 10),
        ),
      );
    } catch (e) {
      return null;
    }
  }

  static Future<bool> isInBrazil() async {
    final position = await obterPosicao();
    if (position == null) return false;

    return position.latitude >= -33.75 &&
        position.latitude <= 5.25 &&
        position.longitude >= -73.99 &&
        position.longitude <= -28.84;
  }

  static String getLocationDescription() {
    return 'Para comparar investimentos locais (CDB/CDI) com taxas internacionais, '
        'precisamos saber sua localização. Isso permite mostrar taxas equivalentes '
        'de outros países e ajudá-lo a decidir entre investir no Brasil ou internacionalmente.';
  }

  static Future<void> showLocationPermissionDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Permissão de Localização Necessária'),
        content: Text(getLocationDescription()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await solicitarLocalizacaoSeNecessario();
            },
            child: const Text('Permitir'),
          ),
        ],
      ),
    );
  }
}
