import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/transaction_categories.dart';
import '../models/transacao_model.dart';
import '../services/ad_manager_service.dart';
import '../services/daily_spend_limit_notifier.dart';
import '../services/local_transaction_store.dart';
import '../services/locale_ui_strings.dart';
import '../services/notification_listener_service.dart';
import '../services/subscription_provider.dart';
import '../services/transaction_refresh_signal.dart';

class AdicionarTransacaoPage extends StatefulWidget {
  const AdicionarTransacaoPage({super.key});

  @override
  State<AdicionarTransacaoPage> createState() => _AdicionarTransacaoPageState();
}

class _AdicionarTransacaoPageState extends State<AdicionarTransacaoPage> {
  final _formKey = GlobalKey<FormState>();
  final _valorController = TextEditingController();
  final _descricaoController = TextEditingController();

  TipoPagamento _tipoPagamento = TipoPagamento.debito;
  String _categoria = 'Outros';
  DateTime _data = DateTime.now();

  bool _salvando = false;

  /// Alinhado com [kTransactionCategoryPickerChoices] (Análise / editor de categoria).
  List<String> get _categorias => kTransactionCategoryPickerChoices;

  @override
  void dispose() {
    _valorController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  Future<void> _selecionarData() async {
    final strings = LocaleUiStrings.of(context);
    final picked = await showDatePicker(
      context: context,
      initialDate: _data,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      helpText: strings.text(
        'Selecionar data',
        en: 'Select date',
        es: 'Seleccionar fecha',
      ),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF00D9FF),
              surface: Color(0xFF1E293B),
            ),
            dialogTheme: const DialogThemeData(
              backgroundColor: Color(0xFF0F172A),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && mounted) {
      setState(() => _data = picked);
    }
  }

  double _parseValor(String raw) {
    final normalized = raw.trim().replaceAll('R\$', '').replaceAll(' ', '');
    final withDot = normalized.replaceAll('.', '').replaceAll(',', '.');
    return double.tryParse(withDot) ?? 0.0;
  }

