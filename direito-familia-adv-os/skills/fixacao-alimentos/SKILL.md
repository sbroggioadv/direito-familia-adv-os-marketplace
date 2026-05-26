---
name: fixacao-alimentos
description: >
  FIXACAO ALIMENTOS — Skill Tier 3 (trilha T3) dual side-aware. Produz inicial OU contestacao de acao de fixacao no rito Lei 5.478/68 (especialissimo, provisorios initio litis) ou CPC comum. Cobre as 9 modalidades — provisorios, provisionais, definitivos, gravidicos (Lei 11.804/2008), compensatorios (CC 1.694 §2º), transitorios (REsp 1.025.769), avoengos (Sum. 596 STJ), preteritos (Sum. 277 STJ), filho maior universitario (Sum. 358, REsp 1.312.706). Aplica trinomio CC 1.694 §1º, competencia CPC 53 II (foro do alimentando), valor da causa CPC 292 III (12x verba), quebra de sigilo SISBAJUD/RENAJUD/INFOJUD/CCS-BCB, Sum. 621 STJ (ex nunc citacao). Ativa em fixar alimentos, /alimentos fixacao, alimentos gravidicos, compensatorios, avoengos, polo alimentando, polo alimentante. Encerra com FIRAC + memoria de calculo + ressalva OAB.
---

# FIXACAO ALIMENTOS

> Skill **Tier 3** dual. Produz inicial OU contestacao conforme polo do cliente (`alimentando` vs `alimentante`). Lê o `CASO.md` antes — sem polo, **PARE**. Aplica Camadas 1-3 + Protocolos P1, P2, P3, P5, P6, P7.

---

## 0. ESCOPO

Trilha **T3** do plugin. Cobre 9 modalidades de alimentos (sec. 2) em rito Lei 5.478/68 ou CPC comum. **NAO cobre** execucao (`execucao-alimentos`), revisional (`revisional-alimentos`) ou exoneracao (`exoneracao-alimentos`). Para urgencia initio litis cumular com `tutela-alimentos-provisorios`.

## 1. ENTRADA — CHECK SIDE-AWARE

Antes de tudo, ler `CASO.md`:
- Polo do cliente: `alimentando` (recebe, polo ativo da fixacao) OU `alimentante` (paga, polo passivo / reu).
- Tipo de vinculo: filiacao registrada, casamento, UE reconhecida, paternidade socioafetiva, paternidade em investigacao (sem prova pre-constituida).
- Vulnerabilidade: menor (PA-13 supraprincipio), gestante (gravidicos), idoso, PCD.
- Cruzamento P4: Maria da Penha, ECA, sucessoes.

**Sem polo, PARE e pergunte.** Polo errado = PA-05 + PA-19 (violacao nuclear).

## 2. AS 9 MODALIDADES

| Modalidade | Quando cabe | Norma-base |
|------------|-------------|------------|
| **Provisorios** | Há prova pre-constituida do vinculo (certidao nascimento/casamento, sentenca UE) | Lei 5.478/68 art. 4º — initio litis |
| **Provisionais** | Vinculo controvertido (investigacao paternidade em curso, UE em discussao) | CPC 300 (tutela de urgencia) |
| **Definitivos** | Fixados em sentenca apos instrucao | CC 1.694; retroage a citacao (Sum. 621 STJ) |
| **Gravidicos** | Devidos a gestante; indicios de paternidade bastam | Lei 11.804/2008; convertem em pensao do menor ao nascer (art. 6º p.u.) |
| **Compensatorios** | Desequilibrio economico pos-divorcio/dissolucao UE | CC 1.694 §2º analogico; REsp 1.518.681; REsp 2.129.308; geralmente temporarios; **NAO admitem prisao civil** |
| **Transitorios** | Entre ex-conjuges com capacidade laboral | REsp 1.025.769; REsp 1.205.408; prazo determinado (24-60 meses) |
| **Avoengos** | Avos chamados quando pais nao podem (total ou parcial) | Sum. 596 STJ — complementar + subsidiaria |
| **Preteritos** | Antes da propositura — em regra **VEDADOS** | Excecao investigacao paternidade — retroage a citacao (Sum. 277 STJ) |
| **Filho maior universitario** | Apos 18 anos cursando graduacao | Sum. 358 STJ + REsp 1.312.706 + REsp 1.198.105 — limite pratico 24 anos OU fim da graduacao |

