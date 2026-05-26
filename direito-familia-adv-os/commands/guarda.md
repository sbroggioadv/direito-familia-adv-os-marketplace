---
description: Aciona producao de peca em trilha de GUARDA (T6 originaria OU T7 modificacao) — acao de guarda + regulamentacao de convivencia + alimentos C/C tutela, modalidade compartilhada como regra (CC 1.584 §2º + Tema 1.137 STJ — REsp 1.878.041), unilateral em hipoteses de inaptidao (Lei 13.715/2018), modificacao por fato superveniente (rebus sic stantibus CC 1.586). Side-aware (requerente x requerido x detentor atual).
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [originaria | --modificacao | descricao livre]
---

Voce foi acionado pelo comando `/guarda` do plugin Direito-Familia-Adv-OS.

Argumento recebido: `$ARGUMENTS`

**Objetivo:** redigir peticao inicial OU defesa em trilha de **guarda**, classificando entre originaria (T6) e modificacao (T7), respeitando a Lei 13.058/2014 (compartilhada como regra), o Tema 1.137 do STJ, a clausula rebus sic stantibus (CC 1.586) quando aplicavel, e a oitiva especializada do menor (PA-14 — Lei 13.431/2017 + Res. 226/2024 CNJ + Res. 299/2019 CNJ).

## PROTOCOLO

1. **Confirmar polo do cliente** lendo o `CASO.md`: requerente / requerido / detentor de fato atual. Sem polo definido => **parar e perguntar** (PA-05 + PA-19).
2. **Classificar entre T6 e T7:**
   - **T6 — guarda originaria:** ainda nao ha sentenca ou acordo anterior de guarda. Acionar skill `guarda-originaria`.
   - **T7 — modificacao de guarda:** ja ha sentenca/acordo anterior; o operador quer alterar. Acionar skill `modificacao-guarda` (clausula rebus sic stantibus — exige **fato superveniente** provado).
   - Se o operador disser `--modificacao` no argumento, forcar T7.
3. **Aplicar P1** (Validador de Vigencia) antes de citar qualquer norma. Sem Selo, sem peca.
4. **Aplicar P2** (Integridade Documental):
   - **Originaria:** certidao de nascimento; RG/CPF do Autor; comprovante de residencia; despesas com o(s) filho(s); renda do Autor; estimativa de renda do Reu; mensagens/fotos (preservar via ata notarial CPC 384); relatorios escolares/medicos; BO se houver; plano parental sugerido.
   - **Modificacao:** sentenca/acordo anterior; prova do **fato superveniente** (BO, mensagens com ata, fotos, video, laudo); estudo psicossocial anterior se houver; diario de descumprimento se aplicavel.
   - **Sem doc essencial** => listar pendencias e NAO redigir.
5. **Aplicar P5** (Foro/Vara): foro do domicilio do menor (originaria) ou do detentor atual (modificacao) — Sumula 383 STJ. Vara de Familia onde houver, Civel onde nao.
6. **Aplicar P4** (Cruzamento Multi-esfera): violencia domestica? alienacao parental concomitante? abandono criminal? subtracao internacional (Conv. Haia 1980 — PA-12)? Acionar `cruzamento-multi-esfera`.
7. **Side-awareness (P6):**
   - Modo requerente => peticao inicial + tutela de urgencia (cuidado redobrado com tutela inversiva — REsp 2.108.750-GO/2024).
   - Modo requerido => contestacao (defender compartilhada como regra; melhores condicoes objetivas; capacidade emocional; continuidade do cuidado; impugnar estudo psicossocial via `laudo-psicossocial-analise`).
   - Modo detentor atual em modificacao => defesa pela **ausencia de fato novo** + **principio da continuidade** + proporcionalidade.
8. **PA-13** (melhor interesse como supraprincipio) + **PA-14** (oitiva especializada Lei 13.431/2017) sempre. Em casos com menor, **tom acolhedor reforcado**.
9. **PA-23** (anonimizacao reforcada) — segredo de justica CPC 189 II.
10. **P7** Suprema Corte R1-R4 antes de entregar — acionar `revisao-final-familia`.

**Skills acionadas:** conforme classificacao, `guarda-originaria` OU `modificacao-guarda`; sempre `validador-legislacao-vigente`, `cruzamento-multi-esfera`, `localizacao-vara-familia`, `memoria-de-caso-familia`, `revisao-final-familia`. Quando ha laudo psicossocial em disputa, encaminhar a `laudo-psicossocial-analise`.

**Bypass aceito:** `--no-corte`, `--quick` ou `/corte off` — saida sem R1-R4, com ressalva OAB reforcada e log em `<cwd>/direito-familia/.audit-log.json`. PAs (Camada 1) permanecem invioláveis.
