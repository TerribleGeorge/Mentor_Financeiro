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
  String get semDados => 'Sem dados';

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
  String get descricao => 'Descrição';

  @override
  String get alimentacao => 'Alimentação';

  @override
  String get transporte => 'Transporte';

  @override
  String get lazer => 'Ocio';

  @override
  String get saude => 'Salud';

  @override
  String get outros => 'Otros';

  @override
  String get notificacoes => 'Notificações';

  @override
  String get permissaoNotificacoes => 'Permiso de Notificaciones';

  @override
  String get ativarMonitoramento => 'Ativar Monitoramento de Gastos';

  @override
  String get descricaoMonitoramento =>
      ' Permite que o app monitore automaticamente suas transações bancárias para organizar suas finanças.';

  @override
  String get idioma => 'Idioma';

  @override
  String get moeda => 'Moneda';

  @override
  String get compararInvestimentos => 'Comparar Inversiones';

  @override
  String get descricaoLocalizacao =>
      'Para comparar investimentos locais (CDB/CDI) com taxas internacionais, precisamos saber sua localização.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Permiso de Ubicación Requerido';

  @override
  String get rendaFixa => 'Renta Fija';

  @override
  String get rendaVariavel => 'Renta Variable';

  @override
  String get tesouroDireto => 'Tesouro Direto';

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
  String get rendimento => 'Rendimento';

  @override
  String get rentabilidade => 'Rentabilidade';

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
  String get conhecimento => 'Conhecimento';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Enviar mensagem';

  @override
  String get digiteMensagem => 'Digite uma mensagem...';

  @override
  String get alertaGastos => 'Alerta de Gastos';

  @override
  String alertaGastosMsg(int percent) {
    return 'Ya usaste $percent% de tu límite de crédito.';
  }

  @override
  String get fechamentoFatura => 'Fechamento da Fatura';

  @override
  String get fechamentoFaturaMsg =>
      'Amanhã é o dia do fechamento. Ótimo momento para revisar seus gastos.';

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
}