## 3. RITO — Lei 5.478/68 vs CPC comum

| Rito | Quando aplicar |
|------|----------------|
| **Lei 5.478/68 (especialissimo)** | Há prova pre-constituida do vinculo. Permite provisorios initio litis. Audiencia una de conciliacao e instrucao (art. 6º). |
| **CPC comum (arts. 318, 693-699)** | Sem prova pre-constituida ou demanda complexa (cumulacao com investigacao de paternidade, partilha, divorcio litigioso). |

Sempre que possivel: Lei 5.478/68 — mais celere.

## 4. COMPETENCIA — CPC 53 II

**Foro do alimentando** (parte hipossuficiente). Competencia relativa — juiz **nao** declina de oficio (REsp 1.290.950). Mesmo na exoneracao proposta pelo alimentante, foro do alimentando.

Skill `localizacao-vara-familia` confirma a vara especializada (Familia onde houver; Civel onde nao).

## 5. TRINOMIO — CC 1.694 §1º

Ferramenta nuclear:
- **Necessidade** do alimentando — presumida para menores; comprovada para maiores/ex-conjuges.
- **Possibilidade** do alimentante — holerite, IR, extratos, declaracoes.
- **Proporcionalidade** — equilibrio considerando dependentes do alimentante, padrao de vida, dividas justificadas.

STJ 2024-2025 reforca proporcionalidade: nega aumentos baseados no padrao da mae (e nao do filho); reduz quando renda do alimentante cai; evita que pensao gere desequilibrio entre genitores (TJDFT 1.824.700; REsp 2.129.308).

## 6. DOCUMENTOS DO ALIMENTANTE (P2)

Em sede de provas (com pedido de tutela probatoria quando ha resistencia):
- Últimos 6 holerites (CLT) OU 3 declaracoes de IR (autonomo/PJ).
- Extratos bancarios dos ultimos 6 meses (Caixa, BB, Itau, Bradesco, Santander, Nubank, Inter, Mercado Pago).
- Declaracao da empresa sobre vinculo + remuneracao total (comissoes, bonus, PLR).
- Contrato social se sócio (% quotas, retiradas, distribuicao de lucros).
- DETRAN (veiculos), matriculas (imoveis), CVM/B3 (investimentos).

## 7. QUEBRA DE SIGILO BANCARIO/FISCAL

Admitida em alimentos quando há resistencia probatoria + indicios de patrimonio oculto / renda informal (REsp 1.347.135). Sistemas:
- **SISBAJUD** — bloqueio + extrato de contas.
- **RENAJUD** — veiculos.
- **INFOJUD** — Receita Federal (IR completo) — despacho fundamentado.
- **CCS-BCB** — Cadastro de Clientes do SFN — relacionamentos bancarios; revela contas ocultas.

## 8. VALOR DA CAUSA — CPC 292 III

**12 × verba mensal pretendida** em fixacao ou majoracao. Em exoneracao, valor anual do que se busca extinguir.

## 9. MODELO FIRAC — POLO ALIMENTANDO (inicial)

**ENDERECAMENTO**
Excelentissimo(a) Senhor(a) Doutor(a) Juiz(a) de Direito da {{VARA}} Vara de Familia e Sucessoes da Comarca de {{CIDADE}}/{{UF}}

**QUALIFICACAO**
{{ALIMENTANDO}}, menor impube/pubere, representado(a)/assistido(a) por sua genitora {{GENITOR_GUARDIAO}}, brasileira, [estado civil], CPF XXX.XXX.XXX-XX, residente em [ENDERECO PROTEGIDO ART. 189 CPC], por intermedio do(a) advogado(a) subscritor(a), com fundamento no art. 1.694 e seguintes do Codigo Civil, na Lei 5.478/68 e no art. 53, II, do CPC, propoe **ACAO DE ALIMENTOS COM PEDIDO DE TUTELA PROVISORIA DE URGENCIA** em face de {{ALIMENTANTE}}, brasileiro(a), [qualificacao + CPF + endereco].

**I — FATOS (F)**
[Sintese OBJETIVA: vinculo, separacao, inadimplemento, indicios de capacidade do alimentante — PA-01: sem juizo moral.]

**II — VINCULO (R)**
Demonstrado pela certidao anexa (doc. 01), autorizando o rito da Lei 5.478/68 e a fixacao de provisorios initio litis (art. 4º).

