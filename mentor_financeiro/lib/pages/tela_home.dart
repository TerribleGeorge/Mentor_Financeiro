// ==============================================================================
// TELA HOME - TELA PRINCIPAL
// ==============================================================================
// Tela principal do app após login.
// Exibe:
//
// - Cabeçalho com saudação e nome do usuário
// - Card do limite diário disponível
// - Chat com a Karine (assistente IA)
// - Botões de registro de saída/entrada
// - Resumo do dia (gastos e ganhos)
//
// Importance: Dashboard principal do usuário
// Impacto: Primeira tela após login, maior engajamento
// ==============================================================================

// Flutter Material
import 'package:flutter/material.dart';

// Armazenamento local
import 'package:shared_preferences/shared_preferences.dart';

// Serviço da Karine (IA)
import '../services/karine_service.dart';

// ==============================================================================
// WIDGET STATEFUL
// ==============================================================================
class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

// ==============================================================================
// ESTADO DA TELA HOME
// ==============================================================================
class _TelaHomeState extends State<TelaHome> {
  // ==============================================================================
  // SERVIÇOS
  // ==============================================================================

  // Karine: Assistente financeira IA
  final KarineService _karineService = KarineService();

  // ==============================================================================
  // VARIÁVEIS DE ESTADO
  // ==============================================================================

  // Limite diário disponível hoje
  double _limiteDiario = 0;

  // Total gasto hoje
  double _gastosHoje = 0;

  // Total recebido hoje
  double _ganhosHoje = 0;

  // Porcentagem do limite usada (0.0 - 1.0)
  double _porcentagem = 0;

  // Nome do usuário
  String _nomeUsuario = 'Usuário';

  // Estado de carregamento
  bool _carregando = false;

  // ==============================================================================
  // CONTROLADORES
  // ==============================================================================

  // Campo de texto do chat
  final TextEditingController _mensagemController = TextEditingController();

  // Scroll do chat
  final ScrollController _scrollController = ScrollController();

  // Lista de mensagens do chat
  final List<_Mensagem> _mensagens = [];

  // ==============================================================================
  // CICLO DE VIDA
  // ==============================================================================

  @override
  void initState() {
    super.initState();
    // Inicializa Karine e carrega dados
    _iniciarKarine();
    _carregarDados();
  }

