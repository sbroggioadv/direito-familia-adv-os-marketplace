---
name: encaminhamentos-familia
description: >
  ENCAMINHAMENTOS FAMILIA — Skill Tier 6 que sinaliza ao advogado, durante a triagem ou no fim da producao, quando o caso extrapola direito de familia e demanda especialista de OUTRA area. PA-17 absoluta: SEM CROSS-SELL. Sinalizacao sempre GENERICA — "encaminhar a advogado especializado em [area]" — NUNCA cita slug de plugin irmao Adv-OS. Encaminhamentos comuns: pensao por morte do alimentante → previdenciarista; holding familiar / ITCMD complexo / partilha de quotas com due diligence → tributarista; crime conexo (homicidio, lesao grave VD, denunciacao caluniosa) → criminalista; acidente de trabalho do alimentante → trabalhista; consumidor/saude suplementar → consumerista. Bloco "ENCAMINHAMENTO SUGERIDO" no fim de cada entrega. Nunca diagnostica esfera fora — so aponta sinais. Ativa em sugerir encaminhamento, /encaminhamento, area conexa, demanda fora de escopo, caso multidisciplinar. Mantem PA-20 (sem captacao ilicita). Ressalva OAB.
---

# ENCAMINHAMENTOS FAMILIA — SKILL TIER 6

> Skill **Tier 6 — encaminhamentos**. Aplica **PA-17 absoluta (sem cross-sell)** + PA-20 (sem captacao ilicita) + P4 (cruzamento multi-esfera).

---

## 0. ESCOPO

Sinalizar ao advogado quando o caso extrapola direito de familia. **Sinalizacao SEMPRE generica:** "encaminhar a advogado especializado em [area]". **NUNCA cita** slug, nome ou produto irmao da familia Adv-OS (PA-17).

Nao substitui diagnostico em area conexa — apenas indica sinais e sugere encaminhamento. Esta skill **opera em conjunto** com `cruzamento-multi-esfera` (mapeamento P4) e fecha cada entrega com bloco proprio.

---

## 1. REGRA DURA — PA-17

**PROIBIDO** em qualquer saida do plugin:
- Citar `previdenciario-adv-os`, `tributario-societario-adv-os`, `trabalhista-adv-os`, ou qualquer slug de plugin irmao.
- Citar marca proprietaria de produto/curso/mentoria.
- Indicar profissional especifico (nome, CRO, OAB, escritorio).
- Sugerir "use o plugin X" ou "instale o produto Y".

**PERMITIDO** apenas: "Recomenda-se encaminhamento a **advogado(a) especializado(a) em [area juridica]**." Ponto. Fim.

---

## 2. CATALOGO DE ENCAMINHAMENTOS COMUNS

### 2.1 PREVIDENCIARIO

**Quando sinalizar:**
- Alimentante faleceu → dependentes elegiveis a **pensao por morte RGPS (Lei 8.213/91 art. 74)** ou **RPPS**.
- Alimentante recebe **BPC/LOAS** (Lei 8.742/93) → impacta capacidade.
- Alimentando incapaz com possibilidade de **BPC** ou **auxilio-doenca**.
- Alimentante em **auxilio-doenca** ou **aposentadoria por invalidez** → reflexos no calculo.
- Casamento previdenciario / UE com dependente economico para fins de pensao.

**Texto sugerido:**
> Caso envolve elemento previdenciario (pensao por morte / BPC / aposentadoria). Recomenda-se encaminhamento a **advogado(a) especializado(a) em direito previdenciario** para a parte previdenciaria — esta peca cobre apenas o que toca direito de familia.

### 2.2 TRIBUTARIO + SOCIETARIO

**Quando sinalizar:**
- **Holding familiar** como instrumento de partilha/sucessao.
- **ITCMD complexo** com bens em mais de um Estado, planejamento sucessorio, doacao com reserva de usufruto.
- **Partilha de quotas empresariais** com necessidade de due diligence + avaliacao societaria + reestruturacao.
- Inventario com **empresa familiar** em operacao.
- Sucessao empresarial com **acordo de socios** e **reestruturacao tributaria**.

