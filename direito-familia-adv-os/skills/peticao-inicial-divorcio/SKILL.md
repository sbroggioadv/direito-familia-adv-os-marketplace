---
name: peticao-inicial-divorcio
description: >
  PETICAO INICIAL DIVORCIO — Skill Tier 2A side-aware da trilha T1 (divorcio
  litigioso). Opera MODO AUTOR (redige inicial cumulada com guarda, alimentos,
  partilha, uso do nome, tutela de urgencia) OU MODO REU (contestacao cruzada
  com preliminares, teses defensivas de regime/comunicabilidade/sub-rogacao
  e reconvencao quando cabivel). Le polo no CASO.md, aplica FIRAC, cumpre P1
  (vigencia), P2 (integridade CPC 320), P5 (foro CPC 53 I), P6 (side-awareness),
  P7 (R1-R4). Vedacao PA-01 (sem juizo moral — EC 66/2010 culpa-neutral) +
  PA-06 (segredo CPC 189 II) + PA-13 (melhor interesse). Acionada por
  triagem-familia em T1 OU pelo command /divorcio. Cita CC 1.571-1.582 +
  1.639-1.688, CPC 693-699, Lei 5.478/68, Lei 11.340, Lei 13.058/2014,
  Sumulas 277/358/377 STJ, 380/382 STF, Temas 809 e 1.236 STF. Encerra com
  ressalva OAB (PA-07).
---

# PETICAO INICIAL DIVORCIO (side-aware)

> Tier 2A · Trilha T1 — Divorcio litigioso. Opera autor (inicial cumulada) e
> reu (contestacao). Aciona `validador-legislacao-vigente` (P1) antes de citar
> norma e `revisao-final-familia` (P7) antes de entregar. Extrajudicial (Res. 35
> CNJ) fora de escopo.

---

## 1. SIDE-AWARENESS (P6 + PA-05)

Antes de produzir qualquer linha:
1. Abrir `<cwd>/direito-familia/casos/<slug>/CASO.md`
2. Ler **Polo do cliente** + **Tipo de acao** (T1) + **Foro/Vara**
3. Sem polo OU contradicao → **pare e pergunte**

| Polo | Modo |
|------|------|
| Autor / requerente | **MODO AUTOR** (§3) |
| Reu / requerido | **MODO REU** (§4) |

---

## 2. P1 + P2 — PREREQUISITOS

**P1 — Selo de Validacao Legal:** validador acionado para CC 1.571-1.582,
1.639-1.688; CPC 53/292/319/320/693-699; EC 66/2010; Lei 5.478/68; Lei
11.340/2006; Lei 13.058/2014; Sumulas 277/358 STJ, 377/380/382 STF; Temas 809,
1.236, 1.063. Sem Selo → sem peca (PA-03).

**P2 — Integridade Documental (CPC 320):**
- [ ] Certidao casamento (≤90d) com averbacao de regime
- [ ] RG/CPF/comprovante residencia + procuracao (CPC 105 + transigir)
- [ ] Certidao nascimento dos filhos (se houver)
- [ ] Pacto antenupcial (se houver)
- [ ] Matriculas (≤30d), CRLV, contratos sociais, extratos, PGBL/VGBL
- [ ] Holerites/IR ultimos 3 anos (CPC 396) de ambos
- [ ] Comprovantes despesas dos filhos
- [ ] Custas OU justica gratuita (CPC 98+99)

Documento essencial faltando → **NAO redige**. Lista pendencias.

---

## 3. MODO AUTOR — Inicial cumulada

### 3.1 Pedidos cumulaveis (CPC 327)
- Decretacao do divorcio (CF 226 §6º + EC 66/2010 + CC 1.571 IV + 1.580)
- Guarda compartilhada como regra (CC 1.583-1.584 + Lei 13.058/2014)
- Regulamentacao de convivencia (calendario ordinario + extraordinario)
- Alimentos para filhos (CC 1.694-1.710; Lei 5.478/68) — binomio
- Alimentos ao ex-conjuge transitorios (CC 1.694 + 1.708) — excepcionais
- Alimentos compensatorios (CC 1.694 §2º + Enunc. 573 CJF) — termo certo
- Partilha (CC 1.658-1.671 ou 1.687-1.688 ou Sum. 377 STF reinterpretada)
- Uso do nome de casado (CC 1.578) — manutencao e regra
- Dano moral so com ilicito autonomo (REsp 1.159.242/SP)
- Indenizacao por uso exclusivo de bem comum (REsp 1.250.362/RS + Sum. 5 TJSP)

### 3.2 Tutela de urgencia (CPC 300-301)

| Tutela | Base |
|--------|------|
| Alimentos provisorios | Lei 5.478/68 art. 4º + Sum. 277 STJ |
| Guarda provisoria | CC 1.585 + CPC 300 (PA-13) |
| Afastamento do lar civel | CC 1.562 + CPC 300 |
| Afastamento — LMP | Lei 11.340 art. 22 II + Lei 13.827/2019 (preferir em VD) |
| Sequestro / arrolamento | CPC 301 + 859 |
| Quebra sigilo banc./fiscal | LC 105/2001 |

