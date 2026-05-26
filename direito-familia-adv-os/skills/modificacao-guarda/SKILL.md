---
name: modificacao-guarda
description: >
  MODIFICACAO DE GUARDA — Skill Tier 2B. Produz acao de modificacao de guarda
  com tutela de urgencia em casos de FATO SUPERVENIENTE (clausula rebus sic
  stantibus — CC 1.586; NAO ha coisa julgada material em guarda). Hipoteses
  tipicas: alienacao parental, abandono, descumprimento reiterado de
  convivencia, mudanca de cidade sem autorizacao, novo relacionamento
  prejudicial, suspeita de abuso, condenacao criminal, dependencia quimica
  ativa. Side-aware (quem requer modificacao x quem detem guarda atual).
  Tutela inversiva so com prova robusta (REsp 2.108.750-GO/2024 — vedacao a
  decisao sumaria). Modo Reu: ausencia de fato novo + estabilidade do menor
  (principio da continuidade). Acione quando o operador disser modificacao
  de guarda, inversao de guarda, alterar guarda, rebus sic stantibus em
  familia, fato superveniente, /guarda --modificacao, ou T7.
---

# MODIFICACAO DE GUARDA

> Skill **Tier 2B** — trilha **T7**. Acao de modificacao de guarda com tutela
> de urgencia, **side-aware**, fundada em fato superveniente.

## 0. ESCOPO

Use quando JA HA sentenca ou acordo de guarda anterior e o operador quer
modificar. Sem sentenca anterior, use `guarda-originaria`. Se o eixo central
e alienacao parental e o pedido principal e a medida do art. 6º da Lei
12.318, use `alienacao-parental` (a modificacao da guarda pode ser
consequencia ali — inciso V).

## 1. HIERARQUIA

Camada 4. Consome P1 (Vigencia), P2 (Documental), P3 (Memoria), P4
(Cruzamento), P5 (Foro/Vara), P6 (Side-awareness), P7 (R1-R4). Reforco
de **PA-13** (melhor interesse), **PA-14** (oitiva especializada), **PA-06**
(segredo CPC 189 II) e **PA-23** (anonimizacao reforcada).

## 2. SIDE-AWARENESS — 2 POLOS

| Polo | Quem | Pretensao |
|------|------|-----------|
| **Requerente** | Quem pede a modificacao | Inverter / alterar a modalidade da guarda atual |
| **Requerido / detentor atual** | Quem ja detem a guarda | Defesa: ausencia de fato novo + estabilidade |

Polo indefinido => **parar e perguntar** (PA-05 + PA-19).

## 3. TESE NUCLEAR — CLAUSULA REBUS SIC STANTIBUS

**CC art. 1.586:** "Havendo motivos graves, podera o juiz, em qualquer
caso, a bem dos filhos, regular de maneira diferente da estabelecida nos
artigos antecedentes a situacao deles para com os pais."

**Tradução:** **NAO ha coisa julgada material em guarda**. Sentenca
transita formalmente, mas relacao continuativa permanece sujeita a revisao
quando ha alteracao das circunstancias. Jurisprudencia consolidada da 3ª
Turma do STJ (Min. Nancy Andrighi).

A tese central da modificacao e demonstrar **mudanca superveniente** das
circunstancias que justificaram a guarda original.

## 4. HIPOTESES TIPICAS — GATILHO FATICO

| Hipotese | Base normativa |
|----------|----------------|
| Alienacao parental caracterizada | Lei 12.318 art. 6º V |
| Abandono material ou afetivo | CC 1.638 II |
| Descumprimento reiterado da convivencia | Lei 12.318 art. 2º par. unico II + CPC 536 |
| Mudanca de cidade/Estado sem autorizacao | CC 1.583 §3º (e Lei 12.318 art. 2º VII se com fim de AP) |
| Novo relacionamento prejudicial | CC 1.586 + ECA 4º (prejuizo concreto) |
| Suspeita de abuso sexual ou fisico | Lei 13.715/2018 + CP 217-A/213 |
| Condenacao criminal do guardiao | Lei 13.715/2018 + CC 1.638 par. unico II |
| Dependencia quimica / doenca mental grave | CC 1.638 + CC 1.586 (pericia) |
| Inversao silenciosa da rotina | CC 1.586 |
| Vontade da crianca/adolescente (≥12 anos) | Conv. ONU art. 12 + ECA 28 §2º analogia (peso significativo, nao vinculante) |

## 5. ESQUELETO DA PETICAO (MODO REQUERENTE)

