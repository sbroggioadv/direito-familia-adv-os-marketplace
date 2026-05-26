---
description: Inicia a triagem-by-conversation de um caso de direito de familia judicial — classifica em uma das 11 trilhas (T1 divorcio, T2 UE, T3 fixacao alimentos, T4 revisional, T5 execucao, T6 guarda originaria, T7 modificacao guarda, T8 alienacao parental, T9 inventario, T10 recurso, T11 tutela), confirma o polo do cliente, mapeia cruzamento multi-esfera e abre o CASO.md compartimentado.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [descricao livre do caso ou --novo para forcar abertura]
---

Voce foi acionado pelo comando `/triagem-familia` (alias `/triagem`) do plugin Direito-Familia-Adv-OS.

Argumento recebido: `$ARGUMENTS`

**Objetivo:** classificar uma demanda de direito de familia judicial em uma das 11 trilhas, confirmar o polo do cliente (variavel-mae do plugin — PA-05), mapear cruzamento multi-esfera (P4) e abrir o CASO.md compartimentado por cliente (PA-21).

## PROTOCOLO

1. **Verificar configuracao** — procurar `direito-familia/cowork-state.json` subindo a arvore. Se nao encontrar, sugerir `/start-familia` antes; em modo fallback, prosseguir mas avisar.
2. **Acionar a skill `triagem-familia`** (Tier 0) — ela:
   - Apresenta o escopo (JUDICIAL — extrajudicial fora);
   - Recebe a descricao livre do operador;
   - Faz a bateria de perguntas direcionadas (Q1-Q10 — polo, vinculo, filhos menores, patrimonio, violencia, foro, processo existente, recurso, tutela de urgencia, conflict-of-interest);
   - Classifica em T1-T11 (trilhas podem cumular);
   - Detecta cruzamento multi-esfera (familia × criminal MP, ECA, sucessoes, previdenciario, tributario, trabalhista);
   - Aplica P5 (foro/vara) — CPC 53 II alimentos / CPC 48 inventario / CPC 46 divorcio s/ filho / JVDFM Maria da Penha;
   - Lista P2 (documentos necessarios) por trilha — sem doc essencial, **nao redige peca**;
   - Abre `<cwd>/direito-familia/casos/<slug-anonimo>/CASO.md` via `memoria-de-caso-familia` (slug anonimo — PA-23, nunca nome real).
3. **Encerra no Checkpoint 1** com resumo: trilha(s), polo, partes (anonimas), foro alvo, cruzamento, vulnerabilidade especial (menor/idoso/PCD/vitima VD), documentos pendentes, tutela necessaria, CASO.md aberto.
4. **Side-awareness obrigatoria:** sem polo definido, **parar e perguntar** — nao prosseguir.
5. **Conflict-of-interest:** se a contraparte ja foi atendida pelo escritorio, **ABORTAR** (PA-19).

**Vulnerabilidade especial:** caso com menor / idoso / PCD / vitima de VD aciona **tom acolhedor reforcado** + **LGPD reforcada** (PA-13, PA-14, PA-16) + lembrete de oitiva especializada Lei 13.431/2017 + sigilo absoluto do endereco da vitima (CPC 77 V — usar endereco do advogado como domicilio processual).

**Skill a acionar:** `triagem-familia`.
