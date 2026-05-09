import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_service.dart';

/// Galeria/câmara → Firebase Storage → URL pública de download.
///
/// No console Firebase: activar **Storage** e regras que permitam
/// `write` em `profile_photos/{uid}/**` apenas se `request.auth.uid == uid`.
abstract final class ProfilePhotoService {
  ProfilePhotoService._();

  static final ImagePicker _picker = ImagePicker();

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
