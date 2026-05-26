---
name: itcmd-calculo
description: >
  ITCMD — Tier 6A. Calcula ITCMD pos EC 132/2023 + LC 227/2026 (vigente 13/01/2026 — progressividade obrigatoria por quinhao + Tema 825 suprido). Cobre base legal CF 155 + CTN 35-42 (teto 8%), tabela 2026 (SP 4% fixo, RJ 4-8%, MG 3-8%, RS 3-6%, SC 1-8%, GO 2-8%, DF 4-6%, outros [VERIFICAR]), base de calculo (valor venal = VALOR DE MERCADO — REsp 2.580.956/2024; NAO incide sobre meacao), holding (REsp 2.139.412/MT a valor de mercado dos imoveis subjacentes), doacao inoficiosa (REsp 2.026.250/PR), pagamento (SP 180d GARE; RJ DARJ; MG DAE), parcelamento CTN 155-A, renuncia abdicativa vs translativa em dobro, bens em outros Estados (multiplas guias CF 155 §1º II), exterior (LC 227/2026), isencoes, recolhimento (Tema 1.074 sumario dispensa), memoria de calculo, MS quando Fisco arbitra excessivo. Ativa em calcular ITCMD, GARE, aliquota progressiva, holding herdada, /inventario itcmd.
---

# ITCMD — CALCULO + RECOLHIMENTO PRO PARTILHA SAIR

> **Tier 6A** trilha **T7-B**. Pos **EC 132/2023 + LC 227/2026** (vigente 13/01/2026). Camadas 1-3 + P1/P2/P3/P5/P7. **Acionada APOS `inventario-judicial`** ou independente em ITCMD inter vivos (doacao).

## 1. ENTRADA

Ler `CASO.md`: polo (inventariante · co-herdeiro · contribuinte de doacao); falecido (data e local do obito, ultimo domicilio); herdeiros (numero, regime do conjuge — para meacao); acervo bruto (imoveis, contas, quotas/holding, criptoativos, exterior); dividas; doacoes em vida ja recolhidas (creditar). **Estado de domicilio do falecido + Estado de situacao de cada imovel** (anti-falacia de aliquota unica — PA-11). Sem isso, **PARE** (PA-02).

## 2. BASE LEGAL — POS EC 132/2023 + LC 227/2026

- **CF 155 I + CTN 35-42** — competencia estadual; norma geral.
- **CF 155 §1º I** — imoveis: ITCMD do **Estado de situacao**.
- **CF 155 §1º II** — moveis/titulos/creditos: ITCMD do **Estado do domicilio do falecido** ou do inventario.
- **CF 155 §1º IV + Res. SF 9/1992** — **teto nacional 8%**.
- **EC 132/2023** tornou **progressividade OBRIGATORIA** em todos os Estados.
- **LC 227/2026 (vigente 13/01/2026)** regulamentou: parametros da progressividade **POR QUINHAO INDIVIDUAL** (nao por monte); valor de mercado de quotas/acoes; bens no exterior; trusts; doacoes fracionadas (anti-elusao).
- **STF Tema 21 (RE 562.045, 06/02/2013):** constitucional a progressividade.
- **STF Tema 825 (RE 851.108, fev/2021):** vedava cobranca sobre bens no exterior sem LC — **SUPRIDO pela LC 227/2026**.

## 3. ALIQUOTAS 2026 — POR ESTADO

| UF | Aliquota 2026 |
|----|---------------|
| **SP** | **4% fixo** (Lei 10.705/2000 art. 16) — **PENDENTE** adequacao EC 132. Projetos 7/2024 + 409/2025 propoem 2-8%. Lei publicada em 2026 so produz efeito **01/01/2027** (anterioridade) |
| **RJ** | **4-8% progressivo** (Lei 7.174/2015): 4% ate R$ 500 mil · 6% ate R$ 2 mi · 8% acima |
| **MG** | **3-8%** (Lei 14.941/2003 — UFEMG 2026 R$ 5,7899): 3% ate 20.000 UFEMG (R$ 115.798) · 5% ate 60.000 UFEMG · 8% acima |
| **RS** | **3-6%** (Lei 8.821/1989) |
| **PR** | **4% fixo** — pendente |
| **SC** | **1-8%** (Lei 13.136/2004) |
| **GO** | **2-8%** |
| **DF** | **4-6%** — em adequacao |
| **BA/PE** | ate **8%** |
| Outros | `[VERIFICAR — lei estadual]` |

**SP — TATICA 2026:** pagar 4%, ressalvar, questionar judicialmente em patrimonios pequenos quando aprovada progressividade com faixa zero (repeticao via MS). Inventarios abertos em 2026 ficam sob 4% fixo (fato gerador = obito).

