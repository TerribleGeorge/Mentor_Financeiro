// Tela para usuário configurar suas finanças pessoais.
//
// Permite configurar:
// - Renda Fixa (salário)
// - Renda Extra (freelance, gorjetas)
// - Gastos Fixos (aluguel, luz, internet, etc)
//

import 'dart:async';

// Flutter Material
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Armazenamento local
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/finance/daily_limit_calculator.dart';
import '../core/constants/app_routes.dart';
import '../theme/classic_mode_style.dart';

// Serviço Firebase (para backup na nuvem)
import '../services/daily_spend_limit_notifier.dart';
import '../services/firebase_service.dart';
import '../services/finance_config_signals.dart';
import '../services/locale_ui_strings.dart';
import '../services/user_data_retention_service.dart';

/// Configuração de renda, saldo e gastos fixos (persistência local + Firestore).
class FinanceConfigurationPage extends StatefulWidget {
  const FinanceConfigurationPage({super.key});

  @override
  State<FinanceConfigurationPage> createState() =>
      _FinanceConfigurationPageState();
}

class _FinanceConfigurationPageState extends State<FinanceConfigurationPage> {
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

  /// Teto opcional do "limite hoje" (vazio = padrão R\$ 50; "0" = sem teto).
  final TextEditingController _tetoLimiteDiarioController =
      TextEditingController();

