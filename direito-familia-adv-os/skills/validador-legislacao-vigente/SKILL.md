---
name: validador-legislacao-vigente
description: >
  VALIDADOR LEGISLACAO VIGENTE — Skill Tier 1 critica. Executa o Protocolo P1
  (Camada 2): Selo de Validacao Legal Previa. Antes de qualquer producao,
  confere vigencia de cada norma a ser citada (CC, CPC, Lei especial, Sumula,
  Tese) no ANO DO FATO GERADOR do caso. Detecta normas REVOGADAS comuns
  (Lei 8.971/94 pra UE, Sum. 358 pre-2005, separacao judicial pre EC 66/2010) e
  alteracoes 2024-2026 (LC 227/2026 ITCMD pos EC 132/2023, Lei 14.994/2024 e
  14.550/2023 Maria da Penha, Res. 226/2024 e 571/2024 CNJ, Tema 1.137 STJ
  CNH/passaporte em alimentos, REsp 2.124.424/2025 inventariante digital).
  Carimba Selo data + escopo. Em duvida, marca [VERIFICAR] e ABORTA producao
  sem Selo. Quando disponiveis, usa WebFetch contra planalto.gov.br,
  stj.jus.br, stf.jus.br, cnj.jus.br. Sem Selo, sem peca.
---

# VALIDADOR LEGISLACAO VIGENTE

> Skill **Tier 1** critica. Executa o **Protocolo P1** da Camada 2: Selo de
> Validacao Legal Previa. **Sem Selo, sem entrega.** Plugin abre mao da peca
> antes de citar norma errada.

---

## 0. ESCOPO E ACIONAMENTO

Acionada por **toda** skill produtora antes de redigir, e por toda skill que
cite norma (sumula, tese, artigo). Tambem acionada explicitamente via
`/validar-legislacao` quando o operador quer conferir uma lista.

Sem ela, nenhuma producao do plugin sai com Selo — e sem Selo, R3 da Suprema
Corte BLOQUEIA a entrega.

## 1. POSICAO NA HIERARQUIA

Camada 2 — Protocolo P1. Vence Camadas 3 e 4 e instrucao do usuario. Se o
operador disser "redija assim mesmo, sem checar Sumula", a skill responde:
"Nao posso entregar sem Selo — peca volta sem fundamento ou abortamos."

## 2. CHECKLIST DE VIGENCIA — PASSO A PASSO

Para **cada norma** que vai entrar na peca:

1. **Identificar** — citar diploma + artigo + paragrafo/inciso/alinea
   (ex: "CC art. 1.694 §2º").
2. **Datar o fato gerador** — o caso aconteceu quando? (ex: divorcio com fato
   gerador em 09/2023 → norma precisa estar vigente em 09/2023).
3. **Conferir vigencia no momento** — a norma estava em vigor naquela data?
4. **Conferir vigencia atual** — a norma continua valendo hoje? Foi
   revogada/alterada por norma posterior?
5. **Para sumulas/teses:** confirmar entendimento dominante atual; conferir se
   ha tese repetitiva (CPC 1.036) ou repercussao geral (CPC 1.035) que
   superou/alterou o paradigma.
6. **Marcar resultado:**
   - **OK** — vigente, escopo confirmado → carimba no Selo.
   - **[VERIFICAR]** — duvida razoavel → marca na peca; abortar Selo.
   - **REVOGADA / SUPERADA** — usar a norma sucessora; se nao houver, retirar
     o argumento.

## 3. BASES NORMATIVAS DO PLUGIN

Mapeadas no `EXECUTIVE-SUMMARY.md` da deep research. Resumo operacional:

### Diplomas principais
- **CC** Livro IV (1.511-1.783) — casamento, regime de bens, UE, alimentos,
  guarda, poder familiar, filiacao
- **CC** Livro V (1.784-2.027) — sucessoes (interface com inventario)
- **CPC** (Lei 13.105/2015) — arts. 53, 189, 292, 294-311, 464-480, 477, 528,
  610-673, 693-699, 1.009-1.043
- **EC 66/2010** — divorcio direto culpa-neutral
- **EC 132/2023 + LC 227/2026** — Reforma Tributaria, ITCMD (vigente 13/01/2026)

### Leis especiais
- **Lei 5.478/1968** — Lei de Alimentos
- **Lei 11.804/2008** — Alimentos Gravidicos
- **Lei 12.318/2010** — Alienacao Parental
- **Lei 13.058/2014** — Guarda Compartilhada como regra
- **Lei 13.146/2015** — LBI (PCD, curatela, TDA)
- **Lei 13.431/2017** — Escuta e depoimento especiais de crianca/adolescente
- **Lei 11.340/2006** — Maria da Penha (+ alteracoes 14.550/2023 + 14.994/2024)
- **Lei 14.344/2022** — Henry Borel
- **Lei 8.069/1990** — ECA

### Resolucoes CNJ / CFP
- **Res. 299/2019 CNJ** — depoimento especial
- **Res. 226/2024 CNJ** — escuta especializada (NOVA — sempre verificar)
- **Res. 571/2024 CNJ** — inventario (NOVA — sempre verificar)
- **Res. 008/2010 CFP** — limites do psicologo perito

## 4. NORMAS REVOGADAS / SUPERADAS — DETECCAO ATIVA

Erro comum que esta skill **bloqueia automaticamente**:

