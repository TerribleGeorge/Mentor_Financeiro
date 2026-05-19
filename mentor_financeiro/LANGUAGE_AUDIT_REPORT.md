# Language audit report

Potential unlocalized Portuguese/user-visible strings: 1349 across 90 files.

## lib/app/mentor_app_router.dart (2)
- `153`: Estratégias avançadas
- `230`: Relatórios

## lib/constants/subscription_constants.dart (24)
- `4`: premium_monthly
- `5`: premium_yearly
- `6`: premium_offering
- `55`: Relatórios mensais detalhados
- `56`: Gráficos avançados por categoria e pagamento
- `57`: Insights automáticos de organização financeira
- `58`: Monitoramento inteligente de notificações compatíveis
- `59`: Temas premium e personalização visual
- `60`: Sem anúncios
- `68`: Premium themes and visual customization
- `73`: Informes mensuales detallados
- `74`: Gráficos avanzados por categoría y método de pago
- `75`: Ideas automáticas para organizar tus finanzas
- `76`: Monitoreo inteligente de notificaciones compatibles de gastos
- `77`: Temas premium y personalización visual
- `93`: 7 días de prueba gratuita para nuevos usuarios
- `95`: 7 dias de teste grátis para novos usuários
- `107`: Después de la prueba, el cobro continúa en Google Play salvo que 
- `108`: canceles con al menos 24 h de antelación. Puedes gestionar o cancelar 
- `111`: O teste gratuito pode ser usado uma única vez e não é renovável. 
- `112`: Após o teste, a cobrança continua na Google Play salvo cancelamento 
- `113`: com pelo menos 24 horas de antecedência. Você pode gerir ou cancelar 
- `120`: Empezar 7 días gratis
- `121`: Começar teste grátis de 7 dias