### 3.3 Foro (P5 + CPC 53 I)
- Filho incapaz → foro do **guardiao**
- Sem incapaz → **ultimo domicilio do casal**
- Nenhum residir la → **domicilio do reu**
- Vitima de VD → **domicilio da vitima** (Lei 11.340 art. 15)

Vara: Familia e Sucessoes; Civel subsidiaria.

### 3.4 Valor da causa (CPC 292)
Patrimonio liquido a partilhar + 12 prestacoes mensais (CPC 292 III) +
parcela indenizatoria/compensatoria (se cumulada).

### 3.5 Modelo estrutural (FIRAC + placeholders)

```
EXCMO(A) JUIZ(A) DA ___ VARA DE FAMILIA E SUCESSOES DA COMARCA DE {{CIDADE}}/{{UF}}

(prioridade — CPC 1.048 se idoso/incapaz)

{{CLIENTE}}, qualificacao, por {{ADVOGADO_NOME}} (OAB/{{OAB_UF}} {{OAB_NUMERO}},
{{FIRM_NAME}}), proc. anexa (doc. 01), com fundamento nos arts. 226 §6º CF;
1.571 IV e 1.580 CC; 693-699 CPC, propor

  ACAO DE DIVORCIO LITIGIOSO C/C GUARDA, CONVIVENCIA, ALIMENTOS E
  PARTILHA DE BENS — com pedido de TUTELAS DE URGENCIA

em face de {{CONTRAPARTE}}, qualificacao.

I — FATOS (F)
1. Casamento em {{DATA_CASAMENTO}}, regime {{REGIME_BENS}} (doc. 02).
2. {{N_FILHOS}} filho(s) menor(es): {{FILHO_1}} nasc. {{DATA_NASC_1}} (doc. 03).
3. Separacao de fato em {{DATA_SEPARACAO}} — narrativa OBJETIVA (PA-01).
4. Patrimonio comum: {{IMOVEIS_MATRICULA}}, {{VEICULOS_RENAVAM}},
   {{PARTICIPACOES}}, {{ATIVOS}}, {{PREVIDENCIA_PRIVADA}}.
5. Situacao economica: rendimentos do alimentante; despesas dos filhos.

II — DIREITO (I-R-A por bloco FIRAC)
II.1 Divorcio direito potestativo — CF 226 §6º; CC 1.571 IV + 1.580; EC 66/2010.
II.2 Guarda compartilhada — CC 1.584 §2º; Lei 13.058/2014; lar referencia
     {{ENDERECO}} (CC 1.583 §3º).
II.3 Alimentos filhos — CC 1.694/1.703; triade necessidade × possibilidade ×
     proporcionalidade. Quantum: {{X}}% liquido OU R${{X}}. Memoria em tabela.
II.4 Alimentos compensatorios [se aplicavel] — CC 1.694 §2º + Enunc. 573 CJF
     + REsp 1.290.313/AL.
II.5 Partilha — regime {{REGIME}}; CC 1.658-1.666 OU 1.667 OU 1.687 OU 1.641
     + Sum. 377 STF reinterpretada (EREsp 1.623.858/MG); Tema 1.063 STJ.
II.6 Uso do nome — CC 1.578.
II.7 Tutelas (CPC 300) — probabilidade: docs pre-constituidos; perigo: cessacao
     dos meios materiais aos filhos; risco patrimonial/integridade.

III — PEDIDOS
a) TUTELA DE URGENCIA inaudita altera parte:
   (a.1) Alimentos provisorios R${{X}} ou {{Y}}% — Lei 5.478/68 art. 4º
   (a.2) Guarda provisoria compartilhada com referencial {{ENDERECO}}
   (a.3) Afastamento do reu — CC 1.562 + CPC 300 OU LMP art. 22 II
   (a.4) Arrolamento/indisponibilidade — CPC 301
   (a.5) Quebra sigilo banc./fiscal — LC 105/2001 [se indicios]
b) Citacao para AUDIENCIA DE MEDIACAO/CONCILIACAO (CPC 695-696, obrigatoria);
   nao havendo acordo, contestacao em 15 dias uteis (CPC 335 I + 697).
c) NO MERITO:
   c.1) Decretar o divorcio — averbacao (matricula {{N}})
   c.2) Guarda compartilhada — referencial {{ENDERECO}}
   c.3) Regulamentar convivencia (calendario doc.)
   c.4) Alimentos definitivos {{X}}
   c.5) Alimentos compensatorios {{Y}} [se aplicavel]
   c.6) Partilha — tornas em pecunia se houver
   c.7) Uso do nome — {{manter/perder}}
   c.8) Custas + honorarios (CPC 85)
d) Provas: documental, testemunhal, pericial contabil/avaliatoria, depoimento
   pessoal, ata notarial (Lei 8.935/94 + Prov. CNJ 100/2020).
e) Inversao do onus (CPC 373 §1º).
f) Justica gratuita [se cabivel] (CPC 98+99).
g) Intimacoes em {{ADVOGADO_NOME}}, OAB/{{OAB_UF}} {{OAB_NUMERO}}.

Valor da causa: R$ {{VALOR_CAUSA}} (CPC 292 III).

{{CIDADE}}/{{UF}}, {{DATA}}.

{{ADVOGADO_NOME}}
OAB/{{OAB_UF}} {{OAB_NUMERO}}
```

