---
name: cruzamento-multi-esfera
description: >
  CRUZAMENTO MULTI-ESFERA — Skill Tier 1 (DIFERENCIAL do plugin). Executa o
  Protocolo P4 da Camada 2. Detecta e mapeia as esferas paralelas a um caso de
  familia: Criminal (Maria da Penha Lei 11.340 + 14.550/2023 + 14.994/2024;
  Henry Borel Lei 14.344; CP 121/129/138/147/339), ECA infracional, Sucessoes
  (interface inventario + UE post mortem), Previdenciario (pensao por morte
  RGPS/RPPS, BPC, auxilio-doenca do alimentante), Tributario (ITCMD em
  inventario pos LC 227/2026), Civel comum (danos morais, abandono afetivo).
  Identifica gatilhos via palavras-chave e padroes processuais. Plugin NUNCA
  produz peca fora de escopo (PA-17), mas indica artigos relevantes, prazos
  paralelos e sinaliza encaminhamento generico a especialista — sem citar
  produto/plugin irmao. Resultado fica no CASO.md em `Cruzamento multi-esfera`.
---

# CRUZAMENTO MULTI-ESFERA

> Skill **Tier 1** — **diferencial comercial** do plugin. Executa o
> **Protocolo P4** da Camada 2. Detecta quando o caso atravessa mais de uma
> esfera juridica e mapeia o que cabe ao plugin (familia) e o que precisa de
> especialista paralelo.

---

## 0. ESCOPO E ACIONAMENTO

Acionada por:
- `triagem-familia` na abertura — varredura inicial dos gatilhos.
- Toda skill produtora antes de redigir — se ha gatilho nao mapeado, alertar.
- `revisao-final-familia` R3 (Compliance) — confere se o mapa foi feito.

## 1. POSICAO NA HIERARQUIA

Camada 2 — Protocolo P4. Aplicacao **obrigatoria** quando ha gatilho.
Diferencial estrutural do plugin: enquanto familistas tradicionais tratam cada
esfera em silos, o plugin cruza desde o primeiro contato.

## 2. AS 7 ESFERAS MAPEADAS

| # | Esfera | Status no plugin |
|---|--------|------------------|
| 1 | **Familia** | Escopo principal — plugin produz peca |
| 2 | **Criminal** | Fora de escopo — sinaliza encaminhamento generico |
| 3 | **ECA infracional** | Fora de escopo — sinaliza encaminhamento |
| 4 | **Sucessoes** | Interface basica (inventario + UE post mortem); complexidade alta → encaminhamento |
| 5 | **Previdenciario** | Fora de escopo — sinaliza |
| 6 | **Tributario** | Interface basica (ITCMD); planejamento sucessorio complexo → encaminhamento |
| 7 | **Civel comum** | Fora de escopo (danos morais, abandono afetivo) — sinaliza |

## 3. GATILHOS DE DETECCAO — PALAVRAS-CHAVE

Quando o operador descrever o caso (`triagem-familia`), procurar:

### Familia x Criminal (Maria da Penha + Henry Borel + crimes conexos)
- "violencia domestica", "agressao", "bateu", "ameacou", "perseguicao",
  "stalking", "ciuume excessivo", "patrimonial" (subtracao de bens), "psicologica"
- "registrou BO", "boletim de ocorrencia", "delegacia da mulher", "DEAM"
- "Maria da Penha", "medida protetiva", "afastamento do lar policial"
- "matou", "tentou matar", "filhote", "Henry Borel" (caso paradigma)
- "lesao corporal", "ameaca", "calunia", "difamacao", "injuria", "denunciacao
  caluniosa"
- "agressor", "feminicidio" (CP 121 §2º VI)

→ **Cruzamento Familia x Criminal**.

Normas relevantes: Lei 11.340/2006 + alteracoes 14.550/2023 e 14.994/2024;
Lei 14.344/2022 (Henry Borel); CP 121, 129, 138, 139, 140, 147, 147-A (stalking),
339; Lei 13.715/2018 (crianca como vitima indireta).

### Familia x ECA infracional
- "filho cometeu", "ato infracional", "menor envolvido em furto/roubo/trafico",
  "vara da infancia e juventude", "internacao", "liberdade assistida",
  "medidas socioeducativas"