  Future<void> _salvar() async {
    final strings = LocaleUiStrings.of(context);
    if (!_formKey.currentState!.validate()) return;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF1E293B),
          content: Text(
            strings.text(
              'Inicie sessão na página inicial para guardar na nuvem.',
              en: 'Sign in from the home page to save to the cloud.',
              es: 'Inicia sesión en la página inicial para guardar en la nube.',
            ),
            style: TextStyle(color: Colors.white.withValues(alpha: 0.92)),
          ),
        ),
      );
      return;
    }

    final valor = _parseValor(_valorController.text);
    if (valor <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            strings.text(
              'Informe um valor maior que zero.',
              en: 'Enter an amount greater than zero.',
              es: 'Ingresa un valor mayor que cero.',
            ),
          ),
        ),
      );
      return;
    }

    setState(() => _salvando = true);
    try {
      final transacao = TransacaoModel(
        valor: valor,
        descricao: _descricaoController.text.trim(),
        data: _data,
        metodo: 'Manual',
        categoria: _categoria,
        tipoPagamento: _tipoPagamento,
      );

      var cloudOk = false;
      for (var attempt = 0; attempt < 4; attempt++) {
        try {
          await FirebaseFirestore.instance
              .collection('usuarios')
              .doc(user.uid)
              .collection('transacoes')
              .add(transacao.toMap());
          cloudOk = true;
          break;
        } catch (_) {
          if (attempt < 3) {
            await Future<void>.delayed(
              Duration(milliseconds: 350 * (1 << attempt)),
            );
          }
        }
      }

      final sourceId =
          'manual|${user.uid}|${DateTime.now().millisecondsSinceEpoch}|'
          '${transacao.descricao.hashCode}';

      if (!cloudOk) {
        await LocalTransactionStore.save(transacao, sourceId: sourceId);
        await NotificationListenerService.enqueueManualRegistroForLaterSync(
          t: transacao,
          sourceId: sourceId,
        );
        unawaited(
          NotificationListenerService().flushPendingTransactionsToFirestore(),
        );
      }

      if (_tipoPagamento == TipoPagamento.debito) {
        final prefs = await SharedPreferences.getInstance();
        final key =
            'gastos_${transacao.data.year}-${transacao.data.month.toString().padLeft(2, '0')}-${transacao.data.day.toString().padLeft(2, '0')}';
        final atual = prefs.getDouble(key) ?? 0.0;
        final novo = atual + valor;
        await prefs.setDouble(key, novo);
        await DailySpendLimitNotifier.onSpendUpdated(
          prefs: prefs,
          gastosDayKey: key,
          newTotal: novo,
        );
      }

      TransactionRefreshSignal.notify();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            cloudOk
                ? strings.text(
                    'Transação salva com sucesso.',
                    en: 'Transaction saved successfully.',
                    es: 'Transacción guardada correctamente.',
                  )
                : strings.text(
                    'Registo guardado neste telemóvel; a sincronizar com a nuvem em segundo plano.',
                    en: 'Record saved on this phone; syncing with the cloud in the background.',
                    es: 'Registro guardado en este teléfono; sincronizando con la nube en segundo plano.',
                  ),
          ),
          backgroundColor: const Color(0xFF26DE81),
        ),
      );
      final sub = context.read<SubscriptionProvider>();
      await AdManagerService.instance.showInterstitialIfAvailable(
        sub,
        onDismissed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        },
      );
    } finally {
      if (mounted) setState(() => _salvando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = LocaleUiStrings.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          strings.text(
            'Adicionar Transação',
            en: 'Add Transaction',
            es: 'Agregar transacción',
          ),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              _sectionTitle(
                strings.text('Detalhes', en: 'Details', es: 'Detalles'),
              ),
              const SizedBox(height: 12),
              _card(
                children: [
                  _textField(
                    controller: _descricaoController,
                    label: strings.text(
                      'Descrição',
                      en: 'Description',
                      es: 'Descripción',
                    ),
                    hint: strings.text(
                      'Ex: Mercado, Uber, Restaurante...',
                      en: 'Ex: Market, Uber, Restaurant...',
                      es: 'Ej: Mercado, Uber, Restaurante...',
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return strings.text(
                          'Informe uma descrição',
                          en: 'Enter a description',
                          es: 'Ingresa una descripción',
                        );
                      }
                      return null;
                    },
                  ),
                  const Divider(color: Colors.white12),
                  _textField(
                    controller: _valorController,
                    label: 'Valor',
                    hint: 'Ex: 49,90',
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return strings.text(
                          'Informe o valor',
                          en: 'Enter the amount',
                          es: 'Ingresa el valor',
                        );
                      }
                      final parsed = _parseValor(v);
                      if (parsed <= 0) {
                        return strings.text(
                          'Valor inválido',
                          en: 'Invalid amount',
                          es: 'Valor inválido',
                        );
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _sectionTitle(
                strings.text(
                  'Categoria e tipo',
                  en: 'Category and type',
                  es: 'Categoría y tipo',
                ),
              ),
              const SizedBox(height: 12),
              _card(
                children: [
                  ListTile(
                    leading: const Icon(Icons.category, color: Colors.white70),
                    title: Text(
                      strings.text(
                        'Categoria',
                        en: 'Category',
                        es: 'Categoría',
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _categoria,
                        dropdownColor: const Color(0xFF1E293B),
                        iconEnabledColor: const Color(0xFF00D9FF),
                        style: const TextStyle(color: Colors.white),
                        items: _categorias
                            .map(
                              (c) => DropdownMenuItem<String>(
                                value: c,
                                child: Text(c),
                              ),
                            )
                            .toList(),
                        onChanged: (v) {
                          if (v == null) return;
                          setState(() => _categoria = v);
                        },
                      ),
                    ),
                  ),
                  const Divider(color: Colors.white12),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          strings.text(
                            'Tipo de pagamento',
                            en: 'Payment type',
                            es: 'Tipo de pago',
                          ),
                          style: TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: _choiceChip(
                                selected:
                                    _tipoPagamento == TipoPagamento.debito,
                                label: strings.text(
                                  'Débito',
                                  en: 'Debit',
                                  es: 'Débito',
                                ),
                                onTap: () => setState(
                                  () => _tipoPagamento = TipoPagamento.debito,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _choiceChip(
                                selected:
                                    _tipoPagamento == TipoPagamento.credito,
                                label: strings.text(
                                  'Crédito',
                                  en: 'Credit',
                                  es: 'Crédito',
                                ),
                                onTap: () => setState(
                                  () => _tipoPagamento = TipoPagamento.credito,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _sectionTitle(strings.text('Data', en: 'Date', es: 'Fecha')),
              const SizedBox(height: 12),
              _card(
                children: [
                  ListTile(
                    leading: const Icon(Icons.event, color: Colors.white70),
                    title: Text(
                      strings.text(
                        'Data da transação',
                        en: 'Transaction date',
                        es: 'Fecha de transacción',
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      '${_data.day.toString().padLeft(2, '0')}/${_data.month.toString().padLeft(2, '0')}/${_data.year}',
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: Colors.white38,
                    ),
                    onTap: _selecionarData,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _salvando ? null : _salvar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00D9FF),
                    foregroundColor: const Color(0xFF0F172A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: _salvando
                      ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          strings.text('SALVAR', en: 'SAVE', es: 'GUARDAR'),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                strings.text(
                  'Dica: depois de salvar, ela já aparece no Dashboard e no Histórico.',
                  en: 'Tip: after saving, it appears on the Dashboard and History.',
                  es: 'Consejo: después de guardar, aparece en el Panel y en el Historial.',
                ),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.35),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        color: Color(0xFF00D9FF),
        fontSize: 12,
        fontWeight: FontWeight.w600,
        letterSpacing: 1,
      ),
    );
  }

  Widget _card({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: Column(children: children),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: const TextStyle(color: Colors.white38),
          filled: true,
          fillColor: const Color(0xFF0F172A),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF00D9FF)),
          ),
        ),
      ),
    );
  }

  Widget _choiceChip({
    required bool selected,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xFF00D9FF).withValues(alpha: 0.2)
              : const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? const Color(0xFF00D9FF) : Colors.white12,
            width: selected ? 2 : 1,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? const Color(0xFF00D9FF) : Colors.white70,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
