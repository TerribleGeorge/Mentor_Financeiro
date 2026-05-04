import 'dart:math' as math;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_routes.dart';
import '../../core/theme/persona_visual_theme.dart';
import '../../domain/entities/compound_interest_inputs.dart';
import '../../domain/entities/compound_interest_result.dart';
import '../../domain/entities/user_persona.dart';
import '../../data/services/firebase_data_service.dart';
import '../../domain/finance/compound_interest_calculator.dart';
import '../../domain/mentorship/mentorship_engine.dart';
import '../../l10n/app_localizations.dart';
import '../../services/localization_service.dart';
import '../../services/user_persona_service.dart';
import '../insight/insight_detail_args.dart';

class CalculadoraMentoraScreen extends StatefulWidget {
  const CalculadoraMentoraScreen({super.key});

  @override
  State<CalculadoraMentoraScreen> createState() =>
      _CalculadoraMentoraScreenState();
}

class _CalculadoraMentoraScreenState extends State<CalculadoraMentoraScreen> {
  final _initialCtrl = TextEditingController(text: '5000');
  final _monthlyCtrl = TextEditingController(text: '800');
  final _rateCtrl = TextEditingController(text: '11');
  final _horizonCtrl = TextEditingController(text: '10');
  final _inflationCtrl = TextEditingController(text: '4.5');

  InterestRatePeriod _ratePeriod = InterestRatePeriod.annual;
  HorizonUnit _horizonUnit = HorizonUnit.years;

  CompoundInterestResult? _result;
  List<String> _advice = [];
  String? _error;

  static const _calc = CompoundInterestCalculator();
  static const _mentor = MentorshipEngine();

  @override
  void dispose() {
    _initialCtrl.dispose();
    _monthlyCtrl.dispose();
    _rateCtrl.dispose();
    _horizonCtrl.dispose();
    _inflationCtrl.dispose();
    super.dispose();
  }

  double? _parseMoney(String raw) {
    var t = raw.trim();
    if (t.contains(',')) {
      t = t.replaceAll('.', '').replaceAll(',', '.');
    }
    return double.tryParse(t);
  }

  double? _parseDecimal(String raw) {
    final t = raw.trim().replaceAll(',', '.');
    return double.tryParse(t);
  }

  Future<void> _compute() async {
    final lang = Localizations.localeOf(context).languageCode;
    final l10n = AppLocalizations.of(context)!;

    final initial = _parseMoney(_initialCtrl.text) ?? 0;
    final monthly = _parseMoney(_monthlyCtrl.text) ?? 0;
    final rate = _parseDecimal(_rateCtrl.text);
    final horizon = int.tryParse(_horizonCtrl.text.trim());
    final inflation = _parseDecimal(_inflationCtrl.text) ?? 0;

    if (rate == null ||
        horizon == null ||
        horizon <= 0 ||
        initial < 0 ||
        monthly < 0) {
      setState(() {
        _error = l10n.compoundInvalidInput;
        _result = null;
        _advice = [];
      });
      return;
    }

    final inputs = CompoundInterestInputs(
      initialAmount: initial,
      monthlyContribution: monthly,
      interestRatePercent: rate,
      ratePeriod: _ratePeriod,
      horizonValue: horizon,
      horizonUnit: _horizonUnit,
      annualInflationPercent: inflation < 0 ? 0 : inflation,
    );

    if (!inputs.isValid) {
      setState(() {
        _error = l10n.compoundInvalidInput;
        _result = null;
        _advice = [];
      });
      return;
    }

    try {
      final result = _calc.compute(inputs);
      final persona = context.read<UserPersonaService>().persona;
      final advice = _mentor.buildAdvice(
        result: result,
        persona: persona,
        languageCode: lang,
      );
      if (kDebugMode) {
        final ctxJson = context.read<UserPersonaService>().compoundLlmContext(
              result: result,
              heuristicAdvice: advice,
              languageCode: lang,
            ).toJson();
        debugPrint('MentorLlmContext (compound): $ctxJson');
      }
      setState(() {
        _result = result;
        _advice = advice;
        _error = null;
      });
      await _persistSimulationToFirestore(
        inputs: inputs,
        result: result,
        persona: persona,
      );
    } catch (_) {
      setState(() {
        _error = l10n.compoundInvalidInput;
        _result = null;
        _advice = [];
      });
    }
  }

