# Caso {{CASO_SLUG}}

> Ficha do caso de direito de familia. **Fonte unica** das variaveis de
> **polo** e **tipo de acao** — todas as skills leem este arquivo. Vive em
> `<COWORK>/direito-familia/casos/{{CASO_SLUG}}/CASO.md`.
>
> **Compartimentacao (PA-21):** este `CASO.md` cobre **apenas este caso**.
> Nunca misturar dados de outro caso aqui. Skills `memoria-de-caso-familia`
> opera com escopo isolado.
>
> **Segredo de justica (CPC art. 189) + ECA + LGPD:** dado real do cliente
> permanece aqui (pasta local, gitignored). Em qualquer saida externa,
> aplicar PA-23 (anonimizacao) — crianca vira `[MENOR ANONIMIZADO]`,
> nome civil vira token, CPF/RG mascarado, endereco protegido.

---

## Identificacao do caso

- **Slug do caso:** {{CASO_SLUG}}
- **Tipo de acao:** {{TIPO_ACAO}}
  <!-- divorcio-litigioso | uniao-estavel-reconhecimento-dissolucao |
       alimentos-fixacao | alimentos-revisional | alimentos-exoneracao |
       alimentos-execucao | guarda-originaria | modificacao-guarda |
       alienacao-parental | inventario-judicial-itcmd | laudo-psicossocial -->
- **Polo do cliente:** {{POLO}}
  <!-- autor | reu | alimentante | alimentando | guardiao | nao-guardiao |
       requerente | requerido | vitima | acusado (Maria da Penha) -->
- **Foro / vara / comarca:** {{FORO}}
  <!-- ex: 3a Vara de Familia da Comarca de Sao Jose do Rio Preto/SP |
       JVDFM (Lei 11.340 — se cumulacao) | Vara dos Orfaos (inventario, onde
       houver) | [VERIFICAR — norma local] -->
- **Numero do processo:** {{NUMERO_PROCESSO}}
  <!-- formato CNJ ou `pre-processual` se ainda nao ajuizado -->
- **Fase processual:** {{FASE}}
  <!-- pre-processual | conhecimento 1o grau | recursal | liquidacao |
       cumprimento de sentenca | execucao | inventario fase declaracoes |
       inventario fase partilha -->
- **Tipo de tarefa em curso:** {{TAREFA}}

---

## Partes (dados internos — anonimizar externamente PA-23)

### Cliente (parte atendida)
- **Nome:** {{CLIENTE}}
- **CPF:** {{CLIENTE_CPF}}
  <!-- internamente real; externamente mascarado XXX.XXX.XXX-XX -->
- **Endereco:** {{CLIENTE_ENDERECO}}
  <!-- externamente: [ENDERECO PROTEGIDO] -->
- **Telefone/email:** {{CLIENTE_CONTATO}}

### Contraparte
- **Nome:** {{CONTRAPARTE}}
- **CPF:** {{CONTRAPARTE_CPF}}
- **Procurador (se conhecido):** {{CONTRAPARTE_PROCURADOR}}

