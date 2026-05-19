# Segurança - Mentor Financeiro

**Última atualização:** 19 de maio de 2026

Esta página explica as práticas de segurança do Mentor Financeiro em linguagem direta. Ela complementa a Política de Privacidade e os Termos de Uso.

## 1. Compromisso de segurança

O Mentor Financeiro foi desenvolvido para ajudar na organização financeira sem pedir acesso direto a conta bancária, sem solicitar senha bancária e sem funcionar como banco, corretora ou meio de pagamento.

O app pode armazenar dados financeiros informados por você ou identificados por recursos opcionais, por isso tratamos segurança como parte central do produto.

## 2. O que o app não faz

- Não pede senha de banco, cartao ou carteira digital.
- Não acessa sua conta bancária.
- Não movimenta dinheiro.
- Não faz pagamentos, Pix, transferências ou investimentos em seu nome.
- Não solicita código de segurança de cartao.
- Não solicita código OTP de banco.
- Não vende seus dados pessoais.

## 3. Medidas técnicas usadas

Conforme o recurso utilizado, o app pode usar:

- Login por Firebase Authentication.
- Cloud Firestore com dados associados ao usuário autenticado.
- Regras de segurança para restringir acesso aos dados do próprio usuário.
- Comunicacao criptografada pelos SDKs e serviços utilizados.
- Firebase Crashlytics para identificar falhas técnicas e corrigir problemas.
- Permissões do Android solicitadas somente quando relacionadas a recursos do app.
- Armazenamento local para preferências, tema, cache e dados do aparelho.

## 4. Monitoramento de notificações

O monitoramento de notificações é opcional e exige ativacao manual no Android.

Quando ativado, o app pode ler notificações compatíveis para reconhecer gastos, compras, pagamentos, assinaturas e transferências. O objetivo e reduzir trabalho manual ao registrar despesas.

Para reduzir riscos:

- O app informa o motivo da permissao antes de direcionar você para as configurações.
- O acesso pode ser revogado a qualquer momento nas configurações do Android.
- O filtro busca eventos financeiros compatíveis, não conversas pessoais.
- O app tenta ignorar códigos OTP, senhas, códigos de segurança e mensagens de autenticação.
- O app não usa esse recurso para entrar em bancos, cartoes ou carteiras digitais.

Mesmo assim, notificações podem conter dados sensiveis. Use esse recurso apenas se você concordar com esse tipo de processamento.

## 5. Permissões sensiveis

O app pode solicitar:

- **Internet:** conexao com Firebase, Google Play, APIs e recursos online.
- **Notificações:** envio de alertas do próprio app.
- **Localização:** adaptacao de conteúdos ou comparações ao país/regiao, quando autorizado.
- **Acesso a notificações do Android:** identificação opcional de gastos a partir de notificações compatíveis.
- **Compras no app:** assinatura Premium pela Google Play.

Você controla essas permissões nas configurações do Android.

## 6. Sua parte na segurança

Para proteger seus dados:

- Use bloqueio de tela no aparelho.
- Não compartilhe sua conta.
- Mantenha o app é o Android atualizados.
- Revogue permissões que não deseja mais usar.
- Confira transações identificadas automaticamente antes de tomar decisões.
- Não cadastre informações que você não deseja manter no aplicativo.
- Cancele assinaturas diretamente na Google Play quando não quiser renovação.

## 7. Limitacoes

Nenhum aplicativo, servidor, sistema operacional ou servico de nuvem e 100% seguro. Apesar das medidas adotadas, podem ocorrer falhas, indisponibilidade, erros de sincronização, perda de acesso, problemas de terceiros ou tentativas externas de abuso.

O Mentor Financeiro busca reduzir riscos de forma razoavel, mas você deve manter copias ou controles próprios das informações financeiras essenciais.

## 8. Incidentes e contato

Se você perceber comportamento estranho, acesso indevido, dado incorreto, suspeita de falha de segurança ou problema com permissao sensivel, entre em contato:

**george.guimares@gmail.com**

Inclua, se possível:

- Modelo do aparelho.
- Versão do Android.
- Versão do app.
- Descricao do problema.
- Capturas de tela sem expor senhas, códigos ou dados excessivos.


