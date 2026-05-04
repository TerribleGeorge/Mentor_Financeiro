/// Perfil adaptativo do tom do Mentor (UI + heurísticas + futuro LLM).
enum UserPersona {
  novice,
  strategist,
  riskTaker,
  conservative,
}

extension UserPersonaSerialization on UserPersona {
  String get apiId => switch (this) {
        UserPersona.novice => 'novice',
        UserPersona.strategist => 'strategist',
        UserPersona.riskTaker => 'risk_taker',
        UserPersona.conservative => 'conservative',
      };

  String get llmVoicePreset => switch (this) {
        UserPersona.novice =>
          'educational_simple: short sentences, no jargon, reassuring safety-first tone',
        UserPersona.strategist =>
          'analytical_investor: cite rates, CAGR, tax efficiency, asset allocation framing',
        UserPersona.riskTaker =>
          'direct_opportunistic: punchy, growth-focused, acknowledge volatility trade-offs',
        UserPersona.conservative =>
          'capital_preservation: dividends, predictability, inflation and drawdown awareness',
      };
}
