import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/investimento_model.dart';
import '../services/global_equity_quote_service.dart';
import '../services/investment_category_provider.dart';
import '../services/locale_ui_strings.dart';
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
            LocaleUiStrings.of(context).text(
              'Sem cotação para "${result.yahooSymbol}". Verifique o ticker.',
              en: 'No quote for "${result.yahooSymbol}". Check the ticker.',
              es: 'Sin cotización para "${result.yahooSymbol}". Revisa el ticker.',
            ),
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
        SnackBar(
          content: Text(
            LocaleUiStrings.of(context).text(
              'Faça login para guardar o investimento.',
              en: 'Sign in to save the investment.',
              es: 'Inicia sesión para guardar la inversión.',
            ),
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
            LocaleUiStrings.of(context).text(
              'Indique um valor maior que zero.',
              en: 'Enter an amount greater than zero.',
              es: 'Indica un valor mayor que cero.',
            ),
          ),
        ),
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
        SnackBar(
          content: Text(
            LocaleUiStrings.of(context).text(
              'Investimento registado.',
              en: 'Investment saved.',
              es: 'Inversión registrada.',
            ),
          ),
          backgroundColor: const Color(0xFF26DE81),
        ),
      );
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            LocaleUiStrings.of(context).text(
              'Não foi possível guardar agora. Tente novamente.',
              en: 'Could not save right now. Try again.',
              es: 'No se pudo guardar ahora. Inténtalo de nuevo.',
            ),
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _salvando = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cat = context.watch<InvestmentCategoryProvider>();
    final strings = LocaleUiStrings.of(context);
    final opcoes = cat.registrationCategories;
    final scheme = Theme.of(context).colorScheme;

    if (opcoes.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            strings.text(
              'Novo investimento',
              en: 'New investment',
              es: 'Nueva inversión',
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              strings.text(
                'Nenhum tipo de investimento disponível para esta região.',
                en: 'No investment type is available for this region.',
                es: 'No hay ningún tipo de inversión disponible para esta región.',
              ),
            ),
          ),
        ),
      );
    }

    final validTipo = opcoes.any((o) => o.id == _tipoId)
        ? _tipoId
        : opcoes.first.id;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          strings.text(
            'Novo investimento',
            en: 'New investment',
            es: 'Nueva inversión',
          ),
        ),
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
                strings.text(
                  'Região da loja/conta: ${cat.effectiveCountryCode} · '
                  '${cat.isBrazilMarket ? "catálogo Brasil" : "catálogo global"}',
                  en:
                      'Store/account region: ${cat.effectiveCountryCode} · '
                      '${cat.isBrazilMarket ? "Brazil catalog" : "global catalog"}',
                  es:
                      'Región de tienda/cuenta: ${cat.effectiveCountryCode} · '
                      '${cat.isBrazilMarket ? "catálogo Brasil" : "catálogo global"}',
                ),
                style: TextStyle(
                  color: scheme.onSurface.withValues(alpha: 0.75),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: validTipo,
                decoration: InputDecoration(
                  labelText: LocaleUiStrings.of(
                    context,
                  ).text('Tipo', en: 'Type', es: 'Tipo'),
                  border: const OutlineInputBorder(),
                ),
                items: opcoes
                    .map(
                      (o) =>
                          DropdownMenuItem(value: o.id, child: Text(o.title)),
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
                  labelText: LocaleUiStrings.of(context).text(
                    'Ticker do ativo (opcional)',
                    en: 'Asset ticker (optional)',
                    es: 'Ticker del activo (opcional)',
                  ),
                  hintText: 'AAPL · MSFT · PETR4 · VALE3',
                  border: const OutlineInputBorder(),
                  helperText: LocaleUiStrings.of(context).text(
                    'Identifica automaticamente B3 (ex.: PETR4) vs NASDAQ/NYSE (ex.: AAPL).',
                    en: 'Automatically detects B3 (ex: PETR4) vs NASDAQ/NYSE (ex: AAPL).',
                    es: 'Detecta automáticamente B3 (ej.: PETR4) vs NASDAQ/NYSE (ej.: AAPL).',
                  ),
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
                          tooltip: LocaleUiStrings.of(context).text(
                            'Buscar cotação (Yahoo Finance)',
                            en: 'Search quote (Yahoo Finance)',
                            es: 'Buscar cotización (Yahoo Finance)',
                          ),
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
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: LocaleUiStrings.of(
                    context,
                  ).text('Valor (BRL)', en: 'Amount (BRL)', es: 'Valor (BRL)'),
                  hintText: '0,00',
                  border: const OutlineInputBorder(),
                  prefixText: 'R\$ ',
                ),
                validator: (s) {
                  if (s == null || s.trim().isEmpty) {
                    return LocaleUiStrings.of(context).text(
                      'Informe o valor',
                      en: 'Enter the amount',
                      es: 'Informa el valor',
                    );
                  }
                  if (_parseValor(s) <= 0) {
                    return LocaleUiStrings.of(context).text(
                      'Valor inválido',
                      en: 'Invalid amount',
                      es: 'Valor inválido',
                    );
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                title: Text(
                  LocaleUiStrings.of(context).text(
                    'Data de referência',
                    en: 'Reference date',
                    es: 'Fecha de referencia',
                  ),
                ),
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
                decoration: InputDecoration(
                  labelText: strings.text(
                    'Notas (opcional)',
                    en: 'Notes (optional)',
                    es: 'Notas (opcional)',
                  ),
                  border: const OutlineInputBorder(),
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
                    : Text(strings.text('Guardar', en: 'Save', es: 'Guardar')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
