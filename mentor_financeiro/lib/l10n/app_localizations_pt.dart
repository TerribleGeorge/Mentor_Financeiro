// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Mentor Financeiro';

  @override
  String get saldo => 'Saldo';

  @override
  String get gastosDiarios => 'Gastos Diários';

  @override
  String get confirmarTransacao => 'Confirmar Transação';

  @override
  String get extrato => 'Extrato';

  @override
  String get transferencias => 'Transferências';

  @override
  String get investimentos => 'Investimentos';

  @override
  String get configuracoes => 'Configurações';

  @override
  String get perfil => 'Perfil';

  @override
  String get sair => 'Sair';

  @override
  String get entrar => 'Entrar';

  @override
  String get cadastrar => 'Cadastrar';

  @override
  String get email => 'E-mail';

  @override
  String get senha => 'Senha';

  @override
  String get nome => 'Nome';

  @override
  String get cpf => 'CPF';

  @override
  String get telefone => 'Telefone';

  @override
  String get continuar => 'Continuar';

  @override
  String get voltar => 'Voltar';

  @override
  String get cancelar => 'Cancelar';

  @override
  String get salvar => 'Salvar';

  @override
  String get editar => 'Editar';

  @override
  String get excluir => 'Excluir';

  @override
  String get sucesso => 'Sucesso';

  @override
  String get erro => 'Erro';

  @override
  String get carregando => 'Carregando...';

  @override
  String get semDados => 'Sem dados';

  @override
  String get tentarNovamente => 'Tentar novamente';

  @override
  String get relatorios => 'Relatórios';

  @override
  String get gastosPorCategoria => 'Gastos por Categoria';

  @override
  String get ultimosSeteDias => 'Últimos 7 Dias';

  @override
  String get totalGasto => 'Total Gasto';

  @override
  String get transacoes => 'Transações';

  @override
  String get categoria => 'Categoria';

  @override
  String get data => 'Data';

  @override
  String get valor => 'Valor';

  @override
  String get descricao => 'Descrição';

  @override
  String get alimentacao => 'Alimentação';

  @override
  String get transporte => 'Transporte';

  @override
  String get lazer => 'Lazer';

  @override
  String get saude => 'Saúde';

  @override
  String get outros => 'Outros';

  @override
  String get notificacoes => 'Notificações';

  @override
  String get permissaoNotificacoes => 'Permissão de Notificações';

  @override
  String get ativarMonitoramento => 'Ativar Monitoramento de Gastos';

  @override
  String get descricaoMonitoramento =>
      ' Permite que o app monitore automaticamente suas transações bancárias para organizar suas finanças.';

  @override
  String get idioma => 'Idioma';

  @override
  String get moeda => 'Moeda';

  @override
  String get compararInvestimentos => 'Comparar Investimentos';

  @override
  String get descricaoLocalizacao =>
      'Para comparar investimentos locais (CDB/CDI) com taxas internacionais, precisamos saber sua localização.';

  @override
  String get permissaoLocalizacaoNecessaria =>
      'Permissão de Localização Necessária';

  @override
  String get rendaFixa => 'Renda Fixa';

  @override
  String get rendaVariavel => 'Renda Variável';

  @override
  String get tesouroDireto => 'Tesouro Direto';

  @override
  String get cdb => 'CDB';

  @override
  String get lci => 'LCI';

  @override
  String get lca => 'LCA';

  @override
  String get acoes => 'Ações';

  @override
  String get fiis => 'FIIs';

  @override
  String get criptomoedas => 'Criptomoedas';

  @override
  String get rendimento => 'Rendimento';

  @override
  String get rentabilidade => 'Rentabilidade';

  @override
  String get aplicar => 'Aplicar';

  @override
  String get resgatar => 'Resgatar';

  @override
  String get simular => 'Simular';

  @override
  String get metas => 'Metas';

  @override
  String get estrategias => 'Estratégias';

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
    return 'Você já usou $percent% do seu limite de crédito.';
  }

  @override
  String get fechamentoFatura => 'Fechamento da Fatura';

  @override
  String get fechamentoFaturaMsg =>
      'Amanhã é o dia do fechamento. Ótimo momento para revisar seus gastos.';

  @override
  String get faturaVencendo => 'Atenção: Fatura vencendo';

  @override
  String faturaVencendoMsg(int dias) {
    return 'Sua fatura vence em $dias dia(s). Verifique seu saldo.';
  }

  @override
  String get regra30 => 'Dica: Regra dos 30%';

  @override
  String get regra30Msg =>
      'Tente manter seu uso abaixo de 30% para melhorar seu Score Bancário.';

  @override
  String get diaDeOuro => 'Dia de Ouro!';

  @override
  String get diaDeOuroMsg =>
      'Suas compras hoje só serão pagas daqui a 40 dias!';

  @override
  String get alertaJuros => 'Cuidado: Juros';

  @override
  String get alertaJurosMsg =>
      'Seu saldo não cobre a fatura. Evite o crédito rotativo!';

  @override
  String get notaSaude => 'Saúde Financeira';

  @override
  String get notaExcelente => 'Excelente! Você tem saúde financeira.';

  @override
  String get notaBom => 'Bom, mas pode melhorar.';

  @override
  String get notaAtencao => 'Atenção aos gastos.';

  @override
  String get notaRevisar => 'Revise suas finanças.';
}
