---
name: peticao-uniao-estavel
description: >
  PETICAO UNIAO ESTAVEL — Tier 2A side-aware da trilha T2 (reconhecimento +
  dissolucao + partilha de UE judicial). MODO AUTOR (inter vivos OU post mortem
  para fins sucessorios) OU MODO REU (contestacao com namoro qualificado,
  descontinuidade, ausencia de animus, pacto). Le polo no CASO.md. Aplica FIRAC
  + P1 (vigencia) + P2 (CPC 320) + P5 (CPC 53 I) + P6 + P7 (R1-R4). Cita CC
  1.723-1.727, Lei 9.278/96 art. 7º par. unico, CPC 693-699, Sumulas 380/382
  STF, Temas 809/1.236/529 STF, Enunciado 573 CJF. Vedacoes PA-01/06/13.
  Acionada por triagem-familia em T2 OU pelo command /uniao-estavel (/ue).
  Encerra com ressalva OAB.
---

# PETICAO UNIAO ESTAVEL (side-aware)

> Tier 2A · Trilha T2. Cobre inter vivos e post mortem (sobrevivente vs
> herdeiros — fins sucessorios) + contestacao defensiva. Extrajudicial fora.

---

## 1. SIDE-AWARENESS (P6 + PA-05)

1. Abrir `<cwd>/direito-familia/casos/<slug>/CASO.md`
2. Ler **Polo do cliente** + **Modalidade da UE** + **Termo inicial/final**
   (eixo do conflito probatorio)
3. Sem polo OU contradicao → **pare e pergunte**

| Polo | Modo |
|------|------|
| Requerente (inter vivos) | **MODO AUTOR — Inter Vivos** (§3) |
| Sobrevivente (post mortem) vs herdeiros | **MODO AUTOR — Post Mortem** (§4) |
| Requerido / herdeiro contestante | **MODO REU** (§5) |

---

## 2. P1 + P2 — PREREQUISITOS

**P1 — Selo:** CC 1.521, 1.523, 1.694, 1.723-1.727, 1.725, 1.831, 1.790
(inconst. — Tema 809), 1.829, 1.659; Lei 9.278/96 art. 7º par. unico; CPC 53 I,
292, 313 V "a", 373, 695-699; Sum. 380/382 STF; Temas 529, 809, 1.236 STF;
Enunc. 573 CJF. Sem Selo → sem peca (PA-03).

**P2 — Integridade Documental (CPC 320):**
- [ ] RG/CPF/comprovante residencia + procuracao (CPC 105 + transigir)
- [ ] Convivencia — multiplos meios: IRPF dependente, contas conjuntas, plano
  saude/previdencia (beneficiario), contas de consumo no endereco, fotos/redes
  (ata notarial — Lei 8.935/94 + Prov. CNJ 100/2020), testemunhas min. 2,
  certidao nascimento filho comum
- [ ] Escritura publica de UE (se houver — inverte onus); pacto escrito
- [ ] Comprovacao patrimonial com datas dos termos inicial/final
- [ ] Renda do alimentante (se cumular alimentos)
- [ ] **Post mortem:** certidao obito + herdeiros + inventario (CPC 313 V "a")

Sem documento essencial → **NAO redige**. Lista pendencias.

---

## 3. MODO AUTOR — Inter Vivos (Reconhecimento + Dissolucao + Partilha)

### 3.1 Requisitos materiais (CC 1.723) — 5 cumulativos
1. **Publicidade** (Sum. 382 STF: coabitacao nao indispensavel)
2. **Continuidade** (sem rupturas relevantes)
3. **Durabilidade** (tempo e prova, nao requisito quantitativo — REsp
   1.371.318/SP)
4. **Animus familiae** atual e mutuo (distincao com namoro qualificado —
   REsp 1.263.015/MG; 1.454.643/RJ)
5. **Ausencia de impedimentos** (CC 1.521; separacao de fato salva — 1.723 §1º)

### 3.2 Pedidos cumulaveis
- Reconhecimento + dissolucao da UE (termo inicial e final)
- Partilha (CC 1.725 + parcial supletiva salvo contrato) — 50% salvo prova
- Alimentos ao ex-companheiro (CC 1.724 + 1.694) — termo certo
- Alimentos filhos comuns (CC 1.694-1.710)
- Compensatorios (CC 1.694 §2º + Enunc. 573 CJF)
- Guarda compartilhada + convivencia (CC 1.583-1.589 + Lei 13.058/2014)
- Servicos domesticos — RESTRITIVO: STJ recusa em UE caracterizada (cabe so em
  concubinato — Sum. 380 STF)
- Uso do nome; dano moral por ilicito autonomo; averbacao em escritura/matriculas

### 3.3 Tutela de urgencia (CPC 300-301)
- Alimentos provisorios (Lei 5.478/68 art. 4º) com prova pre-constituida; sem
  prova → provisionais (CPC 300)
