import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

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
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      setState(() => _cotacaoDolar = "USD: R\$ 5,10");
    } catch (e) {
      setState(() => _cotacaoDolar = "Offline");
    }
  }

  Future<void> _salvarDados() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('sonho', _sonhoController.text);
    await prefs.setString('valor_sonho', _valorController.text);
    _calcular();
  }

  void _calcular() async {
    final prefs = await SharedPreferences.getInstance();
    double rF =
        double.tryParse(
          prefs.getString('valor_Renda Fixa')?.replaceAll(',', '.') ?? '0',
        ) ??
        0;
    double rE =
        double.tryParse(
          prefs.getString('valor_Renda Extra')?.replaceAll(',', '.') ?? '0',
        ) ??
        0;
    double gastos = 0;
    for (var g in [
      'Aluguel',
      'Pensão',
      'Condomínio',
      'Internet',
      'Luz',
      'Gás',
      'Mercado',
      'Academia',
      'Cartão',
      'Seguro',
      'Transporte',
    ]) {
      gastos +=
          double.tryParse(
            prefs.getString('valor_$g')?.replaceAll(',', '.') ?? '0',
          ) ??
          0;
    }
    double aporteMensal = (rF + rE) - gastos;
    double meta =
        double.tryParse(_valorController.text.replaceAll(',', '.')) ?? 0;
    double taxa =
        double.tryParse(_rentabilidadeController.text.replaceAll(',', '.')) ??
        0;

    if (aporteMensal <= 0 || meta <= 0) {
      setState(
        () => _resultado = "Ajuste sua sobra mensal ou o valor da meta!",
      );
      return;
    }

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
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
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
            ),
            const SizedBox(height: 15),
            _campo(
              "Rentabilidade Anual (%)",
              _rentabilidadeController,
              Icons.trending_up,
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
    IconData icone,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
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
          const Icon(Icons.auto_awesome, color: Color(0xFF00D9FF), size: 30),
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