**Texto sugerido:**
> Caso comporta solucao via holding familiar / planejamento sucessorio tributario / reestruturacao societaria, fora do escopo deste plugin. Recomenda-se encaminhamento a **advogado(a) especializado(a) em direito tributario e societario**.

### 2.3 CRIMINAL

**Quando sinalizar:**
- Violencia domestica com **lesao corporal CP 129**, ameaca CP 147, calunia CP 138, injuria CP 140, difamacao CP 139.
- Homicidio / feminicidio conexo (CP 121 §2º VI).
- **Lei Henry Borel 14.344/2022** — crianca/adolescente vitima.
- **Subtracao de incapazes CP 249** quando ha apreensao indevida.
- **Falsa denunciacao caluniosa CP 339** quando ha imputacao falsa de abuso/violencia/AP.
- Estupro de vulneravel CP 217-A em caso de abuso intrafamiliar.

**Texto sugerido:**
> Caso apresenta elemento criminal conexo (lesao/ameaca/feminicidio/denunciacao caluniosa). Esta peca trata apenas da esfera familiar. Recomenda-se encaminhamento a **advogado(a) especializado(a) em direito penal** para registro de BO, acompanhamento de inquerito, e — quando cabivel — assistente de acusacao.

### 2.4 TRABALHISTA

**Quando sinalizar:**
- **Acidente de trabalho** do alimentante com reducao de capacidade laboral → impacta possibilidade nos alimentos.
- **Demissao** do alimentante por justa causa em momento estrategico (suspeita de evasao patrimonial).
- **Verbas rescisorias** em discussao — impactam patrimonio partilhavel ou capacidade de pagar alimentos.
- **Doenca ocupacional** com afastamento.

**Texto sugerido:**
> Capacidade economica do alimentante esta vinculada a discussao trabalhista (acidente/rescisao/verbas). Recomenda-se encaminhamento a **advogado(a) especializado(a) em direito do trabalho** para a parte trabalhista — calculo de alimentos pode ser revisto apos solucao.

### 2.5 CONSUMERISTA + SAUDE SUPLEMENTAR

**Quando sinalizar:**
- Idoso/PCD com **plano de saude** que recusa cobertura (impacta alimentos+curatela).
- Negativa de cobertura para tratamento de menor (TEA, deficiencia, doenca cronica) em saude suplementar.
- Cobranca abusiva em servicos contratados conjuntamente pelo ex-casal.

**Texto sugerido:**
> Ha demanda consumerista conexa (plano de saude / cobranca abusiva). Recomenda-se encaminhamento a **advogado(a) especializado(a) em direito do consumidor e saude suplementar**.

### 2.6 OUTROS (sinalizacao curta)

- **Imobiliario complexo** (regularizacao, usucapiao em meio a partilha) → **advogado(a) especializado(a) em direito imobiliario**.
- **Internacional / Conv. Haia 1980** (subtracao internacional de menor, divorcio internacional) → **advogado(a) especializado(a) em direito internacional privado**.
- **Empresarial** (recuperacao judicial do alimentante PJ) → **advogado(a) especializado(a) em direito empresarial**.

---

## 3. QUANDO SINALIZAR

A sinalizacao acontece em 3 momentos:

**a) Durante a triagem (`triagem-familia`):**
- A Q-cruzamento detecta esfera conexa.
- Apos abrir o `CASO.md`, registrar em "Cruzamento multi-esfera" + sinalizar encaminhamento generico.

**b) Durante a producao de peca:**
- Quando a esfera conexa **impacta o pedido principal** (ex: fixar alimentos sem capacidade real definida pelo trabalhista).
- Pode pedir suspensao do feito (CPC 313) se a esfera conexa for **prejudicial**.

**c) No fim da entrega (sempre):**
- Bloco "ENCAMINHAMENTO SUGERIDO" antes da ressalva OAB.

---

## 4. FORMATO DO BLOCO "ENCAMINHAMENTO SUGERIDO"

