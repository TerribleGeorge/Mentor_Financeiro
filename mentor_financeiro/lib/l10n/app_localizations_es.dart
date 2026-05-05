// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Mentor Financiero';

  @override
  String get saldo => 'Saldo';

  @override
  String get gastosDiarios => 'Gastos Diarios';

  @override
  String get confirmarTransacao => 'Confirmar Transacción';

  @override
  String get extrato => 'Extracto';

  @override
  String get transferencias => 'Transferencias';

  @override
  String get investimentos => 'Inversiones';

  @override
  String get configuracoes => 'Configuración';

  @override
  String get perfil => 'Perfil';

  @override
  String get sair => 'Salir';

  @override
  String get entrar => 'Entrar';

  @override
  String get cadastrar => 'Registrarse';

  @override
  String get email => 'Correo';

  @override
  String get senha => 'Contraseña';

  @override
  String get nome => 'Nombre';

  @override
  String get cpf => 'Cédula';

  @override
  String get telefone => 'Teléfono';

  @override
  String get continuar => 'Continuar';

  @override
  String get voltar => 'Volver';

  @override
  String get cancelar => 'Cancelar';

  @override
  String get salvar => 'Guardar';

  @override
  String get editar => 'Editar';

  @override
  String get excluir => 'Eliminar';

  @override
  String get sucesso => 'Éxito';

  @override
  String get erro => 'Error';

  @override
  String get carregando => 'Cargando...';

  @override
  String get semDados => 'Sin datos';

  @override
  String get tentarNovamente => 'Intentar de nuevo';

  @override
  String get relatorios => 'Informes';

  @override
  String get gastosPorCategoria => 'Gastos por Categoría';

  @override
  String get ultimosSeteDias => 'Últimos 7 Días';

  @override
  String get totalGasto => 'Total Gastado';

  @override
  String get transacoes => 'Transacciones';

  @override
  String get categoria => 'Categoría';

  @override
  String get data => 'Fecha';

  @override
  String get valor => 'Valor';

  @override
  String get descricao => 'Descripción';

  @override
  String get alimentacao => 'Alimentación';

  @override
  String get transporte => 'Transporte';

  @override
  String get lazer => 'Ocio';

  @override
  String get saude => 'Salud';

  @override
  String get outros => 'Otros';

  @override
  String get notificacoes => 'Notificaciones';

  @override
  String get permissaoNotificacoes => 'Permiso de Notificaciones';

  @override
  String get ativarMonitoramento => 'Activar Monitoreo de Gastos';

  @override
  String get descricaoMonitoramento =>
      'Permite que la aplicación monitoree automáticamente sus transacciones bancarias para organizar sus finanzas.';

  @override
  String get idioma => 'Idioma';

  @override
  String get moeda => 'Moneda';

  @override
  String get compararInvestimentos => 'Comparar Inversiones';

  @override
  String get descricaoLocalizacao =>
      'Para comparar inversiones locales (CDB/CDI) con tasas internacionales, necesitamos su ubicación.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Permiso de Ubicación Requerido';

  @override
  String get rendaFixa => 'Renta Fija';

  @override
  String get rendaVariavel => 'Renta Variable';

  @override
  String get tesouroDireto => 'Tesoro Directo';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Acciones';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Criptomonedas';

  @override
  String get rendimento => 'Retorno';

  @override
  String get rentabilidade => 'Rentabilidad';

  @override
  String get aplicar => 'Aplicar';

  @override
  String get resgatar => 'Rescatar';

  @override
  String get simular => 'Simular';

  @override
  String get metas => 'Metas';

  @override
  String get estrategias => 'Estrategias';

  @override
  String get conhecimento => 'Conocimiento';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Enviar mensaje';

  @override
  String get digiteMensagem => 'Escriba un mensaje...';

  @override
  String get alertaGastos => 'Alerta de Gastos';

  @override
  String alertaGastosMsg(int percent) {
    return 'Ya usaste $percent% de tu límite de crédito.';
  }

  @override
  String get fechamentoFatura => 'Cierre de Factura';

  @override
  String get fechamentoFaturaMsg =>
      'Mañana es el cierre. Buen momento para revisar gastos.';

  @override
  String get faturaVencendo => 'Factura por Vencer';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Factura vence en $dias día(s). Verifica tu saldo.';
  }

  @override
  String get regra30 => 'Consejo: Regla del 30%';

  @override
  String get regra30Msg =>
      'Mantén el uso por debajo del 30% para mejorar tu Score.';

  @override
  String get diaDeOuro => 'Día de Oro!';

  @override
  String get diaDeOuroMsg => 'Tus compras de hoy solo se pagarán en 40 días!';

  @override
  String get alertaJuros => 'Cuidado: Intereses';

  @override
  String get alertaJurosMsg =>
      'Tu saldo no cubre la factura. Evita el crédito revolutivo!';

  @override
  String get notaSaude => 'Salud Financiera';

  @override
  String get notaExcelente => 'Excelente! Tienes buena salud financiera.';

  @override
  String get notaBom => 'Bien, pero puede mejorar.';

  @override
  String get notaAtencao => 'Atención a los gastos.';

  @override
  String get notaRevisar => 'Revisa tus finanzas.';

  @override
  String get mentorInsightTitle => 'Orientación del Mentor';

  @override
  String get mentorInsightLoading => 'Consultando el mercado…';

  @override
  String get mentorInsightError =>
      'No se pudieron cargar los datos ahora. Inténtalo de nuevo en un momento.';

  @override
  String get mentorInsightOffline =>
      'Sin conexión. Conéctate para ver cotizaciones y al Mentor.';

  @override
  String get mentorAllocationDefensive =>
      'Con la volatilidad actual, prioriza preservar capital y liquidez antes de buscar rendimiento.';

  @override
  String get mentorAllocationBalanced =>
      'Equilibra protección y crecimiento: diversifica y revisa el plazo de tu objetivo.';

  @override
  String get mentorAllocationOffensive =>
      'Tu perfil admite más riesgo: mantén disciplina y evita concentrar en pocos activos.';

  @override
  String mentorInsightSymbols(String symbols) {
    return 'Activos observados: $symbols';
  }

  @override
  String get currencyFollowLocale => 'Automático (idioma)';

  @override
  String get compoundCalculatorTitle =>
      'Calculadora Mentora — Interés Compuesto';

  @override
  String get compoundCalculatorSubtitle =>
      'Simula aportes, ganancia nominal y real (tras inflación) y consejos del Mentor.';

  @override
  String get compoundInitialLabel => 'Aporte inicial';

  @override
  String get compoundMonthlyLabel => 'Aporte mensual';

  @override
  String get compoundRateLabel => 'Tasa de interés';

  @override
  String get compoundRateAnnual => 'anual';

  @override
  String get compoundRateMonthly => 'mensual';

  @override
  String get compoundHorizonLabel => 'Plazo';

  @override
  String get compoundHorizonYears => 'años';

  @override
  String get compoundHorizonMonths => 'meses';

  @override
  String get compoundInflationLabel => 'Inflación estimada (% anual)';

  @override
  String get compoundCalculate => 'Calcular';

  @override
  String get compoundChartInvested => 'Total invertido';

  @override
  String get compoundChartInterest => 'Intereses ganados';

  @override
  String get compoundSummaryNominalEnd => 'Saldo final (nominal)';

  @override
  String get compoundSummaryRealGain => 'Ganancia real (poder adquisitivo)';

  @override
  String get compoundMentorCardTitle => 'Consejo del Mentor';

  @override
  String get compoundInvalidInput => 'Introduce valores válidos (plazo > 0).';

  @override
  String get userPersonaSectionTitle => 'Tono del Mentor';

  @override
  String get userPersonaNovice => 'Principiante';

  @override
  String get userPersonaStrategist => 'Estratega';

  @override
  String get userPersonaRiskTaker => 'Atrevido';

  @override
  String get userPersonaConservative => 'Ahorrador';

  @override
  String get compoundOpenFullInsight => 'Ver análisis completo del Mentor';

  @override
  String get investFirstSteps_title => 'Primeros pasos';

  @override
  String get investFirstSteps_brokerTitle => 'Elige un bróker';

  @override
  String get investFirstSteps_brokerBody =>
      'Busca instituciones reguladas y con buena reputación. Compara comisiones, productos y fiabilidad antes de abrir la cuenta.';

  @override
  String get investFirstSteps_openAccountTitle => 'Abre tu cuenta';

  @override
  String get investFirstSteps_openAccountBodyBr =>
      'Proceso digital. En Brasil, normalmente necesitas CPF/RG y, a veces, comprobante de domicilio.';

  @override
  String get investFirstSteps_openAccountBodyGlobal =>
      'El alta digital varía por país. En general necesitas un documento de identidad y verificación de identidad/dirección.';

  @override
  String get investFirstSteps_transferTitle => 'Transfiere fondos';

  @override
  String get investFirstSteps_transferBodyBr =>
      'Envía dinero vía PIX o transferencia bancaria al bróker. El saldo quedará disponible para invertir.';

  @override
  String get investFirstSteps_transferBodyGlobal =>
      'Transfiere fondos mediante transferencia bancaria o métodos locales (depende del país). El saldo quedará disponible para invertir.';

  @override
  String get investFirstSteps_riskProfileTitle => 'Conoce tu perfil';

  @override
  String get investFirstSteps_riskProfileBody =>
      'Responde el cuestionario de suitability. Entiende si eres conservador, moderado o agresivo.';

  @override
  String get investFirstSteps_firstAssetTitle => 'Invierte en tu primer activo';

  @override
  String get investFirstSteps_firstAssetBodyBr =>
      'Empieza por el fondo de emergencia (Tesouro Selic o un CDB con liquidez diaria). Luego diversifica poco a poco.';

  @override
  String get investFirstSteps_firstAssetBodyGlobal =>
      'Empieza por el fondo de emergencia (efectivo remunerado, money market o Treasury bonds de corto plazo). Luego diversifica poco a poco.';

  @override
  String get investFirstSteps_tipTitle => 'Consejo del Mentor:';

  @override
  String get investFirstSteps_tipBodyBr =>
      'Empieza poco a poco, invierte con constancia y evita intentar acertar el timing del mercado. El tiempo es tu mejor aliado.';

  @override
  String get investFirstSteps_tipBodyGlobal =>
      'Empieza poco a poco, invierte con constancia y evita intentar acertar el timing del mercado. El tiempo es tu mejor aliado.';

  @override
  String get investMenu_tesouroTitle => 'Bonos del Tesoro (Brasil)';

  @override
  String get investMenu_cdbTitle => 'Renta fija bancaria (CDB)';

  @override
  String get investMenu_etfsTitle => 'ETFs internacionales';

  @override
  String get investMenu_sp500Title => 'S&P 500 (índice)';

  @override
  String get investMenu_stocksTitle => 'Acciones';

  @override
  String get investMenu_fundsTitle => 'Fondos';

  @override
  String get investMenu_fiisTitle => 'FIIs';

  @override
  String get investMenu_reitsTitle => 'REITs';

  @override
  String get investMenu_internationalTitle => 'Internacional';

  @override
  String get investMenu_cryptoTitle => 'Cripto';

  @override
  String get investRegisterCta => 'Registrar inversión';

  @override
  String investRegionHintBr(String country) {
    return 'País efectivo: $country · catálogo Brasil (Tesouro, CDB, LCA…).';
  }

  @override
  String investRegionHintGlobal(String country) {
    return 'País efectivo: $country · catálogo global (ETFs, NYSE/NASDAQ…). Prioridad: tienda (RevenueCat) · fallback locale/IP.';
  }

  @override
  String get strategy_sectionCoreTitle => 'Estrategias esenciales';

  @override
  String get strategy_sectionDeepDiveTitle => 'Deep Dive (Premium)';

  @override
  String get strategy_emergencyFundTitle => 'Fondo de emergencia';

  @override
  String get strategy_emergencyFundBodyBr =>
      'Tu escudo financiero. Cubre 6–12 meses de gastos. Prioriza liquidez diaria y bajo riesgo (p. ej., Tesouro Selic o CDB ligado al CDI).';

  @override
  String get strategy_emergencyFundBodyGlobal =>
      'Tu escudo financiero. Cubre 6–12 meses de gastos. Prioriza liquidez diaria y bajo riesgo (p. ej., money market y Treasury bonds de corto plazo).';

  @override
  String get strategy_buyHoldTitle => 'Buy & Hold';

  @override
  String get strategy_buyHoldBody =>
      'Comprar activos de calidad y mantenerlos a largo plazo. Enfócate en disciplina, calidad y reinversión con el tiempo.';

  @override
  String get strategy_diversificationTitle => 'Diversificación';

  @override
  String get strategy_diversificationBodyBr =>
      'Distribuye tu capital entre renta fija, acciones, FIIs y activos internacionales para reducir riesgo y mejorar el rendimiento ajustado al riesgo.';

  @override
  String get strategy_diversificationBodyGlobal =>
      'Distribuye tu capital entre bonos, acciones, REITs y exposición internacional para reducir riesgo y mejorar el rendimiento ajustado al riesgo.';

  @override
  String get strategy_dcaTitle => 'Aportes constantes (DCA)';

  @override
  String get strategy_dcaBody =>
      'La constancia vence al genio. Invertir cada mes suele ser más eficaz que intentar adivinar el mejor momento del mercado.';

  @override
  String get strategy_smartGoalsTitle => 'Metas SMART';

  @override
  String get strategy_smartGoalsBody =>
      'Tus metas deben ser: específicas, medibles, alcanzables, relevantes y con plazo definido.';

  @override
  String get strategy_503020Title => 'Regla 50-30-20';

  @override
  String get strategy_503020Body =>
      'Un marco simple: 50% necesidades, 30% deseos y 20% inversión y metas.';

  @override
  String get strategy_deepDive_allocationTitle =>
      'Asignación de activos (avanzado)';

  @override
  String get strategy_deepDive_allocationBody =>
      'Aprende a construir una asignación por objetivo y horizonte, ajustando riesgo, correlación y rebalanceo.';

  @override
  String get strategy_deepDive_globalEtfsTitle =>
      'ETFs globales e índices (avanzado)';

  @override
  String get strategy_deepDive_globalEtfsBody =>
      'Entiende índices globales (p. ej., S&P 500), ETFs y cómo construir exposición internacional con disciplina.';

  @override
  String get strategy_deepDive_taxesTitle =>
      'Impuestos y declaración (avanzado)';

  @override
  String get strategy_deepDive_taxesBody =>
      'Entiende conceptos básicos de impuestos y cómo organizar registros para declarar inversiones con seguridad.';

  @override
  String get strategy_premiumLockedBody =>
      'Contenido Premium. Activa un tema Cyber/Grimm/Hive para desbloquear el Deep Dive de inversiones.';

  @override
  String get homeShowcaseTitle => 'Vitrina';

  @override
  String get homeShowcaseProfileSimTitle => 'Simulado de perfil';

  @override
  String get homeShowcaseProfileSimSubtitle =>
      'Descubre tu perfil de inversor en pocos minutos.';

  @override
  String get homeShowcaseStrategiesTitle => 'Estrategias recomendadas';

  @override
  String get homeShowcaseStrategiesSubtitle =>
      'Atajos directos para aprender y aplicar estrategias.';

  @override
  String get homeShowcaseMentorHubTitle => 'Mentor: Simulados y Estrategias';

  @override
  String get homeShowcaseMentorHubSubtitle =>
      'Acceso rápido al simulado de perfil y a las estrategias recomendadas.';

  @override
  String get quizProfile_title => 'Simulado de perfil';

  @override
  String quizProfile_progress(int current, int total) {
    return 'Pregunta $current de $total';
  }

  @override
  String get quizProfile_badge => 'SIMULADO DE PERFIL';

  @override
  String get quizProfile_resultTitle => 'TU PERFIL ES';

  @override
  String get quizProfile_idealInvestmentsTitle => 'INVERSIONES IDEALES:';

  @override
  String get quizProfile_exploreInvestmentsCta => 'EXPLORAR INVERSIONES';

  @override
  String get quizProfile_exit => 'SALIR';

  @override
  String get quizKnowledge_title => 'Simulado de conocimiento';

  @override
  String quizKnowledge_progress(int current, int total) {
    return 'Pregunta $current de $total';
  }
}
