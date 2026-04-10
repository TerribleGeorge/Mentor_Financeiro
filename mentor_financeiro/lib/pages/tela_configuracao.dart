// ==============================================================================
// TELA CONFIGURAÇÃO - CONFIGURAÇÃO FINANCEIRA
// ==============================================================================
// Tela para usuário configurar suas finanças pessoais.
//
// Permite configurar:
// - Renda Fixa (salário)
// - Renda Extra (freelance, gorjetas)
// - Gastos Fixos (aluguel, luz, internet, etc)
//
// Importance: Configuração inicial essencial
// Impacto: Sem ela, app não consegue calcular limite
// ==============================================================================

// Flutter Material
import 'package:flutter/material.dart';

// Armazenamento local
import 'package:shared_preferences/shared_preferences.dart';

// Serviço Firebase (para backup na nuvem)
import '../services/firebase_service.dart';

// Tela Principal
import 'tela_home.dart';

// ==============================================================================
// WIDGET STATEFUL
// ==============================================================================
class TelaConfiguracao extends StatefulWidget {
  const TelaConfiguracao({super.key});

  @override
  State<TelaConfiguracao> createState() => _TelaConfiguracaoState();
}

// ==============================================================================
// ESTADO DA TELA CONFIGURAÇÃO
// ==============================================================================
class _TelaConfiguracaoState extends State<TelaConfiguracao> {
  // ==============================================================================
  // FORM KEY
  // ==============================================================================
  // Validação do formulário
  final _formKey = GlobalKey<FormState>();

  // ==============================================================================
  // CONTROLADORES
  // ==============================================================================
  // Map de controllers para cada campo
  final Map<String, TextEditingController> _controllers = {};

  // ==============================================================================
  // CAMPOS ATIVOS
  // ==============================================================================
  // Controla quais campos estão ativos (marcados)
  final Map<String, bool> _camposAtivos = {};

  // Estado de salvamento
  bool _salvando = false;

  // ==============================================================================
  // DEFINIÇÃO DOS CAMPOS
  // ==============================================================================
  // Lista de campos de configuração
  final List<_CampoConfig> _campos = [
    //RENDA
    const _CampoConfig(
      'Renda Fixa',
      'Seu salário mensal',
      true, // Obrigatório
      ehRenda: true,
      cor: Colors.greenAccent,
    ),
    const _CampoConfig(
      'Renda Extra',
      'Freelances, gorjetas,etc',
      true,
      ehRenda: true,
      cor: Colors.tealAccent,
    ),
    // GASTOS
    const _CampoConfig(
      'Aluguel',
      'Valor do aluguel',
      true,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Pensão',
      'Pensão alimentícia',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Condomínio',
      'Valor do condomínio',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Internet',
      'Serviço de internet',
      true,
      cor: Colors.redAccent,
    ),
    const _CampoConfig('Luz', 'Conta de luz', true, cor: Colors.redAccent),
    const _CampoConfig('Gás', 'Botijão de gás', false, cor: Colors.redAccent),
    const _CampoConfig(
      'Mercado',
      'Supermercado mensal',
      true,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Academia',
      'Academia ou esporte',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Cartão',
      'Cartão de crédito',
      true,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Seguro',
      'Seguro do carro/casa',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Transporte',
      'Transporte público/combustível',
      true,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Reserva Emergência',
      'Valor para reserva mensal',
      false,
      cor: Colors.amber,
    ),
  ];

  // ==============================================================================
  // CICLO DE VIDA
  // ==============================================================================

  @override
  void initState() {
    super.initState();
    // Inicializa controllers
    for (var campo in _campos) {
      _controllers[campo.nome] = TextEditingController();
      _camposAtivos[campo.nome] = campo.obrigatorio;
    }
    // Carrega dados salvos
    _carregarDados();
  }

