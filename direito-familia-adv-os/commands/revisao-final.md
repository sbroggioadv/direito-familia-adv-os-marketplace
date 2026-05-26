---
description: Aciona a skill `revisao-final-familia` (Tier 6 CRITICA) — Suprema Corte R1-R2-R3-R4. Toda peca/contestacao/recurso/parecer/orientacao do plugin DEVE passar por aqui antes da entrega ao advogado. Vereditos APROVADA / REVISAR / BLOQUEADA. Bypass disponivel sob responsabilidade do advogado.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [tipo da peca ou caminho do arquivo a revisar; opcional `--no-corte` ou `/corte off` para bypass]
---

Voce foi acionado pelo comando `/revisao-final` (alias `/revisao`) do plugin Direito-Familia-Adv-OS.

Argumento recebido: `$ARGUMENTS`

**Objetivo:** validar uma producao do plugin contra as 4 rodadas da Suprema Corte antes da entrega ao advogado.

## PROTOCOLO

1. **Identificar a producao alvo** — peca (peticao inicial, contestacao, recurso, tutela, impugnacao a laudo, parecer), valor de calculo, lista de documentos, ou qualquer entrega rotulada do plugin.

2. **Conferir bypass:**
   - Se `$ARGUMENTS` contem `--no-corte`, `--quick` ou `/corte off`, executar bypass:
     - **Pular** R1-R4;
     - Entregar a peca com aviso: "Atencao: peca entregue **sem revisao R1-R4** por solicitacao do advogado. Confira pessoalmente PAs, P1 e prazos antes de protocolar.";
     - Registrar bypass no CASO.md (P3) com data e responsavel.
   - Sem bypass, prosseguir com as 4 rodadas em sequencia.

3. **Acionar a skill `revisao-final-familia`** (Tier 6 CRITICA — Protocolo P7) — ela:
   - **R1 Brief** — objetivo claro, pedidos cumulaveis (P2), valor da causa, FIRAC presente, polo declarado em CASO.md (P6), tutela de urgencia sinalizada se aplicavel;
   - **R2 Conteudo** — fatos OBJETIVOS sem juizo moral (PA-01), subsuncao logica, pedido fecha com conclusao, memoria de calculo rastreavel (alimentos/partilha/ITCMD), citacoes integras com Selo P1, documentos referenciados;
   - **R3 Compliance (short-circuit BLOQUEADA)** — 25 PAs (Grupo A conduta, B coerencia processual, C localizacao/prescricao, D protecao especial supraprincipios, E deontologia OAB, F LGPD+sigilo), Selo P1, side-awareness coerente (P6), foro+vara corretos (P5), documentos validados (P2), cruzamento multi-esfera mapeado (P4), 7 Protocolos respeitados;
   - **R4 Performance** — persuasao, clareza CC art. 3, tom adaptado ao polo (autor/reu/menor/VD), ressalva OAB ao final (PA-07), fechamento profissional.

4. **Emitir veredito:**
   - **APROVADA** → carimbar **Selo R1-R4** com data + liberar entrega;
   - **REVISAR** (falha em R1, R2 ou R4) → devolver a producao com pontos abertos;
   - **BLOQUEADA** (falha em R3 — compliance) → cancelar entrega; gerar relatorio em `<cwd>/direito-familia/casos/<slug>/.revisao-bloqueada-[data].md`; orientar correcao na origem.

5. **Hook `prompt-intercept-corte.py`** injeta lembrete R1-R4 a cada producao. Se a skill produtora tentar fechar sem invocar esta revisao, o hook bloqueia.

**Atalhos:** `/revisao-final`, `/revisao`, `/corte`.

**Skill a acionar:** `revisao-final-familia`.
