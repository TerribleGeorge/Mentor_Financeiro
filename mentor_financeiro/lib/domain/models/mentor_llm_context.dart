import '../entities/compound_interest_result.dart';
import '../entities/user_persona.dart';
import '../extensions/compound_interest_result_analytics.dart';

/// Payload versionável para enviar traços + métricas a Gemini/OpenAI.
class MentorLlmContext {
  MentorLlmContext({
    required this.schemaVersion,
    required this.personaId,
    required this.voicePreset,
    required this.languageCode,
    required this.quantitativeSummary,
    required this.heuristicAdvice,
    required this.narrativeHints,
  });

  static const String currentSchema = '1.0';

  final String schemaVersion;
  final String personaId;
  final String voicePreset;
  final String languageCode;
  final Map<String, num> quantitativeSummary;
  final List<String> heuristicAdvice;
  final Map<String, String> narrativeHints;

  factory MentorLlmContext.forCompoundSimulation({
    required UserPersona persona,
    required CompoundInterestResult result,
    required List<String> heuristicAdvice,
    required String languageCode,
  }) {
    final cagr = result.approximateCagrPercent;
    return MentorLlmContext(
      schemaVersion: currentSchema,
      personaId: persona.apiId,
      voicePreset: persona.llmVoicePreset,
      languageCode: languageCode,
      quantitativeSummary: {
        'totalInvested': result.totalInvested,
        'nominalFutureValue': result.nominalFutureValue,
        'nominalInterestGain': result.nominalInterestGain,
        'realGain': result.realGain,
        'inflationAdjustedFutureValue': result.inflationAdjustedFutureValue,
        'approxCagrPercent': cagr,
        'horizonMonths': result.inputs.horizonMonths,
        'annualInflationPercent': result.inputs.annualInflationPercent,
        'monthlyNominalRate': result.monthlyNominalRate,
      },
      heuristicAdvice: List<String>.from(heuristicAdvice),
      narrativeHints: {
        'simulationType': 'compound_interest',
        'personaObjective': persona.apiId,
      },
    );
  }

  Map<String, Object?> toJson() => {
        'schemaVersion': schemaVersion,
        'personaId': personaId,
        'voicePreset': voicePreset,
        'languageCode': languageCode,
        'quantitativeSummary': quantitativeSummary.map(
          (k, v) => MapEntry(k, v is int ? v : v.toDouble()),
        ),
        'heuristicAdvice': heuristicAdvice,
        'narrativeHints': narrativeHints,
      };
}
