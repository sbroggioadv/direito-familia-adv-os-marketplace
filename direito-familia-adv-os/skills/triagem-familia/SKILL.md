---
name: triagem-familia
description: >
  TRIAGEM FAMILIA — Skill Tier 0, porta de entrada de todo caso de direito de familia judicial. Triagem-by-conversation: o operador descreve o caso em linguagem natural; a skill faz perguntas direcionadas para classificar a demanda em uma das 11 trilhas (T1 divorcio litigioso, T2 UE judicial, T3 fixacao alimentos, T4 revisional/exoneracao, T5 execucao alimentos, T6 guarda originaria, T7 modificacao de guarda, T8 alienacao parental, T9 inventario judicial, T10 recurso, T11 tutela de urgencia). PERGUNTA o polo do cliente, identifica cruzamento multi-esfera (Maria da Penha, ECA, sucessoes, previdenciario, tributario), grava no CASO.md e dispara o pipeline. Use no inicio de qualquer demanda familiar, caso novo, ou quando o usuario disser triagem, /triagem-familia, /triagem, analisar caso familia.
---

# TRIAGEM FAMILIA

> Skill **Tier 0** — porta de entrada. Triagem-by-conversation: classifica caso em T1-T11, lê polo do cliente, abre o CASO.md compartimentado e dispara o pipeline. Acionada logo apos a `familia-master`.

---

## 0. ESCOPO E ACIONAMENTO

Primeira skill a rodar em qualquer demanda familiar. Acionada por `familia-master`, `/triagem-familia`, `/triagem`, `/caso-familia`. Encerra no **Checkpoint 1** do pipeline. Escopo: contencioso JUDICIAL — extrajudicial (Res. 35 CNJ) sai com aviso "fora de escopo deste plugin; ver outro produto".

## 1. POSICAO NA ORQUESTRA

```
familia-master  ->  TRIAGEM-FAMILIA  ->  CHECKPOINT 1
                                     ->  localizacao-vara-familia + memoria-de-caso-familia (paralelo)
```

A triagem entrega: trilha (T1-T11) classificada, polo do cliente confirmado, partes, foro alvo, lista P2 de documentos necessarios, cruzamento multi-esfera mapeado, **CASO.md aberto**. Sem isso, nenhuma skill de producao avanca.

---

## 2. APRESENTACAO INICIAL

> "Vou te ajudar a classificar o caso e abrir a pasta no padrao IA Combativa Adv-OS. Em direito de familia, o plugin atende **CONTENCIOSO JUDICIAL** — divorcio litigioso, UE judicial, alimentos, guarda, alienacao parental, inventario judicial, tutelas e recursos. Extrajudicial (cartorio Res. 35 CNJ) esta fora deste plugin.
>
> Me descreve o caso em linguagem natural — quem e o cliente, o que ele quer, qual e a situacao. Eu te faco perguntas direcionadas para classificar corretamente em uma das 11 trilhas."

---

## 3. AS 11 TRILHAS

| # | Trilha | Quando classifica aqui |
|---|--------|------------------------|
| T1 | Divorcio litigioso | Casamento civil + dissolucao com conflito |
| T2 | UE judicial | UE a reconhecer/dissolver judicialmente (inclui post mortem) |
| T3 | Fixacao de alimentos | Pedido originario (provisorios/definitivos/gravidicos/compensatorios/transitorios/avoengos/universitario) |
| T4 | Revisional/exoneracao | Ja ha sentenca; muda binomio (revisional) ou cessa (exoneracao) |
| T5 | Execucao de alimentos | Inadimplemento — CPC 528 prisao (Sum. 309) ou §8º penhora; Tema 1.137 CNH/passaporte; Tema 1.230 salario |
| T6 | Guarda originaria | Definicao inicial — compartilhada (REsp 1.591.518), unilateral, alternada |
| T7 | Modificacao de guarda | Ja ha guarda; fato superveniente (rebus sic stantibus) |
| T8 | Alienacao parental | Lei 12.318/2010; 7 medidas escalonadas; pericia 90d |
| T9 | Inventario judicial | ITCMD (pos LC 227/2026); criptoativos (REsp 2.124.424); holding (REsp 2.139.412) |
| T10 | Recurso | ED, AI (CPC 1.015 + Tema 988), apelacao, REsp, RE, agravo interno, contrarrazoes |
| T11 | Tutela de urgencia | Alimentos provisorios, guarda provisoria, busca apreensao (Conv. Haia), afastamento (Lei 11.340 art. 22 III), sequestro, suspensao poder familiar |