- Guarda provisoria (CC 1.585 + CPC 300); sequestro/arrolamento (CPC 301);
  indisponibilidade; afastamento (CC 1.562 OU LMP 22 II — LMP aplica a UE,
  Lei 11.340 5º III); sigilo LC 105/2001

### 3.4 Foro (P5 + CPC 53 I)
- Filho incapaz → guardiao · Sem incapaz → ultimo domicilio do casal · Nenhum
  residir la → reu · Vitima VD → domicilio da vitima. Vara: Familia e
  Sucessoes; Civel subsidiaria.

### 3.5 Modelo estrutural (FIRAC + placeholders)

```
EXCMO(A) JUIZ(A) DA ___ VARA DE FAMILIA E SUCESSOES — COMARCA DE {{CIDADE}}/{{UF}}

{{CLIENTE}}, qualificacao, por {{ADVOGADO_NOME}} (OAB/{{OAB_UF}} {{OAB_NUMERO}},
{{FIRM_NAME}}), proc. anexa, fundamento nos arts. 226 §3º CF; 1.723-1.727 CC;
53 I e 693-699 CPC, propor

  ACAO DECLARATORIA DE RECONHECIMENTO E DISSOLUCAO DE UNIAO ESTAVEL
  C/C PARTILHA, ALIMENTOS, GUARDA E CONVIVENCIA — com TUTELAS DE URGENCIA

em face de {{CONTRAPARTE}}, qualificacao.

I — FATOS (F)
1. UE em {{TERMO_INICIAL}} a {{TERMO_FINAL}}, 5 requisitos do 1.723 CC.
2. PUBLICIDADE: testemunhas; IRPF dependente; plano saude; previdencia
   beneficiario; redes sociais (ata notarial).
3. CONTINUIDADE: convivencia ininterrupta desde {{...}}; contas conjuntas;
   consumo no endereco comum.
4. ANIMUS FAMILIAE: projeto comum; filho(s) {{FILHO_1}} nasc. {{...}};
   planejamento patrimonial.
5. AUSENCIA IMPEDIMENTOS — CC 1.521 c/c 1.723 §1º. 6. Ruptura {{DATA_RUPTURA}}.
7. Bens onerosos: {{IMOVEIS}}, {{VEICULOS}}, {{PARTICIPACOES}}, {{ATIVOS}}.

II — DIREITO (I-R-A)
II.1 Reconhecimento — CC 1.723 + ADI 4.277/ADPF 132 (se homoafetiva).
II.2 Ausencia de impedimentos — CC 1.521 c/c 1.723 §1º.
II.3 Dissolucao em {{DATA_RUPTURA}}.
II.4 Partilha — CC 1.725 (parcial supletiva); CC 1.660/1.659.
II.5 Alimentos — filhos CC 1.694/1.703; companheiro CC 1.724 c/c 1.694 com
     termo certo (REsp 1.741.789/RJ).
II.6 Compensatorios — CC 1.694 §2º + Enunc. 573 CJF.
II.7 Guarda compartilhada — CC 1.584 §2º + Lei 13.058/2014.
II.8 Tutela (CPC 300) — probabilidade: docs; perigo: meios materiais e
     patrimonio.

III — PEDIDOS
a) TUTELA: provisorios; guarda provisoria; arrolamento (CPC 301); afastamento
   (CC 1.562 ou LMP 22 II); sigilo LC 105/2001.
b) Citacao para MEDIACAO/CONCILIACAO (CPC 695-696); contestacao 15 dias uteis
   (CPC 335 I + 697).
c) MERITO: c.1 RECONHECER UE em {{TERMO_INICIAL}} a {{TERMO_FINAL}}; c.2
   DISSOLUCAO; c.3 partilha 50% (CC 1.725 + 1.658); c.4 alimentos; c.5
   compensatorios; c.6 guarda compartilhada; c.7 convivencia; c.8 averbacao em
   escritura e matriculas; c.9 custas + honorarios (CPC 85).
d) Provas: documental, testemunhal, pericial, depoimento pessoal.
e) Inversao do onus (CPC 373 §1º). f) JG. g) Intimacoes em {{ADVOGADO_NOME}}.

Valor: R$ {{VALOR_CAUSA}} — liquido + 12 prestacoes (CPC 292 III).

{{CIDADE}}/{{UF}}, {{DATA}}. {{ADVOGADO_NOME}} — OAB/{{OAB_UF}} {{OAB_NUMERO}}
```

---

## 4. MODO AUTOR — Post Mortem (fins sucessorios)

### 4.1 Particularidades
- Polo passivo: **todos os herdeiros** (CC 1.829) — litisconsorcio
- Foro: ultimo domicilio do casal (STJ 2024 3ª T.)
- **Maior rigor probatorio** — falecido nao contradita. Docs: IRPF dependente,
  conta conjunta, plano saude, previdencia beneficiario, fotos/redes,
  testamento. Suspeicao de testemunhas com interesse (CPC 447 §3º)