## lib/content/investing_transition_strategy_content.dart (36)
- `7`: Sem renda fixa: defesa e liquidez
- `9`: Estratégias conservadoras para períodos de transição
- `12`: Estratégias de Investimento para Períodos de Transição
- `15`: Quando não há entrada previsível, o objetivo do investimento 
- `17`: com o mínimo de risco até restabelecer a renda.
- `23`: A prioridade absoluta é a preservação de capital: cada real guardado 
- `24`: precisa estar disponível se surgir imprevisto (saúde, moradia, 
- `28`: do seu custo de vida real (não o ideal, mas o que efetivamente gasta). 
- `30`: investimentos com prazo ou menor liquidez.
- `33`: Ativos recomendados (segurança máxima)
- `45`: Títulos públicos pós-fixados atrelados à taxa Selic. Liquidez 
- `46`: D+1 em mercado secundário e, na prática, um dos menores riscos de 
- `47`: crédito do país para o investidor pessoa física.
- `53`: Depósitos bancários com rentabilidade atrelada ao CDI. Emissores 
- `54`: sólidos e cobertura do FGC até o limite legal por instituição — 
- `61`: Saldo diário com rendimento automático (são “caixas” com juros). 
- `62`: Praticidade para despesas correntes; compare taxa, limites de 
- `72`: Renda variável (ações e fundos de ações) sem colchão: oscilações de 20% 
- `73`: a 40% em crises são comuns; sem salário, cada queda vira estresse 
- `76`: tempo, disciplina e capital que você não pode “apostar”.
- `77`: Criptoativos: volatilidade extrema, risco regulatório e menor 
- `95`: Altíssima\n(risco soberano)
- `96`: D+1\n(mercado secundário)
- `101`: Alta\n(+ FGC até limite)
- `103`: Forte\n(após reserva)
- `106`: Ações
- `109`: Fraca\n(sem renda fixa)
- `115`: custódia antes de decidir.
- `118`: Dicas práticas
- `124`: Quite dívidas caras antes de “investir por investir”
- `126`: Cartão de crédito, cheque especial e empréstimos pessoais comem 
- `127`: rendimentos conservadores inteiros. Reduzir juros pagos é o 
- `132`: Atenção à tributação regressiva do IR
- `135`: regressiva conforme o tempo que o título fica na sua posição. 
- `136`: Resgates muito cedo pagam alíquota maior; planeje resgates para 
- `137`: não destruir o rendimento líquido quando precisar do dinheiro.

## lib/core/constants/play_store_billing.dart (3)
- `6`: premium_assinatura
- `7`: a-premium
- `8`: premium-anual

## lib/core/constants/transaction_categories.dart (3)
- `7`: Alimentação
- `10`: Saúde
- `12`: Compras

## lib/core/network/offline_exception.dart (1)
- `3`: Sem conexão com a internet.

## lib/data/providers/brazilian_financial_data_provider.dart (2)
- `54`: Falha ao obter cotações BR (${res.statusCode}).
- `59`: Resposta BR inválida.

## lib/data/services/firebase_data_service.dart (1)
- `164`: Firebase não inicializado.

## lib/domain/finance/compound_interest_calculator.dart (1)
- `12`: Parâmetros inválidos para simulação.

## lib/domain/finance/daily_limit_calculator.dart (21)
- `12`: Pensão
- `13`: Condomínio
- `14`: Financiamento (imóvel)
- `15`: IPTU (provisão mensal)
- `18`: Água / esgoto
- `19`: Gás
- `21`: Plano de saúde
- `22`: Educação (escola/curso)
- `25`: Cartão
- `28`: Assinaturas digitais
- `32`: Renda Fixa
- `32`: Renda Extra
- `38`: limite_diario_teto_brl
- `217`: Alerta: Você está com saldo negativo. Seu limite diário recomendado é R\$ 0,00 para evitar mais juros. Foque em cobrir o saldo de $saldoFmt.
- `235`: O limite calculado (${_formatBrl(raw)}) foi mostrado no teto de ${_formatBrl(display)} por dia (ajustável em Configurar finanças).
- `295`: Controle forte no dia a dia — é o teto padrão do app se não escolheres outro.
- `306`: Cerca de 30 % do guia diário calculado com os teus dados — favorece poupança.
- `315`: Cerca de 50 % do guia — ritmo moderado conforme a tua configuração.
- `324`: Cerca de 70 % do guia — mais espaço para imprevistos do dia.
- `333`: Só a fórmula
- `335`: Sem teto manual: o ecrã usa o valor integral da fórmula (pode ser alto com saldo grande na conta).

## lib/domain/investment/investment_catalog.dart (14)
- `36`: Poupança
- `38`: Conta poupança tradicional. Liquidez imediata; rendimento costuma ficar abaixo da inflação em muitos países.
- `46`: Títulos públicos federais (Brasil). Considerados baixo risco de crédito soberano no Brasil.
- `54`: Certificado de depósito bancário (Brasil). Renda fixa com proteção do FGC até limites legais.
- `62`: Letras de crédito imobiliário e do agronegócio (Brasil). Isenção de IR para PF em condições específicas.
- `68`: Fundos de investimento
- `70`: Cestas geridas por gestores. Perfil de risco variável (conservador a agressivo).
- `76`: Ações
- `78`: Participação em empresas listadas. Retorno e volatilidade maiores; exige tolerância ao risco.
- `86`: Fundos negociados em bolsa que replicam índices (ex.: S&P 500, MSCI). Diversificação com liquidez diária.
- `92`: Ações internacionais
- `94`: Bolsa fora do Brasil (ex.: NYSE, NASDAQ). Moeda e tributação dependem do país da conta.
- `102`: Ativos digitais voláteis. Sem garantia de fundo garantidor; adequado apenas a perfil arrojado.
- `110`: Títulos de dívida corporativa. Risco de crédito da emissora; cupons fixos ou variáveis.

## lib/domain/mentorship/mentorship_engine.dart (42)
- `27`: Imagina que cada euro o real es una semilla: con tiempo y constancia, el interés 
- `30`: Imagine que cada real é uma semente: com tempo e constância, os juros compostos 
- `31`: vão fazendo a “floresta” crescer — sem pressa, no seu ritmo.
- `39`: El alpha de esta pila está en sostener un CAGR aproximado del 
- `40`: $cagrStr% en $months meses — fiscalidad y política de reinversión pesan tanto como la tasa bruta.
- `42`: O alpha dessa operação está em manter um CAGR aproximado de carteira acima de 
- `43`: $cagrStr% ao longo de $months meses — eficiência fiscal e política de reinvestimento pesam tanto quanto a taxa “na etiqueta”.
- `51`: Estás apilando retorno: estira horizonte y aporte para captar upside — 
- `52`: pero mantén liquidez para no liquidar ganadores en el peor momento.
- `54`: Você está montando retorno com alavanca temporal: estique horizonte e aporte para capturar upside — 
- `55`: só não zere liquidez e seja vendido no pior timing.
- `63`: Ancora en poder adquisitivo: tras inflación, el ganancia real es lo que te protege — 
- `66`: Ancore no poder de compra: depois da inflação, o ganho real é o que protege patrimônio — 
- `67`: cupons previsíveis e dividendos conversam melhor com esse perfil do que “novela” de mercado.
- `134`: Se não precisar do dinheiro logo, esperar mais tempo costuma deixar a conta mais justa — 
- `135`: ou peça ajuda para ver se LCI/LCA isentas encaixam no seu caso.
- `151`: Alerta de liquidez: en plazos cortos (~6 meses o menos), el IR sobre rendimientos 
- `152`: de RF en Brasil suele ir en la franja más alta (~22,5%). Si no necesitas el dinero 
- `153`: ya, amplía el horizonte (p. ej. 2+ años) para tender a 15% (tabla regresiva) o valora 
- `159`: Para esse prazo curto, a mordida do Leão costuma ser forte: até ~180 dias o IR 
- `160`: regressivo de renda fixa no Brasil pode chegar a 22,5%. Se você não precisa desse 
- `161`: dinheiro agora, segurar por 2 anos ou mais ajuda a caminhar para faixas menores 
- `162`: (até 15%) — ou considere LCI/LCA isentas de IR, se fizer sentido ao seu perfil.
- `186`: Curva de acumulação: com taxa modesta, o ponto de inflexão “mecânico” costuma aparecer 
- `187`: por volta do mês $monthPhrase — a partir daí o estoque de juros trabalha a favor do CAGR.
- `201`: Aquí el tiempo es tu mejor aliado: con una tasa modesta, la constancia gana. 
- `202`: El efecto bola de nieve suele acelerar tras el mes $monthPhrase — mantén el ritmo.
- `207`: Aqui o tempo é seu melhor amigo: com juro mais modesto, disciplina e constância 
- `208`: valem mais que “milagre”. O efeito bola de neve tende a ficar bem mais visível 
- `209`: depois do mês $monthPhrase — não quebre o aporte.
- `229`: Defasagem inflacionária relevante: compare ganho nominal vs. ganho real — 
- `230`: para cenários longos, sensibilize a taxa real e o duration do seu lado ativo.
- `244`: La inflación se está comiendo parte del ganancia nominal: mira el poder adquisitivo real, 
- `250`: Com a inflação que você estipulou, parte desse ganho nominal some no poder de compra. 
- `251`: Olhe o ganho real — é ele que diz se você ficou mais rico de verdade.
- `265`: Dica: uma vez por mês, olhe prazo e aporte — pequenos ajustes viram hábito e resultado.
- `272`: Stress test: mueve inflación ±1pp y tasa ±50bp — mira cómo se mueve el CAGR y el real.
- `274`: Stress test: chacoalhe inflação ±1 p.p. e taxa ±50 bps — veja como CAGR e ganho real reagem.
- `281`: Si subes la tasa, acompáñala con colchón de caja — sin liquidez, el upside duele.
- `283`: Se você empurra a taxa para cima, mantenha colchão de caixa — oportunidade sem liquidez vira dor.
- `290`: Prefiere suavidad: separa metas en cubetas (emergencia, ingreso, crecimiento) antes de ir a por yield.
- `292`: Prefira suavidade: separe metas em “caixinhas” (reserva, renda, crescimento) antes de correr atrás de yield.

## lib/models/investimento_model.dart (6)
- `35`: valor
- `36`: moeda
- `37`: data
- `50`: data
- `58`: valor
- `59`: moeda

## lib/models/investment_news_item.dart (1)
- `32`: Notícias

## lib/models/quiz_engine.dart (33)
- `27`: Qual é o investimento de menor risco de crédito no Brasil?
- `31`: Ações
- `38`: O que é o FGC?
- `40`: Fundo de Garantia de Crédito
- `42`: Fundo de Gestão Centralizada
- `49`: Qual é a principal vantagem das LCI e LCA?
- `52`: Isenção de IR para pessoa física
- `60`: O que é marcação a mercado?
- `62`: Sistema de precificação diária
- `63`: Método de investimento
- `68`: Marcação a Mercado
- `71`: Qual a alíquota de IR para ações com menos de 180 dias?
- `79`: Ações
- `82`: O que é o CDI?
- `85`: Certificado de Depósito Interbancário
- `89`: Crédito Direto Informado
- `96`: O que significa diversificar investimentos?
- `99`: Colocar todo dinheiro em um ativo só
- `103`: Investir apenas em ações
- `107`: Diversificação
- `110`: Qual é a regra de ouro para emergência?
- `112`: Guardar 1-3 meses de despesas
- `113`: Guardar 3-6 meses de despesas
- `114`: Guardar 12 meses de despesas
- `121`: O que é Dividend Yield?
- `123`: Valor pago em dividendos
- `135`: Isenção de IR sobre dividendos
- `143`: O que significa "levar até o vencimento"?
- `146`: Manter o título até o final
- `154`: O que é a Selic?
- `156`: Taxa básica de juros
- `157`: Tipo de ação
- `158`: Corretora de valores

## lib/models/suitability_engine.dart (31)
- `18`: Qual é a sua idade?
- `28`: Preservar o patrimônio (segurança)
- `29`: Equilibrar segurança com crescimento
- `35`: Por quanto tempo você pretende deixar esse dinheiro investido?
- `43`: Como você reage a perdas de 20% em um mês?
- `47`: Compra mais (oportunidade)
- `51`: Qual seu conhecimento sobre investimentos?
- `54`: Intermediário (conheço algumas opções)
- `55`: Avançado (sou bem informado)
- `59`: De onde vem sua renda principal?
- `61`: Aposentadoria ou renda fixa
- `62`: Salário estável
- `63`: Renda variável ou negócios
- `67`: Você tem reservas para emergências?
- `69`: Não tenho nenhuma reserva
- `75`: Como você prefere receber informações sobre investimentos?
- `77`: Só preciso de orientações simples
- `79`: Adoro analisar dados e gráficos
- `83`: Se você perdesse R\$ 10.000 hoje, o que aconteceria com você?
- `85`: Seria um problema sério
- `88`: Mal perceberia (dinheiro que não me faz falta)
- `94`: Você já investiu em ações ou renda variável?
- `102`: Qual sua experiência com investimentos de risco?
- `111`: Quanto do seu patrimônio você colocaria em investimentos de risco?
- `148`: Você prioriza a segurança acima de tudo. Prefere investimentos com baixo risco e história comprovada.
- `150`: Você busca um equilíbrio entre segurança e rentabilidade. Aceita alguns riscos em troca de melhores retornos.
- `152`: Você está disposto a assumir riscos para buscar retornos maiores. Tem nervos de aço e visão de longo prazo.
- `159`: CDB de bancos sólidos
- `164`: Ações de empresas sólidas
- `167`: Ações
- `167`: Criptomoedas

## lib/models/transacao_model.dart (13)
- `68`: valor
- `70`: data
- `71`: data
- `74`: categoria
- `77`: limiteDisponivel
- `85`: valor
- `87`: data
- `89`: categoria
- `94`: limiteDisponivel
- `103`: Alimentação
- `105`: Compras
- `107`: Saúde
- `146`: assinatura

## lib/pages/adicionar_investimento_page.dart (11)
- `83`: Sem cotação para "${result.yahooSymbol}". Verifique o ticker.
- `113`: Indique um valor maior que zero.
- `191`: Novo investimento
- `196`: Nenhum tipo de investimento disponível para esta região.
- `209`: Novo investimento
- `220`: Região da loja/conta: ${cat.effectiveCountryCode} · 
- `221`: ${cat.isBrazilMarket ? "catálogo Brasil" : "catálogo global"}
- `351`: ${_data.day.toString().padLeft(2, 
- `351`: )}/${_data.month.toString().padLeft(2, 
- `351`: )}/${_data.year}
- `382`: Guardar

## lib/pages/adicionar_transacao_page.dart (6)
- `174`: gastos_${transacao.data.year}-${transacao.data.month.toString().padLeft(2, 
- `174`: )}-${transacao.data.day.toString().padLeft(2, 
- `279`: Valor
- `416`: ${_data.day.toString().padLeft(2, 
- `416`: )}/${_data.month.toString().padLeft(2, 
- `416`: )}/${_data.year}

## lib/pages/configuracoes_page.dart (5)
- `322`: Visualização
- `342`: Este é um exemplo de como seus cards e gráficos aparecerão com o tema selecionado.
- `410`: Restaurar compras
- `573`: Melhor Valor
- `641`: Assinar Agora

## lib/pages/conhecimento/acoes_detalhe_page.dart (23)
- `15`: Ações
- `32`: 1. Torne-se Sócio
- `37`: 2. Tipos de Ações
- `47`: 4. Gestão de Riscos
- `95`: Ações
- `104`: Títulos de Renda Variável
- `159`: O investidor passa a ser dono de uma pequena parte da empresa, participando de seus resultados. Ao comprar ações, você se torna acionista e tem direito a participação nos lucros e decisões.
- `170`: Ações ON ( Ordinárias Nominativas)
- `176`: Ações PN ( Preferenciais)
- `233`: Dividendos: Lucro distribuído isento de IR.
- `273`: Valorização: Ganho na venda por preço superior ao de compra.
- `311`: Ações NÃO possuem garantia do Fundo Garantidor de Crédito. O preço das ações varia diariamente conforme a oferta e demanda do mercado.
- `347`: Alíquota: 15%
- `358`: Sobre o lucro em operações comuns (buy e sell).
- `390`: Vendas mensais de até R\$ 20.000,00 são isentas (exclusivo para ações).
- `418`: Indicadores básicos:
- `426`: Lucro Líquido
- `426`: Quanto a empresa lucrou no período
- `427`: Relação entre dívida e patrimônio
- `429`: Governança Corporativa
- `430`: Qualidade da gestão e transparência
- `432`: P/L (Preço/Lucro)
- `432`: Se a ação está cara ou barata

## lib/pages/conhecimento/cdb_detalhe_page.dart (24)
- `52`: 5. Tributação e Vantagem de Custo
- `57`: 6. Detalhes Avançados
- `62`: 7. Estratégia de Escolha
- `116`: Certificado de Depósito Bancário
- `171`: O CDB é um título de renda fixa emitido pelos bancos para captar recursos. Você empresta dinheiro ao banco e ele te devolve com juros. É a porta de entrada para quem quer render mais que a poupança com a mesma segurança.
- `194`: Segurança Máxima: Proteção do Fundo Garantidor de Crédito.
- `206`: Cobertura: Até R\$ 250 mil por CPF e por instituição. Se o banco quebrar, o FGC te ressarce.
- `220`: Pós-fixado
- `227`: Taxa travada (ex: 11% ao ano). Ideal para quando os juros estão em queda.
- `232`: Híbrido (IPCA+)
- `233`: Ganho real. Garante a inflação + uma taxa fixa.
- `245`: Liquidez Diária
- `263`: Imposto de Renda:
- `287`: Período
- `293`: Alíquota
- `303`: Até 180 dias
- `412`: Vantagem: Ao contrário do Tesouro Direto, o CDB NÃO possui taxa de custódia da B3. Todo o rendimento líquido é seu.
- `436`: Rating (Nota de Crédito):
- `449`: Mercado Secundário:
- `457`: É possível tentar vender um CDB "preso" antes do vencimento em caso de emergência, mas pode haver perda de rentabilidade (deságio).
- `470`: O banco capta de você a 10% e empresta a terceiros a 100%. Por isso ele te paga juros.
- `490`: Estratégia de Escolha:
- `499`: • CDBs de bancos grandes (Itaú, Bradesco) costumam pagar menos (próximo a 100% do CDI).\n\n
- `500`: • Bancos médios/digitais costumam oferecer 110%, 120% do CDI ou mais para atrair capital.\n\n

## lib/pages/conhecimento/conhecimento_hub.dart (12)
- `46`: Conhecimento
- `56`: Tipos de Investimento
- `57`: Entenda as opções do mercado
- `64`: Tipos de Estratégias
- `65`: Aprenda a investir melhor
- `72`: Dicionário do Investidor
- `81`: Guia para começar a investir
- `88`: Impostos e Declaração
- `89`: Entenda a tributação
- `96`: Onde NÃO Investir
- `159`: Simulado de Conhecimento
- `168`: Teste seus conhecimentos

## lib/pages/conhecimento/cripto_detalhe_page.dart (11)
- `42`: 3. Como Investir com Segurança
- `47`: 4. Alerta de Volatilidade
- `161`: Criptomoedas são dinheiro digital descentralizado, sem controle de bancos ou governos.
- `166`: Blockchain é a tecnologia por trás: um registro público e seguro que todos podem verificar, mas ninguém pode alterar facilmente.
- `178`: Reserva de valor digital. Similar ao ouro digital. Limitado a 21 milhões de unidades.
- `229`: Comprar em Exchanges
- `230`: Plataformas como Binance, Coinbase. Mais opções, mas requer mais conhecimento.
- `299`: O preço pode subir ou cair drasticamente em pouco tempo. Em 2022, o Bitcoin perdeu mais de 60% do valor.
- `310`: Invista apenas dinheiro que não fará falta no curto prazo.
- `339`: Dicas de Segurança:
- `352`: Ative autenticação em duas etapas

## lib/pages/conhecimento/debentures_detalhe_page.dart (15)
- `42`: 3. O Alerta de Risco: Sem FGC
- `52`: 5. Liquidez e Mercado Secundário
- `107`: Títulos de Dívida Corporativa
- `162`: Ao comprar uma Debênture, você está emprestando dinheiro diretamente para uma empresa (que não seja um banco). Você se torna um credor da companhia e recebe juros por isso.
- `190`: Têm incidência de Imposto de Renda pela tabela regressiva.
- `226`: São isentas de Imposto de Renda para Pessoa Física. Elas financiam setores de infraestrutura cruciais para o país.
- `259`: ATENÇÃO MÁXIMA
- `270`: Debêntures NÃO possuem garantia do Fundo Garantidor de Crédito.
- `279`: O risco é o de a empresa não conseguir pagar a dívida (Risco de Crédito). Se a empresa falir, o investidor corre o risco de perder o capital.
- `313`: Busque empresas com Rating AAA ou AA para maior segurança.
- `326`: Debêntures de empresas menores (High Yield) pagam mais, mas o risco de calote é significativamente maior.
- `342`: A maioria das debêntures é para longo prazo.
- `360`: Mercado Secundário
- `371`: Sair antes do vencimento exige vender o título no mercado secundário, o que pode resultar em perdas por marcação a mercado.
- `412`: Ex: Inflação + 6%. São excelentes para proteção de patrimônio contra a desvalorização da moeda.

## lib/pages/conhecimento/detalhe_generico_page.dart (1)
- `96`: Conteúdo em desenvolvimento pela equipe técnica.

## lib/pages/conhecimento/dicionario_page.dart (9)
- `17`: Dicionário
- `26`: Taxa Básica de Juros da economia brasileira. Definida pelo Banco Central. Influencia o rendimento de quase todos os investimentos de renda fixa.
- `31`: Certificado de Depósito Interbancário. Taxa usada pelos bancos para emprestar entre si. O benchmark mais comum para investimentos de renda fixa.
- `36`: Índice de Preços ao Consumidor Amplo. É a medida oficial da inflação no Brasil. Usado para corrigir investimentos e manter o poder de compra.
- `41`: Facilidade de transformar um investimento em dinheiro. Pode ser D+0 (mesmo dia), D+1 (próximo dia útil) ou com data de vencimento definida.
- `46`: O quanto o preço de um ativo varia ao longo do tempo. Quanto maior, maior o risco e maior o potencial de ganho ou perda.
- `51`: Parcela do lucro distribuído aos acionistas de empresas. Isento de IR para pessoa física (no caso de ações).
- `56`: Preço sobre Lucro. Indicador que mostra se uma ação está cara ou barata. Quanto menor, melhor.
- `61`: Rendimento percentual de um ativo. Dividend Yield mostra quanto o fundo ou ação paga em dividendos proporcional ao preço.

## lib/pages/conhecimento/ferramentas_page.dart (21)
- `30`: Simulações inteligentes com orientação prática:
- `36`: Montante nominal, ganho real após inflação e conselhos sobre IR, prazo e disciplina.
- `45`: As melhores opções para começar a investir no Brasil:
- `49`: XP Investimentos
- `55`: Ótima plataforma e análise.boa para quem quer dinamismo.
- `65`: Zero taxa de custódia. Ideal para iniciantes.
- `72`: Educação Financeira
- `77`: Grupo Primo (Rico/Íon)
- `78`: Referência em educação financeira no Brasil. Cursos gratuitos e pagos.
- `83`: Aprenda sobre investimentos com profundidade.
- `88`: Podcasts e cursos sobre investimentos.
- `95`: Análise de Ativos
- `96`: Sites para consultar dados e números:
- `106`: Comparativos e análises detalhadas.
- `111`: Dados fundamentalistas de ações.
- `119`: Apps para acompanhar seus investimentos:
- `124`: Consolida todas as corretoras em um só lugar.
- `129`: Agregador de investimentos com análise.
- `134`: Carteira integrada com educação.
- `183`: Tudo que você precisa para investir melhor
- `347`: Comece com uma corretora só. Só use agregadores quando tiver mais de uma conta.

## lib/pages/conhecimento/fiis_detalhe_page.dart (26)
- `32`: 1. O que é um FII?
- `52`: 5. Vantagens sobre Imóvel Físico
- `77`: 10. Gestão Ativa vs. Passiva
- `124`: Fundos Imobiliários
- `179`: O investidor adquire cotas de grandes empreendimentos imobiliários e recebe parte dos aluguéis proporcionalmente ao número de cotas que possui.
- `198`: Os rendimentos mensais são isentos de IR para pessoa física, o que torna os FIIs excelentes para gerar renda passiva.
- `218`: Imóveis reais como Shoppings, Galpões logísticos e Escritórios.
- `224`: Títulos de dívida do setor imobiliário como CRI e LCI.
- `289`: O imóvel ficar vazio sem inquilino
- `290`: Inquilino não pagar o aluguel
- `293`: Oscilação do preço da cota na Bolsa
- `331`: Investimento inicial baixo
- `343`: Diversificação imediata
- `344`: Vários imóveis ao mesmo tempo com pouco capital
- `391`: Indicadores básicos:
- `403`: Preço sobre valor patrimonial
- `406`: Tipo de imóveis e localização
- `408`: Percentual de imóveis vagos
- `409`: Taxa de Administração
- `471`: ATENÇÃO: IR NA VENDA
- `495`: NÃO existe isenção de R\$ 20 mil para FIIs.
- `561`: Um rendimento mensal muito acima da média pode esconder riscos. O investidor deve analisar se o pagamento é sustentável ou se foi apenas um evento extraordinário (venda de ativos).
- `575`: Gestão Ativa
- `576`: O gestor compra e vende imóveis para buscar lucro. Taxa de administração costuma ser maior.
- `581`: Gestão Passiva
- `582`: O fundo apenas mantém os mesmos imóveis e distribui o aluguel. Taxa menor.

## lib/pages/conhecimento/fundos_detalhe_page.dart (24)
- `15`: Fundos de Investimento
- `32`: 1. O que é um Fundo?
- `94`: Fundos de Investimento
- `103`: Gestão Profissional Coletiva
- `161`: Um Fundo de Investimento é como um "condomínio" de investidores. Todos os participantes colocam dinheiro juntos, e um profissional (Gestor) cuida de onde investir esse dinheiro coletivo.
- `177`: O Gestor é responsável por tomar todas as decisões de investimento em nome dos cotistas, seguindo a estratégia definida no regulamento do fundo.
- `197`: Taxa de Administração
- `198`: Custo anual para manter o fundo. Geralmente entre 0,5% e 2% ao ano. É cobrada independentemente do resultado.
- `260`: O que é o Come-Cotas?
- `271`: É um antecipação do Imposto de Renda que ocorre duas vezes por ano: em maio e novembro. O IR é calculado sobre os ganhos de todos os meses anteriores e descontado automaticamente.
- `287`: Se você rescindir em maio ou novembro, o IR já foi pago. Nos outros meses, o IR é retido apenas no resgate.
- `304`: Renda Fixa
- `305`: Investe em títulos de renda fixa (Tesouro, CDB, Debêntures). Mais conservador.
- `310`: Ações
- `311`: Investe majoritariamente em ações na Bolsa. Maior risco, maior potencial de retorno.
- `317`: Mistura várias classes (ações, juros, câmbio).flexível e pode usar estratégias sophisticated.
- `323`: Investe em moedas estrangeiras (Dólar, Euro). Proteção contra variação cambial.
- `393`: Gestão profissional
- `394`: Experts decidem onde investir por você
- `397`: Diversificação
- `398`: Acesso a vários ativos com pouco dinheiro
- `400`: Resgate geralmente rápido
- `432`: Você não escolhe os ativos específicos
- `435`: Decisões ruins afetam todos

## lib/pages/conhecimento/golpes_page.dart (45)
- `39`: Os golpes mudam de país para país, mas quase sempre seguem o mesmo padrão: 
- `40`: urgência + link/telefone + pedido de ação imediata. 
- `41`: A regra é universal: não clique, não ligue para o número da mensagem e não faça “PIX de teste”. 
- `57`: Desconfie de mensagens com urgência (“última chance”). Nunca clique em links para “regularizar” ou “desbloquear” conta. Prefira abrir o app oficial do banco.
- `63`: “Compra suspensa” ou “PIX em análise” (link de cancelamento)
- `65`: BB: Compra de R\$ 2.499,90 em MAGAZINE LUIZA aguardando aprovação. 
- `66`: Caso NÃO tenha realizado, cancele agora em: ://link-falso.com
- `68`: Bancos quase nunca enviam link para “cancelar compra” por mensagem. 
- `69`: O objetivo é te levar a um site falso para capturar senha/código.
- `71`: Se você não reconhece a compra/PIX, abra o app oficial do banco por conta própria 
- `72`: (não pelo link) e confira a transação. Se preciso, bloqueie o cartão pelo app.
- `79`: Sempre confira nome e instituição antes de confirmar. Se alguém pedir PIX “para liberar entrega” ou “taxa”, pare e valide por outro canal.
- `84`: “Central de segurança” falsa (telefone na mensagem)
- `87`: Se não foi você, ligue para a nossa central: 0800-XXX-XXXX.
- `89`: O número pode parecer oficial, mas pertence aos golpistas. 
- `90`: Golpistas trocam números com frequência (como telemarketing) — por isso não 
- `91`: indicamos aqui um “0800 certo”: o seguro é sempre o contacto no verso do cartão 
- `93`: Ao ligar para o número da mensagem, o “atendente” pode pedir PIX ou “conta segura”.
- `95`: Desligue e procure o contato oficial no verso do cartão ou no site/app oficial. 
- `96`: Nunca faça transferências “para validar”, “testar” ou “proteger”.
- `103`: Verifique beneficiário, CNPJ/CPF, banco emissor e valor. Se possível, pague pelo app do banco lendo o código pelo próprio app (evita copiar/colar adulterado).
- `110`: Banco não pede senha, token ou código. Se ligarem, desligue e ligue você mesmo para o número oficial do cartão/banco.
- `115`: PIX agendado falso (link para “cancelar”)
- `117`: NOTIFICAÇÃO: PIX agendado no valor de R\$ 850,00 para [Nome Estranho]. 
- `118`: Para cancelar este agendamento, acesse sua conta: ://banco-atualiza-token.com
- `120`: O link abre uma página falsa para você digitar sua senha/código. 
- `121`: Golpistas usam urgência e medo para você agir rápido.
- `123`: Não clique. Abra o app do banco e procure “Agendamentos”/“Extrato”. 
- `124`: Se existir algo suspeito, cancele por lá e altere senhas/biometria.
- `129`: Código/OTP é pessoal
- `131`: Nunca compartilhe códigos de verificação. Eles permitem acesso à sua conta. Se alguém pediu, é golpe.
- `144`: Dica: em caso de dúvida, pare a transação e confirme no app oficial do banco. 
- `145`: Pressa é o principal gatilho de golpes.
- `269`: Checklist rápido para evitar golpes comuns.
- `428`: Por que é golpe?
- `523`: Raramente possui. Se tiver, é informativo.
- `528`: Ação solicitada
- `530`: Pede para “cancelar”, “atualizar” ou “ligar”.
- `540`: Destinatário
- `541`: Sabe seu nome ou parte do cartão.
- `542`: Genérica (“Prezado cliente”).
- `547`: Pode vir de números curtos (varia por país).
- `548`: Números comuns/celular ou 0800 “inventado”.
- `562`: Dica de ouro: se receber um SMS ou notificação estranha, feche tudo e abra o app do banco. 
- `563`: Se não houver nada no extrato ou na fatura do cartão, a mensagem é falsa.

## lib/pages/conhecimento/impostos_detalhe_page.dart (14)
- `15`: Impostos e Declaração
- `32`: 1. Renda Fixa
- `37`: 2. Renda Variável e DARF
- `42`: 3. Declaração Anual
- `96`: Entenda como funciona a tributação
- `174`: O imposto é retido diretamente na fonte. Você recebe o valor já limpo, sem necessidade de acertar depois.
- `208`: Obrigatório: DARF
- `218`: Vendas de ações acima de R\$ 20.000/mês ou lucros em FIIs devem ser declarados via DARF.
- `235`: Alíquotas:
- `243`: • Ações: 15% sobre o lucro\n
- `275`: Informe de Rendimentos
- `285`: A corretora fornece um documento com todos os seus investimentos e rendimentos do ano.
- `295`: 1. Baixe o informe no app da corretora (até março)\n
- `296`: 2. Acesse a declaração do IRPF\n

## lib/pages/conhecimento/internacional_detalhe_page.dart (23)
- `15`: Investimento Internacional
- `32`: 1. Por que sair do Brasil?
- `37`: 2. BDRs: O Caminho Fácil
- `52`: 5. Tributação e Cuidados
- `90`: Investimento Internacional
- `99`: Diversifique além das fronteiras
- `154`: Investir fora protege contra a desvalorização do Real e dá acesso às maiores empresas do planeta (Big Techs, Luxo, Saúde). Principais motivos:\n\n
- `155`: • Diversificação de moeda\n
- `157`: • Proteção contra crises locais
- `173`: BDRs são recibos de ações estrangeiras negociados na B3.
- `184`: Vantagem: Praticidade (compra na corretora brasileira)
- `198`: Desvantagem: Não possui dólar físico, apenas título atrelado
- `211`: Investir em índices inteiros através de ETFs. Exemplos:\n\n
- `214`: • MSCI World: Ações globais\n\n
- `215`: É possível comprar через corretoras brasileiras.
- `247`: • Patrimônio em jurisdição estrangeira\n
- `248`: • Moeda forte (Dólar/Euro)\n
- `249`: • Proteção contra crises locais no Brasil\n
- `250`: • Acesso a mais produtos de investimento
- `274`: ATENÇÃO:
- `285`: • BDRs NÃO têm isenção de R\$ 20 mil\n
- `286`: • Retenção de imposto sobre dividendos no exterior\n
- `287`: • Risco da variação cambial (valor em R\$ oscila)

## lib/pages/conhecimento/investimento_sem_renda_fixa_page.dart (5)
- `126`: Evite expor o que não pode perder a estes riscos:
- `261`: Comparativo rápido
- `272`: Segurança, liquidez e recomendação nesta fase
- `318`: Segurança
- `320`: Recomendação

## lib/pages/conhecimento/lci_lca_detalhe_page.dart (19)
- `32`: 1. O que são?
- `37`: 2. O Super Poder: Isenção de IR
- `42`: 3. Segurança: Garantia do FGC
- `52`: 5. O que é o Lastro?
- `57`: 6. Comparação de Rentabilidade
- `114`: Letras de Crédito Isentas de IR
- `181`: É um título onde emprestas dinheiro ao banco para que ele financie o setor imobiliário.
- `195`: Semelhante à LCI, mas o dinheiro é destinado ao setor do agronegóceo (produtores rurais e cooperativas).
- `228`: Investidores Pessoa Física não pagam Imposto de Renda sobre os rendimentos de LCI e LCA. O valor que vês na corretora já é o valor líquido que irá para a tua conta.
- `257`: Tal como o CDB, estes títulos possuem a proteção do Fundo Garantidor de Crédito. Garantia de até R\$ 250.000,00 por CPF e por instituição financeira.
- `286`: ATENÇÃO - Regras vigentes 2026
- `297`: Desde as mudanças do CMN em 2024, os prazos mínimos são:
- `366`: O resgate antes desse prazo é proibido. A liquidez diária só é permitida após esse período inicial.
- `390`: Títulos Limitados
- `402`: O banco só pode emitir LCI se tiver imóveis financiados, e LCA se tiver produtores rurais financiados.
- `407`: Se não houver "lastro", o título não fica disponível para compra.
- `511`: Como não há IR, taxas aparentemente menores nas LCIs/LCAs costumam vencer os CDBs no resultado final.
- `553`: Não há cobrança de taxas de custódia da B3. Além da isenção de IR para Pessoa Física, todo o rendimento é seu.
- `590`: • Quanto maior o prazo de carência (9 ou 12 meses), mais importante é a solidez do banco escolhido\n

## lib/pages/conhecimento/perigos_page.dart (10)
- `15`: Onde NÃO Investir
- `29`: Apostas Binárias
- `30`: IQ Option e similares são JOGOS DE AZAR, não investimentos. Não existe análise real - é pura especulação. A plataforma ganha quando você perde.
- `35`: Day Trade Ilusório
- `36`: 90% dos traders perdem dinheiro. Parece fácil nas lives, mas exige anos de prática. NÃO é hobby - é profissão.
- `41`: Promessas de Lucro Fácil
- `42`: Rendimento alto + Risco zero = GOLPE. Se parece bom demais para ser verdade, provavelmente é.
- `48`: Fique longe de esquemas que pagam para atrair novos investidores. O lucro vem do aporte de outros, não de resultados reais.
- `96`: Aprenda a evitar armadilhas
- `187`: Se alguém te oferecer retorno garantido sem risco, é golpe. Investimento = risco.

## lib/pages/conhecimento/tesouro_direto_completo_page.dart (24)
- `32`: 1. O que é o Tesouro Direto?
- `37`: 2. O Cardápio de Títulos
- `42`: 3. Marcação a Mercado
- `48`: 4. Liquidez e Horários
- `53`: 5. Tributação e Custos
- `58`: 6. Como Começar
- `109`: O investimento mais seguro do Brasil
- `168`: É um programa do Tesouro Nacional que permite a pessoas físicas comprarem títulos públicos. Você empresta dinheiro ao Governo Federal em troca de juros.
- `185`: É o investimento de menor risco de crédito do Brasil (Risco Soberano).
- `205`: O preferido para reserva de emergência. Rende a taxa básica de juros e não sofre oscilação negativa.
- `217`: Híbrido. Protege seu poder de compra contra a inflação (IPCA) + uma taxa fixa.
- `223`: Você sabe exatamente quanto vai receber se levar até o vencimento.
- `228`: Tesouro RendA+
- `229`: Título focado em previdência. Acumula por anos e paga mensalmente por 20 anos.
- `235`: Título focado em educação. Acumula e paga mensalmente por 5 anos.
- `300`: Os títulos Prefixados e IPCA+ variam de preço diariamente. Se resgatar antes do vencimento, você pode ganhar mais ou perder dinheiro.
- `325`: Se levar até o final, a taxa contratada é garantida.
- `347`: Dias úteis, das 09h30 às 18h00
- `353`: D+0 (dinheiro no dia) para solicitações até às 13h00, ou D+1.
- `398`: Imposto de Renda
- `411`: 0,20% ao ano (Isento para Tesouro Selic até R\$ 10 mil)
- `423`: Escolha uma de sua confiança
- `428`: Escolher o título
- `442`: Mínimo de ~R\$ 30,00 para começar a investir.

## lib/pages/conhecimento/tesouro_direto_detail_page.dart (12)
- `37`: O que é?
- `39`: É um programa do Tesouro Nacional para compra de títulos públicos por pessoas físicas. Você empresta dinheiro ao Governo Federal em troca de juros. É o investimento de menor risco de crédito no Brasil.
- `43`: Tipos de Títulos
- `45`: • Tesouro Selic: Ideal para Reserva de Emergência (pós-fixado).\n\n• Tesouro IPCA+: Proteção contra inflação (híbrido).\n\n• Tesouro Prefixado: Taxa fixa garantida.\n\n• Tesouro RendA+ e EdukA+: Focados em aposentadoria e educação.
- `51`: Rentabilidade varia por título.\n\nLiquidez é D+0 (resgate no mesmo dia em horário comercial).
- `55`: Riscos e Segurança
- `57`: Risco Soberano (baixíssimo).\n\nAtenção à "Marcação a Mercado" nos títulos IPCA e Prefixados se resgatar antes do vencimento.
- `63`: • Tabela Regressiva de IR (22,5% a 15% conforme o tempo).\n\n• IOF (apenas se resgatar antes de 30 dias).\n\n• Taxa de Custódia B3: 0,20% ao ano (Isento para Selic até R\$ 10 mil).
- `67`: Como Começar
- `69`: 1. Abrir conta em corretora.\n\n2. Transferir recursos.\n\n3. Escolher o título (mínimo de ~R\$ 30,00).
- `175`: O investimento mais seguro do Brasil
- `251`: Lembre-se: O Tesouro Selic é o melhor lugar para sua Reserva de Emergência.

## lib/pages/finance_configuration_page.dart (43)
- `73`: Renda Fixa
- `74`: Seu salário mensal
- `80`: Renda Extra
- `81`: Freelances, gorjetas; entradas (ex.: PIX recebido) podem somar aqui pelo monitor de notificações.
- `96`: Valor do aluguel ou renda da casa
- `101`: Pensão
- `102`: Pensão alimentícia ou acordo judicial
- `107`: Condomínio
- `113`: Financiamento (imóvel)
- `114`: Prestação do financiamento habitacional
- `119`: IPTU (provisão mensal)
- `120`: Provisão mensal (IPTU e taxas do imóvel)
- `126`: Serviço de internet
- `132`: Água / esgoto
- `133`: Conta de água e esgoto
- `138`: Gás
- `139`: Botijão ou gás encanado
- `150`: Plano de saúde
- `151`: Mensalidade de plano ou convênio
- `156`: Educação (escola/curso)
- `169`: Transporte público / combustível
- `174`: Cartão
- `175`: Cartão de crédito (fatura/mínimo)
- `187`: Linha móvel ou fixa
- `192`: Assinaturas digitais
- `199`: Valor para reserva mensal
- `228`: Alinhar _campos (gastos) com kFinanceExpensePrefFieldNames.
- `290`: valor
- `349`: Configure suas Finanças
- `361`: 💰 SUA RENDA
- `376`: 📋 SEUS GASTOS FIXOS
- `408`: SALVAR E CONTINUAR
- `551`: Preencha ${campo.nome}
- `623`: 📈 TETO DO LIMITE DIÁRIO (GASTOS VARIÁVEIS)
- `633`: A fórmula usa renda, gastos fixos, saldo e dias no mês. O **teto** limita o guia 
- `634`: “Limite hoje”; o histórico e relatórios usam os gastos reais.\n
- `635`: • Vazio = teto padrão R\$ ${kDefaultDailySpendCapBrl.round()}\n
- `636`: • 0 = sem teto (mostra a fórmula inteira)\n
- `637`: Sugestões abaixo usam os valores **já guardados** (salva as finanças e reabre esta página para atualizar).
- `805`: DÉFICIT MENSAL
- `829`: Renda
- `830`: Gastos
- `849`: R\$ ${valor.toStringAsFixed(2)}

## lib/pages/historico_screen.dart (6)
- `64`: Histórico
- `77`: Faça login para ver o histórico
- `86`: data
- `121`: Nenhuma transação encontrada
- `224`: Editar categoria
- `234`: } ${LocalizationService.formatCurrency(t.valor)}

## lib/pages/home_screen.dart (3)
- `32`: Usuário
- `184`: Premium
- `630`: Mentor Premium

## lib/pages/mentoria/mentoria_lesson_screen.dart (8)
- `250`: Lección concluida. Mentor Score actualizado.
- `251`: Lição concluída. Mentor Score atualizado.
- `257`: Vídeo
- `262`: Escribe aquí...
- `269`: Preencha o checkpoint para concluir.
- `275`: Concluído
- `280`: Concluir lección
- `281`: Concluir lição

## lib/pages/mentoria/mentoria_screen.dart (17)
- `144`: ${MentoriaService.profileMentoriaTitleFor(profile, languageCode)}: ${strings.premiumReady}
- `612`: Mentoría
- `619`: Carregando sua trilha.
- `627`: Haz el Test de Perfil para liberar la ruta correcta para tu momento actual.
- `629`: Faça o Simulado de Perfil para liberar a trilha certa para seu momento.
- `637`: complete lições e checkpoints para evoluir seu score.
- `642`: Mentorship is Premium. Tap any module to view the plans.
- `645`: La mentoría es Premium. Toca cualquier módulo para ver los planes.
- `647`: Mentoria é Premium. Toque em qualquer módulo para ver os planos.
- `652`: Tu mentoría empieza por tu perfil
- `653`: Sua mentoria começa pelo seu perfil
- `661`: Un conservador, un moderado y un audaz no deben recibir la misma orientación. Haz el test para que Mentor monte la ruta correcta para tu momento actual.
- `663`: Um conservador, um moderado e um arrojado não devem receber a mesma orientação. Faça o teste para o Mentor montar a trilha correta para seu momento atual.
- `668`: Hacer Test de Perfil
- `669`: Fazer Simulado de Perfil
- `675`: Concluído
- `681`: Vídeo + leitura + checkpoint

## lib/pages/notification_monitoring_page.dart (4)
- `415`: Últimas leituras do listener
- `450`: Há uma notificação suspeita recente. Confira pelo app oficial do banco antes de considerar esse gasto como verdadeiro.
- `460`: Nenhuma leitura registada. Toque em atualizar após uma notificação 
- `461`: ou confira se o acesso a notificações está activo para o Mentor Financeiro.

## lib/pages/onboarding_page.dart (7)
- `27`: A maioria das pessoas trabalha pelo dinheiro, mas nunca aprende a fazer o dinheiro trabalhar por elas. Investir é o único caminho real para blindar seu futuro financeiro.
- `30`: Nossa Missão.
- `32`: Quero te pegar pela mão e mostrar que construir patrimônio é para qualquer um que tenha foco. Sem jargões de banco, sem letras miúdas. Apenas o caminho limpo.
- `35`: O Próximo Passo.
- `37`: Filtramos o ruído e sugerimos apenas as plataformas em que confiamos. Seu primeiro passo começa agora.
- `167`: Iniciar minha Jornada
- `187`: Próximo

## lib/pages/paywall_screen.dart (1)
- `217`: A compra foi enviada para a Google Play.

## lib/pages/quiz_conhecimento_page.dart (6)
- `146`: SIMULADO TÉCNICO
- `282`: MESTRE DOS INVESTIMENTOS!
- `292`: Parabéns! Você acertou todas as 12 perguntas!
- `338`: QUASE LÁ!
- `347`: Você acertou $score de 12 perguntas.\nRevise os tópicos com erros:
- `368`: VOLTAR AO INÍCIO

## lib/pages/relatorios_screen.dart (31)
- `91`: Alimentação
- `97`: Saúde
- `101`: Compras
- `110`: Alimentação
- `116`: Saúde
- `120`: Compras
- `200`: data
- `203`: data
- `204`: data
- `292`: Nota de Saúde Financeira
- `326`: Análise avançada (últimos 7 dias)
- `383`: Ver todas
- `395`: Sem dados (offline). Abra “Ver todas” quando estiver com internet.
- `598`: Nenhuma transação com este filtro. Use “Tudo” ou escolha outro tipo.
- `618`: Nenhuma transação encontrada
- `626`: Suas transações aparecerão aqui
- `646`: Débito
- `648`: Crédito
- `788`: ${transacoes.length} transações
- `791`: ${_formatarMoeda(mediaDiaria)}/dia
- `839`: GASTOS POR CATEGORIA
- `939`: USO DO CARTÃO (CRÉDITO VS DÉBITO)
- `955`: Crédito: ${_formatarMoeda(totalCredito)} (${credito.length})
- `959`: Débito: ${_formatarMoeda(totalDebito)} (${debito.length})
- `1011`: Crédito
- `1011`: Débito
- `1094`: ÚLTIMOS 7 DIAS
- `1109`: Meta: ${_formatarMoeda(_metaDiaria)}/dia
- `1361`: Editar categoria
- `1374`: + ${_formatarMoeda(transacao.valor)}
- `1375`: - ${_formatarMoeda(transacao.valor)}

## lib/pages/settings_page.dart (4)
- `37`: Usuário
- `59`: Usuário
- `916`: Simular Premium (Admin)
- `928`: Simulando Premium para o George...

## lib/pages/simulado_page.dart (2)
- `55`: perfil_investidor_atualizado_em
- `538`: Ações

## lib/pages/tela_estrategias.dart (16)
- `18`: Estratégias
- `29`: Divida sua renda: 50% para necessidades (aluguel, contas, alimentação), 30% para desejos (lazer, entretenimento), e 20% para economia e investimentos. Simples e eficiente.
- `35`: Reserve para investimentos antes de gastar com necessidades. Configure uma transferência automática para investimentos no dia do recebimento. Trate sua economia como uma conta a pagar.
- `41`: Antes de comprar algo não essencial, aguarde 90 dias. Se ainda quiser após esse período, compre. Isso evita compras por impulso e arrependimento.
- `45`: Metas SMART
- `47`: Defina metas: Específica, Mensurável, Alcançável, Relevante e com Prazo. Ex: "Guardar R\$5.000 para viagem em 12 meses" = R\$417/mês.
- `51`: Orçamento Base Zero
- `53`: Cada real tem um destino. Distribua toda a renda antes do mês começar. Nada fica "sem destino". O restante vai para economias.
- `57`: Diversificação de Investimentos
- `59`: Não coloque todos os ovos na mesma cesta. Diversifique entre renda fixa e variável para reduzir riscos e aumentar a resiliência.
- `63`: Método Acelerado
- `65`: Pague primeiras as dívidas com juros mais altos. Depois, redirecione esse pagamento para investimentos.
- `69`: Revisão Mensal
- `71`: No mesmo dia todo mês, revise seu orçamento. Compare o planejado com o realizado e aja para o próximo mês.
- `77`: Guarde 3-6 meses de despesas em renda fixa de alta liquidez. Use apenas em emergências reais como perda de emprego ou despesas médicas.
- `83`: Os juros rendem juros. Os rendimentos são reinvestidos. Pequenas quantias se tornam grandes valores no longo prazo. O tempo é seu maior aliado.

## lib/pages/tela_home.dart (1)
- `28`: Usuário

## lib/pages/tela_login.dart (37)
- `177`: O Mentor Financeiro está pronto para guiar sua jornada.
- `183`: Acompanhe gastos e limites
- `194`: Metas e Sonhos
- `212`: ENTRAR
- `221`: Escolha como quer continuar
- `229`: Continuar com Google
- `239`: Continuar com Apple
- `249`: Continuar com Email
- `265`: Ao continuar, você aceita nossos Termos de Uso e Política de Privacidade.
- `322`: QUAL É O SEU NOME?
- `331`: Como você gostaria\nde ser chamado?
- `375`: ESCOLHA SEU PLANO
- `386`: ✅ Configuração básica
- `387`: ✅ Cálculo automático de limite
- `388`: ✅ Conteúdo educacional
- `389`: ✅ Registro de gastos diário
- `390`: ✅ Simulador de metas
- `396`: PREMIUM
- `397`: 7 dias grátis na Play · depois a partir de R\$ 9,90/mês
- `401`: ✨ Relatórios mensais detalhados
- `402`: ✨ Gráficos avançados
- `403`: ✨ Insights automáticos
- `404`: ✨ Monitoramento de notificações compatíveis
- `405`: ✨ Sem anúncios
- `515`: Toque para experimentar com período gratuito
- `573`: Voltar
- `600`: COMEÇAR
- `600`: Continuar
- `635`: Digite seu nome!
- `661`: Não foi possível concluir o login com Google. Tente novamente em instantes.
- `698`: Sign in with Apple não disponível neste dispositivo.
- `725`: Sessão Apple sem utilizador.
- `757`: Não foi possível entrar com a Apple. Verifique a ligação “Sign in with Apple” no Firebase e nas capacidades do Xcode. 
- `802`: Entrar com Email
- `823`: Senha
- `920`: Login feito. A sincronização com a nuvem demorou e será retomada quando a conexão estabilizar.
- `931`: Login feito, mas não foi possível sincronizar o perfil agora. A sincronização será retomada automaticamente.

## lib/pages/tela_metas.dart (10)
- `27`: Preencha para calcular
- `28`: Carregando...
- `110`: (soma das rendas ativas − soma dos gastos fixos ativos na configuração).
- `113`: Indique acima o valor do objetivo em reais.
- `117`: Com sobra zero ou negativa, ajuste rendas e gastos fixos em «Renda e Gastos Fixos».
- `139`: Investindo R\$ ${aporteMensal.toStringAsFixed(2)}/mês\ncom ${taxa.toStringAsFixed(0)}%aa, você alcanza\nem $meses meses! 🚀
- `163`: Qual é o seu SONHO?
- `166`: Valor do Objetivo (R\$)
- `209`: SIMULADOR DE SONHOS
- `351`: CALCULAR E SALVAR

## lib/pages/tela_meu_perfil.dart (15)
- `36`: Plano Pro
- `37`: Plano Free
- `67`: perfilInvestidor
- `70`: isPremium
- `140`: Editar Perfil
- `153`: Profissão
- `179`: Perfil de Investidor
- `198`: O que você quer alcançar?
- `212`: Salvar
- `248`: Meu Perfil
- `344`: Profissão
- `345`: Não informado
- `356`: Perfil de Investidor
- `357`: Não definido
- `363`: Não informado

## lib/pages/tela_onboarding.dart (8)
- `11`: Substituído pelo fluxo Mentor em presentation/ + rotas nomeadas.
- `25`: Sua jornada financeira começa aqui
- `27`: Investir não é apenas para ricos. É para quem quer construir um futuro melhor. Comece com o que você tem, do seu jeito.
- `31`: Aprenda a investir do seu jeito
- `33`: Sem termos complicados ou juros compostos misteriosos. Explicamos tudo de forma simples, clara e sem enrolação.
- `39`: Tenha uma IA especializada para tirar suas dúvidas a qualquer momento. Investir nunca foi tão fácil.
- `191`: Começar a Investir
- `211`: Próximo

## lib/pages/tela_plataformas.dart (25)
- `23`: O maior banco digital do Brasil. Conta digital gratuitas, cartão com annuidade zero e rendimento Diário da conta.
- `24`: descricaoPremium
- `25`: Para abrir conta: baixe o app Nubank (iOS/Android) ou acessewww.nubank.com.br. Documentos: CPF e RG. Tempo: 5 minutos. Sem taxa de manutenção.
- `30`: Banco de Investimentos
- `32`: Um dos maiores bancos de investimentos do Brasil. Ótimas opções de renda fixa e fundos.
- `33`: descricaoPremium
- `34`: Oferece CDBs com taxas superiores ao CDI. Mínimode R\$1.000 para investir. Fundos de diversos perfis. Acesso via app ou HomeBroker.
- `38`: Itaú
- `39`: Banco Múltiplo
- `41`: Maior banco do Brasil. Segurança, variedade de produtos e rede de agências.
- `42`: descricaoPremium
- `43`: Conta corriente com taxa reduzida. Fundos de investimento com gestão profissional. Serviços integrados. App robusto e agências em todo o Brasil.
- `48`: Banco Múltiplo
- `49`: Grande banco internacional com presença global.
- `50`: descricaoPremium
- `51`: Conta Digital com mensalidade reduzida. Fundos Santander com diversas estratégias. Promoções frequentes de cashback. App e internet banking completos.
- `56`: Corretora de Investimentos
- `58`: Corretora com ótima plataforma para investimentos em renda variável.
- `59`: descricaoPremium
- `60`: HomeBroker moderno e gratuito para operar ações, FIIs e ETFs. Taxas reduzidas paraDay Trade. Análisesgrátis.Excelente para quem opera ativamente.
- `65`: Corretora de Investimentos
- `67`: descricaoPremium
- `68`: Taxas competitivas para operações de renda variável. PlatformaTrader completa. Análisetécnica integrada.Excelente custo-benefício.
- `121`: descricaoPremium
- `220`: Ver análise completa (Premium)

## lib/pages/tela_upgrade.dart (14)
- `71`: Mentor Premium
- `88`: Premium para organizar melhor seu dinheiro
- `98`: Recursos extras para acompanhar gastos, relatórios e gráficos com mais clareza.
- `187`: Plano Mensal
- `284`: Plano Anual
- `299`: MELHOR VALOR
- `311`: 12 meses pelo preço de 10: inclui 2 meses de Premium grátis
- `343`: 2 MESES GRÁTIS
- `355`: Economize R\$ 18,90 em relação ao plano mensal
- `391`: Continuar com versão gratuita
- `408`: Teste grátis de 7 dias para novos usuários. O teste pode ser usado uma única vez e não é renovável.
- `439`: O que está incluso
- `519`: Assinatura ativa! Bem-vindo ao Premium!
- `520`: Assinatura ativa! Premium liberado.

## lib/presentation/calculator/calculadora_mentora_screen.dart (4)
- `193`: Não foi possível salvar na nuvem (conexão ou permissão). O cálculo local permanece.
- `290`: Não perca seus cálculos, salve aqui!
- `310`: Aqui você vê sua riqueza crescendo
- `319`: Após calcular, o gráfico compara o que você investiu com os juros acumulados.

## lib/presentation/home/mentor_home_screen.dart (4)
- `146`: Juros compostos, inflação e conselhos no seu perfil
- `157`: Premium
- `199`: Análise Personalizada
- `220`: Mercado: internacional (${cat.effectiveCountryCode}) · cotações globais

## lib/presentation/intro/intro_tour_screen.dart (11)
- `44`: con organización, claridad y un paso a la vez. Respira: puedes lograrlo.
- `63`: Nunca abandones los principios y valores que elegiste para tu vida. 
- `65`: Cuidar tus finanzas también es cuidar a quienes amas.
- `83`: persistencia y pequeñas decisiones correctas repetidas cada día.
- `102`: o incluso demasiado felices. Mantén la calma. Piensa. Analiza. Es necesario. Es importante.
- `123`: Antes de gastar, invertir o comprometer dinero, pregúntate con honestidad: 
- `125`: y alineación con lo importante. Si las tres son verdaderas, avanza. 
- `147`: Para que las notificaciones de gastos, límite diario, historial, gráficos e informes 
- `148`: funcionen bien, completa Configurar finanzas (ingresos, gastos fijos, saldo) y 
- `150`: Cuanto más completo esté, mejor cumple la app su papel de mentor.
- `170`: Explora la app con curiosidad: Conocimiento, metas, simulados. 

## lib/presentation/persona/persona_setup_screen.dart (4)
- `43`: Seu perfil no Mentor
- `52`: Como você prefere receber orientações?
- `118`: Iniciante — linguagem simples e foco em segurança
- `124`: Poupador — preservação e previsibilidade

## lib/presentation/splash/splash_screen.dart (1)
- `161`: perfilCompleto

## lib/services/daily_spend_limit_notifier.dart (10)
- `27`: gastos_
- `28`: gastos_
- `83`: Limite diário ultrapassado
- `85`: Límite diario superado
- `88`: Gastos de hoje (${_fmt(spent)}) passaram do teu guia (${_fmt(limit)}). Abre o Mentor Financeiro para rever.
- `90`: Los gastos de hoy (${_fmt(spent)}) superaron tu guía (${_fmt(limit)}). Abre Mentor Financeiro para revisarlo.
- `95`: Perto do limite de gastos hoje
- `97`: Cerca del límite de gastos de hoy
- `100`: Já gastaste ${_fmt(spent)} de ${_fmt(limit)} (~${(ratio * 100).round()}%). Atenção ao teto do dia.
- `102`: Ya gastaste ${_fmt(spent)} de ${_fmt(limit)} (~${(ratio * 100).round()}%). Atención al techo del día.

## lib/services/google_play_billing_service.dart (11)
- `69`: As compras da Google Play não estão disponíveis neste dispositivo.
- `92`: Não foi possível carregar as opções de assinatura. Tente novamente em instantes.
- `105`: Não foi possível carregar este plano. Tente novamente em instantes.
- `119`: As compras da Google Play não estão disponíveis neste dispositivo.
- `126`: As opções de assinatura ainda estão carregando. Tente novamente em alguns segundos.
- `145`: Não foi possível abrir este plano. Tente novamente em instantes.
- `166`: Não foi possível iniciar a compra.
- `171`: Não foi possível abrir a compra na Google Play. Tente novamente em instantes.
- `175`: Não foi possível abrir a compra agora. Tente novamente em instantes.
- `197`: Erro de compra.
- `210`: Compra cancelada na Play Store.

## lib/services/investment_category_provider.dart (13)
- `81`: Cuenta de ahorro tradicional. Liquidez inmediata; el rendimiento suele quedar por debajo de la inflación en muchos países.
- `93`: Títulos públicos federales de Brasil. Considerados de bajo riesgo de crédito soberano en Brasil.
- `103`: Certificado de depósito bancario
- `105`: Certificado de depósito bancario de Brasil. Renta fija con protección del FGC hasta los límites legales.
- `115`: Letras de crédito inmobiliario y agro
- `117`: Letras de crédito inmobiliario y del agronegocio de Brasil. Exentas de IR para personas físicas bajo condiciones específicas.
- `127`: Fondos de inversión
- `129`: Cestas gestionadas por administradores. Perfil de riesgo variable, de conservador a agresivo.
- `141`: Participación en empresas cotizadas. Mayor retorno y volatilidad; exige tolerancia al riesgo.
- `153`: Fondos cotizados que replican índices como S&P 500 o MSCI. Diversificación con liquidez diaria.
- `165`: Bolsa fuera de Brasil, como NYSE o NASDAQ. La moneda y los impuestos dependen del país de la cuenta.
- `177`: Activos digitales volátiles. Sin fondo garantizador; adecuados solo para perfiles arriesgados.
- `189`: Títulos de deuda corporativa. Riesgo de crédito del emisor; cupones fijos o variables.

## lib/services/investment_news_service.dart (1)
- `97`: investimentos finanças mercado financeiro when:1d

## lib/services/local_transaction_store.dart (11)
- `33`: valor
- `35`: dataMillis
- `37`: categoria
- `42`: limiteDisponivel
- `62`: categoria
- `138`: valor
- `139`: dataMillis
- `144`: Gasto identificado
- `146`: Notificação Bancária
- `147`: categoria
- `152`: limiteDisponivel

## lib/services/locale_controller.dart (5)
- `12`: idioma
- `111`: Català
- `121`: Français
- `131`: Íslenska
- `169`: Türkçe

## lib/services/localization_service.dart (16)
- `16`: Dólar americano
- `19`: Dólar canadense
- `20`: Dólar australiano
- `21`: Dólar neozelandês
- `22`: Franco suíço
- `25`: Dólar de Hong Kong
- `26`: Dólar de Singapura
- `37`: Bolívar venezuelano
- `41`: Zlóti polonês
- `43`: Florim húngaro
- `50`: Novo shekel israelense
- `51`: Libra egípcia
- `57`: Rupia indonésia
- `61`: Novo dólar taiwanês
- `190`: Automática (idioma)
- `191`: Automática (idioma)

## lib/services/location_service.dart (2)
- `79`: necesitamos tu ubicación. Esto permite mostrar tasas equivalentes de 
- `80`: otros países y ayudarte a decidir entre invertir en Brasil o internacionalmente.

## lib/services/market_alert_service.dart (5)
- `68`: )} • +$extra alerta(s) no app
- `72`: Atualização do mercado
- `186`: } ${daily.abs().toStringAsFixed(1)}% hoje
- `242`: https://api.bcb.gov.br/dados/serie/bcdata.sgs.432/dados/ultimos/1?formato=json
- `251`: valor

