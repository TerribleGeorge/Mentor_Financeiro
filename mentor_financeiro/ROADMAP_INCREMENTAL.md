# Roadmap incremental — Mentor Financeiro

Marque com `[x]` cada passo quando estiver **concluído e verificado** (build/analyze/test sem erros novos).  
Objetivo: **nunca** ficar preso num único item gigante; cada caixa deve caber numa sessão curta.

---

## Hoje (sessão séria, fecho garantido)

- [x] **`dart analyze lib` sem issues** — corrigido `use_build_context_synchronously` em “Ver tour novamente” (`settings_page.dart`).
- [x] **`flutter test` a verde** — 14 testes OK nesta máquina.
- [x] **CI mínimo (GitHub Actions)** — `.github/workflows/flutter_ci.yml`: `pub get`, `dart analyze lib`, `flutter test` (paths `mentor_financeiro/**`). Confirmar no GitHub após o próximo push.
- [ ] **Documentar “último AAB”** — após o próximo `flutter build appbundle --release`, actualizar `BUILD_LAST_AAB.txt` (versão + data).

---

## Próximas sessões (uma caixa de cada vez)

### Qualidade e segurança

- [ ] Revisão rápida **Firestore rules** (leitura/escrita premium e dados do utilizador).
- [ ] **Crashlytics** / relatórios de erro: confirmar captura em release (sem bloquear arranque).
- [ ] Passar **strings óbvias** (ex.: definições, erros comuns) para **l10n** em blocos pequenos.

### Monetização Play

- [ ] Integração **`in_app_purchase`** (listar produto, comprar, `restore`) com UI mínima de teste.
- [ ] **Backend ou Cloud Function** para validar `purchaseToken` (não confiar só no cliente).
- [ ] Alinhar **IDs de produto** Play Console com constantes no código.

### DX

- [ ] **Dependências**: `flutter pub outdated` e bumps **um pacote de cada vez** com testes.
- [ ] Limpeza de **código morto** / imports (só ficheiros já tocados noutra tarefa).

---

## Legenda

| Estado   | Significado                          |
|----------|--------------------------------------|
| `[ ]`    | Por fazer                              |
| `[x]`    | Feito e verificado nesta sessão/repo |

**Última actualização deste ficheiro:** 2026-05-08 (analyze, test, CI no repo; AAB só após próximo build).
