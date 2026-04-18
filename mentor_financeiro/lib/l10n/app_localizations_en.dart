// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Mentor Finance';

  @override
  String get saldo => 'Balance';

  @override
  String get gastosDiarios => 'Daily Expenses';

  @override
  String get confirmarTransacao => 'Confirm Transaction';

  @override
  String get extrato => 'Statement';

  @override
  String get transferencias => 'Transfers';

  @override
  String get investimentos => 'Investments';

  @override
  String get configuracoes => 'Settings';

  @override
  String get perfil => 'Profile';

  @override
  String get sair => 'Logout';

  @override
  String get entrar => 'Login';

  @override
  String get cadastrar => 'Register';

  @override
  String get email => 'Email';

  @override
  String get senha => 'Password';

  @override
  String get nome => 'Name';

  @override
  String get cpf => 'ID Number';

  @override
  String get telefone => 'Phone';

  @override
  String get continuar => 'Continue';

  @override
  String get voltar => 'Back';

  @override
  String get cancelar => 'Cancel';

  @override
  String get salvar => 'Save';

  @override
  String get editar => 'Edit';

  @override
  String get excluir => 'Delete';

  @override
  String get sucesso => 'Success';

  @override
  String get erro => 'Error';

  @override
  String get carregando => 'Loading...';

  @override
  String get semDados => 'No data';

  @override
  String get tentarNovamente => 'Try again';

  @override
  String get relatorios => 'Reports';

  @override
  String get gastosPorCategoria => 'Expenses by Category';

  @override
  String get ultimosSeteDias => 'Last 7 Days';

  @override
  String get totalGasto => 'Total Spent';

  @override
  String get transacoes => 'Transactions';

  @override
  String get categoria => 'Category';

  @override
  String get data => 'Date';

  @override
  String get valor => 'Value';

  @override
  String get descricao => 'Description';

  @override
  String get alimentacao => 'Food';

  @override
  String get transporte => 'Transport';

  @override
  String get lazer => 'Leisure';

  @override
  String get saude => 'Health';

  @override
  String get outros => 'Others';

  @override
  String get notificacoes => 'Notifications';

  @override
  String get permissaoNotificacoes => 'Notification Permission';

  @override
  String get ativarMonitoramento => 'Enable Expense Monitoring';

  @override
  String get descricaoMonitoramento =>
      'Allow the app to automatically monitor your bank transactions to organize your finances.';

  @override
  String get idioma => 'Language';

  @override
  String get moeda => 'Currency';

  @override
  String get compararInvestimentos => 'Compare Investments';

  @override
  String get descricaoLocalizacao =>
      'To compare local investments (CDB/CDI) with international rates, we need your location.';

  @override
  String get permissaoLocalizacaoNecessaria => 'Location Permission Required';

  @override
  String get rendaFixa => 'Fixed Income';

  @override
  String get rendaVariavel => 'Variable Income';

  @override
  String get tesouroDireto => 'Treasury Direct';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Stocks';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Cryptocurrencies';

  @override
  String get rendimento => 'Return';

  @override
  String get rentabilidade => 'Profitability';

  @override
  String get aplicar => 'Apply';

  @override
  String get resgatar => 'Redeem';

  @override
  String get simular => 'Simulate';

  @override
  String get metas => 'Goals';

  @override
  String get estrategias => 'Strategies';

  @override
  String get conhecimento => 'Knowledge';

  @override
  String get chat => 'Chat';

  @override
  String get enviarMensagem => 'Send message';

  @override
  String get digiteMensagem => 'Type a message...';

  @override
  String get alertaGastos => 'Spending Alert';

  @override
  String alertaGastosMsg(int percent) {
    return 'You already used $percent% of your credit limit.';
  }

  @override
  String get fechamentoFatura => 'Invoice Closing';

  @override
  String get fechamentoFaturaMsg =>
      'Tomorrow is closing day. Great time to review expenses.';

  @override
  String get faturaVencendo => 'Invoice Due';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Invoice due in $dias day(s). Check your balance.';
  }

  @override
  String get regra30 => 'Tip: 30% Rule';

  @override
  String get regra30Msg => 'Keep usage below 30% to improve your Credit Score.';

  @override
  String get diaDeOuro => 'Golden Day!';

  @override
  String get diaDeOuroMsg =>
      'Your purchases today will only be paid in 40 days!';

  @override
  String get alertaJuros => 'Warning: Interest';

  @override
  String get alertaJurosMsg =>
      'Your balance doesn\'t cover the bill. Avoid revolving credit!';

  @override
  String get notaSaude => 'Financial Health';

  @override
  String get notaExcelente => 'Excellent! You have great financial health.';

  @override
  String get notaBom => 'Good, but can improve.';

  @override
  String get notaAtencao => 'Attention to spending.';

  @override
  String get notaRevisar => 'Review your finances.';
}