Trilhas **cumulam**: ex. T1+T3+T6 (divorcio com filhos menores e alimentos).

---

## 4. BATERIA DE PERGUNTAS DIRECIONADAS

Apos a descricao livre do operador, fazer **perguntas-chave** (uma a uma ou agrupadas):

### Q1 — Polo do cliente (variavel-mae — PA-05)
> "Qual e o lado do seu cliente nesta acao?
> 1. **Autor / requerente** (quem propoe)
> 2. **Reu / requerido** (quem se defende)
> 3. Em alimentos: **alimentante** (paga) ou **alimentando** (recebe)?
> 4. Em guarda: **guardiao atual** ou **nao-guardiao** que reivindica?
> 5. Em alienacao parental: **vitima** (genitor afastado) ou **acusado** de alienar?
> 6. Em Maria da Penha (paralelo): **vitima** ou **acusado**?"

A resposta vai para o campo `Polo do cliente` no CASO.md. **Sem polo, nao avancar.** Em consulta pre-contratual sem polo definido, registrar `polo: a definir` e tratar como consultivo ate definicao.

### Q2 — Estado civil / vinculo
> "O vinculo entre as partes e: (a) casamento civil, (b) uniao estavel, (c) ja dissolvido — guarda/alimentos pos-divorcio, (d) so filiacao (sem vinculo conjugal), (e) sucessao (falecido)?"

### Q3 — Filhos menores ou incapazes?
> "Ha filhos menores de 18 ou pessoa com deficiencia? Idade(s)? **(gatilho para guarda + alimentos + supraprincipio melhor interesse PA-13 + oitiva especializada Lei 13.431/2017 PA-14 + tom acolhedor reforcado)**"

### Q4 — Pedido patrimonial?
> "Ha bens a partilhar / patrimonio comum? Imoveis, veiculos, contas, investimentos, criptoativos, quotas de empresa? **(gatilho para partilha; criptoativos => REsp 2.124.424; quotas => possivel cruzamento societario)**"

### Q5 — Violencia domestica? **(gatilho P4 + PA-16 LGPD reforcada)**
> "Ha relato de violencia domestica (fisica / psicologica / moral / patrimonial / sexual)? Ja existe BO? Medida protetiva deferida? **Atencao: dado sensivel — sigilo do endereco da vitima absoluto, dom processual = endereco do advogado CPC 77 V.**"

### Q6 — Foro / cidade
> "Cidade e UF de: (a) cliente atual, (b) contraparte, (c) menor (se houver), (d) ultimo domicilio do falecido (se inventario)? **(Protocolo P5 — define foro e vara especializada).**"

### Q7 — Ja existe processo?
> "Ja ha processo em curso? Numero CNJ, vara, fase atual? Audiencia designada? **(distingue T1-T9 originarias de T4/T7 revisionais e T10 recurso).**"

### Q8 — Recurso?
> "Ha decisao desfavoravel para impugnar? (a) decisao interlocutoria sobre tutela / alimentos / guarda — **AI CPC 1.015 + Tema 988 taxatividade mitigada**; (b) sentenca — **apelacao 15d**; (c) acordao TJ — **REsp/RE 15d**; (d) decisao monocratica em recurso — **agravo interno 15d**; (e) sentenca obscura/omissa — **ED 5d interruptivo**. **(gatilho T10).**"

### Q9 — Tutela de urgencia necessaria?
> "Ha urgencia hoje? (a) alimentos imediatos — Lei 5.478 art. 4º initio litis; (b) guarda provisoria; (c) busca e apreensao de menor; (d) afastamento do lar; (e) sequestro patrimonial; (f) suspensao poder familiar. **(gatilho T11 — paralelo a outra trilha).**"

### Q10 — Conflict-of-interest (PA-19)
> "O escritorio ja atende ou ja atendeu alguma das partes adversas? **(se sim, NAO PROSSEGUIR — PA-19 sem advocacia contra cliente).**"

---

## 5. CLASSIFICACAO E P4 — CRUZAMENTO MULTI-ESFERA

Apos as respostas, classificar em uma ou mais trilhas e detectar cruzamento:

- **Familia × Criminal** (Maria da Penha / Henry Borel) — peca de familia + tutela afastamento (Lei 11.340 art. 22 III — INCLUSO no plugin) + sinalizar encaminhamento criminalista
- **Familia × ECA infracional** — sinalizar encaminhamento + interface Vara da Infancia
- **Familia × Sucessoes** — T9 cobre interface basica; holding complexa => encaminhar tributarista
- **Familia × Previdenciario** (pensao por morte / BPC) — encaminhar previdenciarista
- **Familia × Tributario** (ITCMD complexo / holding) — `itcmd-calculo` cobre basico
- **Familia × Trabalhista** (acidente do alimentante) — encaminhar trabalhista

