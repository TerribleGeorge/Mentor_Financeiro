# Mentor Financeiro

O app de controle financeiro pessoal com inteligência artificial.

## 📱 Funcionalidades

- **Karine IA**: Assistente virtual que ajuda a controlar suas finanças
- **Controle de Gastos**: Registro diário de gastos com categorias
- **Metas Financeiras**: Planeje seus sonhos e objetivos
- **Limite Diário**: Cálculo automático baseado nas suas receitas e despesas
- **Simulado de Perfil**: Questionnaire para descobrir seu perfil de investidor (conservador, moderado ou arrojado)
- **Simulado de Conhecimento**: Quiz técnico com 12 perguntas sobre investimentos
- **Hub de Conhecimento**: Artigos e guias sobre investimentos, estratégias, dicionário financeiro e mais
- **Login Seguro**: Google ou conta anônima
- **Dados na Nuvem**: Sincronizado com Firebase

## 🛠️ Tecnologias

- **Flutter** - Framework multiplataforma
- **Firebase** - Backend (Auth, Firestore, Analytics, Messaging)
- **Google AI** - Gemini API para a Karine

## 🚀 Começando

1. Clone o repositório
2. Execute `flutter pub get`
3. Configure o Firebase (veja abaixo)
4. Execute `flutter run`

## 🔧 Configuração Firebase

1. Crie um projeto no [Firebase Console](https://console.firebase.google.com/)
2. Adicione um app Android com package: `com.example.mentor_financeiro`
3. Baixe o `google-services.json` e coloque em `android/app/`
4. Ative **Authentication** (Google + Anônimo)
5. Crie o banco **Firestore** (São Paulo)

## 📋 requirements

- Flutter SDK 3.x
- Dart 3.x
- Conta Google para Firebase

## 📄 Licença

MIT License