  // Cleanup
  @override
  void dispose() {
    _mensagemController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  // ==============================================================================
  // INICIALIZAÇÃO DA KARINE
  // ==============================================================================
  void _iniciarKarine() {
    _karineService.limparHistorico();
  }

  // ==============================================================================
  // CARREGAR DADOS FINANCEIROS
  // ==============================================================================
  // Calcula limite diário baseado em:
  // - Renda fixa + extra
  // - Gastos fixos mensais
  // - Reserva de emergência
  // - Dias restantes no mês
  //
  // Importance:核心功能 do app
  // Impacto: Controle financeiro automático
  // ==============================================================================
  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();
    _nomeUsuario = prefs.getString('nome_usuario') ?? 'Usuário';

    // ==============================================================================
    // CÁLCULO DE DIAS
    // ==============================================================================

    // Data atual
    final hoje = DateTime.now();

    // Total de dias neste mês
    final diasNoMes = DateTime(hoje.year, hoje.month + 1, 0).day;

    // Dias restantes (incluindo hoje)
    final diasRestantes = diasNoMes - hoje.day + 1;

    // ==============================================================================
    // RENDA
    // ==============================================================================

    // Renda fixa mensal
    double rendaFixa =
        double.tryParse(
          prefs.getString('valor_Renda Fixa')?.replaceAll(',', '.') ?? '0',
        ) ??
        0;

    // Renda extra/mensal
    double rendaExtra =
        double.tryParse(
          prefs.getString('valor_Renda Extra')?.replaceAll(',', '.') ?? '0',
        ) ??
        0;

    // Renda total mensal
    double totalRenda = rendaFixa + rendaExtra;

    // ==============================================================================
    // GASTOS FIXOS
    // ==============================================================================

    double gastosFixos = 0;

    // Lista de gastos fixos típicos
    const List<String> gastos = [
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
    ];

    // Soma todos os gastos
    for (final g in gastos) {
      gastosFixos +=
          double.tryParse(
            prefs.getString('valor_$g')?.replaceAll(',', '.') ?? '0',
          ) ??
          0;
    }

    // ==============================================================================
    // RESERVA DE EMERGÊNCIA
    // ==============================================================================

    double reservaEmergencia =
        double.tryParse(
          prefs.getString('valor_Reserva Emergência')?.replaceAll(',', '.') ??
              '0',
        ) ??
        0;

    // ==============================================================================
    // CÁLCULO DO LIMITE
    // ==============================================================================

    // Sobra mensal disponível
    double sobraMensal = totalRenda - gastosFixos - reservaEmergencia;

    // Limite diário base
    double limiteBase = sobraMensal > 0 ? sobraMensal / diasRestantes : 0;

    // ==============================================================================
    // GASTOS DE HOJE
    // ==============================================================================

    // Chave baseada na data (yyyy-MM-dd)
    final dataHoje = hoje.toIso8601String().split('T')[0];
    _gastosHoje = prefs.getDouble('gastos_$dataHoje') ?? 0;
    _ganhosHoje = prefs.getDouble('ganhos_$dataHoje') ?? 0;

    // Limite atual: base + ganhos - gastos
    double limiteAtual = limiteBase - _gastosHoje + _ganhosHoje;

    // ==============================================================================
    // LIMITE MÍNIMO
    // ==============================================================================

    // Garante mínimo de R$ 50 se tiver algo positivo
    if (limiteAtual < 50 && limiteAtual >= 0) {
      limiteAtual = 50;
    }

    // ==============================================================================
    // PORCENTAGEM USADA
    // ==============================================================================

    double porcentagem = 0;
    if (limiteAtual > 0) {
      // Porcentagem usada
      porcentagem = _gastosHoje / limiteAtual;
      // Máximo 100%
      if (porcentagem > 1) porcentagem = 1;
    } else if (limiteAtual < 0) {
      // Estouro = 100%
      porcentagem = 1;
    }

    // Atualiza UI
    if (mounted) {
      setState(() {
        _limiteDiario = limiteAtual;
        _porcentagem = porcentagem;
      });
    }
  }

  // ==============================================================================
  // ENVIAR MENSAGEM PARA KARINE
  // ==============================================================================
  Future<void> _enviarMensagem() async {
    final texto = _mensagemController.text.trim();
    if (texto.isEmpty || _carregando) return;

    // Limpa campo
    _mensagemController.clear();

    // Adiciona mensagem do usuário
    setState(() {
      _carregando = true;
      _mensagens.add(_Mensagem(texto: texto, ehUsuario: true));
    });

    // Scroll para fim
    _rolarParaFim();

    try {
      // Envia para Karine com contexto financeiro
      final resposta = await _karineService.enviarMensagem(
        texto,
        limiteDiario: _limiteDiario,
        gastosHoje: _gastosHoje,
        ganhosHoje: _ganhosHoje,
      );

      // Adiciona resposta
      if (mounted) {
        setState(() {
          _mensagens.add(_Mensagem(texto: resposta, ehUsuario: false));
        });
      }
    } catch (e) {
      // Erro técnico
      if (mounted) {
        debugPrint('KARINE ERRO: $e');
        setState(() {
          _mensagens.add(
            _Mensagem(
              texto: 'Erro Técnico: ${e.toString().split(':').last.trim()}',
              ehUsuario: false,
            ),
          );
        });
      }
    } finally {
      // Finaliza carregamento
      if (mounted) {
        setState(() => _carregando = false);
        _rolarParaFim();
      }
    }
  }

