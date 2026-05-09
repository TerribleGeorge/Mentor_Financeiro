import 'dart:convert';
import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show debugPrint, kDebugMode, kIsWeb;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_service.dart';

/// Galeria/câmara → Firebase Storage → URL pública de download.
///
/// Usa sempre **putData** (bytes em memória) e **FirebaseStorage.instance**
/// (bucket por defeito do `GoogleService-info` / `google-services` +
/// `Firebase.initializeApp`). Publique [storage.rules] na raiz do repo no
/// Firebase Console → Storage → Regras.
abstract final class ProfilePhotoService {
  ProfilePhotoService._();

  static final ImagePicker _picker = ImagePicker();

  static Future<String> _downloadUrlViaStorageRestApi(Reference ref) async {
    final authUser = FirebaseAuth.instance.currentUser;
    if (authUser == null) {
      throw StateError('Sem sessão para obter URL no Storage.');
    }
    final token = await authUser.getIdToken();
    if (token == null || token.isEmpty) {
      throw StateError('Token Firebase indisponível.');
    }

    var bucket = ref.bucket;
    if (bucket.startsWith('gs://')) {
      bucket = bucket.substring(5);
    }
    final encodedPath = Uri.encodeComponent(ref.fullPath);
    final metaUri = Uri.parse(
      'https://firebasestorage.googleapis.com/v0/b/$bucket/o/$encodedPath',
    );

    final resp = await http
        .get(metaUri, headers: {'Authorization': 'Bearer $token'})
        .timeout(const Duration(seconds: 25));

    if (resp.statusCode == 404) {
      throw FirebaseException(
        plugin: 'firebase_storage',
        code: 'object-not-found',
        message:
            'REST: ficheiro não encontrado. Publique storage.rules (Storage → '
            'Regras) e abra a consola Ficheiros para ver profile_photos/{uid}/.',
      );
    }
    if (resp.statusCode != 200) {
      throw FirebaseException(
        plugin: 'firebase_storage',
        code: 'rest-error',
        message: 'Metadata Storage HTTP ${resp.statusCode}: ${resp.body}',
      );
    }

    final map = jsonDecode(resp.body) as Map<String, dynamic>;
    final raw = map['downloadTokens'];
    String? first;
    if (raw is String && raw.isNotEmpty) {
      first = raw.split(',').first.trim();
    }
    if (first == null || first.isEmpty) {
      throw FirebaseException(
        plugin: 'firebase_storage',
        code: 'no-download-token',
        message:
            'REST: sem downloadTokens — confira permissões de leitura nas regras.',
      );
    }

    return '${metaUri.toString()}?alt=media&token=$first';
  }

  /// Garante permissões antes de [pickAndUpload]. Em Android/iOS pede ao sistema;
  /// se estiver permanentemente negado, abre as definições da app.
  static Future<bool> requestPermissionsFor(ImageSource source) async {
    if (kIsWeb) return true;

    if (source == ImageSource.camera) {
      var status = await Permission.camera.status;
      if (!status.isGranted) {
        status = await Permission.camera.request();
      }
      if (status.isGranted) return true;
      if (status.isPermanentlyDenied) {
        await openAppSettings();
      }
      return false;
    }

    // Galeria / ficheiros de imagem
    if (Platform.isIOS) {
      var status = await Permission.photos.status;
      if (!status.isGranted && !status.isLimited) {
        status = await Permission.photos.request();
      }
      if (status.isGranted || status.isLimited) return true;
      if (status.isPermanentlyDenied) {
        await openAppSettings();
      }
      return false;
    }

    if (Platform.isAndroid) {
      var photosStatus = await Permission.photos.status;
      if (!photosStatus.isGranted && !photosStatus.isLimited) {
        photosStatus = await Permission.photos.request();
      }
      if (photosStatus.isGranted || photosStatus.isLimited) return true;

      // Android ≤12 (READ_EXTERNAL_STORAGE)
      var storageStatus = await Permission.storage.status;
      if (!storageStatus.isGranted) {
        storageStatus = await Permission.storage.request();
      }
      if (storageStatus.isGranted) return true;

      if (photosStatus.isPermanentlyDenied ||
          storageStatus.isPermanentlyDenied) {
        await openAppSettings();
      }
      return false;
    }

    return true;
  }

  /// [null] se o utilizador cancelar o selector.
  static Future<String?> pickAndUpload({
    required String uid,
    required ImageSource source,
  }) async {
    final xFile = await _picker.pickImage(
      source: source,
      maxWidth: 1536,
      maxHeight: 1536,
      imageQuality: 85,
    );
    if (xFile == null) return null;

    final bytes = await xFile.readAsBytes();
    if (bytes.isEmpty) return null;

    final mime = xFile.mimeType ?? 'image/jpeg';
    final objectName =
        'avatar_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final objectPath = 'profile_photos/$uid/$objectName';

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.getIdToken(true);
    }

    final storage = FirebaseStorage.instance;
    final ref = storage.ref(objectPath);
    final meta = SettableMetadata(contentType: mime);

    final snapshot = await ref.putData(bytes, meta);
    if (snapshot.state != TaskState.success) {
      throw StateError(
        'Upload Storage não concluído (estado ${snapshot.state}).',
      );
    }
    if (snapshot.totalBytes > 0 &&
        snapshot.bytesTransferred != snapshot.totalBytes) {
      throw StateError(
        'Upload Storage incompleto (${snapshot.bytesTransferred}/'
        '${snapshot.totalBytes} bytes).',
      );
    }

    for (var attempt = 0; attempt < 8; attempt++) {
      try {
        await snapshot.ref.getMetadata();
        return await snapshot.ref.getDownloadURL();
      } on FirebaseException catch (e) {
        if (e.code != 'object-not-found') rethrow;
        if (attempt == 7) break;
        await Future<void>.delayed(
          Duration(milliseconds: 200 + (attempt * 150)),
        );
      }
    }
    if (kDebugMode) {
      debugPrint(
        'ProfilePhotoService: getDownloadURL nativo falhou; a tentar REST.',
      );
    }
    return _downloadUrlViaStorageRestApi(snapshot.ref);
  }

  static Future<void> applyPhotoUrl({
    required String uid,
    required String downloadUrl,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw StateError('Nenhuma sessão iniciada.');
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('photo_url', downloadUrl);

    await FirebaseService.atualizarDadosUsuario(
      uid: uid,
      photoUrl: downloadUrl,
    );

    try {
      await user.updatePhotoURL(downloadUrl);
      await user.reload();
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        debugPrint(
          'ProfilePhotoService: updatePhotoURL não aplicado (${e.code}): $e',
        );
      }
      // URL guardada em prefs e Firestore; a UI usa `photo_url` local.
    }
  }
}