  Future<void> _persistSimulationToFirestore({
    required CompoundInterestInputs inputs,
    required CompoundInterestResult result,
    required UserPersona persona,
  }) async {
    if (Firebase.apps.isEmpty) return;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return;

    try {
      await FirebaseDataService.instance.saveSimulation(
        uid: uid,
        inputs: inputs.toFirestoreMap(),
        summary: result.summaryFirestoreMap(personaName: persona.name),
        label: 'compound_calculator',
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Simulação salva na sua conta (nuvem).'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint('saveSimulation: $e');
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Não foi possível salvar na nuvem (conexão ou permissão). O cálculo local permanece.',
            style: const TextStyle(fontSize: 13),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _onPeriodChanged() {
    if (_result != null) _compute();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final persona = context.watch<UserPersonaService>().persona;
    final visual = PersonaVisualTheme.forPersona(persona);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: Text(
          l10n.compoundCalculatorTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            l10n.compoundCalculatorSubtitle,
            style: const TextStyle(color: Colors.white70, height: 1.35),
          ),
          const SizedBox(height: 16),
          _personaBar(context, l10n, visual, persona),
          const SizedBox(height: 20),
          _field(
            visual: visual,
            label: l10n.compoundInitialLabel,
            controller: _initialCtrl,
            icon: Icons.savings_outlined,
          ),
          _field(
            visual: visual,
            label: l10n.compoundMonthlyLabel,
            controller: _monthlyCtrl,
            icon: Icons.calendar_month_outlined,
          ),
          _rateSegmentRow(l10n, visual),
          _field(
            visual: visual,
            label: l10n.compoundRateLabel,
            controller: _rateCtrl,
            icon: Icons.percent,
            hint: _ratePeriod == InterestRatePeriod.annual ? '12' : '0.9',
          ),
          const SizedBox(height: 8),
          _horizonSegmentRow(l10n, visual),
          _field(
            visual: visual,
            label: l10n.compoundHorizonLabel,
            controller: _horizonCtrl,
            icon: Icons.schedule,
            keyboardType: TextInputType.number,
            hint: _horizonUnit == HorizonUnit.years ? '10' : '120',
          ),
          _field(
            visual: visual,
            label: l10n.compoundInflationLabel,
            controller: _inflationCtrl,
            icon: Icons.trending_flat,
            hint: '4.5',
          ),
          if (_error != null) ...[
            const SizedBox(height: 8),
            Text(_error!, style: const TextStyle(color: Color(0xFFF87171))),
          ],
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => _compute(),
              style: FilledButton.styleFrom(
                backgroundColor: visual.accent,
                foregroundColor: visual.onAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text(
                l10n.compoundCalculate,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          if (_result != null) ...[
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.insightDetail,
                    arguments: InsightDetailArgs(result: _result!),
                  );
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: visual.accent,
                  side: BorderSide(color: visual.accent),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(l10n.compoundOpenFullInsight),
              ),
            ),
            const SizedBox(height: 28),
            _summaryRow(l10n, visual),
            const SizedBox(height: 20),
            SizedBox(height: 220, child: _buildChart(l10n, visual)),
            const SizedBox(height: 24),
            _mentorCard(l10n, visual),
          ],
        ],
      ),
    );
  }

  String _personaLabel(AppLocalizations l10n, UserPersona p) {
    switch (p) {
      case UserPersona.novice:
        return l10n.userPersonaNovice;
      case UserPersona.strategist:
        return l10n.userPersonaStrategist;
      case UserPersona.riskTaker:
        return l10n.userPersonaRiskTaker;
      case UserPersona.conservative:
        return l10n.userPersonaConservative;
    }
  }

  Widget _personaBar(
    BuildContext context,
    AppLocalizations l10n,
    PersonaVisualTheme visual,
    UserPersona selected,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.userPersonaSectionTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: UserPersona.values.map((p) {
            final isSel = p == selected;
            return ChoiceChip(
              label: Text(_personaLabel(l10n, p)),
              selected: isSel,
              onSelected: (_) async {
                await context.read<UserPersonaService>().setPersona(p);
                if (!context.mounted) return;
                if (_result != null) _compute();
              },
              selectedColor: visual.accent,
              labelStyle: TextStyle(
                color: isSel ? visual.onAccent : Colors.white70,
                fontWeight: isSel ? FontWeight.bold : FontWeight.w500,
                fontSize: 12,
              ),
              backgroundColor: const Color(0xFF1E293B),
              side: BorderSide(
                color: isSel ? visual.accent : Colors.white24,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _field({
    required PersonaVisualTheme visual,
    required String label,
    required TextEditingController controller,
    required IconData icon,
    String? hint,
    TextInputType keyboardType = const TextInputType.numberWithOptions(
      decimal: true,
    ),
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.35)),
          prefixIcon: Icon(icon, color: visual.accent),
          filled: true,
          fillColor: const Color(0xFF1E293B),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: visual.accent),
          ),
        ),
      ),
    );
  }

  Widget _rateSegmentRow(AppLocalizations l10n, PersonaVisualTheme visual) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SegmentedButton<InterestRatePeriod>(
        segments: [
          ButtonSegment(
            value: InterestRatePeriod.annual,
            label: Text(l10n.compoundRateAnnual),
          ),
          ButtonSegment(
            value: InterestRatePeriod.monthly,
            label: Text(l10n.compoundRateMonthly),
          ),
        ],
        selected: {_ratePeriod},
        onSelectionChanged: (s) {
          setState(() => _ratePeriod = s.first);
          _onPeriodChanged();
        },
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return visual.onAccent;
            }
            return Colors.white70;
          }),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return visual.accent;
            }
            return const Color(0xFF1E293B);
          }),
        ),
      ),
    );
  }

  Widget _horizonSegmentRow(AppLocalizations l10n, PersonaVisualTheme visual) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: SegmentedButton<HorizonUnit>(
        segments: [
          ButtonSegment(
            value: HorizonUnit.years,
            label: Text(l10n.compoundHorizonYears),
          ),
          ButtonSegment(
            value: HorizonUnit.months,
            label: Text(l10n.compoundHorizonMonths),
          ),
        ],
        selected: {_horizonUnit},
        onSelectionChanged: (s) {
          setState(() => _horizonUnit = s.first);
          _onPeriodChanged();
        },
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return visual.onAccent;
            }
            return Colors.white70;
          }),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return visual.accent;
            }
            return const Color(0xFF1E293B);
          }),
        ),
      ),
    );
  }

  Widget _summaryRow(AppLocalizations l10n, PersonaVisualTheme visual) {
    final r = _result!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _statTile(
          visual,
          l10n.compoundSummaryNominalEnd,
          LocalizationService.formatCurrency(r.nominalFutureValue),
          Icons.account_balance_wallet_outlined,
        ),
        const SizedBox(height: 10),
        _statTile(
          visual,
          l10n.compoundSummaryRealGain,
          LocalizationService.formatCurrency(r.realGain),
          Icons.shopping_cart_outlined,
          valueColor: r.realGain >= 0 ? const Color(0xFF34D399) : const Color(0xFFF87171),
        ),
      ],
    );
  }

  Widget _statTile(
    PersonaVisualTheme visual,
    String title,
    String value,
    IconData icon, {
    Color? valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: visual.accent),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: valueColor ?? Colors.white,
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

  Widget _buildChart(AppLocalizations l10n, PersonaVisualTheme visual) {
    final r = _result!;
    final invested = math.max(0.0, r.totalInvested);
    final interest = math.max(0.0, r.nominalInterestGain);
    final maxY = math.max(invested, interest);
    final cap = maxY <= 0 ? 1.0 : maxY * 1.15;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: cap,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          horizontalInterval: cap <= 1 ? 0.25 : cap / 4,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.white.withValues(alpha: 0.06),
            strokeWidth: 1,
          ),
        ),
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 44,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Text(
                    value == 0 ? '0' : LocalizationService.formatCurrency(value),
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.45),
                      fontSize: 9,
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
                final label = value.toInt() == 0
                    ? l10n.compoundChartInvested
                    : l10n.compoundChartInterest;
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
                toY: invested,
                width: 26,
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [Color(0xFF64748B), Color(0xFF94A3B8)],
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
                toY: interest,
                width: 26,
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: visual.chartInterestColors,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _mentorCard(AppLocalizations l10n, PersonaVisualTheme visual) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            visual.mentorGradStart.withValues(alpha: 0.95),
            visual.mentorGradEnd.withValues(alpha: 0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: visual.mentorBorder.withValues(alpha: 0.55)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: visual.accent.withValues(alpha: 0.22),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.record_voice_over,
                  color: visual.accent,
                  size: 26,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.compoundMentorCardTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          ..._advice.asMap().entries.map((e) {
            return Padding(
              padding: EdgeInsets.only(bottom: e.key == _advice.length - 1 ? 0 : 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Icon(
                      Icons.insights,
                      size: 18,
                      color: visual.insightIconColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      e.value,
                      style: const TextStyle(
                        color: Colors.white70,
                        height: 1.45,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