  // ==============================================================================
  // SCROLL PARA FIM DO CHAT
  // ==============================================================================
  void _rolarParaFim() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // ==============================================================================
  // COR DO LIMITE
  // ==============================================================================
  // Retorna cor baseada no status do limite:
  // - Verde: < 50% usado
  // - Laranja: 50-80% usado
  // - Vermelho: > 80% ou negativado
  // ==============================================================================
  Color _corLimite() {
    if (_limiteDiario < 0) return Colors.redAccent;
    if (_porcentagem < 0.5) return Colors.greenAccent;
    if (_porcentagem < 0.8) return Colors.orangeAccent;
    return Colors.redAccent;
  }

  // ==============================================================================
  // REGISTRAR MOVIMENTAÇÃO
  // ==============================================================================
  // Bottom sheet para registrar saída ou entrada
  // Importance: Registro rápido de transações
  // ==============================================================================
  void _registrarMovimentacao(bool isGasto) {
    final controller = TextEditingController();
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle visual
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),

            // Título
            Text(
              isGasto ? 'REGISTRAR SAÍDA' : 'REGISTRAR ENTRADA',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Campo de valor
            TextField(
              controller: controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              autofocus: true,
              style: const TextStyle(color: Colors.white, fontSize: 32),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: '0,00',
                hintStyle: TextStyle(color: Colors.white24),
                prefixText: 'R\$ ',
                prefixStyle: TextStyle(color: Colors.white, fontSize: 32),
              ),
            ),
            const SizedBox(height: 20),