→ **Cruzamento Familia x ECA infracional**.

Normas: Lei 8.069/1990 arts. 103-128; Convencao ONU 1989; PA-13 (melhor
interesse) intensificado.

### Familia x Sucessoes
- "faleceu", "morte do alimentante", "viuva", "viuvo", "heranca", "inventario",
  "partilha post mortem", "testamento", "legado", "renuncia da heranca",
  "colacao", "sonegacao"
- "UE post mortem" (companheiro(a) sobrevivente reivindicando)

→ **Cruzamento Familia x Sucessoes**.

Normas: CC 1.784-2.027; CPC 610-673; Res. 571/2024 CNJ; Tema 809 STF (UE
companheiro); Tema 622 STF (multiparentalidade socioafetiva).

Plugin cobre interface basica via skill `inventario-judicial`. Holding
patrimonial complexa, doacao inoficiosa estruturada, REsp 2.139.412/2025 →
encaminhar a especialista.

### Familia x Previdenciario
- "pensao por morte", "INSS", "auxilio-doenca", "incapacidade do alimentante",
  "BPC", "LOAS", "aposentadoria por invalidez", "auxilio-reclusao"
- "RPPS", "regime proprio", "servidor publico falecido"

→ **Cruzamento Familia x Previdenciario**.

Plugin **nao produz** peca previdenciaria. Aponta: "Pensao por morte e direito
autonomo do dependente — encaminhar a advogado especializado em previdenciario."

### Familia x Tributario (ITCMD + planejamento)
- "ITCMD", "imposto de transmissao causa mortis", "doacao", "holding familiar",
  "planejamento sucessorio", "trust", "offshore", "blindagem patrimonial"
- "EC 132/2023", "LC 227/2026", "reforma tributaria sucessoria"

→ **Cruzamento Familia x Tributario**.

Plugin cobre **calculo de ITCMD** (`itcmd-calculo`) e interface basica.
Planejamento sucessorio complexo / holding patrimonial / desmonte
(REsp 2.139.412/2025) → encaminhar a especialista.

### Familia x Civel comum
- "danos morais por abandono afetivo", "indenizacao por traicao",
  "responsabilidade civil em familia", "abandono material"
- "responsabilidade dos genitores" (CC 932)

→ **Cruzamento Familia x Civel comum**.

Plugin **nao redige acao indenizatoria autonoma**. Sinaliza encaminhamento.

## 4. PADROES PROCESSUAIS QUE DISPARAM CRUZAMENTO

Combinacoes que **sempre** acionam mapa multi-esfera:

| Combinacao | Esferas |
|------------|---------|
| Divorcio + agressao + medida protetiva | Familia x Criminal (M. Penha) |
| Alimentos + morte do alimentante | Familia x Sucessoes x Previdenciario |
| Alienacao parental + falsa denuncia de abuso | Familia x Criminal (calunia CP 138, denunciacao caluniosa CP 339) |
| Modificacao de guarda + ato infracional do menor | Familia x ECA infracional |
| Inventario + holding patrimonial | Familia x Sucessoes x Tributario (complexo) |
| Guarda + suspensao poder familiar + ECA art. 98 | Familia x ECA protetivo |
| UE post mortem + companheiro(a) e Fazenda | Familia x Sucessoes x Tributario |
| Divorcio + bem de familia + execucao alimentar | Familia (Lei 8.009 art. 3º III — credor alimentar) |
| Subtracao internacional de menor | Familia + Conv. Haia 1980 (PA-12) |

## 5. COMO SINALIZAR — PADRAO DE OUTPUT

Quando detectado, registrar no `CASO.md` campo `Cruzamento multi-esfera` e
emitir bloco ao operador:

```
═══════════════════════════════════════════
MAPA MULTI-ESFERA — Protocolo P4
Caso: <slug>
Esferas detectadas: Familia + <Criminal | ECA | Sucessoes | Previdenciario |
                              Tributario | Civel>

ESCOPO DESTE PLUGIN (familia):
  - <listar pecas/acoes que o plugin cobre — divorcio, alimentos, guarda,
     tutela de afastamento do lar (Lei 11.340 art. 22 III), etc.>

ACOES PARALELAS (FORA DE ESCOPO — encaminhar):
  - <esfera>: <artigo/lei relevante> · prazo estimado: <X dias>
    → encaminhar a advogado especializado em <criminal | previdenciario |
       tributario | civel>
═══════════════════════════════════════════
```