Encaminhamentos sao **genericos** (PA-17) — sem nome de produto.

---

## 6. ABERTURA OU RETOMADA DO CASO

- **Caso novo:** acionar `memoria-de-caso-familia` para criar `<cwd>/direito-familia/casos/<caso-slug>/CASO.md` (compartimentado — PA-21) + `partes.md` + `docs/` (gitignored) + `pecas/` (gitignored).
- **Caso existente:** localizar a pasta, ler o CASO.md, retomar de onde parou.
- O `<caso-slug>` segue convencao `<trilha>-<sufixo-anonimo>` (ex: `t1-divorcio-001`, `t3-alimentos-002`) — **sem nome real** (PA-23).

## 7. CHECKLIST P2 — DOCUMENTOS NECESSARIOS

Apos classificar a trilha, listar **checklist P2 de documentos** correspondente (ver `PROTOCOLOS-TECNICOS.md` §P2):
- T1 Divorcio: certidao casamento, RG/CPF, certidao nascimento filhos, residencia, patrimoniais, holerite/IR
- T2 UE: prova convivencia, testemunhas (2+), patrimoniais
- T3 Alimentos: certidao nascimento alimentando, comprovacao necessidade + capacidade
- T7 Modificacao guarda: sentenca anterior + **prova do fato superveniente**
- T8 AP: mensagens, gravacoes (STJ admite), historico descumprimento
- T9 Inventario: certidao obito, certidoes herdeiros, patrimoniais, negativas, testamento

**Documento essencial faltando => listar pendencias, NAO redigir peca.**

## 8. P5 — LOCALIZACAO E VARA

Definir foro segundo CPC 53 / 46 / 48 + 1.785 (ver PROTOCOLOS-TECNICOS §P5):
- Alimentos => foro do alimentando (CPC 53 II)
- Familia geral c/ filho => foro do guardiao ou menor
- Divorcio sem filho => foro do reu (CPC 46)
- Inventario => ultimo domicilio do falecido (CPC 48)
- Maria da Penha => JVDFM da comarca onde houver

Marcar `[VERIFICAR — vara/comarca]` se duvida. Em ITCMD, capturar Estado (LC 227/2026 — aliquotas variam).

---

## 9. CHECKPOINT 1

Ao final, apresentar ao advogado:

```
TRIAGEM CONCLUIDA — CHECKPOINT 1

Trilha(s): <T1, T3, T6 ...>
Polo do cliente: <autor / reu / alimentante / alimentando / guardiao / nao-guardiao / vitima / acusado>
Partes (anonimas): cliente <X> × contraparte <Y>
Foro alvo: <vara, comarca, UF>
Cruzamento multi-esfera: <familia × criminal MP / familia × ECA / familia × sucessoes / ...>
Vulnerabilidade especial: <menor / idoso / PCD / vitima VD / nenhuma>
Documentos pendentes (P2): <lista>
Tutela de urgencia necessaria: <sim — qual / nao>
CASO.md: aberto em <cwd>/direito-familia/casos/<slug>/

Confirma estes dados para eu avancar (localizacao + memoria-de-caso em paralelo)?
```

No modo `--continuo`, registrar e seguir sem parar.

---

## 10. VEDACOES ESPECIFICAS

- **PA-05** — nunca prosseguir sem polo definido (ou explicitamente "a definir").
- **PA-19** — se ha conflito de interesse com a contraparte, ABORTAR triagem.
- **PA-21** — cada caso em sua propria pasta; nao misturar dados de casos diferentes.
- **PA-23** — usar slug anonimo no nome da pasta; NUNCA nome real do cliente/menor.
- **PA-13/14** — caso com menor => tom acolhedor reforcado + lembrar oitiva especializada.
- **PA-16** — caso com vitima de VD => sigilo do endereco absoluto; usar `[ENDERECO PROTEGIDO]`.

## 11. INTEGRACAO

Acionada por: `familia-master`, `/triagem-familia`. Aciona: `memoria-de-caso-familia`. Entrega para: `localizacao-vara-familia` + `validador-legislacao-vigente` + `cruzamento-multi-esfera` (Tier 1 paralelos), depois Tier 2-6 conforme trilha.