## lib/services/mentoria_service.dart (348)
- `111`: Base, proteção emocional, reserva e primeiros investimentos sem pressa.
- `113`: Base, protección emocional, reserva y primeras inversiones sin prisa.
- `117`: Você mantém a base conservadora disponível e avança para crescimento com controle, diversificação e metas maiores.
- `119`: Mantienes la base conservadora disponible y avanzas hacia crecimiento con control, diversificación y metas mayores.
- `123`: Você mantém as trilhas anteriores disponíveis e avança para expansão, risco calculado e proteção contra excesso de confiança.
- `125`: Mantienes las rutas anteriores disponibles y avanzas hacia expansión, riesgo calculado y protección contra exceso de confianza.
- `174`: Estabilidade, clareza mental, reserva e hábitos. Esta base continua valendo quando você subir de nível.
- `176`: Crescimento com controle: diversificação, renda, metas maiores e preparo para oscilações.
- `178`: Risco com método: tese, execução, limites, revisão e proteção contra excesso de confiança.
- `231`: Mantén disponible la base conservadora y avanza hacia crecimiento controlado, diversificación y metas mayores.
- `233`: Mantén las rutas anteriores y avanza hacia riesgo calculado, mejor ejecución y control emocional.
- `240`: Mantenha a base conservadora disponível e avance para crescimento controlado, diversificação e metas maiores.
- `242`: Mantenha as trilhas anteriores e avance para risco calculado, execução forte e controle emocional.
- `268`: Estabilidad, claridad mental, reserva de emergencia y hábitos. Esta base sigue valiendo al subir de nivel.
- `270`: Crecimiento con control: diversificación, ingresos, metas mayores y preparación para oscilaciones.
- `272`: Riesgo con método: tesis, ejecución, límites, revisión y protección contra el exceso de confianza.
- `277`: Estabilidade, clareza mental, reserva de emergência e hábitos. Esta base continua valendo quando você sobe de nível.
- `279`: Crescimento com controle: diversificação, renda, metas maiores e preparo para oscilações.
- `281`: Risco com método: tese, execução, limites, revisão e proteção contra excesso de confiança.
- `386`: Você não está atrasado
- `386`: Você não está atrasada
- `387`: você está começando
- `387`: você está começando
- `388`: Você não está preso
- `388`: Você não está presa
- `417`: El perfil audaz
- `418`: el perfil audaz
- `447`: Estabilidade é seu primeiro patrimônio
- `449`: Para o perfil conservador, a prioridade é parar de agir no impulso. Antes de buscar retorno, construa clareza, controle e uma rotina financeira que você consiga manter.
- `451`: Registre gastos e renda antes de tomar decisões maiores.
- `452`: Evite promessas de ganho rápido e produtos que você não entende.
- `453`: Proteja seu foco: menos comparação, menos pressa, mais consistência.
- `457`: Escreva uma regra simples para esta semana: registrar gastos, adiar compras por 24h ou revisar assinaturas.
- `462`: Dinheiro seguro para não decidir no desespero.
- `464`: Sua primeira riqueza é dormir em paz
- `466`: A reserva de emergência deve ficar em produtos simples, líquidos e de baixo risco disponíveis no seu país. O objetivo é segurança, não rendimento máximo.
- `470`: Procure contas remuneradas, depósitos segurados, fundos monetários ou títulos públicos locais de baixo risco, conforme sua região.
- `472`: Meta de segurança
- `474`: Calcule quanto custa 1 mês da sua vida básica. Esse é seu primeiro alvo.
- `478`: Primeiros Investimentos
- `479`: Começar pequeno, entender bem e repetir.
- `483`: O conservador deve escolher produtos compreensíveis, regulados e compatíveis com seu país. O hábito de investir importa mais que tentar acertar o melhor produto.
- `485`: Entenda liquidez, prazo, risco, taxa e proteção legal antes de aplicar.
- `487`: Só avance para produtos voláteis depois de ter reserva e conhecimento.
- `489`: Aporte possível
- `491`: Defina um valor mensal realista para investir sem prejudicar suas contas.
- `499`: Equilibrar segurança e retorno sem perder a paz.
- `501`: Você pode crescer, mas precisa de trilhos
- `503`: O moderado já pode buscar retorno maior, mas precisa separar objetivos por prazo e limitar quanto aceita expor a oscilações.
- `506`: Use diversificação por classe, moeda e região quando fizer sentido.
- `509`: Divisão inicial
- `511`: Defina uma divisão entre segurança, crescimento e aprendizado.
- `515`: Diversificação Inteligente
- `516`: Não depender de uma única moeda, empresa ou produto.
- `518`: Diversificar não é comprar de tudo
- `520`: Diversificação é dar função para cada parte da carteira. Produtos locais, internacionais, renda fixa, fundos e ações podem ter papéis diferentes.
- `522`: Evite concentração em um único ativo ou setor.
- `523`: Compare risco, custo, liquidez e imposto na sua região.
- `524`: Rebalanceie com calendário, não com emoção.
- `526`: Função de cada ativo
- `528`: Escolha um investimento e escreva qual função ele cumpre na sua carteira.
- `532`: Oscilação sem Pânico
- `533`: Lidar com quedas sem abandonar o plano.
- `536`: Oscilação não é fracasso
- `540`: Não decida em dia de medo ou euforia.
- `541`: Tenha limite de exposição por classe de ativo.
- `542`: Revise sua carteira mensalmente, não a cada notícia.
- `546`: Escreva o que você fará quando um ativo cair 5%, 10% ou mais.
- `556`: Coragem sem método vira prejuízo
- `558`: O arrojado pode aceitar volatilidade, mas precisa de tese, limite de perda, horizonte e revisão. Sem isso, risco vira aposta.
- `562`: Defina limite máximo por ativo e por classe.
- `564`: Limite de risco
- `566`: Defina o percentual máximo do patrimônio que aceita expor a ativos de maior risco.
- `571`: Investir com motivo, métrica e plano de saída.
- `573`: Sem tese, você só está torcendo
- `575`: Antes de comprar um ativo volátil, escreva a lógica. Uma tese simples protege você de seguir moda, medo ou euforia.
- `578`: Compare preço, qualidade, risco e horizonte.
- `579`: Tenha diário de decisões para aprender com erros.
- `581`: Tese em uma página
- `583`: Escolha um ativo e escreva: motivo da entrada, limite de perda e condição de saída.
- `587`: Revisão e Evolução
- `591`: Quem não revisa repete erro caro
- `593`: O arrojado evolui quando erra menor, aprende rápido e protege o patrimônio enquanto busca crescimento.
- `596`: Separe decisão boa de resultado bom.
- `597`: Compare sua evolução com seu plano, não com a vida dos outros.
- `601`: Defina um dia fixo para revisar carteira, decisões e limites.
- `612`: Estabilidade é seu primeiro patrimônio
- `614`: Dinheiro seguro para não decidir no desespero.
- `616`: Sua primeira riqueza é dormir em paz
- `618`: Primeiros Investimentos
- `619`: Começar pequeno, entender bem e repetir.
- `623`: Equilibrar segurança e retorno sem perder a paz.
- `625`: Você pode crescer, mas precisa de trilhos
- `627`: Diversificação Inteligente
- `628`: Não depender de uma única moeda, empresa ou produto.
- `630`: Diversificar não é comprar de tudo
- `632`: Oscilação sem Pânico
- `633`: Lidar com quedas sem abandonar o plano.
- `635`: Oscilação não é fracasso
- `639`: Coragem sem método vira prejuízo
- `641`: Investir com motivo, métrica e plano de saída.
- `643`: Sem tese, você só está torcendo
- `645`: Revisão e Evolução
- `648`: Quem não revisa repete erro caro
- `658`: Estabilidade é seu primeiro patrimônio
- `661`: Dinheiro seguro para não decidir no desespero.
- `663`: Sua primeira riqueza é dormir em paz
- `665`: Primeiros Investimentos
- `666`: Começar pequeno, entender bem e repetir.
- `670`: Equilibrar segurança e retorno sem perder a paz.
- `672`: Você pode crescer, mas precisa de trilhos
- `674`: Diversificação Inteligente
- `674`: Diversificación Inteligente
- `675`: Não depender de uma única moeda, empresa ou produto.
- `677`: Diversificar não é comprar de tudo
- `678`: Diversificar no es comprar de todo
- `679`: Oscilação sem Pânico
- `679`: Oscilación sin Pánico
- `680`: Lidar com quedas sem abandonar o plano.
- `681`: Maneja caídas sin abandonar el plan.
- `682`: Oscilação não é fracasso
- `682`: La oscilación no es fracaso
- `685`: Busca mayor retorno sin confundir valentía con impulso.
- `686`: Coragem sem método vira prejuízo
- `687`: La valentía sin método se convierte en pérdida
- `688`: Tesis Antes de Entrar
- `689`: Investir com motivo, métrica e plano de saída.
- `690`: Invierte con motivo, métricas y plan de salida.
- `691`: Sem tese, você só está torcendo
- `691`: Sin tesis, solo estás esperando
- `692`: Revisão e Evolução
- `692`: Revisión y Evolución
- `695`: Quem não revisa repete erro caro
- `696`: Quien no revisa repite errores caros
- `871`: Para un perfil conservador, la prioridad es dejar de actuar por impulso. Antes de buscar rentabilidad, construye claridad, control y una rutina financiera sostenible.
- `873`: Registra ingresos y gastos antes de tomar decisiones mayores.
- `874`: Evita promesas de ganancias rápidas y productos que no entiendes.
- `875`: Protege tu foco: menos comparación, menos prisa y más constancia.
- `879`: Escribe una regla simple para esta semana: registrar gastos, aplazar compras 24 horas o revisar suscripciones.
- `884`: La reserva de emergencia debe estar en productos simples, líquidos y de bajo riesgo disponibles en tu país. El objetivo es seguridad, no rendimiento máximo.
- `886`: Primera meta: 1 mes de gastos esenciales.
- `887`: Siguiente meta: 3 a 6 meses de gastos esenciales.
- `888`: Busca cuentas aseguradas, fondos monetarios, bonos públicos de corto plazo o productos regulados de bajo riesgo en tu región.
- `892`: Calcula cuánto cuesta 1 mes de tu vida básica. Ese es tu primer objetivo.
- `897`: Un inversor conservador debe elegir productos comprensibles, regulados y adecuados a su país. El hábito de invertir importa más que encontrar el producto perfecto.
- `899`: Entiende liquidez, plazo, riesgo, comisiones y protección legal antes de invertir.
- `901`: Avanza hacia activos volátiles solo después de tener reserva y conocimiento.
- `910`: El perfil moderado puede buscar más retorno, pero necesita separar objetivos por plazo y limitar exposición a la volatilidad.
- `912`: Mantén reserva y corto plazo en productos de menor riesgo.
- `913`: Diversifica por clase de activo, moneda y región cuando tenga sentido.
- `916`: Asignación inicial
- `918`: Define una división entre seguridad, crecimiento y aprendizaje.
- `923`: Diversificar significa dar una función a cada parte de la cartera. Productos locales, globales, renta fija, fondos y acciones pueden tener roles diferentes.
- `925`: Evita concentración en un solo activo, país, moneda o sector.
- `926`: Compara riesgo, costo, liquidez e impuestos en tu región.
- `927`: Rebalancea con calendario, no con emoción.
- `929`: Función de cada activo
- `931`: Elige una inversión y escribe qué función cumple en tu cartera.
- `936`: El inversor moderado debe aceptar que parte de la cartera puede oscilar. El riesgo debe estar previsto antes de que llegue la caída.
- `938`: No decidas en días de miedo o euforia.
- `939`: Define límites de exposición por clase de activo.
- `944`: Escribe qué harás si un activo cae 5%, 10% o más.
- `949`: El perfil audaz puede aceptar volatilidad, pero necesita tesis, límite de pérdida, horizonte y revisión. Sin eso, el riesgo se vuelve apuesta.
- `951`: Escribe por qué entras, cuándo sales y qué invalida la tesis.
- `953`: Define un límite máximo por activo y por clase.
- `955`: Límite de riesgo
- `957`: Define el porcentaje máximo de patrimonio que aceptas exponer a activos de mayor riesgo.
- `962`: Antes de comprar un activo volátil, escribe la lógica. Una tesis simple te protege de la moda, el miedo y la euforia.
- `966`: Mantén un diario de decisiones para aprender de errores.
- `968`: Tesis en una página
- `970`: Elige un activo y escribe: motivo de entrada, límite de pérdida y condición de salida.
- `975`: La evolución viene de revisar decisiones, proteger capital y mejorar el comportamiento con el tiempo.
- `978`: Separa una buena decisión de un resultado con suerte.
- `983`: Elige un día fijo para revisar cartera, decisiones y límites.
- `1035`: Acordar para a Própria Vida
- `1041`: A versão antiga não paga a conta da versão nova
- `1045`: O primeiro passo do conservador não é correr atrás de risco. É recuperar direção. Sua vida financeira melhora quando você para de agir no automático e começa a escolher com consciência.
- `1048`: Você não está atrasado: você está começando com consciência.
- `1049`: A mudança começa na identidade: pare de se ver como alguém sem controle.
- `1050`: Paciência é proteção. Pressa costuma empurrar o conservador para decisões ruins.
- `1051`: Referência conceitual: Os Segredos da Mente Milionária, T. Harv Eker. A forma como você pensa sobre dinheiro influencia suas decisões.
- `1055`: Exercício de identidade
- `1057`: Escreva qual hábito financeiro antigo você vai abandonar esta semana e qual atitude simples vai colocar no lugar.
- `1065`: Dinheiro, tempo, atenção e energia precisam parar de escapar.
- `1070`: O que drena sua vida também drena seu dinheiro
- `1074`: Gasto ruim quase sempre nasce antes da compra: nasce no cansaço, na comparação, na ansiedade, na necessidade de aprovação ou no ambiente errado.
- `1077`: Evite fofoca, conteúdo negativo e ambientes que normalizam reclamação sem ação.
- `1078`: Estabeleça limites até com pessoas próximas quando elas sabotam sua evolução.
- `1079`: Nem todo convite merece seu dinheiro. Nem toda opinião merece sua energia.
- `1080`: Use a regra das 24 horas para compras emocionais.
- `1081`: Referência conceitual: Pai Rico, Pai Pobre, Robert Kiyosaki. Ativos fortalecem sua vida; passivos e hábitos ruins drenam seu caixa.
- `1087`: Liste 3 coisas que mais roubam seu dinheiro ou energia hoje. Corte ou limite uma delas nas próximas 24 horas.
- `1096`: Disciplina, limites e constância antes de qualquer investimento.
- `1101`: Sua mente tenta te manter onde você já está
- `1105`: A mente busca conforto, repetição e alívio rápido. Por isso disciplina não é sentimento: é decisão repetida mesmo quando a vontade falha.
- `1108`: Você não precisa ser perfeito. Precisa ser constante.
- `1109`: Não se culpe por errar; transforme o erro em dado e ajuste o comportamento.
- `1110`: Coloque-se em primeiro lugar de forma saudável: quem está destruído não consegue cuidar bem de ninguém.
- `1111`: Afastar-se de hábitos e conversas ruins não é arrogância. É proteção de foco.
- `1117`: Escolha uma regra simples para cumprir por 7 dias: não comprar por impulso, caminhar, dormir melhor ou registrar todos os gastos.
- `1126`: Energia física e clareza mental melhoram decisões financeiras.
- `1132`: Uma mente cansada compra mal
- `1136`: Problemas financeiros drenam saúde, sono, autoestima e relacionamentos. O caminho de volta começa com uma rotina simples que devolve controle.
- `1139`: Faça uma atividade física possível para sua realidade: caminhada já conta.
- `1140`: Coma melhor por estratégia, não por estética. Energia boa ajuda a decidir melhor.
- `1142`: Quem já venceu ou está vencendo costuma enxergar caminho onde a maioria só enxerga desculpa.
- `1146`: Rotina mínima de vitória
- `1148`: Defina uma rotina mínima para amanhã: horário para acordar, uma atividade física e uma revisão de gastos de 5 minutos.
- `1156`: Antes de crescer, parar de sangrar e criar segurança.
- `1161`: Sua primeira riqueza é dormir em paz
- `1165`: Para o conservador, reserva de emergência não é detalhe. É o alicerce emocional que permite tomar decisões sem desespero.
- `1170`: Priorize liquidez e baixo risco: Tesouro Selic, CDB com liquidez diária e instituições sólidas.
- `1171`: Não busque rendimento máximo antes de ter segurança mínima.
- `1172`: Referência conceitual: Do Mil ao Milhão, Thiago Nigro. Gaste bem, invista melhor e aumente sua renda com consistência.
- `1178`: Anote o valor de 1 mês dos seus custos essenciais. Esse será seu primeiro alvo de reserva.
- `1185`: Primeiros Investimentos Sem Medo
- `1186`: Começar com clareza, segurança e repetição.
- `1195`: Investir como conservador é aprender a confiar no processo. Você não precisa vencer o mercado amanhã; precisa construir o hábito de proteger e multiplicar aos poucos.
- `1198`: Entenda Selic, CDI, liquidez e prazo antes de buscar produtos novos.
- `1199`: Evite promessas de ganho rápido. O dinheiro que parece fácil costuma cobrar caro.
- `1200`: Aporte pequeno e constante vence empolgação sem método.
- `1201`: Seu objetivo agora é consistência: repetir o certo até virar identidade.
- `1205`: Aporte de confiança
- `1207`: Defina um valor pequeno e realista para investir todo mês, mesmo que seja R$ 10.
- `1214`: Preparação para Subir de Nível
- `1215`: Evoluir quando houver segurança, não ansiedade.
- `1221`: Confiança é construída, não fingida
- `1225`: Você não está preso ao perfil conservador. Ele representa seu momento atual. Quando sua reserva, rotina e entendimento amadurecem, você pode refazer o teste e avançar.
- `1228`: Sinais de evolução: reserva iniciada, menos compras emocionais, rotina mais estável e estudo constante.
- `1229`: Subir para moderado não é abandonar segurança. É crescer com método.
- `1230`: Você vai vencer se for dedicado, disciplinado e paciente. Respeite o processo.
- `1234`: Teste de evolução
- `1236`: Quando concluir esta trilha, refaça o Simulado de Perfil e veja se seu comportamento já mudou.
- `1247`: Ambição, método e proteção contra excesso de confiança.
- `1252`: Você já pode crescer, mas ainda precisa de trilhos
- `1256`: O perfil moderado precisa equilibrar segurança e movimento. A meta não é apostar mais; é construir uma estratégia que aguente oscilações sem destruir sua paz.
- `1260`: Separe objetivos por prazo: curto, médio e longo.
- `1261`: Use renda extra como acelerador, não como licença para gastar mais.
- `1262`: Aprofunde renda fixa, FIIs, ETFs e fundos de forma gradual.
- `1266`: Plano 70/20/10
- `1268`: Defina uma divisão inicial entre segurança, crescimento e aprendizado. Ajuste conforme sua realidade.
- `1275`: Ambiente de Evolução
- `1276`: Crescer exige uma nova régua de conversas, hábitos e metas.
- `1282`: Seu próximo nível pede outro ambiente
- `1286`: O moderado já entendeu que segurança importa, mas agora precisa conviver com ideias maiores. O ambiente certo não te empurra para aposta; ele te puxa para método, constância e visão.
- `1289`: Procure pessoas que falam de solução, não só de problema.
- `1290`: Troque parte do entretenimento automático por conteúdo de negócios, carreira e investimentos.
- `1291`: Evite tentar provar evolução para quem não quer evoluir junto.
- `1292`: Converse com pessoas que já fazem bem aquilo que você quer aprender.
- `1293`: Referência conceitual: Os Segredos da Mente Milionária, T. Harv Eker. O ambiente reforça padrões mentais e financeiros.
- `1299`: Liste 2 pessoas, canais ou ambientes que elevam sua visão e 2 que te puxam para trás. O que você vai reduzir esta semana?
- `1306`: Aumentar Renda com Estratégia
- `1307`: Renda extra deixa de ser improviso e vira plano.
- `1316`: No nível moderado, o jogo não é apenas cortar gastos. É aumentar a capacidade de gerar dinheiro e direcionar esse dinheiro para patrimônio.
- `1319`: Liste habilidades que podem virar serviço, produto, consultoria ou comissão.
- `1320`: Defina uma meta de renda extra para 60 dias, não para “um dia”.
- `1321`: Todo aumento de renda precisa de destino antes de cair na conta.
- `1322`: Use a ordem: quitar dívidas ruins, fortalecer reserva, investir e só depois aumentar padrão de vida.
- `1323`: Referência conceitual: Do Mil ao Milhão, Thiago Nigro. Enriquecer envolve gastar bem, investir melhor e ganhar mais.
- `1327`: Plano de renda extra
- `1329`: Escolha uma habilidade monetizável e defina uma primeira meta realista de renda extra para os próximos 60 dias.
- `1336`: Diversificação Inteligente
- `1337`: Sair do básico sem abandonar a segurança construída.
- `1342`: Diversificar não é comprar de tudo
- `1346`: Diversificar é distribuir risco com intenção. O moderado precisa crescer sem transformar curiosidade em bagunça.
- `1350`: Use médio e longo prazo para estudar FIIs, ETFs, renda fixa longa e fundos adequados.
- `1351`: Não compre um ativo só porque alguém falou bem dele.
- `1352`: Tenha uma razão para cada investimento: prazo, risco, objetivo e função na carteira.
- `1353`: Referência conceitual: Pai Rico, Pai Pobre, Robert Kiyosaki. O objetivo é construir ativos que fortaleçam sua liberdade.
- `1357`: Função de cada ativo
- `1359`: Escolha um investimento que você tem ou quer estudar e escreva: qual objetivo, prazo, risco e função dele na sua vida?
- `1367`: O moderado precisa aprender a oscilar sem abandonar o plano.
- `1373`: Oscilação não é fracasso
- `1377`: Quando você começa a buscar mais retorno, precisa aprender a lidar com variação. A pessoa moderada vence quando entende que processo vale mais que emoção do dia.
- `1380`: Defina antes o que faria você vender, manter ou comprar mais.
- `1381`: Não tome decisão importante em dia de medo ou euforia.
- `1382`: Acompanhe sua evolução mensal, não sua ansiedade diária.
- `1383`: Errar faz parte; repetir erro sem aprender é que custa caro.
- `1389`: Crie uma regra pessoal para não investir ou vender no calor da emoção. Exemplo: esperar 24 horas e revisar o motivo.
- `1396`: Preparação para o Próximo Nível
- `1397`: Ambição com maturidade antes de assumir mais risco.
- `1407`: O próximo nível não é pressa. É maturidade. Antes de assumir mais risco, você precisa provar para si mesmo que consegue executar, estudar, aportar e manter estabilidade emocional.
- `1410`: Tenha reserva montada ou em estágio avançado.
- `1411`: Tenha rotina de estudo e acompanhamento dos investimentos.
- `1412`: Tenha renda, metas e limites claros.
- `1413`: Refaça o teste apenas quando seu comportamento mudar, não apenas sua vontade.
- `1414`: Você vai vencer se respeitar o processo e continuar ajustando o caminho.
- `1418`: Pronto para avançar?
- `1420`: Escreva quais sinais mostram que você amadureceu financeiramente desde o perfil conservador.
- `1430`: Expansão com Risco Calculado
- `1431`: Execução forte, análise e proteção contra impulsividade.
- `1436`: Coragem sem método vira prejuízo
- `1440`: O arrojado pode buscar retornos maiores, mas precisa de processo. O maior risco deste perfil é confundir confiança com pressa.
- `1443`: Tenha tese, limite de perda e horizonte antes de entrar em qualquer ativo.
- `1446`: Estude negócios, valuation, ciclos de mercado e gestão emocional.
- `1452`: Escreva qual percentual máximo do patrimônio você aceita expor a ativos de maior risco.
- `1466`: Sem tese, você só está torcendo
- `1470`: Investimento arrojado não é impulso com nome bonito. Antes de comprar qualquer ativo volátil, você precisa ter uma tese simples, escrita e revisável.
- `1473`: Defina o motivo da entrada: crescimento, preço descontado, tendência, proteção ou assimetria.
- `1474`: Escreva o que faria você sair: perda de fundamento, limite de risco, mudança no ciclo ou erro na tese.
- `1475`: Separe oportunidade de ansiedade. Nem todo movimento do mercado exige reação.
- `1476`: Referência conceitual: O Investidor Inteligente, Benjamin Graham. Margem de segurança protege o investidor de excesso de confiança.
- `1480`: Tese em uma página
- `1482`: Escolha um ativo de maior risco e escreva: por que entraria, quanto aceitaria perder e qual fato invalidaria sua decisão.
- `1489`: Carteira Antifrágil
- `1490`: Crescer sem deixar um único erro destruir anos de construção.
- `1499`: O arrojado vence quando aceita que risco alto exige estrutura. Uma carteira forte tem caixa, proteção, diversificação e espaço controlado para assimetria.
- `1503`: Use percentuais máximos por classe e por ativo.
- `1504`: Não confunda diversificação com comprar tudo que aparece.
- `1505`: Rebalanceie com calendário, não com emoção.
- `1509`: Mapa de exposição
- `1511`: Defina o percentual máximo para renda variável, cripto, ativos internacionais e caixa. Escreva também o limite máximo por ativo.
- `1518`: Domínio Emocional
- `1530`: Quanto maior o risco, mais cara fica uma decisão emocional. O arrojado precisa criar regras para os dias em que estiver confiante demais ou assustado demais.
- `1533`: Não aumente posição depois de uma sequência de ganhos sem revisar a tese.
- `1534`: Não venda em pânico sem comparar preço, fundamento e horizonte.
- `1535`: Tenha diário de decisões para identificar padrões de erro.
- `1536`: Descanse antes de decisões grandes. Cansaço parece intuição, mas muitas vezes é ansiedade.
- `1540`: Regra de proteção emocional
- `1542`: Crie uma regra para dias de euforia e outra para dias de medo. Exemplo: esperar 24 horas antes de aumentar ou encerrar posição.
- `1549`: Revisão e Evolução
- `1557`: Quem não revisa repete erro caro
- `1561`: A evolução arrojada não vem de acertar sempre. Vem de errar menor, aprender mais rápido e proteger o patrimônio enquanto busca crescimento.
- `1565`: Separe resultado bom de decisão boa. Às vezes você ganha fazendo errado.
- `1566`: Compare sua evolução com seu plano, não com a vida dos outros.
- `1567`: Você vai vencer se mantiver disciplina, paciência e humildade para corrigir rota.
- `1573`: Defina um dia fixo do mês para revisar carteira, anotar decisões e ajustar percentuais sem agir por impulso.
- `1639`: Alerta do Mentor
- `1641`: Alerta del Mentor
- `1644`: Você passou do seu limite diário por 3 dias seguidos. Hoje, use a regra do “adiar 24h” e corte 1 gasto automático.
- `1646`: Superaste tu límite diario durante 3 días seguidos. Hoy, usa la regla de “esperar 24h” y corta 1 gasto automático.
- `1666`: rendaMensal
- `1672`: temInvestimentos
- `1691`: limiteTotalCartao
- `1713`: Tente manter seu uso abaixo de 30% para melhorar seu score bancário.
- `1723`: Alerta de Gastos
- `1725`: Você já usou ${(percentualGasto * 100).toStringAsFixed(0)}% do limite.
- `1744`: Suas compras hoje só serão pagas daqui a 40 dias!
- `1758`: Seu saldo não cobre a fatura de ${_formatarMoeda(valorFatura)}. Evite o crédito rotativo!
- `1766`: Atenção: Saldo Baixo
- `1768`: Seu saldo está baixo. Considere postergar compras não essenciais.
- `1794`: R\$ ${valor.toStringAsFixed(2)}
- `1812`: limiteTotalCartao
- `1846`: Uso responsável do crédito
- `1849`: Estourou o limite
- `1883`: Excelente! Você tem saúde financeira.
- `1887`: Atenção aos gastos.
- `1889`: Revise suas finanças.