## 4. BASE DE CALCULO

**CTN 38:** "valor venal dos bens transmitidos". Jurisprudencia consolidada (STJ): **VALOR VENAL = VALOR DE MERCADO** na data do obito — nao valor venal IPTU simples.

- **STJ REsp 2.580.956 (2ª Turma, 11/11/2024):** Fisco **arbitra** quando valor declarado for incompativel com mercado.
- **STJ REsp 2.139.412/MT (2ª Turma, 18/02/2025):** holding familiar — ITCMD a **valor de mercado dos imoveis subjacentes**, NAO valor patrimonial contabil das quotas. **Corte definitivo** na estrategia de subavaliacao.
- **STJ REsp 2.026.250/PR (3ª Turma, 24/03/2025):** doacao inoficiosa — concordancia dos herdeiros NAO afasta a nulidade no excesso (CC 549). Reflexo: ITCMD incide sobre o excesso quando nulo, com restituicao via repeticao.
- **NAO INCIDE ITCMD SOBRE MEACAO** — meacao pertence ao conjuge por forca do regime de bens; nao e sucessao. **Erro classico** de inventariante leigo.

## 5. CALCULO POR QUINHAO INDIVIDUAL — LC 227/2026

Progressividade incide **por quinhao**, nao sobre o monte. Exemplo UF 3%/5%/8%:

```
ACERVO ........................ R$ 3.000.000
(-) MEACAO CONJUGE (50%) ...... R$ 1.500.000  → NAO TRIBUTA
MONTE HEREDITARIO ............. R$ 1.500.000
QUINHAO/HERDEIRO (3) .......... R$   500.000

ITCMD/QUINHAO:
   faixa 1 ate R$ 200.000 a 3% =  R$  6.000
   faixa 2 ate R$ 500.000 a 5% =  R$ 15.000
   ITCMD/herdeiro ............... R$ 21.000
TOTAL ITCMD ..................... R$ 63.000
```

**Doacoes em vida com colacao:** somar valor da liberalidade ao quinhao do donatario antes da progressividade. **Creditar** ITCMD ja pago na doacao.

## 6. BENS EM OUTROS ESTADOS

**Imoveis (CF 155 §1º I):** ITCMD do **Estado de situacao** do imovel. Imoveis em SP + RJ + MG = **3 GAREs/DARJs/DAEs distintas**. **Moveis e creditos:** ITCMD do Estado de domicilio do falecido.

## 7. BENS NO EXTERIOR — LC 227/2026

- **Doacao de doador no exterior** → ITCMD para Estado de domicilio do **donatario** (ou DF).
- **Heranca com bens no exterior** → ITCMD para Estado de domicilio do **falecido** (se brasileiro residente) OU do **sucessor** (se falecido residia no exterior).
- **Progressividade obrigatoria** tambem sobre o quinhao estrangeiro.
- **Inventario na situacao** (pluralidade dos juizos sucessorios — STJ Inf. Extra 23/2025): lei brasileira NAO rege sucessao de bens no exterior; ITCMD brasileiro incide pelo regime acima.

## 8. PAGAMENTO E ESCRITURACAO

**Prazo (varia por UF).** SP — Lei 10.705/2000 art. 17: 180d do obito sem multa; **10% (60-180d) ou 20% (>180d)** sobre o ITCMD. Outros: `[VERIFICAR — lei estadual]`.

**Guias:** SP **GARE-ITCMD** (`portal.fazenda.sp.gov.br/servicos/itcmd`); RJ **DARJ**; MG **DAE-ITCMD**; RS **GA**; outros DARE/DARF estadual.

**Parcelamento (CTN 155-A):** SP ate **12 parcelas mensais** com garantia; juros SELIC; multa por atraso mantida.

**Isencao (SP Lei 10.705 art. 6º):** bens ate 7.500 UFESPs (≈ R$ 282 mil 2026); extincao de usufruto; doacao a beneficente; herdeiro PCD sem outros bens; imovel residencial unico (com teto). **Indeferimento desafia MS.**

## 9. MOMENTO DO RECOLHIMENTO NO JUDICIAL

| Modalidade | Recolhimento |
|------------|--------------|
| **Inventario comum** (CPC 654 c/c CTN 192) | **Antes** da homologacao da partilha — sem comprovacao, juiz nao homologa nem expede formal |
| **Arrolamento sumario** (STJ Tema 1.074, REsp 1.896.526/DF, 26/10/2022) | **DISPENSA** previo recolhimento; ITCMD cobrado apos formal pela Fazenda. **MAS** tributos sobre bens (IPTU/IPVA/IR) quitados (CTN 192) |
| **Arrolamento comum** | ITCMD pago **antes** do formal |
| **Sobrepartilha** | ITCMD do novo bem com **aliquota da DATA DO OBITO** (anterioridade do fato gerador, nao da descoberta) |