---

## 4. MODO REU — Contestacao cruzada

### 4.1 Preliminares (CPC 337)
- Incompetencia relativa (CPC 64 + 53 I)
- Inepcia (CPC 330)
- Falta de interesse processual
- Conexao com cautelar antecedente (CPC 55)
- Litispendencia / coisa julgada
- Impugnacao a JG do autor (CPC 100)
- Impugnacao ao valor da causa (CPC 293)

### 4.2 Teses de merito

| Tese | Fundamento |
|------|------------|
| Impugnacao ao regime | Pacto diverso; sub-rogacao CC 1.659 II (REsp 1.114.077/MG); separacao obrigatoria CC 1.641 + Sum. 377 STF reinterpretada (EREsp 1.623.858/MG) |
| Ausencia de comunicabilidade | Valores anteriores (1.659 I); heranca/doacao (1.659 I); indenizacao por dano pessoal; sub-rogacao |
| Onus da prova | Quem alega comunicabilidade prova (CPC 373 I); na separacao legal, autor prova esforco comum (Sum. 377 STF) |
| Necessidade/possibilidade nao comprovada | Quebra do binomio; capacidade laborativa; ausencia de prova de despesas; IR/contracheques do reu; outros dependentes |
| Improbidade alimentos compensatorios | Sem queda abrupta do padrao; patrimonio proprio do credor (REsp 1.741.789/RJ) |
| Indenizacao uso exclusivo bem comum | Sum. 5 TJSP + REsp 1.250.362/RS — em reconvencao |
| Dividas anteriores incomunicaveis | CC 1.659 III + 1.666 |

### 4.3 Reconvencao (CPC 343)
Capitulo proprio. Casos tipicos: alimentos compensatorios pelo reu; uso
exclusivo do bem; inversao da guarda; partilha quando autor pediu so divorcio;
dano moral por ilicito autonomo.

### 4.4 Estrutura
1. Enderecamento + qualificacao + ref. processo
2. PRELIMINARES (cada bloco com base CPC 337)
3. MERITO (impugnacao especificada — CPC 341 — ponto a ponto; FIRAC defensivo)
4. RECONVENCAO (CPC 343) se cabivel
5. PEDIDOS: rejeicao tutelas; improcedencia integral/parcial; provas;
   honorarios reu (CPC 85); JG se for o caso
6. Ressalva OAB

---

## 5. JURISPRUDENCIA PARADIGMA

- Sum. 277 STJ · Sum. 358 STJ · Sum. 377 STF (+ EREsp 1.623.858/MG +
  REsp 1.689.152/SC) · Sum. 380 STF · STF Tema 1.236 (ARE 1.309.642) ·
  STJ Tema 1.063 (REsp 1.024.169/RS) · REsp 1.114.077/MG · REsp 1.250.362/RS
  (+ Sum. 5 TJSP) · REsp 1.290.313/AL e 1.741.789/RJ · REsp 1.159.242/SP.

---

## 6. P5 — FORO E VARA

Aplicar §3.3. Sem regra local confirmada: `[VERIFICAR — vara/comarca]` (PA-11).
JVDFM (Lei 11.340 + 13.827/2019) so onde houver.

## 7. P4 — CRUZAMENTO MULTI-ESFERA

- Familia × Criminal (LMP): afastamento via LMP superior; BO + medidas JVDFM em
  paralelo (encaminhar criminalista — PA-17).
- Familia × Sucessoes: conjuge em interim mantem meacao/heranca (CC 1.829 +
  Tema 809 STF aplica analogamente).
- Familia × Previdenciario: pensao/auxilio altera capacidade.

## 8. P7 — REVISAO R1-R4

Acionar `revisao-final-familia`:
- R1 Brief: objetivo, pedidos cumulaveis, valor da causa, FIRAC presente
- R2 Conteudo: fatos objetivos (PA-01), subsuncao logica, memoria de calculo
- R3 Compliance: PA-01/06/13, Selo P1, polo (P6), foro (P5), docs (P2)
- R4 Performance: persuasiva, tom adaptado, ressalva OAB

Veredito APROVADA / REVISAR / BLOQUEADA. R3 falho → cancelada.

## 9. VEDACOES

- **PA-01:** sem qualificativos morais. Excecao tecnica: compensatorios podem
  citar desequilibrio economico como fato objetivo.
- **PA-06:** segredo de justica (CPC 189 II).
- **PA-13:** melhor interesse da crianca prevalece mesmo contra cliente.
- **PA-19:** sem advocacia contra cliente.
- **PA-23:** anonimizacao em exemplos/prints.

## 10. RESSALVA OAB (PA-07)

> "Saida operacional sujeita a revisao e responsabilidade tecnica do advogado
> com OAB ativa. Verifique vigencia das normas no ato do peticionamento."
