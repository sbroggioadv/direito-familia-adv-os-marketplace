---
name: revisao-final-familia
description: >
  REVISAO FINAL FAMILIA — Skill Tier 6 CRITICA (Suprema Corte R1-R2-R3-R4). Protocolo P7 enforcement: toda peca, contestacao, recurso, parecer ou orientacao do plugin passa aqui antes da entrega. R1 Brief (objetivo, pedidos cumulaveis P2, valor da causa, FIRAC); R2 Conteudo (fatos objetivos sem juizo moral PA-01, subsuncao logica, pedido fecha com conclusao, memoria de calculo rastreavel); R3 Compliance (25 PAs + Selo P1 + side-awareness P6 + foro+vara P5 + documentos P2 + cruzamento multi-esfera P4 + segredo art. 189 + melhor interesse PA-13 + oitiva especializada PA-14 + vitima VD endereco protegido + LGPD); R4 Performance (persuasao, clareza, tom adaptado, ressalva OAB). Vereditos APROVADA / REVISAR / BLOQUEADA. Bypass --no-corte / --quick / /corte off. Ativa em /revisao-final, /revisao, /corte, antes de protocolar peca, validar peticao, revisar contestacao. Ressalva OAB.
---

# REVISAO FINAL FAMILIA — SUPREMA CORTE R1-R4

> Skill **Tier 6 CRITICA — enforcement do Protocolo P7**. Toda entrega do plugin passa aqui antes de ser liberada ao advogado. Sem o **Selo R1-R4**, peca **NAO sai** (excecao: bypass explicito do advogado).

---

## 0. ESCOPO

Validar toda producao do plugin antes da entrega final. 4 rodadas em sequencia com short-circuit:
- **R1 Brief** — falha → REVISAR
- **R2 Conteudo** — falha → REVISAR
- **R3 Compliance** — falha → **BLOQUEADA** (gera relatorio, NAO entrega)
- **R4 Performance** — falha → REVISAR

**Veredito final:** APROVADA (libera entrega com Selo R1-R4) / REVISAR (volta a producao) / BLOQUEADA (cancela e gera relatorio).

**Bypass:** advogado pode pedir `--no-corte`, `--quick` ou `/corte off` — saida sai SEM Selo, sob responsabilidade dele.

---

## 1. R1 — BRIEF

Confere fundamentos minimos da peca antes de aprofundar.

**Checklist R1:**
- [ ] **Objetivo claro** — qual o resultado pretendido (decretar divorcio, fixar alimentos, modificar guarda, impugnar laudo)? Esta no preambulo.
- [ ] **Pedidos cumulaveis identificados (P2)** — todos os pedidos compativeis estao listados? Ex: divorcio + partilha + alimentos + nome + guarda — cumulacao admitida (CPC 327).
- [ ] **Valor da causa correto** — fixado conforme CPC 291-293: alimentos = 12 prestacoes mensais; divorcio sem patrimonio = simbolico; partilha = valor dos bens; inventario = monte-mor.
- [ ] **FIRAC presente** — cada bloco tematico em Fato/Issue/Regra/Aplicacao/Conclusao.
- [ ] **Polo do cliente declarado** no `CASO.md` (P6/PA-05).
- [ ] **Tutela de urgencia** sinalizada se aplicavel (alimentos provisorios, guarda provisoria, afastamento do lar).

**Falha em R1:** voltar a producao com checklist de gaps. Veredito REVISAR.

---

## 2. R2 — CONTEUDO

Confere a substancia juridica da peca.

**Checklist R2:**
- [ ] **Fatos OBJETIVOS (PA-01)** — descritos sem juizo moral. Permitido: "deixou o lar em 03/2024"; **proibido**: "abandonou egoistamente". Caca-vocabulario: "negligente", "irresponsavel", "traidor", "abandonante", "alienante" como adjetivo (uso so como tipificacao legal Lei 12.318).
- [ ] **Subsuncao fato-norma logica** — cada fato relevante remete a um artigo + sumula/tese aplicavel. Cadeia logica fato → norma → conclusao.
- [ ] **Pedido fecha com a Conclusao** — nao pode haver fundamento sem pedido correspondente, nem pedido sem fundamento.
- [ ] **Memoria de calculo rastreavel** — quando ha valor (alimentos, partilha, ITCMD, multa CPC 523 §1º), apresentar planilha/calculo passo-a-passo. Sem indice hardcoded: explicar origem do percentual.
- [ ] **Datas verificadas** — fatos com data exata; prazos contados em dias uteis (CPC 219).
- [ ] **Citacoes integras** — todo art./sumula/tese citada bate com texto vigente (P1 — Selo de Validacao Legal Previa).
- [ ] **Documentos referenciados** — toda alegacao com prova documental aponta o doc anexo (CPC 434).
- [ ] **Pedido subsidiario** quando cabivel — se o pedido principal falhar, qual o secundario?