## lib/services/notification_parser_service.dart (2)
- `21`: valor
- `23`: data

## lib/services/pending_renda_extra_confirmation_service.dart (4)
- `17`: pending_renda_extra_confirm_v1
- `47`: valor
- `70`: valor
- `103`: Detecté que recibiste un valor en tu cuenta. 

## lib/services/relatorio_pdf_exporter.dart (19)
- `15`: Crédito
- `15`: Débito
- `25`: dd/MM/yyyy 'às' HH:mm
- `62`: Relatório mensal
- `92`: Total do período
- `93`: Número de transações
- `94`: Média por dia (mês de $diasNoMes dias)
- `95`: Total em cartão de crédito
- `96`: Total em débito / outros
- `102`: Gastos por categoria
- `110`: Lista de transações (${ordenadas.length})
- `117`: Documento gerado pela app Mentor Financeiro. Os valores seguem a moeda de exibição configurada na app.
- `175`: Categoria
- `176`: Valor
- `221`: Data
- `222`: Descrição
- `223`: Categoria
- `225`: Valor
- `234`: ${(t.categoria ?? 

## lib/services/renda_extra_background_nudge.dart (5)
- `19`: renda_extra_last_nudge_ms
- `35`: Recebeste um valor
- `37`: Detectámos uma entrada de ${LocalizationService.formatCurrency(valor)}. 
- `38`: Abre o Mentor Financeiro e confirma se queres somar em Renda extra antes de 
- `39`: apagares a notificação do banco.

## lib/services/renda_extra_notification_increment.dart (2)
- `32`: configuracoes
- `33`: valor

## lib/services/subscription_provider.dart (6)
- `159`: isPremium
- `160`: premiumEndDate
- `161`: premiumEndDate
- `182`: Não foi possível abrir a Play Store.
- `308`: isPremium
- `310`: premiumEndDate

## lib/services/ticker_market_resolver.dart (1)
- `70`: Mercado não identificado

## lib/services/transaction_category_update_service.dart (1)
- `43`: categoria

## lib/services/user_data_retention_service.dart (12)
- `22`: configurado
- `25`: valor_sonho
- `26`: moeda
- `27`: idioma
- `28`: is_premium
- `29`: plano_contratado
- `45`: valor_
- `47`: gastos_
- `75`: data_retention_last_backup_at
- `76`: data_retention_last_restore_at
- `77`: data_retention_last_error
- `78`: data_retention_restored_schema_version

## lib/theme/theme_brand_assets.dart (3)
- `62`: Grimm: não usar bg_grimm como backdrop.
- `66`: Hive: não usar hive_bg como backdrop.
- `71`: Hive splash: não usar hive_bg.

## lib/widgets/ads/ad_conversion_cta.dart (1)
- `20`: Remova os anúncios e libere a Mentoria Completa. Seja Premium.

## lib/widgets/app_update_prompt_host.dart (2)
- `92`: Hay una nueva versión de Mentor Financeiro en la tienda. 
- `93`: Actualiza para recibir las últimas mejoras y correcciones.$versionLine

## lib/widgets/edit_transaction_category_sheet.dart (2)
- `100`: Categoria
- `165`: Guardar categoria

## lib/widgets/nota_saude_circle.dart (1)
- `146`: Saúde Financeira

## lib/widgets/patrimonio_convertido_card.dart (4)
- `32`: valor
- `48`: Património investido (registado)
- `58`: Ainda sem posições. Use “Registrar investimento” para somar aqui.
- `122`: ${pref.toStringAsFixed(2)} ($target — moeda da interface)

## lib/widgets/premium_cyber_paywall_dialog.dart (1)
- `68`: A compra foi enviada para a Google Play.

## lib/widgets/premium_wrapper.dart (5)
- `60`: Premium
- `85`: Recurso Premium
- `89`: Para acessar "$feature", você precisa ser assinante Premium.
- `96`: Agora não
- `112`: Ver Planos