## 10. RENUNCIA — ABDICATIVA vs TRANSLATIVA

- **Abdicativa (CC 1.806):** pura, ex tunc. **SEM ITCMD ADICIONAL** — bem retorna ao monte e redistribui (cada beneficiario paga seu ITCMD normal sobre o quinhao majorado).
- **Translativa:** cessao em favor de pessoa determinada. **TRIBUTA EM DOBRO:**
  1. ITCMD causa mortis (espolio → renunciante);
  2. ITCMD inter vivos OU ITBI (renunciante → beneficiario), conforme onerosa ou gratuita.
  **SEFAZ-SP Consulta 24.246/2021** confirmou a bitributacao.
  **Tatica:** se intencao e apenas afastar-se (ex: ex-conjuge em favor dos filhos), **redigir como ABDICATIVA**.

## 11. MEMORIAL DE CALCULO — MODELO

```
MEMORIAL ITCMD — Inventario de {{FALECIDO}}

1. BASE LEGAL: Lei Estadual {{LEI/UF}} + EC 132/2023 + LC 227/2026.

2. ACERVO LIQUIDO:
   Bens declarados ........... R$ {{X}}
   (-) Meacao conjuge ........ R$ {{Y}}    (NAO TRIBUTA)
   (-) Dividas ............... R$ {{Z}}
   = Acervo partivel ......... R$ {{ACERVO}}

3. QUINHAO/HERDEIRO (LC 227/2026 progressivo):
   Herdeiro A — R$ {{QA}} (faixa {{FAIXA_A}}, {{ALIQ_A}}%) = R$ {{ITCMD_A}}
   Herdeiro B — R$ {{QB}} (faixa {{FAIXA_B}}, {{ALIQ_B}}%) = R$ {{ITCMD_B}}

4. BENS EM OUTROS ESTADOS:
   Imovel em {{UF2}} — base R$ {{V2}}, {{ALIQ_UF2}}%, R$ {{ITCMD_UF2}}

5. ITCMD TOTAL: R$ {{TOTAL}}.

6. NOTAS: NAO incide sobre meacao. Valor venal = valor de mercado (REsp 2.580.956/2024). Holding a valor de mercado dos imoveis subjacentes (REsp 2.139.412/2025). Doacao inoficiosa com excesso: ITCMD restituivel (REsp 2.026.250/2025).
```

## 12. ESTRATEGIA — QUANDO LITIGAR

- **Fisco arbitrou excessivo** (REsp 2.580.956/2024 admite arbitramento, nao desproporcao): **MS** ou impugnacao administrativa + laudo pericial paralelo.
- **Holding com quotas subavaliadas:** Fisco aplicara REsp 2.139.412/MT — atualizar laudo dos imoveis subjacentes antes do recolhimento.
- **SP 2026 patrimonio pequeno:** pagar 4%, ressalvar, aguardar progressividade com faixa isenta e pedir repeticao.
- **Bens no exterior:** LC 227/2026 — confirmar Estado competente; tratados anti-dupla tributacao.
- **Doacoes fracionadas:** LC 227/2026 anti-elusao — soma quinhoes.

## 13. ALERTAS

- **PA-01** sem juizo moral. **PA-03/P1** EC 132/2023 + LC 227/2026 + Temas 21/825/1.074; REsp 2.124.424; 2.139.412; 2.580.956; 2.026.250.
- **PA-08** SP 180d obito (sem multa) vs apos 180d (20%). Outros: `[VERIFICAR — lei estadual]`.
- **PA-11** aliquota varia por UF (ver §3).
- **PA-13** menor: isencao SP art. 6º + hipoteses estaduais.
- **NAO INCIDE SOBRE MEACAO** — sempre separar contabilmente.
- **Sobrepartilha:** aliquota da data do obito.
- Holding/M&A: encaminhamento generico (PA-17).

## 14. INTEGRACAO

Acionada por `familia-master`, `inventario-judicial` (T7-A → T7-B), `/inventario itcmd`. Aciona `validador-legislacao-vigente` (P1), `estilo-juridico-familia`, `localizacao-vara-familia` (P5). Entrega para `revisao-final-familia` (R1-R4).

> **Ressalva OAB:** saida operacional sujeita a revisao e responsabilidade tecnica do advogado com OAB ativa. **Aliquotas e isencoes variam por Estado — conferir lei estadual vigente no ato do recolhimento.** Memoria de calculo rastreavel deve ser anexada ao protocolo do inventario para auditoria do Fisco e dos herdeiros.