            // Botão confirmar
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () async {
                  final valor =
                      double.tryParse(controller.text.replaceAll(',', '.')) ??
                      0;
                  if (valor > 0) {
                    final prefs = await SharedPreferences.getInstance();
                    final dataHoje = DateTime.now().toIso8601String().split(
                      'T',
                    )[0];
                    final chave = isGasto
                        ? 'gastos_$dataHoje'
                        : 'ganhos_$dataHoje';
                    final atual = prefs.getDouble(chave) ?? 0;
                    await prefs.setDouble(chave, atual + valor);
                    _carregarDados(); // Recalcula limite
                  }
                  if (ctx.mounted) Navigator.pop(ctx);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isGasto
                      ? Colors.redAccent
                      : Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  'CONFIRMAR',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
  // BUILD (CONSTRUÇÃO DA UI)
  // ==============================================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              _cabecalho(),
              const SizedBox(height: 15),
              _cardLimite(),
              const SizedBox(height: 15),
              _chatArea(),
              const SizedBox(height: 15),
              _botoesAcao(),
              const SizedBox(height: 15),
              _resumoDia(),
            ],
          ),
        ),
      ),
    );
  }

  // ==============================================================================
  // CABEÇALHO
  // ==============================================================================
  Widget _cabecalho() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _gerarSaudacao(), // "Bom dia/tarde/noite"
                style: const TextStyle(color: Colors.white54, fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                _nomeUsuario,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Ícone de notificações
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              Icons.notifications_rounded,
              color: Colors.white54,
            ),
          ),
        ],
      ),
    );
  }

  // ==============================================================================
  // SAUDAÇÃO POR HORÁRIO
  // ==============================================================================
  String _gerarSaudacao() {
    final hora = DateTime.now().hour;
    if (hora < 12) return 'Bom dia!';
    if (hora < 18) return 'Boa tarde!';
    return 'Boa noite!';
  }

  // ==============================================================================
  // CARD DO LIMITE
  // ==============================================================================
  Widget _cardLimite() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_corLimite().withAlpha(40), _corLimite().withAlpha(15)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _corLimite().withAlpha(75), width: 1),
        ),
        child: Column(
          children: [
            // Label "LIMITE HOJE"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_balance_wallet,
                  color: _corLimite(),
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'LIMITE HOJE',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Valor do limite
            Text(
              'R\$ ${_limiteDiario.toStringAsFixed(2)}',
              style: TextStyle(
                color: _corLimite(),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            // Barra de progresso
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: _porcentagem,
                minHeight: 8,
                backgroundColor: Colors.white12,
                color: _corLimite(),
              ),
            ),
            const SizedBox(height: 8),

            // Porcentagem texto
            Text(
              '${(_porcentagem * 100).toStringAsFixed(0)}% usado',
              style: TextStyle(color: _corLimite(), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  // ==============================================================================
  // ÁREA DO CHAT (KARINE)
  // ==============================================================================
  Widget _chatArea() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 280,
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            // Header do chat
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Avatar da Karine
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00D9FF).withAlpha(50),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Color(0xFF00D9FF),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Karine',
                    style: TextStyle(
                      color: Color(0xFF00D9FF),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  // Indicador de carregamento
                  if (_carregando)
                    const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Color(0xFF00D9FF),
                      ),
                    ),
                ],
              ),
            ),
            const Divider(color: Colors.white12, height: 1),

            // Lista de mensagens
            Expanded(
              child: _mensagens.isEmpty
                  ? const Center(
                      child: Text(
                        'Digite para a Karine...',
                        style: TextStyle(color: Colors.white38, fontSize: 13),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: _mensagens.length,
                      itemBuilder: (context, index) =>
                          _mensagemBubble(_mensagens[index]),
                    ),
            ),
            const Divider(color: Colors.white12, height: 1),

            // Campo de input
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _mensagemController,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Digite para a Karine...',
                        hintStyle: const TextStyle(
                          color: Colors.white38,
                          fontSize: 13,
                        ),
                        filled: true,
                        fillColor: const Color(0xFF0F172A),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        isDense: true,
                      ),
                      onSubmitted: (_) => _enviarMensagem(),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Botão enviar
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF00D9FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                      onPressed: _carregando ? null : _enviarMensagem,
                      icon: const Icon(
                        Icons.send,
                        color: Color(0xFF0F172A),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==============================================================================
  // BOLHA DE MENSAGEM
  // ==============================================================================
  Widget _mensagemBubble(_Mensagem msg) {
    return Align(
      alignment: msg.ehUsuario ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 6),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: msg.ehUsuario
              ? const Color(0xFF00D9FF).withAlpha(40)
              : const Color(0xFF0F172A),
          borderRadius: BorderRadius.circular(15),
        ),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Text(
          msg.texto,
          style: TextStyle(
            color: msg.ehUsuario ? const Color(0xFF00D9FF) : Colors.white70,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  // ==============================================================================
  // BOTÕES DE AÇÃO
  // ==============================================================================
  Widget _botoesAcao() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          // Botão SAÍDA
          Expanded(
            child: _botao(
              Icons.arrow_downward,
              'SAÍDA',
              Colors.redAccent,
              () => _registrarMovimentacao(true),
            ),
          ),
          const SizedBox(width: 12),

          // Botão ENTRADA
          Expanded(
            child: _botao(
              Icons.arrow_upward,
              'ENTRADA',
              Colors.greenAccent,
              () => _registrarMovimentacao(false),
            ),
          ),
        ],
      ),
    );
  }

  // ==============================================================================
  // BOTÃO CUSTOMIZADO
  // ==============================================================================
  Widget _botao(IconData icone, String texto, Color cor, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: cor.withAlpha(25),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: cor.withAlpha(75)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icone, color: cor, size: 24),
            const SizedBox(width: 8),
            Text(
              texto,
              style: TextStyle(
                color: cor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==============================================================================
  // RESUMO DO DIA
  // ==============================================================================
  Widget _resumoDia() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RESUMO HOJE',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 11,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _resumoItem('Gastos', _gastosHoje, Colors.redAccent),
                Container(width: 1, height: 35, color: Colors.white24),
                _resumoItem('Ganhos', _ganhosHoje, Colors.greenAccent),
              ],
            ),
          ],
        ),
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
        const SizedBox(height: 4),
        Text(
          'R\$ ${valor.toStringAsFixed(2)}',
          style: TextStyle(
            color: cor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ==============================================================================
// CLASSE DE MENSAGEM
// ==============================================================================
// Modelo simples para representar uma mensagem no chat
// ==============================================================================
class _Mensagem {
  final String texto;
  final bool ehUsuario;
  _Mensagem({required this.texto, required this.ehUsuario});
}