  List<DailySpendCapSuggestion> _tetoSugestoes = [];

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
      'Freelances, gorjetas; entradas (ex.: PIX recebido) podem somar aqui pelo monitor de notificações.',
      true,
      ehRenda: true,
      cor: Colors.tealAccent,
    ),
    const _CampoConfig(
      'Saldo Atual',
      'Saldo em conta (negativo se estiver no cheque especial)',
      false,
      ehSaldoConta: true,
      cor: Color(0xFF38BDF8),
    ),
    // GASTOS FIXOS (alinhado a [kFinanceExpensePrefFieldNames])
    const _CampoConfig(
      'Aluguel',
      'Valor do aluguel ou renda da casa',
      true,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Pensão',
      'Pensão alimentícia ou acordo judicial',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Condomínio',
      'Taxa condominial',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Financiamento (imóvel)',
      'Prestação do financiamento habitacional',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'IPTU (provisão mensal)',
      'Provisão mensal (IPTU e taxas do imóvel)',
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
    const _CampoConfig(
      'Água / esgoto',
      'Conta de água e esgoto',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Gás',
      'Botijão ou gás encanado',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Mercado',
      'Supermercado mensal',
      true,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Plano de saúde',
      'Mensalidade de plano ou convênio',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Educação (escola/curso)',
      'Mensalidades e cursos recorrentes',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Academia',
      'Academia ou esporte',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Transporte',
      'Transporte público / combustível',
      true,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Cartão',
      'Cartão de crédito (fatura/mínimo)',
      true,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Seguro',
      'Seguro do carro / casa / vida',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Telefone / celular',
      'Linha móvel ou fixa',
      false,
      cor: Colors.redAccent,
    ),
    const _CampoConfig(
      'Assinaturas digitais',
      'Streaming, apps, cloud, etc.',
      false,
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
      _camposAtivos[campo.nome] = campo.ehSaldoConta ? true : campo.obrigatorio;
    }
    // Carrega dados salvos
    _carregarDados();

    assert(
      listEquals(
        _campos
            .where((c) => !c.ehRenda && !c.ehSaldoConta)
            .map((c) => c.nome)
            .toList(),
        kFinanceExpensePrefFieldNames,
      ),
      'Alinhar _campos (gastos) com kFinanceExpensePrefFieldNames.',
    );
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
            prefs.getBool('ativo_${campo.nome}') ??
            (campo.ehSaldoConta ? true : campo.obrigatorio);
      }
      final cap = DailyLimitCalculator.readDailySpendCapOrNull(prefs);
      if (cap == null) {
        _tetoLimiteDiarioController.text = '';
      } else if (cap == 0) {
        _tetoLimiteDiarioController.text = '0';
      } else {
        _tetoLimiteDiarioController.text = cap == cap.roundToDouble()
            ? '${cap.round()}'
            : '$cap';
      }
      _tetoSugestoes = DailyLimitCalculator.suggestDailySpendCaps(prefs);
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
          'valor': DailyLimitCalculator.parseMoney(valor),
          'ativo': true,
        };
      }
    }

    // Marca como configurado
    await prefs.setBool('configurado', true);

    final tetoTxt = _tetoLimiteDiarioController.text.trim();
    if (tetoTxt.isEmpty) {
      await prefs.remove(kDailySpendCapPrefKey);
    } else {
      final tetoVal = DailyLimitCalculator.parseMoney(tetoTxt);
      await prefs.setDouble(kDailySpendCapPrefKey, tetoVal);
    }

    final hoje = DateTime.now().toIso8601String().split('T')[0];
    await DailySpendLimitNotifier.clearPhaseForDate(prefs, hoje);

    FinanceConfigSignals.notifySaved();

    if (!mounted) return;
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop(true);
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    }

    // A tela precisa responder na hora. A nuvem sincroniza em segundo plano e
    // não pode travar o usuário caso a conexão ou as regras recusem a escrita.
    if (uid != null) {
      unawaited(
        FirebaseService.atualizarConfiguracoes(uid, configuracoes).catchError((
          Object e,
          StackTrace st,
        ) {
          debugPrint('FinanceConfigurationPage sync: $e\n$st');
        }),
      );
    }
    unawaited(
      UserDataRetentionService.instance.backupNow(reason: 'finance_config'),
    );
  }

  // ==============================================================================
  // BUILD (CONSTRUÇÃO DA UI)
  // ==============================================================================
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
        title: Text(
          strings.text(
            'Configure suas Finanças',
            en: 'Configure your finances',
            es: 'Configura tus finanzas',
          ),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
              strings.text('SUA RENDA', en: 'YOUR INCOME', es: 'TUS INGRESOS'),
              const Color(0xFF00D9FF),
              _campos.where((c) => c.ehRenda).toList(),
              icon: '💰',
            ),
            const SizedBox(height: 30),

            _secao(
              strings.text(
                'SALDO NA CONTA',
                en: 'ACCOUNT BALANCE',
                es: 'SALDO EN CUENTA',
              ),
              const Color(0xFF38BDF8),
              _campos.where((c) => c.ehSaldoConta).toList(),
              icon: '🏦',
            ),
            const SizedBox(height: 30),

            // Seção: GASTOS
            _secao(
              strings.text(
                'SEUS GASTOS FIXOS',
                en: 'YOUR FIXED EXPENSES',
                es: 'TUS GASTOS FIJOS',
              ),
              Colors.redAccent,
              _campos.where((c) => !c.ehRenda && !c.ehSaldoConta).toList(),
              icon: '📋',
            ),
            const SizedBox(height: 30),

            _tetoLimiteDiarioSection(),
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
                    : Text(
                        strings.text(
                          'SALVAR E CONTINUAR',
                          en: 'SAVE AND CONTINUE',
                          es: 'GUARDAR Y CONTINUAR',
                        ),
                        style: const TextStyle(
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
  Widget _secao(
    String titulo,
    Color cor,
    List<_CampoConfig> campos, {
    String? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          icon == null ? titulo : '$icon $titulo',
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
          color: const Color(0xFF0D1118),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ativo
                ? campo.cor.withValues(alpha: 0.78)
                : Colors.white.withValues(alpha: 0.12),
            width: 1.2,
          ),
          boxShadow: ativo
              ? [
                  BoxShadow(
                    color: campo.cor.withValues(alpha: 0.14),
                    blurRadius: 18,
                    spreadRadius: 1,
                  ),
                ]
              : const [],
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
                        _campoNome(context, campo.nome),
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
                  onChanged: (_) => setState(() {}),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  decoration: InputDecoration(
                    hintText: _campoHint(context, campo.nome),
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
                      return LocaleUiStrings.of(context).text(
                        'Preencha ${_campoNome(context, campo.nome)}',
                        en: 'Fill in ${_campoNome(context, campo.nome)}',
                        es: 'Completa ${_campoNome(context, campo.nome)}',
                      );
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

  String _campoNome(BuildContext context, String nome) {
    final s = LocaleUiStrings.of(context);
    return switch (nome) {
      'Renda Fixa' => s.text(
        'Renda Fixa',
        en: 'Fixed income',
        es: 'Ingreso fijo',
      ),
      'Renda Extra' => s.text(
        'Renda Extra',
        en: 'Extra income',
        es: 'Ingreso extra',
      ),
      'Saldo Atual' => s.text(
        'Saldo Atual',
        en: 'Current balance',
        es: 'Saldo actual',
      ),
      'Aluguel' => s.text('Aluguel', en: 'Rent', es: 'Alquiler'),
      'Pensão' => s.text('Pensão', en: 'Support payment', es: 'Pensión'),
      'Condomínio' => s.text('Condomínio', en: 'Condo fee', es: 'Comunidad'),
      'Financiamento (imóvel)' => s.text(
        'Financiamento (imóvel)',
        en: 'Mortgage',
        es: 'Hipoteca',
      ),
      'IPTU (provisão mensal)' => s.text(
        'IPTU (provisão mensal)',
        en: 'Property tax provision',
        es: 'Provisión de impuesto inmobiliario',
      ),
      'Internet' => s.text('Internet', en: 'Internet', es: 'Internet'),
      'Luz' => s.text('Luz', en: 'Electricity', es: 'Electricidad'),
      'Água / esgoto' => s.text(
        'Água / esgoto',
        en: 'Water / sewage',
        es: 'Agua / alcantarillado',
      ),
      'Gás' => s.text('Gás', en: 'Gas', es: 'Gas'),
      'Mercado' => s.text('Mercado', en: 'Groceries', es: 'Supermercado'),
      'Plano de saúde' => s.text(
        'Plano de saúde',
        en: 'Health insurance',
        es: 'Seguro de salud',
      ),
      'Educação (escola/curso)' => s.text(
        'Educação (escola/curso)',
        en: 'Education',
        es: 'Educación',
      ),
      'Academia' => s.text('Academia', en: 'Gym', es: 'Gimnasio'),
      'Transporte' => s.text('Transporte', en: 'Transport', es: 'Transporte'),
      'Cartão' => s.text('Cartão', en: 'Card bill', es: 'Tarjeta'),
      'Seguro' => s.text('Seguro', en: 'Insurance', es: 'Seguro'),
      'Telefone / celular' => s.text(
        'Telefone / celular',
        en: 'Phone / mobile',
        es: 'Teléfono / móvil',
      ),
      'Assinaturas digitais' => s.text(
        'Assinaturas digitais',
        en: 'Digital subscriptions',
        es: 'Suscripciones digitales',
      ),
      'Reserva Emergência' => s.text(
        'Reserva Emergência',
        en: 'Emergency fund',
        es: 'Fondo de emergencia',
      ),
      _ => nome,
    };
  }

  String _campoHint(BuildContext context, String nome) {
    final s = LocaleUiStrings.of(context);
    return switch (nome) {
      'Renda Fixa' => s.text(
        'Seu salário mensal',
        en: 'Your monthly salary',
        es: 'Tu salario mensual',
      ),
      'Renda Extra' => s.text(
        'Freelances, gorjetas; entradas (ex.: PIX recebido) podem somar aqui pelo monitor de notificações.',
        en: 'Freelance work, tips, and incoming money can be added here by notification monitoring.',
        es: 'Freelances, propinas y entradas de dinero pueden sumarse aquí por el monitoreo de notificaciones.',
      ),
      'Saldo Atual' => s.text(
        'Saldo em conta (negativo se estiver no cheque especial)',
        en: 'Account balance (negative if overdrafted)',
        es: 'Saldo en cuenta (negativo si está en descubierto)',
      ),
      'Aluguel' => s.text(
        'Valor do aluguel ou renda da casa',
        en: 'Rent or housing payment',
        es: 'Valor del alquiler o vivienda',
      ),
      'Pensão' => s.text(
        'Pensão alimentícia ou acordo judicial',
        en: 'Support payment or court agreement',
        es: 'Pensión alimenticia o acuerdo judicial',
      ),
      'Condomínio' => s.text(
        'Taxa condominial',
        en: 'Condo fee',
        es: 'Cuota de comunidad',
      ),
      'Financiamento (imóvel)' => s.text(
        'Prestação do financiamento habitacional',
        en: 'Monthly mortgage payment',
        es: 'Cuota mensual de hipoteca',
      ),
      'IPTU (provisão mensal)' => s.text(
        'Provisão mensal (IPTU e taxas do imóvel)',
        en: 'Monthly provision for property taxes and fees',
        es: 'Provisión mensual de impuestos y tasas del inmueble',
      ),
      'Internet' => s.text(
        'Serviço de internet',
        en: 'Internet service',
        es: 'Servicio de internet',
      ),
      'Luz' => s.text(
        'Conta de luz',
        en: 'Electricity bill',
        es: 'Factura de electricidad',
      ),
      'Água / esgoto' => s.text(
        'Conta de água e esgoto',
        en: 'Water and sewage bill',
        es: 'Factura de agua y alcantarillado',
      ),
      'Gás' => s.text(
        'Botijão ou gás encanado',
        en: 'Cylinder or piped gas',
        es: 'Bombona o gas canalizado',
      ),
      'Mercado' => s.text(
        'Supermercado mensal',
        en: 'Monthly groceries',
        es: 'Supermercado mensual',
      ),
      'Plano de saúde' => s.text(
        'Mensalidade de plano ou convênio',
        en: 'Health plan monthly fee',
        es: 'Mensualidad del seguro médico',
      ),
      'Educação (escola/curso)' => s.text(
        'Mensalidades e cursos recorrentes',
        en: 'Recurring school or course fees',
        es: 'Mensualidades y cursos recurrentes',
      ),
      'Academia' => s.text(
        'Academia ou esporte',
        en: 'Gym or sports',
        es: 'Gimnasio o deporte',
      ),
      'Transporte' => s.text(
        'Transporte público / combustível',
        en: 'Public transport / fuel',
        es: 'Transporte público / combustible',
      ),
      'Cartão' => s.text(
        'Cartão de crédito (fatura/mínimo)',
        en: 'Credit card bill or minimum payment',
        es: 'Factura o pago mínimo de tarjeta',
      ),
      'Seguro' => s.text(
        'Seguro do carro / casa / vida',
        en: 'Car / home / life insurance',
        es: 'Seguro de coche / casa / vida',
      ),
      'Telefone / celular' => s.text(
        'Linha móvel ou fixa',
        en: 'Mobile or landline',
        es: 'Línea móvil o fija',
      ),
      'Assinaturas digitais' => s.text(
        'Streaming, apps, cloud, etc.',
        en: 'Streaming, apps, cloud, etc.',
        es: 'Streaming, apps, nube, etc.',
      ),
      'Reserva Emergência' => s.text(
        'Valor para reserva mensal',
        en: 'Monthly emergency fund amount',
        es: 'Valor mensual para fondo de emergencia',
      ),
      _ => nome,
    };
  }

  String _localizedCapSuggestionLabel(
    BuildContext context,
    DailySpendCapSuggestion suggestion,
  ) {
    final strings = LocaleUiStrings.of(context);
    return switch (suggestion.id) {
      'tight' => strings.text('Mais seguro', en: 'Safer', es: 'Más seguro'),
      'balanced' => strings.text(
        'Equilibrado',
        en: 'Balanced',
        es: 'Equilibrado',
      ),
      'loose' => strings.text('Com folga', en: 'Flexible', es: 'Con margen'),
      'formula' => strings.text(
        'Só a fórmula',
        en: 'Formula only',
        es: 'Solo la fórmula',
      ),
      _ => suggestion.label,
    };
  }

  String _localizedCapSuggestionRationale(
    BuildContext context,
    DailySpendCapSuggestion suggestion,
  ) {
    final strings = LocaleUiStrings.of(context);
    return switch (suggestion.id) {
      'tight' => strings.text(
        'Cerca de 35 % do guia — reduz risco de estourar o orçamento.',
        en: 'About 35% of the guide value, reducing the risk of exceeding the budget.',
        es: 'Cerca del 35% del valor guía, reduciendo el riesgo de superar el presupuesto.',
      ),
      'balanced' => strings.text(
        'Cerca de 50 % do guia — equilíbrio entre proteção e flexibilidade.',
        en: 'About 50% of the guide value, balancing protection and flexibility.',
        es: 'Cerca del 50% del valor guía, equilibrando protección y flexibilidad.',
      ),
      'loose' => strings.text(
        'Cerca de 70 % do guia — mais espaço para imprevistos do dia.',
        en: 'About 70% of the guide value, with more room for daily surprises.',
        es: 'Cerca del 70% del valor guía, con más margen para imprevistos del día.',
      ),
      'formula' => strings.text(
        'Sem teto manual: o ecrã usa o valor integral da fórmula (pode ser alto com saldo grande na conta).',
        en: 'No manual ceiling: the screen uses the full formula value, which can be high with a large account balance.',
        es: 'Sin techo manual: la pantalla usa el valor completo de la fórmula, que puede ser alto con un saldo grande.',
      ),
      _ => suggestion.rationale,
    };
  }

  // ==============================================================================
  // TETO DO LIMITE DIÁRIO (GUIA "LIMITE HOJE")
  // ==============================================================================
  Widget _tetoLimiteDiarioSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleUiStrings.of(context).text(
            '📈 TETO DO LIMITE DIÁRIO (GASTOS VARIÁVEIS)',
            en: '📈 DAILY LIMIT CEILING (VARIABLE EXPENSES)',
            es: '📈 TECHO DEL LÍMITE DIARIO (GASTOS VARIABLES)',
          ),
          style: TextStyle(
            color: Colors.amber.shade200,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          LocaleUiStrings.of(context).text(
            'A fórmula usa renda, gastos fixos, saldo e dias no mês. O teto limita o guia “Limite hoje”; o histórico e relatórios usam os gastos reais.\n'
            '• Vazio = teto padrão R\$ ${kDefaultDailySpendCapBrl.round()}\n'
            '• 0 = sem teto (mostra a fórmula inteira)\n'
            'Sugestões abaixo usam os valores já guardados (salva as finanças e reabre esta página para atualizar).',
            en:
                'The formula uses income, fixed expenses, balance, and days in the month. The ceiling limits the “Today limit” guide; history and reports use actual expenses.\n'
                '• Empty = default R\$ ${kDefaultDailySpendCapBrl.round()} ceiling\n'
                '• 0 = no ceiling (shows the full formula)\n'
                'Suggestions below use values already saved. Save finances and reopen this page to refresh.',
            es:
                'La fórmula usa ingresos, gastos fijos, saldo y días del mes. El techo limita la guía “Límite de hoy”; historial e informes usan gastos reales.\n'
                '• Vacío = techo predeterminado de R\$ ${kDefaultDailySpendCapBrl.round()}\n'
                '• 0 = sin techo (muestra la fórmula completa)\n'
                'Las sugerencias usan valores ya guardados. Guarda finanzas y vuelve a abrir esta página para actualizar.',
          ),
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.72),
            fontSize: 12,
            height: 1.35,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          LocaleUiStrings.of(context).text(
            'Sugestões de teto',
            en: 'Ceiling suggestions',
            es: 'Sugerencias de techo',
          ),
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.85),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _tetoSugestoes.map((s) {
            final label = _localizedCapSuggestionLabel(context, s);
            final rationale = _localizedCapSuggestionRationale(context, s);
            return Tooltip(
              message: rationale,
              child: ActionChip(
                label: Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
                backgroundColor: const Color(0xFF1E293B),
                side: BorderSide(
                  color: Colors.amber.shade200.withValues(alpha: 0.5),
                ),
                onPressed: () {
                  setState(() {
                    if (s.usesFormulaWithoutCap) {
                      _tetoLimiteDiarioController.text = '0';
                    } else {
                      final v = s.valueBrl;
                      _tetoLimiteDiarioController.text = v == v.roundToDouble()
                          ? '${v.round()}'
                          : v.toStringAsFixed(0);
                    }
                  });
                },
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        Text(
          LocaleUiStrings.of(context).text(
            'Valor do teto (manual)',
            en: 'Ceiling amount (manual)',
            es: 'Valor del techo (manual)',
          ),
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.85),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: _tetoLimiteDiarioController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: LocaleUiStrings.of(context).text(
              'Ex.: 80 ou deixe vazio para o padrão',
              en: 'Ex.: 80 or leave empty for the default',
              es: 'Ej.: 80 o deja vacío para el valor predeterminado',
            ),
            hintStyle: const TextStyle(color: Colors.white24),
            filled: true,
            fillColor: const Color(0xFF0F172A),
            prefixText: 'R\$ ',
            prefixStyle: TextStyle(color: Colors.amber.shade200),
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
              borderSide: BorderSide(color: Colors.amber.shade200),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 12,
            ),
          ),
        ),
      ],
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
      if (campo.ehSaldoConta) continue;
      if (_camposAtivos[campo.nome] ?? false) {
        final valor = DailyLimitCalculator.parseMoney(
          _controllers[campo.nome]?.text,
        );
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

    final corDestaque = positivo ? Colors.greenAccent : Colors.redAccent;

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
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: corDestaque.withValues(alpha: 0.78),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: corDestaque.withValues(alpha: 0.14),
            blurRadius: 18,
            spreadRadius: 1,
          ),
        ],
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
            ).withFinancialShadows(context),
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
          style: TextStyle(
            color: cor,
            fontWeight: FontWeight.bold,
          ).withFinancialShadows(context),
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
    _tetoLimiteDiarioController.dispose();
    super.dispose();
  }
}

// CLASSE DE CONFIGURAÇÃO DE CAMPO
// Modelo para armazenar configuração de cada campo
class _CampoConfig {
  final String nome;
  final String hint;
  final bool obrigatorio;
  final bool ehRenda;
  final bool ehSaldoConta;
  final Color cor;

  const _CampoConfig(
    this.nome,
    this.hint,
    this.obrigatorio, {
    this.ehRenda = false,
    this.ehSaldoConta = false,
    this.cor = Colors.grey,
  });
}
