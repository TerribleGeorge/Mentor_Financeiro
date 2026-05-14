import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/finance/daily_limit_calculator.dart';
import '../services/exchange_rate_service.dart';
import '../services/user_data_retention_service.dart';
import 'finance_configuration_page.dart';

class TelaMetas extends StatefulWidget {
  const TelaMetas({super.key});

  @override
  State<TelaMetas> createState() => _TelaMetasState();
}

class _TelaMetasState extends State<TelaMetas> {
  final TextEditingController _sonhoController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  final TextEditingController _rentabilidadeController = TextEditingController(
    text: "10",
  );
  String _resultado = "Preencha para calcular";
  String _cotacaoDolar = "Carregando...";
  bool _sugereAbrirFinancas = false;

  static final NumberFormat _moneyInputFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '',
    decimalDigits: 2,
  );

  @override
  void initState() {
    super.initState();
    _carregarDados();
    _buscarCotacao();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _sonhoController.text = prefs.getString('sonho') ?? '';
      _valorController.text = prefs.getString('valor_sonho') ?? '';
      if (_sonhoController.text.isNotEmpty) _calcular();
    });
  }

  Future<void> _buscarCotacao() async {
    final snap = await ExchangeRateService.getLatest(base: 'USD');
    if (!mounted) return;
    final brl = snap?.rateTo('BRL');
    if (brl == null) {
      setState(() => _cotacaoDolar = 'Offline');
      return;
    }
    setState(() => _cotacaoDolar = 'USD: R\$ ${brl.toStringAsFixed(2)}');
  }

  Future<void> _salvarDados() async {
    _normalizarValorObjetivo();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('sonho', _sonhoController.text);
    await prefs.setString('valor_sonho', _valorController.text);
    unawaited(UserDataRetentionService.instance.backupNow(reason: 'goals'));
    _calcular();
  }

  void _normalizarValorObjetivo() {
    final value = DailyLimitCalculator.parseMoney(_valorController.text);
    if (value <= 0) return;
    final formatted = _moneyInputFormat.format(value).trim();
    if (_valorController.text == formatted) return;
    _valorController.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  void _calcular() async {
    final prefs = await SharedPreferences.getInstance();
    var renda = 0.0;
    for (final income in kFinanceIncomePrefFieldNames) {
      if (DailyLimitCalculator.fieldCountsTowardDailyLimit(prefs, income)) {
        renda += DailyLimitCalculator.parseMoney(
          prefs.getString('valor_$income'),
        );
      }
    }

    double gastos = 0;
    for (final g in kFinanceExpensePrefFieldNames) {
      if (DailyLimitCalculator.fieldCountsTowardDailyLimit(prefs, g)) {
        gastos += DailyLimitCalculator.parseMoney(prefs.getString('valor_$g'));
      }
    }
    double aporteMensal = renda - gastos;
    double meta = DailyLimitCalculator.parseMoney(_valorController.text);
    double taxa =
        double.tryParse(_rentabilidadeController.text.replaceAll(',', '.')) ??
        0;

    if (aporteMensal <= 0 || meta <= 0) {
      final linhas = <String>[
        'Sobra mensal estimada: R\$ ${aporteMensal.toStringAsFixed(2)}',
        '(soma das rendas ativas − soma dos gastos fixos ativos na configuração).',
      ];
      if (meta <= 0) {
        linhas.add('Indique acima o valor do objetivo em reais.');
      }
      if (aporteMensal <= 0) {
        linhas.add(
          'Com sobra zero ou negativa, ajuste rendas e gastos fixos em «Renda e Gastos Fixos».',
        );
      }
      setState(() {
        _resultado = linhas.join('\n');
        _sugereAbrirFinancas = true;
      });
      return;
    }

    setState(() => _sugereAbrirFinancas = false);

    double i = (taxa / 100) / 12;
    int meses;
    if (i > 0) {
      meses = (log((meta * i / aporteMensal) + 1) / log(1 + i)).ceil();
    } else {
      meses = (meta / aporteMensal).ceil();
    }

    setState(() {
      _resultado =
          "Investindo R\$ ${aporteMensal.toStringAsFixed(2)}/mês\ncom ${taxa.toStringAsFixed(0)}%aa, você alcanza\nem $meses meses! 🚀";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "MERCADO: $_cotacaoDolar",
          style: const TextStyle(color: Color(0xFF00D9FF), fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _cabecalho(),
            const SizedBox(height: 25),
            _campo("Qual é o seu SONHO?", _sonhoController, Icons.favorite),
            const SizedBox(height: 15),
            _campo(
              "Valor do Objetivo (R\$)",
              _valorController,
              Icons.attach_money,
              isMoney: true,
            ),
            const SizedBox(height: 15),
            _campo(
              "Rentabilidade Anual (%)",
              _rentabilidadeController,
              Icons.trending_up,
              isNumeric: true,
            ),
            const SizedBox(height: 25),
            _resultadoCard(),
            const SizedBox(height: 25),
            _botaoSalvar(),
          ],
        ),
      ),
    );
  }

  Widget _cabecalho() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple.withValues(alpha: 0.2),
            Colors.pink.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        children: [
          Icon(Icons.rocket_launch, color: Colors.purple, size: 40),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SIMULADOR DE SONHOS",
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    letterSpacing: 2,
                  ),
                ),
                Text(
                  "Quanto tempo para realizar?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _campo(
    String label,
    TextEditingController controller,
    IconData icone, {
    bool isMoney = false,
    bool isNumeric = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        keyboardType: isMoney || isNumeric
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        onEditingComplete: isMoney
            ? () {
                _normalizarValorObjetivo();
                FocusScope.of(context).nextFocus();
              }
            : null,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white54),
          prefixIcon: Icon(icone, color: const Color(0xFF00D9FF)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  Widget _resultadoCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF00D9FF).withValues(alpha: 0.15),
            const Color(0xFF00D9FF).withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF00D9FF).withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Icon(
            _sugereAbrirFinancas ? Icons.tune : Icons.auto_awesome,
            color: const Color(0xFF00D9FF),
            size: 30,
          ),
          const SizedBox(height: 15),
          Text(
            _resultado,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF00D9FF),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              height: 1.5,
            ),
          ),
          if (_sugereAbrirFinancas) ...[
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () async {
                  await Navigator.of(context).push<void>(
                    MaterialPageRoute<void>(
                      builder: (_) => const FinanceConfigurationPage(),
                    ),
                  );
                  if (!mounted) return;
                  await _carregarDados();
                  _calcular();
                },
                icon: const Icon(Icons.open_in_new, size: 18),
                label: const Text('Abrir Renda e Gastos Fixos'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF00D9FF),
                  side: const BorderSide(color: Color(0xFF00D9FF)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _botaoSalvar() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: _salvarDados,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00D9FF),
          foregroundColor: const Color(0xFF0F172A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: const Text(
          "CALCULAR E SALVAR",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _sonhoController.dispose();
    _valorController.dispose();
    _rentabilidadeController.dispose();
    super.dispose();
  }
}
