import 'dart:math';

import '../entities/compound_interest_result.dart';
import '../entities/user_persona.dart';
import '../extensions/compound_interest_result_analytics.dart';

/// Regras de mentoria + tom adaptativo por [UserPersona].
class MentorshipEngine {
  const MentorshipEngine();

  String buildPersonaCompoundLead({
    required CompoundInterestResult result,
    required UserPersona persona,
    String languageCode = 'pt',
  }) {
    final cagr = result.approximateCagrPercent;
    final cagrStr = cagr.toStringAsFixed(1);
    final months = result.inputs.horizonMonths;

    switch (persona) {
      case UserPersona.novice:
        switch (languageCode) {
          case 'en':
            return 'Think of each dollar as a seed: with time and steady deposits, compound interest '
                'helps your garden grow — no rush, at your pace.';
          case 'es':
            return 'Imagina que cada euro o real es una semilla: con tiempo y constancia, el interés '
                'compuesto hace crecer el huerto — sin prisa, a tu ritmo.';
          default:
            return 'Imagine que cada real é uma semente: com tempo e constância, os juros compostos '
                'vão fazendo a “floresta” crescer — sem pressa, no seu ritmo.';
        }
      case UserPersona.strategist:
        switch (languageCode) {
          case 'en':
            return 'The “alpha” in this stack is sustaining an approximate portfolio CAGR of '
                '$cagrStr% over $months months — tax placement and reinvestment policy matter as much as the gross rate.';
          case 'es':
            return 'El alpha de esta pila está en sostener un CAGR aproximado del '
                '$cagrStr% en $months meses — fiscalidad y política de reinversión pesan tanto como la tasa bruta.';
          default:
            return 'O alpha dessa operação está em manter um CAGR aproximado de carteira acima de '
                '$cagrStr% ao longo de $months meses — eficiência fiscal e política de reinvestimento pesam tanto quanto a taxa “na etiqueta”.';
        }
      case UserPersona.riskTaker:
        switch (languageCode) {
          case 'en':
            return 'You are stacking returns: push the horizon and contribution rate to capture upside — '
                'just keep liquidity so you do not sell winners at the wrong time.';
          case 'es':
            return 'Estás apilando retorno: estira horizonte y aporte para captar upside — '
                'pero mantén liquidez para no liquidar ganadores en el peor momento.';
          default:
            return 'Você está montando retorno com alavanca temporal: estique horizonte e aporte para capturar upside — '
                'só não zere liquidez e seja vendido no pior timing.';
        }
      case UserPersona.conservative:
        switch (languageCode) {
          case 'en':
            return 'Anchor on purchasing power: after inflation, the real gain is what actually protects you — '
                'predictable coupons and dividends fit this profile better than chasing headlines.';
          case 'es':
            return 'Ancora en poder adquisitivo: tras inflación, el ganancia real es lo que te protege — '
                'cupones previsibles y dividendos encajan mejor que perseguir titulares ruidosos.';
          default:
            return 'Ancore no poder de compra: depois da inflação, o ganho real é o que protege patrimônio — '
                'cupons previsíveis e dividendos conversam melhor com esse perfil do que “novela” de mercado.';
        }
    }
  }

  List<String> buildAdvice({
    required CompoundInterestResult result,
    required UserPersona persona,
    String languageCode = 'pt',
  }) {
    final tips = <String>[
      buildPersonaCompoundLead(
        result: result,
        persona: persona,
        languageCode: languageCode,
      ),
    ];

    final months = result.inputs.horizonMonths;
    final rateAnnualApprox =
        ((pow(1 + result.monthlyNominalRate, 12) - 1) * 100).toDouble();

    _liquidityAndIrRule(
      tips: tips,
      months: months,
      annualRatePercent: rateAnnualApprox,
      lang: languageCode,
      persona: persona,
    );

    _timeAndSnowballRule(
      tips: tips,
      result: result,
      annualRatePercent: rateAnnualApprox,
      lang: languageCode,
      persona: persona,
    );

    _inflationDragRule(
      tips: tips,
      result: result,
      lang: languageCode,
      persona: persona,
    );

    if (tips.length == 1) {
      tips.add(_fallback(persona: persona, lang: languageCode));
    }

    return tips;
  }

  void _liquidityAndIrRule({
    required List<String> tips,
    required int months,
    required double annualRatePercent,
    required String lang,
    required UserPersona persona,
  }) {
    final shortHorizon = months <= 6;
    final juicyYield = annualRatePercent >= 10;

    if (!shortHorizon || !juicyYield) return;

    if (persona == UserPersona.novice && lang == 'pt') {
      tips.add(
        'Em prazos bem curtinhos, o imposto pode comer uma fatia grande do rendimento. '
        'Se não precisar do dinheiro logo, esperar mais tempo costuma deixar a conta mais justa — '
        'ou peça ajuda para ver se LCI/LCA isentas encaixam no seu caso.',
      );
      return;
    }

    switch (lang) {
      case 'en':
        tips.add(
          'Liquidity alert: with about 6 months or less, Brazilian fixed-income withholding '
          'often stays at the top bracket (~22.5%). If you do not need the money soon, '
          'stretch beyond 2 years to trend toward 15% (regressive table) or prefer exempt '
          'LCI/LCA for IR.',
        );
        break;
      case 'es':
        tips.add(
          'Alerta de liquidez: en plazos cortos (~6 meses o menos), el IR sobre rendimientos '
          'de RF en Brasil suele ir en la franja más alta (~22,5%). Si no necesitas el dinero '
          'ya, amplía el horizonte (p. ej. 2+ años) para tender a 15% (tabla regresiva) o valora '
          'LCI/LCA exentas de IR.',
        );
        break;
      default:
        tips.add(
          'Para esse prazo curto, a mordida do Leão costuma ser forte: até ~180 dias o IR '
          'regressivo de renda fixa no Brasil pode chegar a 22,5%. Se você não precisa desse '
          'dinheiro agora, segurar por 2 anos ou mais ajuda a caminhar para faixas menores '
          '(até 15%) — ou considere LCI/LCA isentas de IR, se fizer sentido ao seu perfil.',
        );
    }
  }

