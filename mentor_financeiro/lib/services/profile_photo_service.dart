import 'dart:io' show Platform;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_service.dart';

/// Galeria/câmara → Firebase Storage → URL pública de download.
///
/// No console Firebase: activar **Storage** e regras que permitam
/// `write` em `profile_photos/{uid}/**` apenas se `request.auth.uid == uid`.
abstract final class ProfilePhotoService {
  ProfilePhotoService._();

  static final ImagePicker _picker = ImagePicker();

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
    final ref = FirebaseStorage.instance
        .ref()
        .child('profile_photos')
        .child(uid)
        .child('avatar.jpg');

    await ref.putData(bytes, SettableMetadata(contentType: mime));
    return ref.getDownloadURL();
  }

  static Future<void> applyPhotoUrl({
    required String uid,
    required String downloadUrl,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      throw StateError('Nenhuma sessão iniciada.');
    }

    await user.updatePhotoURL(downloadUrl);
    await user.reload();

    await FirebaseService.atualizarDadosUsuario(
      uid: uid,
      photoUrl: downloadUrl,
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('photo_url', downloadUrl);
  }
}