**Falha em R2:** marcar trechos com pendencia; veredito REVISAR.

---

## 3. R3 — COMPLIANCE (rodada mais critica — short-circuit)

Confere as 25 PAs + os 7 Protocolos. **Falha em R3 = BLOQUEADA** — peca nao sai, advogado recebe relatorio.

### Camada 1 — PAs (25)

**A (01-04) Conduta tecnica:**
- PA-01 sem juizo moral (conferido em R2) · PA-02 dados reais presentes (sem nome/data/foro = nao redige) · PA-03 **Selo P1** do `validador-legislacao-vigente` com data+escopo · PA-04 vigencia atual (LC 227/2026 ITCMD, Lei 14.994/2024 Maria da Penha, Lei 14.550/2023, Res. 226/2024 CNJ).

**B (05-08) Coerencia processual:**
- PA-05 side-awareness OK (P6) · PA-06 segredo de justica CPC 189 II (pedido expresso + anonimizacao) · PA-07 ressalva OAB ao final · PA-08 prazos (ED 5d; AI/apelacao/REsp/RE 15d; contestacao familia 15d apos mediacao CPC 697).

**C (09-12) Localizacao + prescricao:**
- PA-09 foro confirmado P5 (familia = guardiao/menor CPC 53; alimentos = alimentando CPC 53 II; divorcio s/ filho = reu CPC 46; inventario CPC 48; JVDFM Maria da Penha) · PA-10 prescricao (alimentos bienal CC 206 §2º; paternidade imprescritivel Sum. 149 STF; anulacao casamento CC 1.560; sonegacao CC 2.013) · PA-11 norma local com `[VERIFICAR]` (ITCMD por Estado) · PA-12 Haia 1980 sinalizada em caso internacional.

**D (13-16) Protecao especial (supraprincipios):**
- PA-13 melhor interesse (CC 1.586 + CF 227 + ECA 4 + Conv. ONU 1989) — vence qualquer outro · PA-14 oitiva especializada (Lei 13.431/2017 + Res. 226/2024 + 299/2019 CNJ) — sala de escuta, oitiva unica, sem confronto · PA-15 TDA preferencial sobre curatela (Lei 13.146/2015) · PA-16 vitima VD com endereco protegido (CPC 77 V).

**E (17-20) Deontologia OAB:**
- PA-17 **sem cross-sell** — generico "advogado especializado em..." · PA-18 em laudo psicossocial aponta vicios PROCESSUAIS/METODOLOGICOS — **nao discorda de diagnostico clinico** · PA-19 sem advocacia contra cliente (conflict-of-interest) · PA-20 sem publicidade que viole Provimento 205/2021 OAB.

**F (21-25) LGPD + sigilo:**
- PA-21 compartimentacao por caso · PA-22 pasta sincronizada bloqueada sem warning aceito · PA-23 anonimizacao reforcada (`[MENOR ANONIMIZADO]`, CPF mascarado, endereco protegido) · PA-24 laudo/prontuario sigiloso · PA-25 audit pre-commit limpo.

### Camada 2 — Protocolos (todos os 7)

- [ ] **P1** — Selo de Validacao Legal Previa carimbado (data + escopo).
- [ ] **P2** — Checklist de documentos completo; sem doc essencial, NAO redige.
- [ ] **P3** — `CASO.md` atualizado com decisoes processuais e linha do tempo.
- [ ] **P4** — Cruzamento multi-esfera mapeado quando aplicavel (familia × criminal MP/VD; ECA; sucessoes; previdenciario; tributario ITCMD; civel). Encaminhamento generico sinalizado (PA-17).
- [ ] **P5** — Foro + vara + Estado fixados.
- [ ] **P6** — Side-awareness coerente com o polo do cliente em `CASO.md`.
- [ ] **P7** — Esta propria revisao R1-R4.