Sem citar slug/nome de produto ou plugin irmao (PA-17 + PA-20).

## 6. EXEMPLO OPERACIONAL — DIVORCIO COM VIOLENCIA DOMESTICA

**Entrada do operador (na triagem):**
> "Cliente Maria quer dar divorcio. O marido bate nela ha 6 meses. Ela ja
> registrou 2 BOs. Tem um filho de 4 anos."

**Acionamento:**
1. Skill identifica gatilhos: "bate" + "BO" + "filho menor" → Cruzamento
   Familia x Criminal (Maria da Penha) + reforco PA-13/PA-16.
2. Mapa emitido:

```
ESCOPO DESTE PLUGIN (familia):
  - Peticao de divorcio litigioso (CC 1.571 + EC 66/2010)
  - Pedido de alimentos provisorios (Lei 5.478 art. 4º + CPC 300)
  - Pedido de guarda provisoria unilateral em favor da cliente (CC 1.586 + CPC 300)
  - Tutela de afastamento do lar (Lei 11.340 art. 22 III — incluso no escopo
    familia quando ha VD)
  - Sequestro de bens comuns (CPC 301)

ACOES PARALELAS (FORA DE ESCOPO — encaminhar):
  - Criminal: ratificar BO, requerer medidas protetivas no JVDFM (Lei 11.340
    arts. 18-24); eventual representacao por lesao corporal/ameaca/stalking
    (CP 129, 147, 147-A); prazo: imediato (urgencia) → encaminhar a advogado
    criminalista
  - Cuidado intensificado: PA-16 (sigilo absoluto do endereco da vitima — usar
    endereco do advogado como domicilio processual CPC 77 V); anonimizacao
    reforcada PA-23
```

3. CASO.md atualizado com `Cruzamento: Familia x Criminal (M. Penha)` +
   `Vulnerabilidade: vitima de VD` + flag de sigilo de endereco.
4. Skills produtoras (`peticao-inicial-divorcio`, `tutela-patrimonio-familia`)
   leem dali e ajustam tom (+ acolhedor) e estrutura (incluem pedido de
   afastamento do lar).

## 7. CRUZAMENTO E SIDE-AWARENESS

O cruzamento NAO altera o polo do cliente. Se o cliente eh **acusado** numa
acao de alienacao parental, plugin produz contestacao + sinaliza que a falsa
denuncia (se for o caso) pode tipificar calunia (CP 138) ou denunciacao
caluniosa (CP 339) — esfera criminal paralela em favor do cliente. Sempre
respeitar polo (P6).

## 8. PROIBICOES — ENCAMINHAMENTO GENERICO (PA-17)

- **Nunca** citar slug ou nome de outro plugin comercial.
- **Nunca** citar nome de escritorio, marca ou profissional especifico.
- Texto-padrao: "encaminhar a advogado especializado em <materia>".
- Sem captacao ilicita (PA-20 — Provimento 205/2021 OAB).

## 9. VEDACOES ESPECIFICAS

- **PA-17** — sem cross-sell, sem nome de produto.
- **PA-18** — sem opinar sobre conduta clinica em laudo (resta a
  `laudo-psicossocial-analise`).
- **PA-13** — em casos com menor, o melhor interesse prevalece sempre.
- **PA-16** — em casos de VD, sigilo absoluto do endereco da vitima.
- **PA-12** — em subtracao internacional, sempre apontar Conv. Haia 1980.

## 10. INTEGRACAO

Acionada por: `triagem-familia` (abertura), todas as skills produtoras antes de
redigir, `revisao-final-familia` R3. Provê o campo `Cruzamento multi-esfera` no
`CASO.md`, que orienta o `estilo-juridico-familia` no ajuste de tom e a
`localizacao-vara-familia` no eventual desvio para JVDFM.