| Citar | Erro | Substituir por |
|-------|------|----------------|
| Lei 8.971/1994 (UE) | REVOGADA pela Lei 9.278/1996 e absorvida pelo CC 1.723-1.727 | CC 1.723-1.727 |
| Lei 9.278/1996 (UE) | Em parte absorvida pelo CC 1.723 | CC 1.723-1.727 |
| Separacao judicial pre EC 66/2010 | Discutida; EC 66 eliminou requisito temporal e culpa-neutral | Divorcio direto CC 1.571 + EC 66/2010 |
| Sumula 358 STJ pre-2005 | Atualizada — exige contraditorio apos maioridade | Sum. 358 STJ atual |
| Lei 6.515/1977 (Divorcio) | Em parte revogada/absorvida pelo CC 2002 + EC 66 | CC 1.571 e seguintes |
| ITCMD pre-EC 132/2023 | Mudou aliquota maxima e progressividade obrigatoria | EC 132/2023 + LC 227/2026 + lei estadual |

Sempre que o operador citar uma destas, a skill alerta: "Norma desatualizada.
Substituir por [X]."

## 5. NOVIDADES 2024-2026 (CONFERIR ATIVAMENTE)

Diferencial comercial do plugin — atualizacao recente que mercado tem pouco
material. **Conferir sempre:**

| Item | Conteudo | Onde aparece |
|------|----------|--------------|
| **LC 227/2026** (vigente 13/01/2026) | ITCMD pos EC 132/2023 — progressividade obrigatoria, base minima Tema 837 STF, regras de planejamento | Skill `itcmd-calculo`, `inventario-judicial` |
| **Lei 14.994/2024** | Alteracoes Maria da Penha | `tutela-patrimonio-familia`, `peticao-inicial-divorcio` com VD |
| **Lei 14.550/2023** | Alteracoes Maria da Penha (medidas protetivas urgentes) | idem |
| **Res. 226/2024 CNJ** | Escuta especializada de crianca | `guarda-originaria`, `modificacao-guarda`, `alienacao-parental` |
| **Res. 571/2024 CNJ** | Inventario | `inventario-judicial` |
| **Tema 1.137 STJ (2026)** | CNH e passaporte como medida coercitiva em alimentos | `execucao-alimentos` |
| **REsp 2.124.424/2025** | Inventariante digital — criptoativos em inventario | `inventario-judicial` |
| **REsp 2.139.412/2025** | Holding patrimonial — desmonte de planejamento ITCMD | `itcmd-calculo`, encaminhamento generico |
| **REsp 2.108.750/2024** | Inversao precipitada de guarda — limita uso abusivo da Lei 12.318 | `alienacao-parental` |

**Em caso de duvida sobre publicacao ou alteracao posterior** → marcar
`[VERIFICAR — atualizacao recente <ano>]` e ABORTAR Selo.

## 6. USO DE WebFetch / WebSearch (QUANDO DISPONIVEL)

Quando o ambiente tem `WebFetch` ou `WebSearch` habilitado, a skill consulta
fontes oficiais para confirmar vigencia:

- `https://www.planalto.gov.br/` — texto oficial das leis (com remissoes
  "(Revogado pela...)" / "(Redacao dada pela...)")
- `https://www.stj.jus.br/` — sumulas e teses repetitivas
- `https://portal.stf.jus.br/` — repercussao geral, ADIs, sumulas
- `https://www.cnj.jus.br/` — resolucoes

**Regra:** WebFetch eh apoio, nao substitui o checklist humano. Se a fonte
estiver fora do ar, marcar `[VERIFICAR]` e abortar Selo.

Quando WebFetch nao esta disponivel, a skill trabalha exclusivamente com a base
da deep research mais o conhecimento documentado nesta skill — qualquer norma
fora desse perimetro vira automaticamente `[VERIFICAR]`.

## 7. FORMATO DO SELO

Carimbo padrao no rodape da fundamentacao (antes da ressalva OAB):

```
═══════════════════════════════════════════
SELO DE VALIDACAO LEGAL PREVIA — P1
Data de validacao: AAAA-MM-DD
Fato gerador do caso: AAAA-MM (mes/ano)
Normas confirmadas:
  - CC art. 1.694 §1º — vigente, sem alteracao
  - CPC art. 528 §3º (prisao civil) — vigente
  - Sumula 309 STJ — vigente, dominante
  - LC 227/2026 — vigente 13/01/2026, aplicavel
  - Tema 1.137 STJ — paradigma 2026, aplicavel
Itens marcados [VERIFICAR]:
  - <nenhum> OU
  - <listar com motivo>
Escopo: <tipo da peca> | Polo: <autor/reu/etc.>
═══════════════════════════════════════════
```

Sem este Selo, a producao **nao sai**.

## 8. ABORTO POR DUVIDA — POLITICA DURA

Se houver **qualquer duvida** sobre vigencia, a skill:

1. Lista os pontos `[VERIFICAR]` em mensagem ao operador.
2. **Nao carimba Selo.**
3. Devolve ao Tier 2-6 acionante com: "Producao abortada — confirmar vigencia
   antes de prosseguir."
4. Sugere acao: consultar planalto.gov.br / stj.jus.br / advogado especialista
   na materia.

Plugin **prefere abortar a entregar peca com norma incerta**. PA-03.

## 9. VEDACOES ESPECIFICAS

- **PA-03** — sem Selo, sem entrega.
- **PA-04** — usar versao atualizada pos LC 227/2026 / pos Lei 14.994/2024 /
  pos Res. 226/2024 CNJ.
- **PA-08** — prazos recursais corretos (ED 5d uteis; AI/Apelacao/REsp/RE/EmbDiv/
  Agravo Interno 15d uteis; contestacao familia 15d apos audiencia mediacao
  CPC 697; replica 15d).
- Skill **nao inventa norma** nem assume vigencia por familiaridade. Em duvida,
  aborta.

## 10. INTEGRACAO

Acionada por: toda skill Tier 2-6 antes de redigir; `revisao-final-familia` R3
(Compliance) reverifica se o Selo carimbado bate com as normas citadas. O
`familia-master` injeta o lembrete do P1 no inicio de cada sessao.
