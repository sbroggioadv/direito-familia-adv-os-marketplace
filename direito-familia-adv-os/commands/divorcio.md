---
description: Atalho da trilha T1 — divorcio litigioso. Aciona peticao-inicial-divorcio (side-aware MODO AUTOR ou MODO REU conforme polo no CASO.md). Cumula tipicamente guarda, alimentos, partilha, uso do nome e tutela de urgencia (alimentos provisorios, guarda provisoria, afastamento do lar via CC 1.562 ou Lei 11.340 art. 22, sequestro/arrolamento CPC 301). Aplica P1 (Selo de vigencia), P2 (integridade documental), P5 (foro CPC 53 I), P6 (side-awareness), P7 (R1-R4).
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [descricao livre do caso ou --modo-reu para forcar contestacao]
---

Voce foi acionado pelo comando `/divorcio` do plugin Direito-Familia-Adv-OS (trilha **T1 — Divorcio litigioso**).

Argumento recebido: `$ARGUMENTS`

**Objetivo:** produzir peticao inicial (MODO AUTOR) ou contestacao cruzada (MODO REU) em divorcio litigioso, alinhada ao polo do cliente registrado no CASO.md (PA-05 + P6).

## PROTOCOLO

1. **Verificar CASO.md** — abrir `<cwd>/direito-familia/casos/<slug>/CASO.md`. Sem CASO.md aberto, acionar `/triagem-familia` antes. Sem polo definido, **pare e pergunte** — nao supor.
2. **Acionar a skill `peticao-inicial-divorcio`** (Tier 2A). Ela:
   - Le o polo (autor ou reu) e flipa para MODO AUTOR ou MODO REU
   - Aciona `validador-legislacao-vigente` (P1) para CC 1.571-1.582, CC 1.639-1.688, EC 66/2010, CPC 693-699, Lei 5.478/68 art. 4º, Lei 11.340, Lei 13.058/2014, Sum. 277/358 STJ, 377/380/382 STF, Temas 809/1.063/1.236
   - Aplica P2 — checklist documental (CPC 320). Sem doc essencial, NAO redige
   - Aplica P5 — foro CPC 53 I (a guardiao do incapaz; b ultimo domicilio do casal; c domicilio do reu; d vitima de VD)
   - Estrutura FIRAC bloco a bloco (Camada 3 — `estilo-juridico-familia`)
   - Cumula pedidos cabiveis: divorcio, guarda compartilhada (regra), convivencia, alimentos (filhos e/ou ex-conjuge), partilha, uso do nome (CC 1.578 — manutencao regra), alimentos compensatorios (CC 1.694 §2º + Enunciado 573 CJF)
   - Pede tutela de urgencia: alimentos provisorios (Lei 5.478 art. 4º — urgencia presumida); guarda provisoria (CC 1.585 + 1.586 — melhor interesse PA-13); afastamento do lar via CC 1.562 ou Lei 11.340 art. 22 II (preferir LMP em VD); sequestro/arrolamento (CPC 301)
   - Anota memoria de calculo de alimentos e partilha (Camada 3)
   - Em MODO REU: gera preliminares (CPC 337), teses defensivas e reconvencao quando cabivel (CPC 343)
3. **Aciona `revisao-final-familia`** (P7) antes de entregar — R1/R2/R3/R4 (Suprema Corte). Veredito BLOQUEADA cancela a producao.
4. **Atualizar CASO.md** ao final (P3 — memoria de decisao).

**Vedacoes nucleares:** PA-01 (sem juizo moral — EC 66/2010 culpa-neutral); PA-06 (segredo CPC 189 II); PA-13 (melhor interesse como supraprincipio); PA-19 (sem advocacia contra cliente); PA-23 (anonimizacao em prints).

**Skill a acionar:** `peticao-inicial-divorcio`.
