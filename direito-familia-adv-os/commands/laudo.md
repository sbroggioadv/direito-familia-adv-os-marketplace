---
description: Aciona a skill `laudo-psicossocial-analise` (Tier 6) para analise critica de laudo psicossocial em acao de familia (guarda, AP, abuso, modificacao) com produca de impugnacao (CPC 477 §1º) + roteiro de quesitos do assistente tecnico (CPC 466 §1º) + estrutura do contra-laudo (CPC 479).
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [caminho do laudo OU descricao do laudo a analisar]
---

Voce foi acionado pelo comando `/laudo` do plugin Direito-Familia-Adv-OS.

Argumento recebido: `$ARGUMENTS`

**Objetivo:** analisar criticamente um laudo psicossocial juntado em acao de familia e produzir (a) impugnacao tecnica CPC 477 §1º; (b) roteiro de 15 quesitos do assistente tecnico CPC 466 §1º; (c) estrutura do contra-laudo do AT.

## PROTOCOLO

1. **Verificar contexto** — checar `direito-familia/casos/<slug>/CASO.md` aberto. Sem caso, sugerir `/triagem-familia` antes.

2. **Confirmar PA-24 — sigilo absoluto do laudo:**
   - Conteudo nao replicado em arquivo distribuido;
   - Trechos do laudo so aparecem em peca processual (impugnacao);
   - Sigilo profissional do psicologo perito (CFP Res. 001/2009) + dado sensivel LGPD art. 11 respeitado.

3. **Confirmar PA-18 — sem opiniao clinica:**
   - Plugin aponta vicios PROCESSUAIS e METODOLOGICOS;
   - **NAO** discorda de diagnostico clinico — quem analisa acerto clinico eh o assistente tecnico (outro psicologo).

4. **Acionar a skill `laudo-psicossocial-analise`** (Tier 6) — ela:
   - Aplica o marco legal (CPC 156-158/464-480/477/699 + Res. CFP 008/2010 + Res. CNJ 299/2019 e 226/2024 + Lei 13.431/2017 + Lei 12.318 art. 5º);
   - Roda o **checklist analitico de 10 passos** (formacao do perito, tempo, paridade, oitiva especializada, testes validados, quesitos respondidos, fundamentacao bibliografica, limites Res. CFP 008, vieses, contradicoes);
   - Produz **impugnacao FIRAC** com tempestividade (prazo de 15 dias da intimacao da juntada — CPC 477 §1º);
   - Produz **15 quesitos do AT** (4 sobre a crianca, 4 sobre cada genitor, 2 sobre vinculo, 3 sobre contexto, 2 sobre intervencoes);
   - Produz **estrutura do contra-laudo** para o AT;
   - Sinaliza pedidos alternativos (esclarecimentos / complementacao / nova pericia CPC 480).

5. **Side-awareness obrigatorio:** confirmar polo do cliente em CASO.md antes (P6).

6. **Encaminhar para `revisao-final-familia` (R1-R4)** antes de protocolar — peca de impugnacao **passa por R3 Compliance** especialmente para honrar PA-18 e PA-24.

**Atalho:** `/laudo`.

**Skill a acionar:** `laudo-psicossocial-analise`.
