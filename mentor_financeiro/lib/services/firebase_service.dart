import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static User? get usuarioAtual => _auth.currentUser;

  static Future<User?> loginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  static Future<User?> loginAnonimo() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  static Future<void> logout() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  static Future<void> salvarDadosUsuario({
    required String uid,
    required String nome,
    String? email,
    required String metodoLogin,
    Map<String, dynamic>? configuracoes,
  }) async {
    await _firestore.collection('usuarios').doc(uid).set({
      'nome': nome,
      'email': email,
      'metodoLogin': metodoLogin,
      'configuracoes': configuracoes ?? {},
      'criadoEm': DateTime.now(),
    }, SetOptions(merge: true));
  }

  static Future<Map<String, dynamic>?> buscarDadosUsuario(String uid) async {
    try {
      final doc = await _firestore.collection('usuarios').doc(uid).get();
      return doc.data();
    } catch (e) {
      return null;
    }
  }

  static Future<void> atualizarConfiguracoes(
    String uid,
    Map<String, dynamic> configuracoes,
  ) async {
    await _firestore.collection('usuarios').doc(uid).update({
      'configuracoes': configuracoes,
    });
  }

  static Future<void> salvarGasto({
    required String uid,
    required String descricao,
    required double valor,
    required DateTime data,
    String? categoria,
  }) async {
    await _firestore.collection('usuarios').doc(uid).collection('gastos').add({
      'descricao': descricao,
      'valor': valor,
      'data': data,
      'categoria': categoria,
      'criadoEm': DateTime.now(),
    });
  }

  static Stream<QuerySnapshot> getGastos(String uid) {
    return _firestore
        .collection('usuarios')
        .doc(uid)
        .collection('gastos')
        .orderBy('data', descending: true)
        .snapshots();
  }

  static Future<void> salvarMeta({
    required String uid,
    required String nome,
    required double valorAlvo,
    required double valorAtual,
    DateTime? prazo,
  }) async {
    await _firestore.collection('usuarios').doc(uid).collection('metas').add({
      'nome': nome,
      'valorAlvo': valorAlvo,
      'valorAtual': valorAtual,
      'prazo': prazo,
      'criadoEm': DateTime.now(),
    });
  }

  static Stream<QuerySnapshot> getMetas(String uid) {
    return _firestore
        .collection('usuarios')
        .doc(uid)
        .collection('metas')
        .snapshots();
  }
}