Posicao: imediatamente antes da ressalva OAB, ao fim de qualquer peca/parecer/relatorio.

```
─────────────────────────────────────────
ENCAMINHAMENTO SUGERIDO
─────────────────────────────────────────
Foram identificados, no presente caso, elementos que extrapolam
o direito de familia e demandam atuacao especializada em:

1) [AREA 1] — [motivo objetivo]
   Recomenda-se encaminhamento a advogado(a) especializado(a)
   em [area juridica].

2) [AREA 2] — [motivo objetivo]
   Recomenda-se encaminhamento a advogado(a) especializado(a)
   em [area juridica].

A presente entrega cobre **apenas** o que toca o direito de
familia. As demandas conexas devem ser tratadas em paralelo
pelos especialistas indicados.
─────────────────────────────────────────
```

---

## 5. EXEMPLO 1 — DIVORCIO COM VD + HOMICIDIO TENTADO

**Cruzamento detectado:** familia × criminal (lesao CP 129 + feminicidio tentado CP 121 §2º VI) × previdenciario (BPC da vitima).

**Bloco gerado:**
> ENCAMINHAMENTO SUGERIDO
>
> Foram identificados, no presente caso, elementos que extrapolam o direito de familia:
>
> 1) **CRIMINAL** — registros de violencia domestica com tipificacao penal autonoma (lesao corporal CP 129 e tentativa de feminicidio CP 121 §2º VI). Recomenda-se encaminhamento a advogado(a) especializado(a) em direito penal para acompanhamento do inquerito e, quando cabivel, atuacao como assistente de acusacao.
>
> 2) **PREVIDENCIARIO** — alimentando recebe BPC/LOAS, com possivel impacto na capacidade economica e no calculo de alimentos. Recomenda-se encaminhamento a advogado(a) especializado(a) em direito previdenciario.

---

## 6. EXEMPLO 2 — INVENTARIO COM EMPRESA FAMILIAR

**Cruzamento detectado:** familia/sucessoes × tributario (ITCMD interestadual) × societario (quotas empresariais).

**Bloco gerado:**
> ENCAMINHAMENTO SUGERIDO
>
> O inventario envolve participacao societaria em empresa em operacao + bens em mais de um Estado, com necessidade de:
>
> 1) **TRIBUTARIO** — calculo de ITCMD interestadual + avaliacao de holding familiar como alternativa.
> 2) **SOCIETARIO** — due diligence das quotas, leitura do acordo de socios e eventual reestruturacao.
>
> Recomenda-se encaminhamento a advogado(a) especializado(a) em direito tributario e societario para a parte conexa.

---

## 7. CHECKLIST DE CONFORMIDADE

Antes de inserir o bloco "ENCAMINHAMENTO SUGERIDO":

- [ ] **PA-17** — nenhum slug de plugin irmao citado;
- [ ] Linguagem **generica** (advogado(a) especializado(a) em [area juridica]);
- [ ] Sem indicacao de **profissional especifico** (nome/escritorio/OAB);
- [ ] Sem **mencao a marca** proprietaria ou produto comercial;
- [ ] **PA-20** — texto nao configura captacao ilicita (sem promessa, sem desconto, sem incentivo financeiro);
- [ ] Motivo objetivo apontado (qual fato do caso aciona o encaminhamento);
- [ ] **CASO.md** atualizado com a sinalizacao (P3);
- [ ] Bloco posicionado **antes** da ressalva OAB;
- [ ] **Selo R1-R4** confere o bloco em R3 (compliance).

> **Ressalva OAB:** saida operacional sujeita a revisao e responsabilidade tecnica do advogado com OAB ativa. Verifique vigencia das normas no ato do peticionamento.

## 8. INTEGRACAO

Acionada por: `triagem-familia` (apos Q-cruzamento), `cruzamento-multi-esfera` (sempre que mapear esfera externa), todas as skills produtoras (no fechamento), `revisao-final-familia` (R3 confere bloco). Aciona: `memoria-de-caso-familia` (registrar encaminhamento no CASO.md). Entrega para: `revisao-final-familia` (R1-R4).