- **Pleito reflexo INSS:** Lei 8.213/91 art. 16 §5º (Lei 13.846/2019) exige
  inicio de prova material

### 4.2 Pedidos
- Reconhecer a UE no periodo
- Habilitar sobrevivente no inventario (suspensao — CPC 313 V "a")
- Meacao + concorrencia sucessoria — **CC 1.829** (Tema 809 STF — RE 646.721 +
  878.694: CC 1.790 inconstitucional)
- **Direito real de habitacao** (CC 1.831 + Lei 9.278/96 art. 7º par. unico)

### 4.3 Reflexos (Tema 809 STF)
- Descendentes (CC 1.829 I): no regime parcial, interpretacao prevalente
  concorre so sobre particulares do falecido (REsp 1.368.123/SP; 1.382.170/SP).
  Divergencia entre Turmas — `[VERIFICAR]`.
- Ascendentes (CC 1.829 II) — sem distincao de regime.
- Heranca exclusiva na ausencia de descendentes/ascendentes (1.829 III).

---

## 5. MODO REU — Contestacao

### 5.1 Preliminares (CPC 337)
- Incompetencia relativa (CPC 64 + 53 I); inepcia (UE sem causa de pedir clara
  dos requisitos do 1.723); ilegitimidade (post mortem — todos herdeiros,
  litisconsorcio); falta de interesse; litispendencia / coisa julgada

### 5.2 Teses defensivas

| Tese | Fundamento |
|------|------------|
| Namoro qualificado | REsp 1.263.015/MG + 1.454.643/RJ — sem **animus familiae atual** |
| Descontinuidade | Rupturas reiteradas; convivencia intermitente |
| Ausencia de notoriedade | Relacao clandestina/oculta |
| UE paralela / concubinato impuro | REsp 1.949.890/SC + Tema 529 STF — sem UE simultanea sem separacao de fato; partilha so sob Sum. 380 STF em acao autonoma |
| Periodo controverso | Impugnar termo inicial/final — definem o acervo |
| Pacto separacao convencional | Pacto afasta comunicacao salvo prova de esforco comum |
| Bens incomunicaveis | CC 1.659 II/I/VI (Tema 1.063 STJ) |
| UE pre-1996 | Anteriores a Lei 9.278/96 exigem esforco comum (Sum. 380 STF — REsp 1.755.890/DF) |
| Servicos domesticos improcedente | Em UE, partilha ja cumpre — STJ rejeita |
| Inicio de prova material insuficiente | Lei 8.213/91 art. 16 §5º (reflexo INSS) |

### 5.3 Reconvencao (CPC 343)
- Partilha de bens nao arrolados; indenizacao uso exclusivo bem comum (REsp
  1.250.362/RS + Sum. 5 TJSP); reconhecimento com periodo menor / partilha
  restrita; alimentos compensatorios em favor do reu

---

## 6. JURISPRUDENCIA PARADIGMA

STF ADI 4.277 + ADPF 132 · Tema 809 (RE 878.694 + 646.721) · Tema 529 · Tema
1.236 · STJ REsp 1.949.890/SC · 1.263.015/MG · 1.454.643/RJ · 1.755.890/DF ·
1.371.318/SP · 1.096.324/RS · 1.382.170/SP + 1.368.123/SP · Sum. 382/380 STF ·
Enunc. 573 CJF.

## 7. SUMULA 380 STF — DISTINCAO

| Criterio | UE (CC 1.723) | Soc. fato (Sum. 380) |
|----------|---------------|----------------------|
| Natureza | Entidade familiar | Sociedade patrimonial |
| Animus | Constituir familia | Constituir patrimonio |
| Esforco comum | Presumido (1.725) | Necessario provar |
| Cabimento | Pos 1988/1996/2002 | Concubinato + UE pre-1996 |

## 8. P5 — FORO E VARA

Aplicar §3.4. Post mortem (sem incapaz): ultimo domicilio do casal (STJ 2024).
`[VERIFICAR]` se duvida (PA-11).

## 9. P4 — CRUZAMENTO MULTI-ESFERA

- UE × Sucessoes: Tema 809 — habilitar no inventario; suspensao (CPC 313 V "a")
- UE × Previdenciario: pleito INSS exige inicio de prova material (Lei
  13.846/2019); sentenca civel NAO vincula INSS
- UE × Criminal (LMP): art. 5º III aplica; afastamento via 22 II

## 10. P7 — REVISAO R1-R4

Acionar `revisao-final-familia` (R1/R2/R3/R4). R3 falho → cancelada (PA-25).

## 11. VEDACOES

- **PA-01:** sem juizo moral (EC 66/2010). **PA-06:** segredo CPC 189 II.
- **PA-13:** melhor interesse. **PA-19:** sem advocacia contra cliente.
- **PA-23:** anonimizacao em prints/exemplos.

## 12. RESSALVA OAB (PA-07)

> "Saida sujeita a revisao e responsabilidade tecnica do advogado com OAB
> ativa. Verifique vigencia das normas no peticionamento."
