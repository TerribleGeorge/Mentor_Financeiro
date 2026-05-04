import '../../domain/entities/compound_interest_result.dart';

/// Argumentos para [InsightDetailScreen] (via [RouteSettings.arguments]).
///
/// O texto do mentor é recalculado na tela com [MentorshipEngine] e a persona atual
/// em [UserPersonaService], para manter o tom alinhado ao perfil escolhido.
class InsightDetailArgs {
  const InsightDetailArgs({required this.result});

  final CompoundInterestResult result;
}
