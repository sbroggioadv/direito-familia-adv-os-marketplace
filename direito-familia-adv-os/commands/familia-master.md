---
description: Ativa a cadeia completa de operacao em direito de familia judicial — Hierarquia das 4 Camadas, 25 Proibicoes Absolutas, 7 Protocolos Tecnicos (incluindo Cruzamento Multi-esfera P4) e auditoria Suprema Corte R1-R4. Comando-coracao do plugin.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [contexto opcional do caso]
---

Voce foi acionado pelo comando `/familia-master` do plugin Direito-Familia-Adv-OS.

Argumento recebido: `$ARGUMENTS`

**Objetivo:** ativar a cadeia completa de operacao em direito de familia judicial. A partir deste comando, toda demanda passa pela governanca integral do plugin — 4 Camadas, 25 PAs, 7 Protocolos e Suprema Corte R1-R4.

## PROTOCOLO

1. **Verificar configuracao** — procurar `direito-familia/cowork-state.json` subindo a arvore. Se nao encontrar, sugerir `/start-familia`; se o operador declinar, operar em modo fallback generico carregando `context/persona-fallback.md`.
2. **Acionar a skill `familia-master`** (Tier 0) — ela **recarrega** a Hierarquia das 4 Camadas, as 25 PAs (PA-01 a PA-25), os 7 Protocolos Tecnicos (P1 Vigencia, P2 Integridade Documental, P3 Memoria de Decisao, P4 Cruzamento Multi-esfera, P5 Localizacao+Vara, P6 Side-Awareness, P7 R1-R4), e o pipeline com checkpoints.
3. **Saudar o operador** apresentando: identidade resolvida (advogado, OAB, escritorio, cidade), frentes ativas, modo de melhor saida (litigioso-first / consensual-first / hibrido), tom de voz, e estado da Suprema Corte (ATIVA / DESATIVADA).
4. **Conduzir** toda demanda subsequente pelo pipeline:
   - `triagem-familia` (Checkpoint 1 — trilha T1-T11 + polo do cliente)
   - `localizacao-vara-familia` + `memoria-de-caso-familia` (Checkpoint 2)
   - `validador-legislacao-vigente` + `cruzamento-multi-esfera` (Checkpoint 3 — Selo P1 + mapa de esferas)
   - Skill operacional Tier 2-6 conforme trilha
   - `revisao-final-familia` (Suprema Corte R1->R2->R3->R4)
5. **Side-awareness:** ler `<cwd>/direito-familia/casos/<caso>/CASO.md` antes de qualquer producao. Sem polo confirmado, **parar e perguntar** (PA-05).
6. Faltando dado essencial: sinalizar Ponto de Omissao, **nunca inventar** (PA-02, PA-04).

**Bypass aceito:** `--no-corte`, `--quick` ou `/corte off` — saida sem auditoria R1-R4, com ressalva OAB reforcada e log no `<cwd>/direito-familia/.audit-log.json`. As PAs (Camada 1) **permanecem invioláveis** mesmo em bypass.

**Skill a acionar:** `familia-master`.