  void _timeAndSnowballRule({
    required List<String> tips,
    required CompoundInterestResult result,
    required double annualRatePercent,
    required String lang,
    required UserPersona persona,
  }) {
    final months = result.inputs.horizonMonths;
    final lowRate = annualRatePercent < 8;
    final longRun = months >= 96;

    if (!lowRate || !longRun) return;

    final m = result.snowballAccelerationMonth;
    final approxMonth = m ?? (months * 0.45).round().clamp(2, months - 1);
    final monthPhrase = '$approxMonth';

    if (persona == UserPersona.strategist && lang == 'pt') {
      tips.add(
        'Curva de acumulação: com taxa modesta, o ponto de inflexão “mecânico” costuma aparecer '
        'por volta do mês $monthPhrase — a partir daí o estoque de juros trabalha a favor do CAGR.',
      );
      return;
    }

    switch (lang) {
      case 'en':
        tips.add(
          'Here time is your best friend: with a modest rate, consistency beats chasing miracles. '
          'The snowball tends to feel heavier after month $monthPhrase — keep contributing steadily.',
        );
        break;
      case 'es':
        tips.add(
          'Aquí el tiempo es tu mejor aliado: con una tasa modesta, la constancia gana. '
          'El efecto bola de nieve suele acelerar tras el mes $monthPhrase — mantén el ritmo.',
        );
        break;
      default:
        tips.add(
          'Aqui o tempo é seu melhor amigo: com juro mais modesto, disciplina e constância '
          'valem mais que “milagre”. O efeito bola de neve tende a ficar bem mais visível '
          'depois do mês $monthPhrase — não quebre o aporte.',
        );
    }
  }

  void _inflationDragRule({
    required List<String> tips,
    required CompoundInterestResult result,
    required String lang,
    required UserPersona persona,
  }) {
    final nominal = result.nominalInterestGain;
    final real = result.realGain;
    if (nominal <= 0 || result.inputs.annualInflationPercent <= 0) return;

    final erosion = nominal > 0 ? (nominal - real) / nominal : 0;
    if (erosion < 0.25) return;

    if (persona == UserPersona.strategist && lang == 'pt') {
      tips.add(
        'Defasagem inflacionária relevante: compare ganho nominal vs. ganho real — '
        'para cenários longos, sensibilize a taxa real e o duration do seu lado ativo.',
      );
      return;
    }

    switch (lang) {
      case 'en':
        tips.add(
          'Inflation is eating part of your nominal gain: focus on real purchasing power, '
          'not just the headline balance.',
        );
        break;
      case 'es':
        tips.add(
          'La inflación se está comiendo parte del ganancia nominal: mira el poder adquisitivo real, '
          'no solo el saldo en pantalla.',
        );
        break;
      default:
        tips.add(
          'Com a inflação que você estipulou, parte desse ganho nominal some no poder de compra. '
          'Olhe o ganho real — é ele que diz se você ficou mais rico de verdade.',
        );
    }
  }

  String _fallback({required UserPersona persona, required String lang}) {
    switch (persona) {
      case UserPersona.novice:
        switch (lang) {
          case 'en':
            return 'Tip: revisit horizon and monthly amount once a month — small changes add up.';
          case 'es':
            return 'Consejo: revisa plazo y aporte una vez al mes — los pequeños cambios suman.';
          default:
            return 'Dica: uma vez por mês, olhe prazo e aporte — pequenos ajustes viram hábito e resultado.';
        }
      case UserPersona.strategist:
        switch (lang) {
          case 'en':
            return 'Stress-test: nudge inflation ±1pp and rate ±50bp — check how CAGR and real gain move.';
          case 'es':
            return 'Stress test: mueve inflación ±1pp y tasa ±50bp — mira cómo se mueve el CAGR y el real.';
          default:
            return 'Stress test: chacoalhe inflação ±1 p.p. e taxa ±50 bps — veja como CAGR e ganho real reagem.';
        }
      case UserPersona.riskTaker:
        switch (lang) {
          case 'en':
            return 'If you crank the rate, pair it with a cash buffer — opportunities hurt when liquidity vanishes.';
          case 'es':
            return 'Si subes la tasa, acompáñala con colchón de caja — sin liquidez, el upside duele.';
          default:
            return 'Se você empurra a taxa para cima, mantenha colchão de caixa — oportunidade sem liquidez vira dor.';
        }
      case UserPersona.conservative:
        switch (lang) {
          case 'en':
            return 'Favor smoothness: split goals by buckets (emergency, income, growth) before chasing yield.';
          case 'es':
            return 'Prefiere suavidad: separa metas en cubetas (emergencia, ingreso, crecimiento) antes de ir a por yield.';
          default:
            return 'Prefira suavidade: separe metas em “caixinhas” (reserva, renda, crescimento) antes de correr atrás de yield.';
        }
    }
  }
}