```
EXMO. JUIZ DE DIREITO DA {{VARA}}ª VARA DE FAMILIA — {{COMARCA}}/{{UF}}
(foro do domicilio do atual detentor — Sumula 383 STJ)

{{QUALIFICACAO_AUTOR}}, vem propor
ACAO DE MODIFICACAO DE GUARDA C/C TUTELA DE URGENCIA
em face de {{QUALIFICACAO_REU}}.

I — HISTORICO PROCESSUAL
1. A guarda da crianca {{FILHO_ANONIMIZADO}} foi atribuida ao Reu pela {{SENTENCA_OU_ACORDO}}, em {{DATA}}, no Processo {{NUMERO}} ({{JUIZO}}), com regime de convivencia {{DESCRICAO}}, conforme doc. 01.

II — FATOS NOVOS (rebus sic stantibus — CC 1.586)
2. Sobrevieram alteracoes substanciais:
   (i) {{FATO_1}} em {{DATA}} — prova {{DOC}};
   (ii) {{FATO_2}} em {{DATA}} — prova {{DOC}};
   (iii) {{FATO_3}} em {{DATA}} — prova {{DOC}}.
3. {{PREJUIZO_ATUAL_DA_CRIANCA}} — corroborado por {{LAUDOS_RELATORIOS_TESTEMUNHOS}}.

III — DIREITO
4. CC 1.586 — clausula rebus sic stantibus.
5. NAO ha coisa julgada material em guarda (3ª T. STJ — Min. Nancy Andrighi).
6. Os fatos supervenientes caracterizam alteracao substancial — modalidade pleiteada: {{COMPARTILHADA_OU_UNILATERAL}} com base no Autor.
7. {{FUNDAMENTACAO_LEI_12318_SE_AP_OU_LEI_13715_SE_VIOLENCIA}}.

IV — TUTELA DE URGENCIA (CPC 300)
8. Fumus: {{ROBUSTEZ_PROBATORIA}}. Periculum: {{RISCO_CONCRETO_ATUAL_IMINENTE}}.
9. Proporcionalidade: {{POR_QUE_VISITA_SUPERVISIONADA_OU_AMPLIAR_CONVIVENCIA_NAO_RESOLVE}}.
10. Requer {{PEDIDO_CAUTELAR_GRADUADO}}.

V — PEDIDOS
11. (a) tutela; (b) estudo psicossocial (CPC 699) com prioridade na pauta; (c) oitiva do menor em escuta especializada (Lei 13.431/2017 + Res. 226/2024 CNJ + Res. 299/2019 CNJ); (d) {{PERICIA_PSICOLOGICA_LEI_12318_SE_AP}}; (e) citacao; (f) mediacao (CPC 695 — ressalvada se violencia/conflito alto Lei 11.340); (g) procedencia: modificacao + revisao de convivencia + revisao de alimentos; (h) sucumbencia.
12. Provas: todas em direito admitidas.
13. Valor: R$ {{VALOR}}.

{{LOCAL}}, {{DATA}}.
{{ADVOGADO_NOME}} — OAB/{{OAB_UF}} {{OAB_NUMERO}}

[Ressalva OAB — PA-07]
```

## 6. TUTELA DE URGENCIA INVERSIVA — PRE-REQUISITOS ALTOS

**Atencao critica:** STJ rejeita reiteradamente tutelas que invertam guarda
abruptamente sem pericia (REsp 2.108.750-GO/2024). Pre-requisitos:

1. Risco **concreto, atual, iminente** (nao basta historico antigo).
2. Prova robusta — testemunhal + documental.
3. Inviabilidade de medida menos drastica:
   - Convivencia supervisionada antes da inversao.
   - Acompanhamento psicologico (Lei 12.318 art. 6º IV).
   - Multa (Lei 12.318 art. 6º III + CPC 537).
4. Preferencia por **liminar de protecao** (suspender/supervisar
   convivencia) antes de inverter guarda.

**Quando inversao direta e viavel:**
- Abuso sexual em apuracao com indicios fortes (laudo IML, depoimento
  especial, BO).
- Violencia fisica grave documentada.
- Sumico com o filho (Lei 12.318 art. 2º VII).
- Falsa identidade / fraude documental (raro).

## 7. PROVA DO FATO SUPERVENIENTE (P2 reforcado)

**Documental:** mensagens preservadas — **ata notarial e o ouro** (CPC
384); STJ admite WhatsApp como prova plena. BOs. Laudos
medicos/psicologicos particulares. Relatorios escolares (queda de
rendimento, faltas). Fotos/videos com data. Decisoes em outros processos
(criminal, MP, Conselho Tutelar).

**Testemunhal:** professores, pediatras, vizinhos, familiares (CPC 447
§2º — parentesco nao impede). **Conselho Tutelar** — peso altissimo.