  // ==============================================================================
  // CARREGAR DADOS
  // ==============================================================================
  // Carrega valores salvos anteriormente
  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      for (var campo in _campos) {
        // Busca valor salvo
        _controllers[campo.nome]?.text =
            prefs.getString('valor_${campo.nome}') ?? '';
        // Busca ativo/inativo
        _camposAtivos[campo.nome] =
            prefs.getBool('ativo_${campo.nome}') ?? campo.obrigatorio;
      }
    });
  }

  // ==============================================================================
  // SALVAR DADOS
  // ==============================================================================
  // Salva todas as configurações
  Future<void> _salvarDados() async {
    // Valida formulário
    if (!_formKey.currentState!.validate()) return;

    setState(() => _salvando = true);

    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString('uid');

    // Prepara configurações para Firestore
    final Map<String, dynamic> configuracoes = {};

    // Salva cada campo
    for (var campo in _campos) {
      final valor = _controllers[campo.nome]?.text ?? '0';
      await prefs.setString('valor_${campo.nome}', valor);
      await prefs.setBool(
        'ativo_${campo.nome}',
        _camposAtivos[campo.nome] ?? false,
      );

      // Adiciona às configurações se ativo
      if (_camposAtivos[campo.nome] ?? false) {
        configuracoes[campo.nome] = {
          'valor': double.tryParse(valor.replaceAll(',', '.')) ?? 0,
          'ativo': true,
        };
      }
    }

    // Faz backup no Firestore
    if (uid != null) {
      await FirebaseService.atualizarConfiguracoes(uid, configuracoes);
    }

    // Marca como configurado
    await prefs.setBool('configurado', true);

    // Navega para tela principal
    if (mounted) {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const TelaHome()));
    }
  }

  // ==============================================================================
  // BUILD (CONSTRUÇÃO DA UI)
  // ==============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: const Text(
          'Configure suas Finanças',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Seção: RENDA
            _secao(
              '💰 SUA RENDA',
              const Color(0xFF00D9FF),
              _campos.where((c) => c.ehRenda).toList(),
            ),
            const SizedBox(height: 30),

            // Seção: GASTOS
            _secao(
              '📋 SEUS GASTOS FIXOS',
              Colors.redAccent,
              _campos.where((c) => !c.ehRenda).toList(),
            ),
            const SizedBox(height: 30),

            // Resumo financeiro
            _resumoFinanceiro(),
            const SizedBox(height: 30),

            // Botão salvar
            SizedBox(
              height: 60,
              child: ElevatedButton(
                onPressed: _salvando ? null : _salvarDados,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D9FF),
                  foregroundColor: const Color(0xFF0F172A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: _salvando
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text(
                        'SALVAR E CONTINUAR',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ==============================================================================
  // SEÇÃO (AGRUPAMENTO)
  // ==============================================================================
  Widget _secao(String titulo, Color cor, List<_CampoConfig> campos) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titulo,
          style: TextStyle(
            color: cor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 15),
        ...campos.map((campo) => _campoInput(campo)),
      ],
    );
  }

  // ==============================================================================
  // CAMPO DE INPUT
  // ==============================================================================
  Widget _campoInput(_CampoConfig campo) {
    // Verifica se campo está ativo
    bool ativo = _camposAtivos[campo.nome] ?? true;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(12),
          // Bordacolorida se ativo
          border: ativo
              ? Border.all(color: campo.cor.withValues(alpha: 0.5))
              : Border.all(
                  color: Colors.white.withValues(alpha: 0.1),
                  style: BorderStyle.solid,
                ),
        ),
        child: Column(
          children: [
            // Checkbox e título
            InkWell(
              onTap: () => setState(
                () => _camposAtivos[campo.nome] =
                    !(_camposAtivos[campo.nome] ?? true),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: _camposAtivos[campo.nome] ?? false,
                      onChanged: (value) => setState(
                        () => _camposAtivos[campo.nome] = value ?? false,
                      ),
                      activeColor: campo.cor,
                      checkColor: Colors.white,
                    ),
                    Expanded(
                      child: Text(
                        campo.nome,
                        style: TextStyle(
                          color: ativo ? Colors.white : Colors.white38,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Campo de valor (só mostra se ativo)
            if (_camposAtivos[campo.nome] ?? false)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: TextFormField(
                  controller: _controllers[campo.nome],
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: campo.hint,
                    hintStyle: const TextStyle(color: Colors.white24),
                    filled: true,
                    fillColor: const Color(0xFF0F172A),
                    prefixText: 'R\$ ',
                    prefixStyle: TextStyle(color: campo.cor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: campo.cor),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 12,
                    ),
                  ),
                  validator: (value) {
                    // Valida se campo obrigatório está vazio
                    if ((_camposAtivos[campo.nome] ?? false) &&
                        (value == null || value.isEmpty)) {
                      return 'Preencha ${campo.nome}';
                    }
                    return null;
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  // ==============================================================================
  // RESUMO FINANCEIRO
  // ==============================================================================
  // Calcula e exibe resumo: renda total, gastos total, sobra/déficit
  Widget _resumoFinanceiro() {
    double rendaTotal = 0;
    double gastosTotais = 0;

    // Soma valores ativos
    for (var campo in _campos) {
      if (_camposAtivos[campo.nome] ?? false) {
        double valor =
            double.tryParse(
              _controllers[campo.nome]?.text.replaceAll(',', '.') ?? '0',
            ) ??
            0;
        if (campo.ehRenda) {
          rendaTotal += valor;
        } else {
          gastosTotais += valor;
        }
      }
    }

    // Calcula sobra
    double sobra = rendaTotal - gastosTotais;
    // Positivo ou negativo
    bool positivo = sobra >= 0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: positivo
              ? [
                  Colors.greenAccent.withValues(alpha: 0.2),
                  Colors.green.withValues(alpha: 0.1),
                ]
              : [
                  Colors.redAccent.withValues(alpha: 0.2),
                  Colors.red.withValues(alpha: 0.1),
                ],
        ),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: positivo ? Colors.greenAccent : Colors.redAccent,
        ),
      ),
      child: Column(
        children: [
          // Label
          Text(
            positivo ? 'SOBRA MENSAL' : 'DÉFICIT MENSAL',
            style: TextStyle(
              color: positivo ? Colors.greenAccent : Colors.redAccent,
              fontSize: 12,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 10),

          // Valor
          Text(
            'R\$ ${sobra.toStringAsFixed(2)}',
            style: TextStyle(
              color: positivo ? Colors.greenAccent : Colors.redAccent,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),

          // Detalhes
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _resumoItem('Renda', rendaTotal, Colors.greenAccent),
              _resumoItem('Gastos', gastosTotais, Colors.redAccent),
            ],
          ),
        ],
      ),
    );
  }

  // ==============================================================================
  // ITEM DO RESUMO
  // ==============================================================================
  Widget _resumoItem(String label, double valor, Color cor) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white54, fontSize: 12),
        ),
        Text(
          'R\$ ${valor.toStringAsFixed(2)}',
          style: TextStyle(color: cor, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // ==============================================================================
  // LIMPEZA
  // ==============================================================================
  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}

// ==============================================================================
// CLASSE DE CONFIGURAÇÃO DE CAMPO
// ==============================================================================
// Modelo para armazenar configuração de cada campo
// ==============================================================================
class _CampoConfig {
  final String nome;
  final String hint;
  final bool obrigatorio;
  final bool ehRenda;
  final Color cor;

  const _CampoConfig(
    this.nome,
    this.hint,
    this.obrigatorio, {
    this.ehRenda = false,
    this.cor = Colors.grey,
  });
}
