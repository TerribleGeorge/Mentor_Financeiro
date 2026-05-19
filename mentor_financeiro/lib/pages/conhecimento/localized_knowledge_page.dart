import 'package:flutter/material.dart';

import '../../services/locale_ui_strings.dart';

enum KnowledgeTopic {
  dictionary,
  taxes,
  risks,
  tools,
  quiz,
  scams,
  investmentDetail,
}

class LocalizedKnowledgePage extends StatelessWidget {
  const LocalizedKnowledgePage({
    required this.topic,
    this.investmentId,
    this.isBrazil = false,
    super.key,
  });

  final KnowledgeTopic topic;
  final String? investmentId;
  final bool isBrazil;

  @override
  Widget build(BuildContext context) {
    final strings = LocaleUiStrings.of(context);
    final data = _data(strings);
    final accent = _accent(topic);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          data.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _HeroBlock(data: data, accent: accent),
          const SizedBox(height: 16),
          for (final section in data.sections) ...[
            _SectionBlock(section: section, accent: accent),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }

  _KnowledgeData _data(LocaleUiStrings strings) {
    if (topic == KnowledgeTopic.investmentDetail) {
      return _investmentData(strings, investmentId ?? 'international');
    }
    return switch (topic) {
      KnowledgeTopic.dictionary => _KnowledgeData(
        title: strings.text(
          'Dicionário do investidor',
          en: 'Investor dictionary',
          es: 'Diccionario del inversor',
        ),
        subtitle: strings.text(
          'Termos essenciais explicados de forma simples.',
          en: 'Essential terms explained in simple language.',
          es: 'Términos esenciales explicados de forma sencilla.',
        ),
        sections: [
          _section(
            strings,
            'Risco',
            'Possibilidade de o resultado ser diferente do esperado. Todo investimento tem algum risco.',
            'Risk',
            'The chance that the result differs from what you expected. Every investment has some level of risk.',
            'Riesgo',
            'La posibilidad de que el resultado sea diferente al esperado. Toda inversión tiene algún riesgo.',
          ),
          _section(
            strings,
            'Liquidez',
            'Facilidade de transformar o investimento em dinheiro disponível.',
            'Liquidity',
            'How easily an investment can be converted into available cash.',
            'Liquidez',
            'La facilidad para convertir una inversión en dinero disponible.',
          ),
          _section(
            strings,
            'Diversificação',
            'Distribuir o dinheiro entre diferentes ativos, moedas, setores e prazos.',
            'Diversification',
            'Spreading money across different assets, currencies, sectors, and time horizons.',
            'Diversificación',
            'Distribuir el dinero entre distintos activos, monedas, sectores y plazos.',
          ),
        ],
      ),
      KnowledgeTopic.taxes => _KnowledgeData(
        title: strings.text(
          'Impostos e declaração',
          en: 'Taxes and reporting',
          es: 'Impuestos y declaración',
        ),
        subtitle: isBrazil
            ? strings.text(
                'Regras variam por produto. Confirme a tributação brasileira antes de investir.',
                en: 'Rules vary by product. Confirm Brazilian taxation before investing.',
                es: 'Las reglas varían por producto. Confirma la tributación brasileña antes de invertir.',
              )
            : strings.text(
                'As regras fiscais dependem do país onde você declara impostos.',
                en: 'Tax rules depend on the country where you file taxes.',
                es: 'Las reglas fiscales dependen del país donde declaras impuestos.',
              ),
        sections: [
          _section(
            strings,
            'Regra local primeiro',
            'Use sempre a regra fiscal do país da sua residência tributária.',
            'Local rule first',
            'Always use the tax rule of your tax-residence country.',
            'Primero la regla local',
            'Usa siempre la regla fiscal del país de tu residencia tributaria.',
          ),
          _section(
            strings,
            'Guarde comprovantes',
            'Mantenha notas, extratos, preço médio, dividendos e taxas organizados.',
            'Keep records',
            'Keep statements, average cost, dividends, fees, and transaction records organized.',
            'Guarda comprobantes',
            'Mantén organizados extractos, precio medio, dividendos, comisiones y operaciones.',
          ),
        ],
      ),
      KnowledgeTopic.risks => _KnowledgeData(
        title: strings.text(
          'Onde não investir',
          en: 'Where not to invest',
          es: 'Dónde no invertir',
        ),
        subtitle: strings.text(
          'Evite promessas de retorno garantido, pressa e produtos que você não entende.',
          en: 'Avoid guaranteed-return promises, pressure, and products you do not understand.',
          es: 'Evita promesas de retorno garantizado, presión y productos que no entiendes.',
        ),
        sections: [
          _section(
            strings,
            'Retorno garantido é alerta',
            'Investimento real envolve risco. Promessa de lucro certo costuma esconder golpe.',
            'Guaranteed return is a warning',
            'Real investing involves risk. Promises of certain profit often hide scams.',
            'Retorno garantizado es alerta',
            'Invertir de verdad implica riesgo. Promesas de ganancia segura suelen esconder estafas.',
          ),
          _section(
            strings,
            'Não invista sob pressão',
            'Se a decisão precisa ser feita agora, pare e valide por outro canal.',
            'Do not invest under pressure',
            'If the decision must be made right now, stop and verify through another channel.',
            'No inviertas bajo presión',
            'Si la decisión debe tomarse ahora, detente y verifica por otro canal.',
          ),
        ],
      ),
      KnowledgeTopic.tools => _KnowledgeData(
        title: strings.text('Ferramentas', en: 'Tools', es: 'Herramientas'),
        subtitle: strings.text(
          'Use ferramentas simples para organizar decisões, custos e acompanhamento.',
          en: 'Use simple tools to organize decisions, costs, and tracking.',
          es: 'Usa herramientas simples para organizar decisiones, costes y seguimiento.',
        ),
        sections: [
          _section(
            strings,
            'Corretora ou banco regulado',
            'Prefira instituições supervisionadas no seu país.',
            'Regulated broker or bank',
            'Prefer institutions supervised in your country.',
            'Broker o banco regulado',
            'Prefiere instituciones supervisadas en tu país.',
          ),
          _section(
            strings,
            'Planilha ou app de controle',
            'Acompanhe aportes, custos, rentabilidade e objetivos.',
            'Spreadsheet or tracking app',
            'Track contributions, costs, returns, and goals.',
            'Hoja de cálculo o app de control',
            'Acompaña aportes, costes, rentabilidad y objetivos.',
          ),
        ],
      ),
      KnowledgeTopic.quiz => _KnowledgeData(
        title: strings.text(
          'Simulado de conhecimento',
          en: 'Knowledge quiz',
          es: 'Simulado de conocimiento',
        ),
        subtitle: strings.text(
          'Revise conceitos antes de tomar decisões financeiras.',
          en: 'Review concepts before making financial decisions.',
          es: 'Repasa conceptos antes de tomar decisiones financieras.',
        ),
        sections: [
          _section(
            strings,
            'Comece pelo básico',
            'Risco, liquidez, prazo, custo e impostos explicam boa parte das decisões.',
            'Start with the basics',
            'Risk, liquidity, time horizon, cost, and taxes explain most decisions.',
            'Empieza por lo básico',
            'Riesgo, liquidez, plazo, coste e impuestos explican gran parte de las decisiones.',
          ),
        ],
      ),
      KnowledgeTopic.scams => _KnowledgeData(
        title: strings.text('Golpes', en: 'Scams', es: 'Estafas'),
        subtitle: strings.text(
          'Golpes mudam por país, mas quase sempre usam urgência, link e medo.',
          en: 'Scams vary by country, but they usually use urgency, links, and fear.',
          es: 'Las estafas cambian por país, pero suelen usar urgencia, enlaces y miedo.',
        ),
        sections: [
          _section(
            strings,
            'Abra o app oficial',
            'Não clique no link recebido. Abra o banco ou corretora pelo app oficial.',
            'Open the official app',
            'Do not click the received link. Open the bank or broker through the official app.',
            'Abre la app oficial',
            'No hagas clic en el enlace recibido. Abre el banco o broker desde la app oficial.',
          ),
          _section(
            strings,
            'Nunca informe códigos',
            'Banco e corretora não pedem senha, token ou código de autenticação por telefone.',
            'Never share codes',
            'Banks and brokers do not ask for passwords, tokens, or authentication codes by phone.',
            'Nunca informes códigos',
            'Bancos y brokers no piden contraseña, token o código de autenticación por teléfono.',
          ),
        ],
      ),
      KnowledgeTopic.investmentDetail => _investmentData(
        strings,
        investmentId ?? 'international',
      ),
    };
  }

  _KnowledgeData _investmentData(LocaleUiStrings strings, String id) {
    final global = !isBrazil;
    return switch (id) {
      'tesouro' => _KnowledgeData(
        title: strings.text(
          'Títulos públicos',
          en: 'Government bonds',
          es: 'Bonos gubernamentales',
        ),
        subtitle: global
            ? strings.text(
                'Procure títulos públicos ou fundos monetários regulados no seu país.',
                en: 'Look for government bonds or regulated money market funds in your country.',
                es: 'Busca bonos gubernamentales o fondos monetarios regulados en tu país.',
              )
            : strings.text(
                'No Brasil, Tesouro Direto é a porta de entrada para títulos públicos.',
                en: 'In Brazil, Tesouro Direto is the entry point for government bonds.',
                es: 'En Brasil, Tesoro Directo es la puerta de entrada a títulos públicos.',
              ),
        sections: _coreInvestmentSections(strings),
      ),
      'cdb' => _KnowledgeData(
        title: strings.text(
          'Depósitos bancários',
          en: 'Bank deposits',
          es: 'Depósitos bancarios',
        ),
        subtitle: global
            ? strings.text(
                'Compare depósitos segurados e contas remuneradas disponíveis localmente.',
                en: 'Compare insured deposits and interest-bearing accounts available locally.',
                es: 'Compara depósitos asegurados y cuentas remuneradas disponibles localmente.',
              )
            : strings.text(
                'No Brasil, CDBs são depósitos bancários de renda fixa.',
                en: 'In Brazil, CDBs are fixed-income bank deposits.',
                es: 'En Brasil, los CDB son depósitos bancarios de renta fija.',
              ),
        sections: _coreInvestmentSections(strings),
      ),
      'reits_fiis' => _KnowledgeData(
        title: strings.text(
          'Fundos imobiliários',
          en: global ? 'REITs and real estate funds' : 'Real estate funds',
          es: global ? 'REITs y fondos inmobiliarios' : 'Fondos inmobiliarios',
        ),
        subtitle: strings.text(
          'Ativos imobiliários podem gerar renda, mas têm risco de mercado, vacância e juros.',
          en: 'Real estate assets can generate income, but carry market, vacancy, and interest-rate risks.',
          es: 'Los activos inmobiliarios pueden generar renta, pero tienen riesgo de mercado, vacancia y tipos de interés.',
        ),
        sections: _coreInvestmentSections(strings),
      ),
      'funds' => _KnowledgeData(
        title: strings.text(
          'Fundos de investimento',
          en: 'Investment funds',
          es: 'Fondos de inversión',
        ),
        subtitle: strings.text(
          'Fundos reúnem ativos e gestão profissional. Compare taxa, risco e estratégia.',
          en: 'Funds combine assets and professional management. Compare fees, risk, and strategy.',
          es: 'Los fondos combinan activos y gestión profesional. Compara comisiones, riesgo y estrategia.',
        ),
        sections: _coreInvestmentSections(strings),
      ),
      'stocks' => _KnowledgeData(
        title: strings.text('Ações', en: 'Stocks', es: 'Acciones'),
        subtitle: strings.text(
          'Ações representam participação em empresas e podem oscilar bastante.',
          en: 'Stocks represent ownership in companies and can fluctuate significantly.',
          es: 'Las acciones representan participación en empresas y pueden fluctuar bastante.',
        ),
        sections: _coreInvestmentSections(strings),
      ),
      'crypto' => _KnowledgeData(
        title: strings.text(
          'Criptoativos',
          en: 'Cryptoassets',
          es: 'Criptoactivos',
        ),
        subtitle: strings.text(
          'São ativos voláteis e sem fundo garantidor. Use apenas parcela compatível com seu risco.',
          en: 'They are volatile assets with no guarantee fund. Use only a portion compatible with your risk profile.',
          es: 'Son activos volátiles y sin fondo garantizador. Usa solo una parte compatible con tu perfil de riesgo.',
        ),
        sections: _coreInvestmentSections(strings),
      ),
      _ => _KnowledgeData(
        title: strings.text(
          'Investimentos internacionais',
          en: 'International investing',
          es: 'Inversiones internacionales',
        ),
        subtitle: strings.text(
          'Considere moeda, tributação, custos, regulação e diversificação global.',
          en: 'Consider currency, taxes, costs, regulation, and global diversification.',
          es: 'Considera moneda, impuestos, costes, regulación y diversificación global.',
        ),
        sections: _coreInvestmentSections(strings),
      ),
    };
  }

  List<_KnowledgeSection> _coreInvestmentSections(LocaleUiStrings strings) {
    return [
      _section(
        strings,
        'Antes de investir',
        'Entenda o produto, prazo, risco, liquidez, custos e impostos aplicáveis na sua localidade.',
        'Before investing',
        'Understand the product, time horizon, risk, liquidity, costs, and taxes that apply in your location.',
        'Antes de invertir',
        'Entiende el producto, plazo, riesgo, liquidez, costes e impuestos aplicables en tu localidad.',
      ),
      _section(
        strings,
        'Adequação ao perfil',
        'Não escolha pelo maior retorno prometido. Escolha pelo risco que você consegue suportar.',
        'Fit with your profile',
        'Do not choose by the highest promised return. Choose by the risk you can actually tolerate.',
        'Adecuación al perfil',
        'No elijas por el mayor retorno prometido. Elige por el riesgo que realmente puedes tolerar.',
      ),
      _section(
        strings,
        'Regulação local',
        'Produtos, proteções e impostos mudam por país. Confirme regras oficiais antes de aplicar dinheiro.',
        'Local regulation',
        'Products, protections, and taxes vary by country. Confirm official rules before investing money.',
        'Regulación local',
        'Productos, protecciones e impuestos cambian por país. Confirma reglas oficiales antes de invertir dinero.',
      ),
    ];
  }

  _KnowledgeSection _section(
    LocaleUiStrings strings,
    String titlePt,
    String bodyPt,
    String titleEn,
    String bodyEn,
    String titleEs,
    String bodyEs,
  ) {
    return _KnowledgeSection(
      title: strings.text(titlePt, en: titleEn, es: titleEs),
      body: strings.text(bodyPt, en: bodyEn, es: bodyEs),
    );
  }

  Color _accent(KnowledgeTopic topic) {
    return switch (topic) {
      KnowledgeTopic.taxes => const Color(0xFFFECA57),
      KnowledgeTopic.risks || KnowledgeTopic.scams => const Color(0xFFFF4D4D),
      KnowledgeTopic.tools => const Color(0xFF6366F1),
      KnowledgeTopic.quiz => const Color(0xFF26DE81),
      _ => const Color(0xFF00D9FF),
    };
  }
}

class _KnowledgeData {
  const _KnowledgeData({
    required this.title,
    required this.subtitle,
    required this.sections,
  });

  final String title;
  final String subtitle;
  final List<_KnowledgeSection> sections;
}

class _KnowledgeSection {
  const _KnowledgeSection({required this.title, required this.body});

  final String title;
  final String body;
}

class _HeroBlock extends StatelessWidget {
  const _HeroBlock({required this.data, required this.accent});

  final _KnowledgeData data;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1118),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: accent.withValues(alpha: 0.72), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            style: TextStyle(
              color: accent,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({required this.section, required this.accent});

  final _KnowledgeSection section;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: accent.withValues(alpha: 0.28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            section.body,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