**Pericial:** estudo psicossocial pelo juizo (regra); laudo particular do
AT (CPC 465 §1º); em AP — pericia Lei 12.318 art. 5º (90d prorrogaveis).

## 8. MODO REU / DETENTOR ATUAL — DEFESA

**Tese 1 — Ausencia de fato novo:** "Modificacao exige alteracao
substancial. O Autor nao traz fato superveniente — rediscute materia ja
apreciada, ofendendo a seguranca juridica e a coisa julgada formal (CPC
502)."

**Tese 2 — Estabilidade e principio da continuidade:** "A crianca esta
ha {{X}} anos integrada a rotina, escola, vizinhanca e familia extensa
sob a guarda do Requerido. STJ: 'mudancas abruptas no ambiente familiar
podem produzir efeitos psiquicos profundos e duradouros' (Min. Nancy
Andrighi, REsp 2.108.750-GO/2024). O melhor interesse (CF 227 + ECA 4º
+ Conv. ONU art. 3º) impoe a preservacao."

**Tese 3 — Proporcionalidade / inviabilidade da medida mais drastica:**
"Lei 12.318 art. 6º preve escalonamento; inversao reservada quando
medidas menos drasticas se mostrem insuficientes. Nao ha prova de
esgotamento."

**Tese 4 — Vontade da crianca/adolescente:** "O filho, {{IDADE}} anos,
manifestou em escuta especializada (Lei 13.431/2017) preferencia pela
manutencao da convivencia atual — peso significativo, ainda que nao
vinculante (Conv. ONU art. 12)."

**Tese 5 — Impugnacao da prova:** mensagens descontextualizadas, BO sem
desfecho, laudo particular sem rigor tecnico.

**Pedidos defesa:** (a) improcedencia; (b) estudo psicossocial com AT
proprio + quesitos; (c) oitiva especializada (PA-14); (d) sucumbencia
ao Autor.

## 9. DOCUMENTOS (P2 — modificacao)

- [ ] Sentenca/acordo anterior de guarda (datado e com transito)
- [ ] Prova **do fato superveniente** (BO, mensagens com ata, fotos, video,
      laudo)
- [ ] Estudo psicossocial anterior (se houver)
- [ ] Diario de descumprimento (se descumprimento de convivencia)
- [ ] Comprovacao de melhor capacidade do Autor (renda, escola, ambiente)
- [ ] Relatorios escolares e medicos atualizados
- [ ] Conselho Tutelar (registro, se houver)

Sem prova do fato superveniente => **NAO redigir**. Pendencia critica.

## 10. JURISPRUDENCIA CHAVE (P1)

- **CC art. 1.586** + jurisprudencia consolidada da 3ª T. STJ (rebus sic
  stantibus em relacao continuativa).
- **REsp 2.108.750-GO** (3ª T., 2024) — ampla dilacao probatoria em
  acusacoes reciprocas; vedacao a decisao sumaria; mudancas abruptas
  produzem dano.
- **REsp 1.629.994-RJ** (3ª T., 2016) — possibilidade de inversao por
  inaptidao caracterizada.
- **REsp 1.878.041-SP** (Tema 1.137, 2021) — compartilhada como regra
  mesmo com conflito (referencia tambem para modificacao que pleiteia
  passagem de unilateral para compartilhada).
- **Sumula 383 STJ** — competencia do foro do detentor atual.
- **Conjur 29/04/2026** — pratica deliberada + fraude documental
  justificam inversao.

## 11. CRUZAMENTO MULTI-ESFERA (P4)

- Modificacao + AP => acionar `alienacao-parental` em paralelo (incidente
  ou autonoma — Lei 12.318 art. 4º).
- Modificacao + violencia => Familia × Criminal (Maria da Penha 11.340 +
  Henry Borel 14.344). Afastamento do lar incluso.
- Modificacao + falsa denuncia de abuso => Familia × Criminal (CP 138
  calunia / CP 339 denunciacao caluniosa) — encaminhar a criminalista
  (PA-17 — sem citar produto).
- Mudanca de cidade sem autorizacao => atencao a Conv. Haia 1980 se
  elemento internacional (PA-12).

## 12. P7 — SUPREMA CORTE

R1 brief / R2 conteudo / R3 compliance / R4 performance antes de entregar.
Bypass so com `--no-corte` registrado. Camada 1 inviolavel.

## 13. ENCERRAMENTO

Toda saida desta skill carrega ressalva OAB (PA-07), anonimizacao
reforcada (PA-23), respeito a vontade do menor com discernimento
(PA-13/14), e alinhamento integral ao polo do cliente (P6 + PA-05/19). O
**fato superveniente** e a tese nuclear — sem ele, defesa pela
improcedencia; nele, ataque pela modificacao.
