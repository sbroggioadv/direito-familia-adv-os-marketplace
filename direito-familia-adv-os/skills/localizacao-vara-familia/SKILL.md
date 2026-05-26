---
name: localizacao-vara-familia
description: >
  LOCALIZACAO VARA FAMILIA — Skill Tier 1. Executa o Protocolo P5 da Camada 2.
  Define foro, vara competente e Estado para fins de ITCMD ANTES de qualquer
  redacao. Aplica regras de competencia: familia geral foro do guardiao (CPC
  53 I), alimentos foro do alimentando (CPC 53 II protetivo), divorcio sem
  filho menor foro do reu (CPC 46), inventario ultimo domicilio do falecido
  (CPC 48 + CC 1.785), Maria da Penha JVDFM da comarca. Vara de Familia
  (especializada) onde houver; Vara Civel onde nao houver; Vara dos Orfaos em
  algumas comarcas para inventario. Mantem tabela ITCMD 2026 por UF
  (SP/RJ/MG/RS/SC/GO/outros) com base em EC 132/2023 + LC 227/2026. Aciona
  Conv. Haia 1980 em subtracao internacional (PA-12). Sem regra local
  confirmada, marca `[VERIFICAR — vara/comarca]` ou `[VERIFICAR — aliquota
  estadual]` (PA-09 + PA-11). Capta cidade, UF, ultimo domicilio e dados de
  domicilio para gravar no CASO.md.
---

# LOCALIZACAO VARA FAMILIA

> Skill **Tier 1**. Executa o **Protocolo P5** da Camada 2. Sem foro e vara
> definidos, **nenhuma peca eh redigida**.

---

## 0. ESCOPO E ACIONAMENTO

Acionada por:
- `triagem-familia` na abertura — define foro inicial e Estado.
- Toda skill produtora que precise de enderecamento (peticao inicial,
  contestacao, tutela, recurso).
- `itcmd-calculo` para definir aliquota estadual.
- `revisao-final-familia` R3 (Compliance) — confere coerencia.

## 1. POSICAO NA HIERARQUIA

Camada 2 — Protocolo P5. Aplicacao obrigatoria. Sem foro/vara, R3 BLOQUEIA
entrega.

## 2. CAMPOS A CAPTURAR

A skill captura e grava no `CASO.md`:

| Campo | Quando colher | Fonte |
|-------|---------------|-------|
| Cidade + UF do cliente | Sempre | Persona / triagem |
| Cidade + UF da contraparte | Sempre que conhecido | Triagem |
| Cidade + UF do domicilio do casal | Quando relevante (divorcio, UE) | Triagem |
| Cidade + UF do menor | Em guarda/alimentos/AP | Triagem |
| Ultimo domicilio do falecido | Em inventario | Triagem |
| UF de tramitacao | Sempre | Resultado da skill |

## 3. REGRAS DE COMPETENCIA (FORO)

| Acao | Foro competente | Base legal |
|------|-----------------|------------|
| **Familia geral (regra)** | Foro do guardiao | CPC 53 I |
| **Familia geral (alternativa protetiva)** | Foro do menor | CPC 53 II + Sum. 383 STJ |
| **Alimentos** (fixacao/revisional/exoneracao/execucao) | **Foro do alimentando** | CPC 53 II (regra protetiva) |
| **Divorcio sem filho menor** | Foro do reu | CPC 46 |
| **Divorcio com filho menor** | Foro do guardiao/menor | CPC 53 I/II |
| **Reconhecimento + dissolucao UE** | Foro do reu (regra) ou foro de eleicao | CPC 46 + analogia CPC 53 |
| **Inventario judicial** | Foro do **ultimo domicilio do falecido** | CPC 48 + CC 1.785 |
| **Modificacao de guarda** | Foro do guardiao atual | CPC 53 I |
| **Alienacao parental** | Foro do menor | Lei 12.318 art. 4º + CPC 53 II |
| **Maria da Penha (medidas protetivas)** | **JVDFM** da comarca | Lei 11.340 arts. 14-15 |
| **Busca e apreensao de menor (nacional)** | Foro do menor | CPC 53 II |
| **Subtracao internacional** | Justica Federal — Convencao da Haia 1980 | PA-12 |

## 4. VARA COMPETENTE

| Comarca tem | Vara | Materias |
|-------------|------|----------|
| Vara de Familia especializada | **Vara de Familia** | Todas de familia |
| Sem Vara de Familia | **Vara Civel** | Familia tramita por residual |
| Vara dos Orfaos e Sucessoes (algumas comarcas) | **Vara dos Orfaos** | Inventario, curatela, tutela |
| Sem Vara dos Orfaos | Vara de Familia ou Vara Civel | Inventario tramita ali |
| Comarca com JVDFM | **Juizado de Violencia Domestica e Familiar contra a Mulher** | Medidas protetivas, crime em VD |
| Comarca sem JVDFM | Vara Criminal + Vara de Familia | Por competencia residual |

Sem confirmacao da organizacao judiciaria local → marcar
`[VERIFICAR — vara/comarca]`.

## 5. ESTADO PARA ITCMD — TABELA 2026

Aliquotas estaduais para inventario judicial (causa mortis e doacoes).
**Sempre confirmar com `validador-legislacao-vigente` pos LC 227/2026** —
progressividade tornou-se obrigatoria pela EC 132/2023.

