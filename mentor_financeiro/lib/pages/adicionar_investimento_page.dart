import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/investimento_model.dart';
import '../services/global_equity_quote_service.dart';
import '../services/investment_category_provider.dart';
import '../services/ticker_market_resolver.dart';

/// Cadastro de posição com tipos filtrados por [InvestmentCategoryProvider]
/// e busca inteligente de ticker (B3 vs NASDAQ/NYSE via Yahoo Finance HTTP).
class AdicionarInvestimentoPage extends StatefulWidget {
  const AdicionarInvestimentoPage({super.key});

  @override
  State<AdicionarInvestimentoPage> createState() =>
      _AdicionarInvestimentoPageState();
}

class _AdicionarInvestimentoPageState extends State<AdicionarInvestimentoPage> {
  final _formKey = GlobalKey<FormState>();
  final _valorController = TextEditingController();
  final _notasController = TextEditingController();
  final _tickerController = TextEditingController();

  String _tipoId = '';
  DateTime _data = DateTime.now();
  bool _salvando = false;
  bool _buscandoTicker = false;
  EquityQuoteLookupResult? _ultimaCotacao;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_tipoId.isNotEmpty) return;
    final cat = context.read<InvestmentCategoryProvider>();
    final opcoes = cat.registrationCategories;
    if (opcoes.isNotEmpty) {
      _tipoId = opcoes.first.id;
    }
  }

  @override
  void dispose() {
    _valorController.dispose();
    _notasController.dispose();
    _tickerController.dispose();
    super.dispose();
  }

  double _parseValor(String raw) {
    final normalized = raw.trim().replaceAll(RegExp(r'[R$\s]'), '');
    final withDot = normalized.replaceAll('.', '').replaceAll(',', '.');
    return double.tryParse(withDot) ?? 0.0;
  }

  Future<void> _lookupTicker() async {
    final q = _tickerController.text.trim();
    if (q.isEmpty) {
      setState(() => _ultimaCotacao = null);
      return;
    }

    setState(() {
      _buscandoTicker = true;
      _ultimaCotacao = null;
    });

    final result = await GlobalEquityQuoteService.lookup(q);

    if (!mounted) return;
    setState(() {
      _buscandoTicker = false;
      _ultimaCotacao = result;
    });

    if (result.quote == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Sem cotação para "${result.yahooSymbol}". Verifique o ticker.',
          ),
        ),
      );
    }
  }

  Future<void> _salvar() async {
    if (!_formKey.currentState!.validate()) return;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Faça login para guardar o investimento.')),
      );
      return;
    }

    final valor = _parseValor(_valorController.text);
    if (valor <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Indique um valor maior que zero.')),
      );
      return;
    }

    final rawTicker = _tickerController.text.trim();
    final marketEnum = rawTicker.isEmpty
        ? ListedMarket.unknown
        : TickerMarketResolver.classifyMarket(rawTicker);
    final marketTag = switch (marketEnum) {
      ListedMarket.b3 => 'B3',
      ListedMarket.nasdaqNyse => 'US',
      ListedMarket.unknown => null,
    };

    setState(() => _salvando = true);
    try {
      final yahooSym = rawTicker.isEmpty
          ? null
          : TickerMarketResolver.yahooFinanceSymbol(rawTicker);

      final model = InvestimentoModel(
        tipoId: _tipoId,
        valor: valor,
        moeda: 'BRL',
        data: _data,
        notas: _notasController.text.trim(),
        tickerInput: rawTicker.isEmpty ? null : rawTicker.toUpperCase(),
        yahooSymbol: yahooSym,
        listedMarket: marketTag,
      );

      await FirebaseFirestore.instance
          .collection('usuarios')
          .doc(user.uid)
          .collection('investimentos')
          .add(model.toFirestore());

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Investimento registado.'),
          backgroundColor: Color(0xFF26DE81),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao guardar: $e')),
      );
    } finally {
      if (mounted) setState(() => _salvando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cat = context.watch<InvestmentCategoryProvider>();
    final opcoes = cat.registrationCategories;
    final scheme = Theme.of(context).colorScheme;

    if (opcoes.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text('Novo investimento')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text('Nenhum tipo de investimento disponível para esta região.'),
          ),
        ),
      );
    }

    final validTipo = opcoes.any((o) => o.id == _tipoId)
        ? _tipoId
        : opcoes.first.id;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo investimento'),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Região da loja/conta: ${cat.effectiveCountryCode} · '
                '${cat.isBrazilMarket ? "catálogo Brasil" : "catálogo global"}',
                style: TextStyle(color: scheme.onSurface.withValues(alpha: 0.75)),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: validTipo,
                decoration: const InputDecoration(
                  labelText: 'Tipo',
                  border: OutlineInputBorder(),
                ),
                items: opcoes
                    .map(
                      (o) => DropdownMenuItem(
                        value: o.id,
                        child: Text(o.title),
                      ),
                    )
                    .toList(),
                onChanged: (v) {
                  if (v != null) setState(() => _tipoId = v);
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _tickerController,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  labelText: 'Ticker do ativo (opcional)',
                  hintText: 'AAPL · MSFT · PETR4 · VALE3',
                  border: const OutlineInputBorder(),
                  helperText:
                      'Identifica automaticamente B3 (ex.: PETR4) vs NASDAQ/NYSE (ex.: AAPL).',
                  suffixIcon: _buscandoTicker
                      ? const Padding(
                          padding: EdgeInsets.all(12),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : IconButton(
                          icon: const Icon(Icons.search),
                          tooltip: 'Buscar cotação (Yahoo Finance)',
                          onPressed: _lookupTicker,
                        ),
                ),
                onFieldSubmitted: (_) => _lookupTicker(),
              ),
              if (_ultimaCotacao?.quote != null) ...[
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Chip(
                        label: Text(
                          TickerMarketResolver.describeMarket(
                            _ultimaCotacao!.market,
                          ),
                        ),
                      ),
                      Chip(
                        label: Text(
                          '${_ultimaCotacao!.yahooSymbol} · '
                          '${_ultimaCotacao!.quote!.price.toStringAsFixed(2)} '
                          '${_ultimaCotacao!.quote!.currency}',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 16),
              TextFormField(
                controller: _valorController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: 'Valor (BRL)',
                  hintText: '0,00',
                  border: OutlineInputBorder(),
                  prefixText: 'R\$ ',
                ),
                validator: (s) {
                  if (s == null || s.trim().isEmpty) {
                    return 'Informe o valor';
                  }
                  if (_parseValor(s) <= 0) return 'Valor inválido';
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Data de referência'),
                subtitle: Text(
                  '${_data.day.toString().padLeft(2, '0')}/${_data.month.toString().padLeft(2, '0')}/${_data.year}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _data,
                    firstDate: DateTime(DateTime.now().year - 10),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null) setState(() => _data = picked);
                },
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _notasController,
                maxLines: 2,
                decoration: const InputDecoration(
                  labelText: 'Notas (opcional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _salvando ? null : _salvar,
                child: _salvando
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
