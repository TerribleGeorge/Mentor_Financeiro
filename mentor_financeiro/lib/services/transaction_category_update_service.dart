import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/transacao_model.dart';
import 'local_transaction_store.dart';
import 'transaction_refresh_signal.dart';

/// Atualiza só o campo [categoria] de uma transação na nuvem ou no armazenamento local.
///
/// - **Firestore:** quando [TransacaoModel.firestoreDocumentId] está preenchido.
/// - **Local (notificações / offline):** quando [TransacaoModel.localSourceId] está preenchido.
///
/// Depois de gravar, notifica o resto da app via [TransactionRefreshSignal].
class TransactionCategoryUpdateService {
  TransactionCategoryUpdateService._();

  /// Indica se conseguimos persistir uma alteração de categoria para esta linha.
  static bool canEdit(TransacaoModel t) {
    final fid = t.firestoreDocumentId?.trim();
    if (fid != null && fid.isNotEmpty) return true;
    final lid = t.localSourceId?.trim();
    return lid != null && lid.isNotEmpty;
  }

  /// Grava a nova categoria. Não mostra UI; o chamador trata de erros se quiser.
  static Future<bool> updateCategory(
    TransacaoModel t,
    String newCategory,
  ) async {
    final trimmed = newCategory.trim();
    if (trimmed.isEmpty) return false;

    final fid = t.firestoreDocumentId?.trim();
    if (fid != null && fid.isNotEmpty) {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return false;
      try {
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(user.uid)
            .collection('transacoes')
            .doc(fid)
            .update(<String, dynamic>{'categoria': trimmed});
        TransactionRefreshSignal.notify();
        return true;
      } catch (_) {
        return false;
      }
    }

    final lid = t.localSourceId?.trim();
    if (lid != null && lid.isNotEmpty) {
      final ok = await LocalTransactionStore.updateCategoryBySourceId(
        sourceId: lid,
        categoria: trimmed,
      );
      if (ok) TransactionRefreshSignal.notify();
      return ok;
    }

    return false;
  }
}