**III — NECESSIDADE (A)**
Despesas mensais do(a) alimentando(a): alimentacao R$ [...]; plano saude R$ [...]; escola R$ [...]; vestuario R$ [...]; transporte R$ [...]; lazer/desenvolvimento R$ [...]. **TOTAL: R$ [...]**.

**IV — POSSIBILIDADE (A)**
{{ALIMENTANTE}} percebe R$ [...] como [profissao] na empresa [...] (holerite — doc. 02). Possui [imoveis/veiculos/quotas] indicativos de capacidade adicional.

**V — DIREITO (R)**
Trinomio CC 1.694 §1º. Sumula 621 STJ — efeito ex nunc da citacao. Competencia CPC 53 II.

**VI — PEDIDOS (C)**
a) **Alimentos PROVISORIOS** initio litis em R$ {{VALOR}} ({{VALOR_EXTENSO}}), equivalentes a [percentual]% do rendimento liquido do alimentante OU [X] salarios-minimos, com deposito em conta a indicar;
b) Citacao do(a) requerido(a) para audiencia una (Lei 5.478/68 art. 6º);
c) Procedencia para fixar **alimentos DEFINITIVOS** no patamar postulado;
d) Em sede instrutoria, **quebra de sigilo bancario e fiscal** via SISBAJUD, RENAJUD, INFOJUD, CCS-BCB;
e) Producao de prova documental (holerites, IR, extratos), testemunhal e pericial contabil se necessario;
f) Custas e honorarios.

**VALOR DA CAUSA:** R$ [...] (12 × verba mensal pretendida — CPC 292 III).

**FECHO** {{CIDADE}}, {{DATA}}. {{ADVOGADO_NOME}} — OAB/{{OAB_UF}} {{OAB_NUMERO}}.

> **Ressalva OAB:** saida operacional sujeita a revisao e responsabilidade tecnica do advogado com OAB ativa. Verifique vigencia das normas no ato do peticionamento.

## 10. MODELO FIRAC — POLO ALIMENTANTE (contestacao)

Quando cliente eh alimentante (reu), flipar para `contestacao-familia` (skill irma). Teses defensivas tipicas:
- **Capacidade limitada** — comprovar com holerite/IR/extratos + outras pensoes + dependentes.
- **Provisao in natura** — se cliente detem guarda total/compartilhada com lar de referencia, parte das necessidades ja eh suprida diretamente (REsp 1.476.061).
- **Padrao referencial** — 20-30% liquido para 1 filho; 30-40% para 2+ (orientativo).
- **Filho maior + autossuficiencia** — Sum. 358 + REsp 1.312.706 (graduacao concluida).
- **Multiparentalidade (Tese 622 STF)** — obrigacao DIVIDIDA proporcionalmente; chamar outro pai/mae ao processo (CPC 130 ou litisconsorcio).
- **Ofertas extrajudiciais** — Pix com descricao "pensao" demonstram pagamento continuado.

Producao detalhada da contestacao em familia: `contestacao-familia`.

## 11. ALERTAS ESPECIAIS

- **Alimentos compensatorios** — natureza indenizatoria; **NAO cabe prisao civil** (CPC 528). Cumular com `tutela-alimentos-provisorios` so se necessidade pura tambem.
- **Gravidicos** — DNA negativo pos-parto: **irrepetibilidade** prevalece (REsp 1.629.423/SP), salvo ma-fe comprovada.
- **Avoengos** — exigir prova de **impossibilidade total ou parcial dos pais** (execucao frustrada / prova de incapacidade); nunca "nao quer pagar".
- **Universitario** — onus do alimentando provar curso ativo + necessidade; pos-graduacao stricto sensu nao automatica.
- **PA-13** — em menor envolvido, melhor interesse vence pedido do cliente.
- **PA-06** — segredo de justica obrigatorio (CPC 189 II). Endereco protegido.
- **PA-16** — vitima de VD: dom processual = endereco do advogado (CPC 77 V).

## 12. INTEGRACAO

Acionada por: `familia-master`, `triagem-familia` (trilha T3), `/alimentos fixacao`. Aciona: `validador-legislacao-vigente` (P1), `estilo-juridico-familia` (Camada 3), `localizacao-vara-familia` (P5), `tutela-alimentos-provisorios` (T11 paralela). Entrega para: `revisao-final-familia` (R1-R4).
