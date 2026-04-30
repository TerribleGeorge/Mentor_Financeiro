# Guia — Segurança dos dados (Google Play Console)

Use este guia ao preencher **Política do app → Segurança dos dados** para o **Mentor Financeiro** (`com.georgeguimares.mentorfinanceiro`).  
Os caminhos na Console podem mudar; procure por “Segurança dos dados” / “Data safety”.

**URL da política (GitHub Pages):** https://terriblegeorge.github.io/Mentor_Financeiro/

**Regra de ouro:** o que você declarar deve **bater com o app real** e com a [Política de Privacidade](politica-privacidade-pt-BR.md). Se mudar o código depois, atualize o formulário e a política.

---

## Antes de começar

1. Ative o **GitHub Pages** (branch `main`, pasta `/docs`) no repositório e cadastre na Play a URL acima.  
2. Tenha em mão os links de privacidade da **Google (Firebase)** e da **RevenueCat**.

---

## Coleta de dados e segurança — respostas sugeridas

Marque **Sim, os dados coletados são compartilhados** quando indicado (terceiros como Google/RevenueCat tratam ou recebem dados).

### Informações pessoais

| Tipo | Coletado? | Finalidade | Opcional? | Criptografado em trânsito? |
|------|-----------|------------|-----------|----------------------------|
| **Nome** | Sim | Conta, perfil | Não (depende do fluxo de cadastro) | Sim |
| **E-mail** | Sim | Conta, comunicação | Não para login e-mail/senha | Sim |
| **IDs de usuário** | Sim (UID Firebase) | Conta, sincronização | Não quando logado | Sim |

### Informações financeiras

| Tipo | Coletado? | Finalidade | Observação |
|------|-----------|------------|------------|
| **Informações financeiras do usuário** (gastos, metas, valores que o usuário digita) | Sim | Funcionalidade principal | Armazenados no Firestore na coleção do usuário |
| **Histórico de compras** | Sim | Assinatura Pro | Via Google Play + RevenueCat |

### Mensagens (notificações lidas — recurso opcional)

Se o formulário tiver categoria para conteúdo de notificações ou “outras mensagens”:

- **Coleta:** apenas se o usuário ativar **Notification Listener** nas configurações do Android.  
- **Conteúdo:** título e texto de notificações filtradas (apps/padrões financeiros).  
- **Finalidade:** funcionalidades do App relacionadas a finanças.  
- **Opcional:** Sim.

Se não houver categoria perfeita, use a mais próxima que a Console oferecer e descreva na política de privacidade (já está na política em `docs/`).

### Localização

| Tipo | Coletado? | Finalidade |
|------|-----------|------------|
| **Localização aproximada** | Sim, se o usuário permitir | Contextualizar comparação de investimentos (ex.: Brasil vs exterior) |

Marque como **opcional** e **coletada apenas em uso** (foreground), se for o caso no app.

### Fotos e vídeos

| Tipo | Coletado? | Observação |
|------|-----------|------------|
| **Fotos** | Opcional | Usuário pode escolher imagem (ex.: fundo); armazenamento **local** no aparelho |

Na Console, se perguntarem “enviados para servidores”: para imagem de tema **local**, pode indicar que **não** são enviadas para seus servidores; confira se alguma tela envia foto ao Storage/Firestore.

### Identificadores do app e dispositivo

| Tipo | Coletado? | Finalidade |
|------|-----------|------------|
| **Token FCM** | Sim (quando notificações autorizadas) | Push |
| **Dados de diagnóstico / uso (Analytics)** | Sim | Firebase Analytics (eventos automáticos e agregados) |

---

## Terceiros que recebem ou processam dados

Declare na seção apropriada (ex.: “transferência para terceiros”):

- **Google Firebase** — Auth, Firestore, FCM, Analytics.  
- **RevenueCat** — assinaturas (associado ao ID do usuário / conta).  
- **Google Play** — cobrança.

---

## Práticas de segurança

Marque **dados criptografados em trânsito** (HTTPS/SDK Firebase).  
Para **dados em repouso no servidor**, siga o que a documentação do Firebase/Google permite declarar.

---

## Permissões sensíveis — correspondência com o app

| Permissão / recurso | Uso no Mentor Financeiro |
|---------------------|---------------------------|
| Internet | APIs e Firebase |
| POST_NOTIFICATIONS | Exibir notificações do próprio app |
| Localização | Opcional — comparativo de investimentos |
| **Notification Listener** | Opcional — ler texto de notificações de apps (filtro financeiro), só após o usuário ativar nas configurações do sistema |

Na Play Console, declare **recursos financeiros** ou **acesso a dados financeiros** conforme os questionários específicos que aparecerem para apps que tratam dados financeiros ou leem notificações bancárias.

---

## Declarações especiais

1. **Assistente / IA:** o projeto inclui dependência `google_generative_ai`; se **ainda não** houver envio de dados do usuário para modelos generativos na versão publicada, **não** declare coleta por IA até implementar e revisar. Quando implementar, atualize política + formulário (textos enviados à Google podem ser tratados conforme termos do produto).  
2. **LGPD:** a política em markdown está em português para usuários brasileiros; a Console é preenchida em inglês normalmente — mantenha os mesmos fatos nas duas línguas se tiver versão EN da política.

---

### Exclusão de dados sem obrigar exclusão de conta (pergunta opcional)

Se a Console perguntar se você oferece meio de excluir **parte** dos dados **sem** exigir exclusão da conta: como você atende pedidos por **george.guimares@gmail.com** e pode apagar categorias (ex.: só gastos/metas), pode marcar **Sim**. A política no GitHub foi atualizada com os passos e o que é mantido.  
Se você não quiser se comprometer com exclusão parcial manual, marque **Não** (mas a política já descreve o canal por e-mail para exclusão total e, quando possível, parcial).

---

## Checklist final

- [ ] URL da política de privacidade cadastrada e acessível sem login  
- [ ] Formulário de segurança dos dados alinhado à política  
- [ ] Conta / dados financeiros / localização / FCM / Analytics revisados  
- [ ] Recurso de **notificações bancárias** explicado na política e refletido nas declarações  
- [ ] RevenueCat e Firebase listados onde a Console pedir “SDKs” ou dados compartilhados  

Se a Google pedir vídeo ou texto extra sobre o uso de dados financeiros ou do leitor de notificações, use os trechos da política de privacidade como base.
