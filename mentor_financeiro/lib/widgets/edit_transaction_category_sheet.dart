import 'package:flutter/material.dart';

import '../core/constants/transaction_categories.dart';
import '../models/transacao_model.dart';
import '../services/transaction_category_update_service.dart';

/// Folha inferior para o utilizador corrigir a categoria de uma transação.
///
/// Só deve ser chamada quando [TransactionCategoryUpdateService.canEdit] for verdadeiro.
Future<void> showTransactionCategoryEditor(
  BuildContext context, {
  required TransacaoModel transaction,
}) async {
  if (!TransactionCategoryUpdateService.canEdit(transaction)) return;

  final choices = List<String>.from(kTransactionCategoryPickerChoices);
  final current = transaction.categoria?.trim();
  if (current != null && current.isNotEmpty && !choices.contains(current)) {
    choices.add(current);
    choices.sort();
  }

  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF0F172A),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
    ),
    builder: (ctx) {
      return _EditTransactionCategoryBody(
        transaction: transaction,
        choices: choices,
      );
    },
  );
}

class _EditTransactionCategoryBody extends StatefulWidget {
  const _EditTransactionCategoryBody({
    required this.transaction,
    required this.choices,
  });

  final TransacaoModel transaction;
  final List<String> choices;

  @override
  State<_EditTransactionCategoryBody> createState() =>
      _EditTransactionCategoryBodyState();
}

class _EditTransactionCategoryBodyState extends State<_EditTransactionCategoryBody> {
  late String _selected;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final c = widget.transaction.categoria?.trim();
    _selected = (c != null && c.isNotEmpty && widget.choices.contains(c))
        ? c
        : (widget.choices.contains('Outros') ? 'Outros' : widget.choices.first);
  }

  Future<void> _apply() async {
    setState(() => _saving = true);
    final ok = await TransactionCategoryUpdateService.updateCategory(
      widget.transaction,
      _selected,
    );
    if (!mounted) return;
    setState(() => _saving = false);
    if (ok) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 16, 20, bottom + 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Categoria',
            style: TextStyle(
              color: Color(0xFF00D9FF),
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.transaction.descricao,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButton<String>(
              value: _selected,
              isExpanded: true,
              underline: const SizedBox.shrink(),
              dropdownColor: const Color(0xFF1E293B),
              style: const TextStyle(color: Colors.white, fontSize: 16),
              items: widget.choices
                  .map(
                    (c) => DropdownMenuItem<String>(
                      value: c,
                      child: Text(c),
                    ),
                  )
                  .toList(),
              onChanged: _saving
                  ? null
                  : (v) {
                      if (v == null) return;
                      setState(() => _selected = v);
                    },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton(
              onPressed: _saving ? null : _apply,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF00D9FF),
                foregroundColor: const Color(0xFF0F172A),
              ),
              child: _saving
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text(
                      'Guardar categoria',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