### Filhos envolvidos (se aplicavel)
<!-- LISTAR INTERNAMENTE COMO TEXTO PLANO. EXTERNAMENTE: [MENOR ANONIMIZADO #1],
     [MENOR ANONIMIZADO #2]. NUNCA repetir nome de menor em peca distribuida
     ou snippet de exemplo. -->

- **Filho 1:** {{FILHO_1_NOME}} ({{FILHO_1_IDADE}} anos) — {{FILHO_1_OBS}}
- **Filho 2:** {{FILHO_2_NOME}} ({{FILHO_2_IDADE}} anos) — {{FILHO_2_OBS}}

### Vulnerabilidades acionadas
- **Menor envolvido:** {{HA_MENOR}} <!-- sim | nao -->
- **Vitima de violencia:** {{HA_VIOLENCIA}} <!-- sim | nao -->
- **Idoso envolvido:** {{HA_IDOSO}}
- **PcD envolvido:** {{HA_PCD}}
- **Segredo de justica decretado:** {{SEGREDO_JUSTICA}} <!-- sim | nao -->

> Se `HA_MENOR` ou `HA_VIOLENCIA` for `sim`, todas as skills elevam tom
> acolhedor automaticamente e ativam anonimizacao reforcada em saidas
> externas.

---

## Marco intertemporal

- **Marco da uniao/casamento:** {{MARCO_INICIO_UNIAO}}
  <!-- data de casamento, inicio da UE comprovada, mudanca de regime -->
- **Marco de cessacao da convivencia:** {{MARCO_FIM_UNIAO}}
  <!-- data da separacao de fato — base para partilha CC 1.642 V -->
- **Regime de bens:** {{REGIME_BENS}}
  <!-- comunhao parcial (default) | comunhao universal | separacao total |
       participacao final nos aquestos | regime convencional -->

---

## Linha do tempo de decisoes processuais (P3 — Memoria de Decisao)

> Cada decisao registrada com data, decisao, fundamento (artigo + jurisprudencia) e alternativa descartada (quando houver). NUNCA recriar fundamento em consulta posterior — usar a memoria.

| Data | Decisao tomada | Fundamento (artigo + jurisprudencia) | Alternativa descartada e motivo |
|------|----------------|--------------------------------------|--------------------------------|
| {{GENERATED_AT}} | Caso aberto — polo {{POLO}}, tipo {{TIPO_ACAO}} | Triagem da `triagem-familia` | — |

<!-- Exemplo de linha:
| 2026-05-26 | Opcao por rito comum CPC 693 ao inves de Lei 5.478/68 |
   CPC art. 693 + REsp 1.622.337/SP | Lei 5.478 descartada — sem prova
   pre-constituida de parentesco no inicio |
-->

---

## Checklist de documentos (P2 — Integridade Documental)

> Lista dos documentos em `casos/{{CASO_SLUG}}/docs/` (gitignored).

- [{{DOC_CERTIDAO_CASAMENTO}}] Certidao de casamento / nascimento (filiacao)
- [{{DOC_CERTIDAO_NASCIMENTO_FILHOS}}] Certidao de nascimento dos filhos
- [{{DOC_RG_CPF_CLIENTE}}] RG e CPF do cliente
- [{{DOC_COMPROVANTE_RESIDENCIA}}] Comprovante de residencia (foro)
- [{{DOC_HOLERITES_ALIMENTANTE}}] Holerites / DRPF do alimentante (binomio)
- [{{DOC_HOLERITES_CLIENTE}}] Holerites / DRPF do cliente
- [{{DOC_COMPROVACAO_DESPESAS_MENOR}}] Comprovacao de despesas do menor
- [{{DOC_LAUDO_PSICOSSOCIAL}}] Laudo psicossocial (se ja produzido)
- [{{DOC_BENS_PARTILHAVEIS}}] Inventario de bens partilhaveis
- [{{DOC_BO_VD}}] Boletim de ocorrencia / medidas protetivas (se VD)
- [{{DOC_DOCS_INVENTARIO}}] Certidao de obito, ITCMD-pre, inventario de bens (se inventario)

<!-- `[x]` documento juntado, `[ ]` pendente. A skill que produz peca exige
     marcacao explicita de "documento ausente intencional" antes de gerar
     com lacunas. -->

---

## Esferas paralelas detectadas (P4 — Cruzamento Multi-esfera)

> Familia x Criminal (VD, descumprimento medida) x ECA infracional x Sucessoes x Previdenciario x Tributario (ITCMD) x Civel comum (danos morais).

| Esfera | Detectado? | Acao paralela em curso? | Encaminhamento sinalizado |
|--------|------------|-------------------------|---------------------------|
| Familia (escopo) | sim | {{ACAO_FAMILIA_EM_CURSO}} | — |
| Criminal (Maria da Penha / Henry Borel / VD) | {{CRUZAMENTO_CRIMINAL}} | {{ACAO_CRIMINAL_EM_CURSO}} | Especialista criminalista |
| ECA infracional | {{CRUZAMENTO_ECA}} | {{ACAO_ECA_EM_CURSO}} | Vara da Infancia |
| Sucessoes (interface inventario / UE post mortem) | {{CRUZAMENTO_SUCESSOES}} | {{ACAO_SUCESSOES_EM_CURSO}} | — |
| Previdenciario (pensao por morte, BPC) | {{CRUZAMENTO_PREVIDENCIARIO}} | {{ACAO_PREVIDENCIARIO_EM_CURSO}} | Especialista previdenciarista |
| Tributario (ITCMD) | {{CRUZAMENTO_TRIBUTARIO}} | — | Especialista tributarista (se holding) |
| Civel comum (danos morais, abandono afetivo) | {{CRUZAMENTO_CIVEL}} | {{ACAO_CIVEL_EM_CURSO}} | — |

> Encaminhamentos sao **genericos** (PA-17/PA-20) — sem citar produto ou marca.

---

## Datas criticas e prazos

| Prazo | Termo inicial | Vencimento | Observacao |
|-------|---------------|------------|------------|
| {{PRAZO_TIPO}} | {{PRAZO_INICIO}} | {{PRAZO_FIM}} | {{PRAZO_OBS}} |

<!-- Prazos tipicos em familia:
     - Contestacao: 15 dias uteis (CPC 335) — em familia 15d a contar da
       audiencia de mediacao (CPC 695, 697)
     - Embargos de declaracao: 5 dias uteis (CPC 1.022, 1.023)
     - Agravo de instrumento: 15 dias uteis (CPC 1.003 §5, 1.015)
     - Apelacao: 15 dias uteis (CPC 1.003 §5, 1.009)
     - REsp / RE: 15 dias uteis (CPC 1.029 §5, 1.030)
     - Cumprimento de sentenca de alimentos: triduo CPC 528
     - Prisao civil alimentar: ate 3 meses (CPC 528 §3)
     - Sumula 309 STJ: prisao so para as 3 ultimas + vincendas
-->

---

## Linha estrategica (preenchida pelo Checkpoint 4)

{{LINHA_ESTRATEGICA}}

<!-- Apos a fase de estrategia, registrar aqui:
     - Tese central
     - Teses subsidiarias
     - Riscos identificados (probatorio, jurisprudencial, processual)
     - Cenarios de saida (vitoria total / vitoria parcial / acordo homologado /
       derrota parcial / derrota total) -->

---

## Proximo passo

{{PROXIMO_PASSO}}

<!-- Ex:
     - Aguardar audiencia de mediacao designada para 2026-06-15
     - Juntar holerites do alimentante recebidos em 2026-05-28
     - Distribuir tutela de alimentos provisorios (initio litis) -->

---

## Audit log de violacoes detectadas

> Registro automatico do hook `post-edit-evolve-memory.py` quando detectar
> violacao de PA-21 a PA-25. Ler antes de qualquer entrega.

| Data | Violacao detectada | Severidade | Acao tomada |
|------|--------------------|------------|-------------|
| — | — | — | — |

---

## Pecas produzidas neste caso

> Cada peca produzida e auditada pela `revisao-final-familia` (R1-R4) e
> listada aqui com veredito.

| Data | Peca | Skill responsavel | Veredito R1-R4 |
|------|------|-------------------|----------------|
| — | — | — | — |

---

**Plugin:** `direito-familia-adv-os` v{{PLUGIN_VERSION}}
**Caso aberto em:** {{GENERATED_AT}}
**Compartimentacao:** PA-21 (escopo isolado) + PA-22 (pasta nao sync) + PA-23 (anonimizacao externa) + PA-24 (sigilo laudo) + PA-25 (audit pre-commit)
