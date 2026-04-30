import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../models/transacao_model.dart';
import '../services/localization_service.dart';
import '../services/mentoria_service.dart';
import '../services/exchange_rate_service.dart';
import 'adicionar_transacao_page.dart';
import '../widgets/premium_wrapper.dart';
import '../widgets/dica_card.dart';
import '../widgets/nota_saude_circle.dart';

class DashboardScreen extends StatefulWidget {
  final String title;
  final bool showBackButton;
  final bool chartsOnly;

  const DashboardScreen({
    super.key,
    this.title = 'Dashboard Financeiro',
    this.showBackButton = true,
    this.chartsOnly = false,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime _selectedMonth = DateTime.now();
  final double _metaDiaria = 150.0;
  String? _filtroTipoPagamento;
  List<DicaFinanceira> _dicas = [];
  NotaSaudeFinanceira? _notaSaude;
  /// Evita recalcular mentoria a cada frame quando os dados não mudaram.
  String? _mentoriaCacheKey;

  String _formatarMoeda(double valor) {
    return LocalizationService.formatCurrency(valor);
  }

  Color _getCategoryColor(String categoria) {
    switch (categoria) {
      case 'Alimentação':
        return const Color(0xFFFF9F43);
      case 'Transporte':
        return const Color(0xFFFECA57);
      case 'Lazer':
        return const Color(0xFFA55EEA);
      case 'Saúde':
        return const Color(0xFFFF6B9D);
      case 'Fixos':
        return const Color(0xFF45A7E3);
      default:
        return const Color(0xFF636E72);
    }
  }

  IconData _getCategoryIcon(String categoria) {
    switch (categoria) {
      case 'Alimentação':
        return Icons.restaurant;
      case 'Transporte':
        return Icons.directions_car;
      case 'Lazer':
        return Icons.movie;
      case 'Saúde':
        return Icons.local_hospital;
      case 'Fixos':
        return Icons.home;
      default:
        return Icons.receipt;
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return const Scaffold(
        body: Center(child: Text('Faça login para ver os relatórios')),
      );
    }

    final startOfMonth = DateTime(_selectedMonth.year, _selectedMonth.month, 1);
    final endOfMonth = DateTime(
      _selectedMonth.year,
      _selectedMonth.month + 1,
      0,
      23,
      59,
      59,
    );

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: widget.showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              )
            : null,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white70),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00D9FF),
        foregroundColor: const Color(0xFF0F172A),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AdicionarTransacaoPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('usuarios')
            .doc(user.uid)
            .collection('transacoes')
            .where(
              'data',
              isGreaterThanOrEqualTo: Timestamp.fromDate(startOfMonth),
            )
            .where('data', isLessThanOrEqualTo: Timestamp.fromDate(endOfMonth))
            .orderBy('data', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFF00D9FF)),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.cloud_off, color: Colors.white54, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      'Não foi possível carregar os relatórios.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.45),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return _buildEmptyState();
          }

          final transacoesAll = snapshot.data!.docs
              .map(
                (doc) =>
                    TransacaoModel.fromMap(doc.data() as Map<String, dynamic>),
              )
              .toList();

          var transacoes = transacoesAll;
          if (_filtroTipoPagamento != null) {
            transacoes = transacoesAll.where((t) {
              if (_filtroTipoPagamento == 'debito') {
                return t.tipoPagamento == TipoPagamento.debito;
              } else if (_filtroTipoPagamento == 'credito') {
                return t.tipoPagamento == TipoPagamento.credito;
              }
              return true;
            }).toList();
          }

          final checksum = transacoesAll.fold<double>(
            0,
            (running, t) =>
                running + t.valor + (t.data.millisecondsSinceEpoch % 10009),
          );
          final mentoriaKey =
              '${user.uid}|${startOfMonth.millisecondsSinceEpoch}|${transacoesAll.length}|$checksum';
          if (_mentoriaCacheKey != mentoriaKey) {
            _mentoriaCacheKey = mentoriaKey;
            // Evita setState durante build; só agenda quando o snapshot mudou de fato.
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (!mounted) return;
              MentoriaService.gerarDicas(
                uid: user.uid,
                transacoes: transacoesAll,
              ).then((dicas) {
                if (!mounted) return;
                setState(() => _dicas = dicas);
              });
              MentoriaService.calcularNotaSaude(
                uid: user.uid,
                transacoes: transacoesAll,
              ).then((nota) {
                if (!mounted) return;
                setState(() => _notaSaude = nota);
              });
            });
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!widget.chartsOnly) ...[
                  if (_notaSaude != null) ...[
                    PremiumWrapper(
                      feature: 'Nota de Saúde Financeira',
                      child: NotaSaudeCard(notaSaude: _notaSaude!),
                    ),
                    const SizedBox(height: 20),
                  ],
                  if (_dicas.isNotEmpty) ...[
                    PremiumWrapper(
                      feature: 'Mentoria (dicas personalizadas)',
                      child: DicaCarousel(dicas: _dicas),
                    ),
                    const SizedBox(height: 20),
                  ],
                ],
                _buildMonthSelector(),
                const SizedBox(height: 16),
                _buildTipoPagamentoFilter(),
                if (widget.chartsOnly) ...[
                  const SizedBox(height: 16),
                  _buildExchangeRatesCard(),
                  const SizedBox(height: 24),
                  _buildMoneyUsedLineChart(transacoes),
                ],
                if (transacoes.isEmpty && transacoesAll.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  _buildFiltroVazioBanner(),
                ],
                const SizedBox(height: 20),
                _buildTotalCard(transacoes),
                const SizedBox(height: 24),
                _buildPieChart(transacoes),
                const SizedBox(height: 24),
                _buildCardUsageChart(transacoes),
                const SizedBox(height: 24),
                PremiumWrapper(
                  feature: 'Análise avançada (últimos 7 dias)',
                  child: _buildCandleStickChart(transacoes),
                ),
                if (!widget.chartsOnly) ...[
                  const SizedBox(height: 24),
                  _buildRecentTransactions(transacoes.take(5).toList()),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildExchangeRatesCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: FutureBuilder<ExchangeRatesSnapshot?>(
        future: ExchangeRateService.getLatest(base: 'USD'),
        builder: (context, snap) {
          final data = snap.data;
          final usdBrl = data?.rateTo('BRL');
          final usdEur = data?.rateTo('EUR');
          final usdGbp = data?.rateTo('GBP');

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.currency_exchange, color: Colors.white70, size: 20),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'CÂMBIO (ATUALIZA 1x/DIA)',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/cambio'),
                    child: const Text('Ver todas'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              if (snap.connectionState == ConnectionState.waiting)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: LinearProgressIndicator(minHeight: 3),
                )
              else if (data == null || usdBrl == null)
                Text(
                  'Sem dados (offline). Abra “Ver todas” quando estiver com internet.',
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 12),
                )
              else
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _buildStatChip('USD→BRL: ${usdBrl.toStringAsFixed(2)}', Icons.attach_money),
                    if (usdEur != null)
                      _buildStatChip('USD→EUR: ${usdEur.toStringAsFixed(4)}', Icons.euro),
                    if (usdGbp != null)
                      _buildStatChip('USD→GBP: ${usdGbp.toStringAsFixed(4)}', Icons.currency_pound),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildMoneyUsedLineChart(List<TransacaoModel> transacoes) {
    final daysInMonth = DateTime(_selectedMonth.year, _selectedMonth.month + 1, 0).day;
    final daily = List<double>.filled(daysInMonth, 0);

    for (final t in transacoes) {
      if (t.data.year != _selectedMonth.year || t.data.month != _selectedMonth.month) continue;
      final idx = t.data.day - 1;
      if (idx >= 0 && idx < daily.length) daily[idx] += t.valor;
    }

    final total = daily.fold<double>(0, (acc, v) => acc + v);
    final maxY = daily.isEmpty ? 1.0 : daily.reduce((a, b) => a > b ? a : b);

    if (total <= 0) return const SizedBox.shrink();

    final spots = <FlSpot>[];
    for (int i = 0; i < daily.length; i++) {
      spots.add(FlSpot(i.toDouble() + 1, daily[i]));
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.show_chart, color: Colors.white70, size: 20),
              SizedBox(width: 8),
              Text(
                'DINHEIRO USADO (POR DIA)',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _formatarMoeda(total),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 210,
            child: LineChart(
              LineChartData(
                minX: 1,
                maxX: daily.length.toDouble(),
                minY: 0,
                maxY: maxY <= 0 ? 1 : (maxY * 1.2),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white.withValues(alpha: 0.08),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 42,
                      getTitlesWidget: (value, meta) => Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          value == 0 ? '0' : _formatarMoeda(value),
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.55),
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: (daily.length / 6).clamp(1, 10).toDouble(),
                      getTitlesWidget: (value, meta) {
                        final v = value.toInt();
                        if (v < 1 || v > daily.length) return const SizedBox.shrink();
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            v.toString(),
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.6),
                              fontSize: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    barWidth: 3,
                    color: const Color(0xFF00D9FF),
                    dotData: const FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: const Color(0xFF00D9FF).withValues(alpha: 0.12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFiltroVazioBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          Icon(Icons.filter_alt_off, color: Colors.amber.withValues(alpha: 0.9)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Nenhuma transação com este filtro. Use “Tudo” ou escolha outro tipo.',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.receipt_long, size: 80, color: Colors.white24),
          const SizedBox(height: 16),
          Text(
            'Nenhuma transação encontrada',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Suas transações aparecerão aqui',
            style: TextStyle(color: Colors.white.withValues(alpha: 0.3)),
          ),
        ],
      ),
    );
  }

  Widget _buildTipoPagamentoFilter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildFilterChip('Tudo', null),
          const SizedBox(width: 8),
          _buildFilterChip('Débito', 'debito'),
          const SizedBox(width: 8),
          _buildFilterChip('Crédito', 'credito'),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, String? tipo) {
    final isSelected = _filtroTipoPagamento == tipo;
    return GestureDetector(
      onTap: () => setState(() {
        _filtroTipoPagamento = tipo;
      }),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF00D9FF) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? const Color(0xFF00D9FF) : Colors.white30,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left, color: Color(0xFF00D9FF)),
            onPressed: () => setState(() {
              _selectedMonth = DateTime(
                _selectedMonth.year,
                _selectedMonth.month - 1,
              );
            }),
          ),
          Text(
            DateFormat(
              'MMMM yyyy',
              'pt_BR',
            ).format(_selectedMonth).toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right, color: Color(0xFF00D9FF)),
            onPressed: () => setState(() {
              _selectedMonth = DateTime(
                _selectedMonth.year,
                _selectedMonth.month + 1,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalCard(List<TransacaoModel> transacoes) {
    final total = transacoes.fold<double>(0, (acc, t) => acc + t.valor);
    final mediaDiaria = total / DateTime.now().day;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF00D9FF), Color(0xFF0066FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00D9FF).withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.account_balance_wallet,
                color: Colors.white70,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'TOTAL DO MÊS',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _formatarMoeda(total),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildStatChip('${transacoes.length} transações', Icons.receipt),
              const SizedBox(width: 12),
              _buildStatChip(
                '${_formatarMoeda(mediaDiaria)}/dia',
                Icons.trending_up,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white70, size: 14),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildPieChart(List<TransacaoModel> transacoes) {
    final categorias = <String, double>{};
    for (final t in transacoes) {
      final cat = t.categoria ?? 'Outros';
      categorias[cat] = (categorias[cat] ?? 0) + t.valor;
    }

    if (categorias.isEmpty) return const SizedBox.shrink();

    final total = categorias.values.fold(0.0, (acc, v) => acc + v);
    int touchedIndex = -1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'GASTOS POR CATEGORIA',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 220,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (event, response) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        response == null ||
                        response.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex = response.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              sectionsSpace: 2,
              centerSpaceRadius: 50,
              sections: categorias.entries.toList().asMap().entries.map((
                entry,
              ) {
                final index = entry.key;
                final cat = entry.value.key;
                final value = entry.value.value;
                final isTouched = index == touchedIndex;
                final percentage = (value / total * 100).toStringAsFixed(1);

                return PieChartSectionData(
                  color: _getCategoryColor(cat),
                  value: value,
                  title: isTouched ? '$percentage%' : '',
                  radius: isTouched ? 70 : 60,
                  titleStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: categorias.entries.map((entry) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getCategoryColor(entry.key),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  entry.key,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(width: 4),
                Text(
                  _formatarMoeda(entry.value),
                  style: const TextStyle(color: Colors.white54, fontSize: 11),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCardUsageChart(List<TransacaoModel> transacoes) {
    final credito = transacoes.where((t) => t.isCredito).toList();
    final debito = transacoes.where((t) => t.isDebito).toList();
    final totalCredito = credito.fold<double>(0, (acc, t) => acc + t.valor);
    final totalDebito = debito.fold<double>(0, (acc, t) => acc + t.valor);
    final maxY = (totalCredito > totalDebito ? totalCredito : totalDebito);

    if (totalCredito == 0 && totalDebito == 0) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.credit_card, color: Colors.white70, size: 20),
              SizedBox(width: 8),
              Text(
                'USO DO CARTÃO (CRÉDITO VS DÉBITO)',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildStatChip(
                'Crédito: ${_formatarMoeda(totalCredito)} (${credito.length})',
                Icons.credit_card,
              ),
              _buildStatChip(
                'Débito: ${_formatarMoeda(totalDebito)} (${debito.length})',
                Icons.account_balance_wallet,
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: maxY <= 0 ? 1 : (maxY * 1.15),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: maxY <= 0 ? 1 : (maxY / 4),
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white.withValues(alpha: 0.08),
                    strokeWidth: 1,
                  ),
                ),
                titlesData: FlTitlesData(
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 42,
                      getTitlesWidget: (value, meta) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            value == 0 ? '0' : _formatarMoeda(value),
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.55),
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        final label = value.toInt() == 0 ? 'Crédito' : 'Débito';
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            label,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(
                        toY: totalCredito,
                        width: 22,
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00D9FF), Color(0xFF3B82F6)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(
                        toY: totalDebito,
                        width: 22,
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF22C55E), Color(0xFF16A34A)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCandleStickChart(List<TransacaoModel> transacoes) {
    final now = DateTime.now();
    final ultimos7Dias = <DateTime, double>{};

    for (int i = 6; i >= 0; i--) {
      final date = DateTime(now.year, now.month, now.day - i);
      ultimos7Dias[date] = 0;
    }

    for (final t in transacoes) {
      final dateKey = DateTime(t.data.year, t.data.month, t.data.day);
      if (ultimos7Dias.containsKey(dateKey)) {
        ultimos7Dias[dateKey] = ultimos7Dias[dateKey]! + t.valor;
      }
    }

    final entries = ultimos7Dias.entries.toList();
    final maxY = ultimos7Dias.values.reduce((a, b) => a > b ? a : b);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'ÚLTIMOS 7 DIAS',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Meta: ${_formatarMoeda(_metaDiaria)}/dia',
                style: const TextStyle(color: Colors.white54, fontSize: 10),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: maxY > _metaDiaria ? maxY * 1.2 : _metaDiaria * 1.2,
              minY: 0,
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  getTooltipColor: (group) => const Color(0xFF1E293B),
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final date = entries[group.x.toInt()].key;
                    final value = rod.toY;
                    final acimaDaMeta = value > _metaDiaria;
                    return BarTooltipItem(
                      '${DateFormat('dd/MM').format(date)}\n${_formatarMoeda(value)}',
                      TextStyle(
                        color: acimaDaMeta
                            ? const Color(0xFFFF6B6B)
                            : const Color(0xFF2ED573),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() >= entries.length) {
                        return const Text('');
                      }
                      final date = entries[value.toInt()].key;
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          DateFormat('dd').format(date),
                          style: const TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: _metaDiaria,
                getDrawingHorizontalLine: (value) {
                  if (value == _metaDiaria) {
                    return FlLine(
                      color: Colors.white.withValues(alpha: 0.2),
                      strokeWidth: 1,
                      dashArray: [5, 5],
                    );
                  }
                  return FlLine(
                    color: Colors.white.withValues(alpha: 0.05),
                    strokeWidth: 0.5,
                  );
                },
              ),
              borderData: FlBorderData(show: false),
              barGroups: entries.asMap().entries.map((e) {
                final value = e.value.value;
                final acimaDaMeta = value > _metaDiaria;
                return BarChartGroupData(
                  x: e.key,
                  barRods: [
                    BarChartRodData(
                      toY: value,
                      color: acimaDaMeta
                          ? const Color(0xFFFF6B6B)
                          : const Color(0xFF2ED573),
                      width: 24,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(6),
                      ),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: _metaDiaria,
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentTransactions(List<TransacaoModel> transacoes) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'ÚLTIMAS TRANSAÇÕES',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Ver todas',
                style: TextStyle(color: Color(0xFF00D9FF), fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...transacoes.map((t) => _buildTransactionItem(t)),
      ],
    );
  }

  Widget _buildTransactionItem(TransacaoModel transacao) {
    final categoria = transacao.categoria ?? 'Outros';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _getCategoryColor(categoria).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getCategoryIcon(categoria),
              color: _getCategoryColor(categoria).withValues(alpha: 0.15),
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transacao.descricao,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      categoria,
                      style: TextStyle(
                        color: _getCategoryColor(categoria),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '•',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.3),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      DateFormat('dd MMM', 'pt_BR').format(transacao.data),
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.4),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            '- ${_formatarMoeda(transacao.valor)}',
            style: const TextStyle(
              color: Color(0xFFFF6B6B),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