**Falha em R3 = BLOQUEADA.** Gerar relatorio em `<cwd>/direito-familia/casos/<slug>/.revisao-bloqueada-[data].md` com cada item NAO marcado + diagnostico + recomendacao.

---

## 4. R4 — PERFORMANCE

Confere persuasao, clareza e tom.

**Checklist R4:**
- [ ] **Persuasao** — argumentos ordenados do mais forte ao mais fraco; jurisprudencia atual e pertinente.
- [ ] **Clareza (CC art. 3)** — frases medias, sem jargao excessivo; tabela/lista quando facilita.
- [ ] **Tom adaptado ao polo** — autor: incisivo + demonstrativo; reu: defensivo + impugnante; em caso com menor/VD: **tom acolhedor reforcado** (sem dramatizacao).
- [ ] **Ressalva OAB ao final (PA-07)** — "Saida operacional sujeita a revisao e responsabilidade tecnica do advogado com OAB ativa. Verifique vigencia das normas no ato do peticionamento."
- [ ] **Fechamento profissional** — local, data, advogado(a), OAB/UF nº.

**Falha em R4:** sugerir ajustes de redacao; veredito REVISAR.

---

## 5. VEREDITOS — CARIMBO

- **APROVADA** — R1+R2+R3+R4 OK → carimbar **Selo R1-R4** com data; liberar entrega.
- **REVISAR** — falha em R1, R2 ou R4 → devolver a producao com pontos abertos.
- **BLOQUEADA** — falha em R3 (compliance) → cancelar entrega; gerar relatorio; orientar correcao na origem.

**Selo R1-R4 (exemplo):**
```
✅ SELO R1-R4 — Suprema Corte Familia
Peca: [tipo] — Caso: [slug-anonimo]
R1 Brief: OK · R2 Conteudo: OK · R3 Compliance: OK · R4 Performance: OK
Data: [data] · Validade: ato de peticionamento
Ressalva OAB: aplicavel.
```

---

## 6. BYPASS

Advogado pode pular a revisao com qualquer destes (sob responsabilidade exclusiva):
- `--no-corte` (CLI argument)
- `--quick` (CLI argument)
- `/corte off` (comando)

Saida sai SEM Selo + aviso: "Atencao: peca entregue **sem revisao R1-R4** por solicitacao do advogado. Confira pessoalmente PAs, P1 e prazos antes de protocolar."

---

## 7. INTEGRACAO — ESTA SKILL DEVE SER ACIONADA ANTES DE QUALQUER ENTREGA

Toda skill de producao (peticoes iniciais, contestacoes, recursos, pareceres, calculos) **DEVE** terminar acionando `revisao-final-familia` antes de devolver o resultado ao advogado.

| Skill produtora | Entrega para `revisao-final-familia` |
|----------------|---------------------------------------|
| `peticao-inicial-divorcio` | sim |
| `peticao-uniao-estavel` | sim |
| `fixacao-alimentos` / `revisional-alimentos` / `execucao-alimentos` / `exoneracao-alimentos` | sim |
| `guarda-originaria` / `modificacao-guarda` / `alienacao-parental` | sim |
| `contestacao-familia` / `replica-familia` | sim |
| `tutela-alimentos-provisorios` / `tutela-guarda-provisoria` / `tutela-patrimonio-familia` | sim |
| `ed-familia` / `apelacao-familia` / `agravo-instrumento-familia` / `resp-re-familia` / `recurso-familia-contrarazoes` | sim |
| `laudo-psicossocial-analise` (impugnacao) | sim |
| `cruzamento-multi-esfera` | sim |
| `encaminhamentos-familia` (parecer com encaminhamento) | sim |

**P7 enforcement:** o hook `prompt-intercept-corte.py` injeta lembrete da R1-R4 a cada producao. Se a skill produtora tentar fechar sem invocar esta revisao, o hook bloqueia.

> **Ressalva OAB:** Selo R1-R4 nao substitui a revisao final do advogado responsavel. Verifique vigencia das normas no ato do peticionamento.