| UF | Aliquota 2026 | Observacao |
|----|---------------|------------|
| **SP** | 4% fixo (em transicao para progressivo pos LC 227/2026 + lei estadual) | Confirmar lei estadual paulista pos-2026 |
| **RJ** | 4% a 8% progressivo (Lei 7.174/2015) | Tem progressividade |
| **MG** | 3% a 8% progressivo | Tem progressividade |
| **RS** | 3% a 6% progressivo | Confirmar atualizacao 2026 |
| **SC** | 1% a 8% progressivo | Tem progressividade |
| **GO** | 2% a 8% progressivo | Tem progressividade |
| **PR** | Progressivo (confirmar lei estadual) | `[VERIFICAR — aliquota estadual]` |
| **BA / PE / CE / outros NE/N/CO** | Variavel | `[VERIFICAR — aliquota estadual]` |
| **DF** | Confirmar | `[VERIFICAR]` |

**Regra dura:**
- Sem UF confirmada → `[VERIFICAR — aliquota estadual]`.
- Pos LC 227/2026 (vigente 13/01/2026) → progressividade obrigatoria; UF que
  ainda nao adaptou lei estadual → flag de transicao.
- Base de calculo: valor de mercado / venal de referencia + Tema 837 STF.

Detalhamento operacional fica em `itcmd-calculo` (Tier 6).

## 6. CONVENCAO DA HAIA 1980 — SUBTRACAO INTERNACIONAL DE MENOR

Quando ha elemento internacional (genitor estrangeiro, menor levado para outro
pais, retencao em territorio estrangeiro):

1. **Competencia federal** — pedido de retorno tramita na Justica Federal
   (autoridade central: SDH/MJ; cooperacao internacional Conv. Haia 1980).
2. Plugin **sinaliza encaminhamento** — caso atipico, exige especializacao em
   direito internacional privado.
3. Skill `tutela-patrimonio-familia` (sub-rotina busca e apreensao) cobre o
   componente nacional (busca e apreensao em territorio brasileiro).
4. PA-12 — sempre apontar a Convencao quando ha elemento internacional.

## 7. REGRAS LOCAIS DE PAUTA / PLANTAO

Algumas Varas de Familia tem regras especificas (pauta de audiencias, mutirao,
plantao de tutelas). Sem regulamento confirmado:

- Marcar `[VERIFICAR — regulamento da comarca]`.
- Em urgencia: orientar consulta direta a secretaria da vara.

## 8. CAMPOS GERADOS NO CASO.md

Apos rodar, a skill grava (ou atualiza):

```markdown
## Localizacao processual (P5)
- Cidade do cliente: {{CIDADE}}/{{UF}}
- Cidade da contraparte: <cidade>/<UF> | [VERIFICAR]
- Domicilio do menor: <cidade>/<UF>
- Foro competente: Comarca de <comarca>, <UF>
- Vara: <Vara de Familia | Vara Civel | JVDFM | Vara dos Orfaos | [VERIFICAR]>
- Estado para ITCMD: <UF> | aliquota: <X%> | [VERIFICAR — aliquota estadual]
- Convencao Haia 1980 aplicavel: <sim/nao>
- Selo P5: data <AAAA-MM-DD>
```

## 9. EXEMPLOS RAPIDOS

**Caso 1 — Alimentos**
- Cliente: alimentando (crianca de 4 anos, mae representa)
- Mae+menor em Sao Jose dos Campos/SP; pai em Rio de Janeiro/RJ
- Foro: **Sao Jose dos Campos/SP** (CPC 53 II — protetivo do alimentando)
- Vara: Vara de Familia da comarca de SJC

**Caso 2 — Divorcio s/ filho menor**
- Cliente: requerente em Curitiba/PR; conjuge em Salvador/BA
- Foro: **Salvador/BA** (CPC 46 — foro do reu)
- Vara: Vara de Familia de Salvador (se houver) ou Vara Civel

**Caso 3 — Inventario**
- Falecido morava em Belo Horizonte/MG; herdeiros em SP, RJ, MG
- Foro: **Belo Horizonte/MG** (CPC 48 + CC 1.785)
- Vara: Vara de Orfaos de BH (se houver) ou Vara de Familia
- ITCMD: **MG** — progressivo 3-8% (confirmar lei estadual mineira pos LC 227/2026)

**Caso 4 — Maria da Penha + divorcio**
- Cliente: vitima em Porto Alegre/RS; agressor em PA tambem
- Medida protetiva: **JVDFM de Porto Alegre**
- Divorcio: Vara de Familia da mesma comarca (acoes correlatas — possivel
  reuniao por conexao CPC 55)
- PA-16: endereco da vitima protegido — usar endereco do advogado

## 10. VEDACOES ESPECIFICAS

- **PA-09** — sem foro confirmado, sem peca.
- **PA-11** — sem aliquota estadual confirmada, marcar
  `[VERIFICAR — aliquota estadual]`.
- **PA-12** — em internacional, sempre apontar Haia 1980.
- **PA-16** — endereco de vitima de VD nunca exposto na peca (usar CPC 77 V).

## 11. INTEGRACAO

Acionada por: `triagem-familia`, todas as skills produtoras antes de
enderecar, `itcmd-calculo` para aliquota, `revisao-final-familia` R3.
Conversa diretamente com `cruzamento-multi-esfera` (quando ha cruzamento com
Maria da Penha, foro vira JVDFM em paralelo) e com `validador-legislacao-vigente`
(confirma vigencia da lei estadual de ITCMD pos LC 227/2026).
