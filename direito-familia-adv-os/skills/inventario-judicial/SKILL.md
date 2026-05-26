---
name: inventario-judicial
description: >
  INVENTARIO JUDICIAL — Tier 6A. Produz abertura + inventariante + primeiras declaracoes (CPC 610-673). Cobre 6 hipoteses CPC 610 (incapaz, sem consenso, testamento — excecao Res. CNJ 571/2024 com anuencia MP), competencia CPC 48 + CC 1.785, prazo CPC 611 60d com multa fiscal estadual 10-20%, 4 modalidades (comum; arrolamento sumario CPC 659 sem limite — Tema 1.074 dispensa ITCMD previo; arrolamento comum CPC 664 ate 1.000 SM; conversao Res. CNJ 35), inventariante CPC 617 + remocao, primeiras declaracoes CPC 620 com CRIPTOATIVOS (REsp 2.124.424/2025 inventariante digital), citacoes 626-628, avaliacao 629-633 (REsp 2.580.956/2024 Fisco arbitra; REsp 2.139.412/2025 holding cai), partilha + sobrepartilha, doacao inoficiosa CC 549 + REsp 2.026.250/2025, sonegacao CC 1.992 autonoma, renuncia abdicativa vs translativa em dobro, Tema 809 + 622, FIRAC. Ativa em abrir inventario, herdeiro menor no espolio, criptoativos espolio, /inventario abertura.
---

# INVENTARIO JUDICIAL — ABERTURA + INVENTARIANCA

> **Tier 6A** T7-A. CPC 610-673. Extrajudicial em plugin separado. Camadas 1-3 + P1/P2/P3/P5/P7. ITCMD em skill `itcmd-calculo`.

## 1. ENTRADA + CABIMENTO JUDICIAL — CPC 610

Ler `CASO.md`: polo (requerente · co-herdeiro · preterido · credor · meeiro); falecido (RG/CPF, obito, ultimo domicilio); herdeiros (mapear incapazes; regime conjuge; UE); testamento; acervo (imoveis matricula+IPTU, contas, quotas, criptoativos, exterior, dividas); cruzamento P4. Sem polo + sem morto + sem herdeiro, **PARE** (PA-02).

> "Havendo testamento ou interessado incapaz, proceder-se-a ao inventario judicial."

**6 hipoteses:** (1) **Herdeiro incapaz** (CC 3º/4º) — Res. CNJ 571/2024 admite extrajudicial com incapaz SE consenso pleno + advogado + **anuencia expressa do MP** + sem testamento nao cumprido (falhando qualquer → JUDICIAL); (2) sem consenso sobre quinhoes/bens; (3) testamento (excecao todos maiores+capazes+concordes e ja aberto — Prov. CNJ 56/2019); (4) so incapazes na sucessao; (5) conflito sobre meacao/regime/sonegacao/jacencia; (6) paternidade/UE post mortem/preterido — via ordinaria + **reserva de quinhao**.

## 2. COMPETENCIA + PRAZO — CPC 48 + 611 + CC 1.785

**Foro:** ultimo domicilio do falecido. Sem domicilio → situacao dos imoveis; so moveis → lugar de qualquer bem; bens no exterior → **pluralidade dos juizos sucessorios** (CPC 23 II + STJ Inf. Extra 23/2025). Vara de Familia e Sucessoes onde houver; Civel onde nao. Sum. 33 STJ (relativa). Sem confirmacao → `[VERIFICAR — vara]` (PA-09).

**Prazo CPC 611:** 60d do obito. NAO ha multa processual. **HA MULTA FISCAL ESTADUAL** (STF Sum. 542): SP 10% (60-180d) ou 20% (>180d); SC 20%; MG escalonada; RJ 10%; RS nao prevista; outros `[VERIFICAR — lei estadual]`. **Tatica:** protocolar inicial com pedido de prazo interrompe contagem em varios Estados.

## 3. AS 4 MODALIDADES

- **Comum (CPC 610-625)** — default em conflito ou incapaz sem consenso. 18-36 meses.
- **Arrolamento sumario (CPC 659-663) — SEM LIMITE.** Todos maiores+capazes+concordes. **STJ Tema 1.074 (REsp 1.896.526/DF, 26/10/2022): homologacao DISPENSA recolhimento previo do ITCMD** (cobrado apos formal); tributos sobre bens (IPTU/IPVA/IR) quitados (CTN 192 + CPC 659 §2º). 6-12 meses.
- **Arrolamento comum (CPC 664-666) — ate 1.000 SM (R$ 1.518.000 em 2026).** Cabivel **mesmo com incapaz** + concordancia + MP. **Imperativa** (STJ REsp 1.881.832/MS). ITCMD pago **antes** do formal.
- **Conversao extrajudicial → judicial** (Res. CNJ 35 art. 32).

## 4. INVENTARIANTE — CPC 615-617

**Legitimados (CPC 615):** conjuge/companheiro, herdeiro, legatario, testamenteiro, cessionario, credor, MP, Fazenda, admin judicial.

**Ordem (CPC 617):** (1) conjuge/companheiro convivente; (2) herdeiro na posse; (3) qualquer herdeiro; (4) herdeiro menor por representante; (5) testamenteiro; (6) cessionario; (7) inventariante judicial; (8) estranho idoneo. Nao absoluta — conflito ou ma administracao autorizam preterir. **Compromisso** 5d; abre os **20d** das primeiras declaracoes.

**Remocao (CPC 622-624):** apenso, contraditorio 15d. Hipoteses: nao prestar declaracoes; duvidas infundadas; deteriorar bens; nao defender espolio; nao prestar contas; **sonegar**; perder idoneidade.

## 5. PRIMEIRAS DECLARACOES — CPC 620

**Prazo:** 20d do compromisso. Conteudo: **I** falecido (estado civil, ultimo domicilio, obito, testamento); **II** herdeiros (estado, idade, e-mail, residencia, regime); **III** qualidade e parentesco; **IV** acervo TOTAL — imoveis (matricula+cartorio, IPTU/ITR, onus); moveis; semoventes; dinheiro/joias/ouro; titulos, acoes, quotas, debentures, fundos, **CRIPTOATIVOS** (CNPJ/ISIN, cotacao na data do obito, exchange); veiculos (RENAVAM/FIPE); direitos; bens no exterior (apostilados + traducao juramentada); **V** dividas.

**Anexos:** certidao de obito; certidoes herdeiros; matriculas ≤ 90d, CRLV, extratos da data do obito, contratos sociais, balancos; **3 ultimas DIRPF do falecido**; negativas PGFN/RFB, SEFAZ-UF, municipal, CNDT, FGTS; testamento (abertura judicial previa se cerrado/particular — CC 1.875 + CPC 735).

**HERANCA DIGITAL:** **STJ REsp 2.124.424/SP (out/2025)** consagrou o **INVENTARIANTE DIGITAL** — juizo autoriza acesso a bens protegidos por senha. Mapear carteiras (hot/cold), exchanges CVM, tokens, NFTs, contas e-mail/nuvem. **Pedir autorizacao judicial expressa.**

## 6. CITACOES — CPC 626-629

Correio (conjuge/companheiro/herdeiros/legatarios); edital 20-60d (CPC 257); intimacao MP, Fazenda (federal+estadual+municipal), testamenteiro, advogados. **Vista 15d (CPC 627):** erros/omissoes/**sonegacao**; impugnacao a nomeacao; contestacao a qualidade de herdeiro. **Preterido (CPC 628):** admissao antes da partilha; controversia complexa → vias ordinarias + **reserva de quinhao**. **Fazenda (CPC 629):** 15d para valor cadastral dos imoveis.

## 7. AVALIACAO — CPC 629-633

Regra: juiz nomeia perito (CPC 630). Dispensa (CPC 633): todos capazes + Fazenda concordante. Criterios: imovel urbano — IPTU OU laudo (divergencia → **Fisco arbitra** — STJ REsp 2.580.956/2024); imovel rural — ITR ou laudo; veiculo — FIPE; acoes abertas — Bolsa; **quotas/HOLDING FAMILIAR — VALOR DE MERCADO dos imoveis subjacentes (STJ REsp 2.139.412/MT, 18/02/2025)** — corte na holding subavaliada; criptoativos — exchange regulamentada na data do obito; joias/ouro — laudo gemologico.

## 8. PARTILHA + SOBREPARTILHA + COLACAO

Plano apos ITCMD (CPC 636 + 651). Tipos: **amigavel** (CPC 657); **judicial** (CPC 647-650); **adjudicacao** (CPC 659 §1º — herdeiro unico). **Sobrepartilha (CPC 669-673):** bens sonegados, descobertos pos-partilha, litigiosos, remotos — nos autos originais; sem nova avaliacao dos ja partilhados; **ITCMD do novo bem com aliquota da DATA DO OBITO**. **Colacao (CC 2.002):** descendentes + conjuge trazem doacoes em vida (adiantamento de legitima); excecao dispensa expressa CC 2.006; valor o da liberalidade (CC 2.004 + STJ REsp 1.166.568/SP), corrigido. **Doacao inoficiosa (CC 549):** excede metade disponivel → **NULA NO EXCESSO**; prazo 10 anos; **STJ REsp 2.026.250/PR (24/03/2025): concordancia dos herdeiros NAO afasta a nulidade.**

## 9. DEFESA E ANOMALIAS

- **Sonegacao (CC 1.992):** acao **autonoma** (rito comum CPC 318+), nao incidental (STJ REsp 1.267.264/RJ). Exige **dolo comprovado**. Sancao: perda do direito + devolucao + remocao.
- **Renuncia abdicativa (CC 1.806):** pura, ex tunc. **SEM ITCMD ADICIONAL** — bem retorna ao monte.
- **Renuncia translativa:** cessao em favor de pessoa determinada. **TRIBUTA EM DOBRO** — ITCMD causa mortis + inter vivos OU ITBI (SEFAZ-SP Consulta 24.246/2021). Se intencao e apenas afastar-se, **redigir como abdicativa.**
- **Aceitacao (CC 1.804):** expressa/tacita/presumida. Irrevogavel salvo vicios.

## 10. INTERFACE FAMILIA

**STF Tema 809 (RE 878.694, 10/05/2017):** companheiro UE concorre igualmente ao conjuge (CC 1.829) — fim do CC 1.790. **STF Tema 622 (RE 898.060, 21/09/2016):** multiparentalidade — filho com 2 pais e 1 mae herda em 3 linhas. **CF 227 §6º:** filho dentro/fora ou adotivo — direitos iguais. Reconhecimento incidental NAO cabe → vias ordinarias + reserva de quinhao. **UE post mortem:** acao autonoma + reserva.

## 11. MODELO FIRAC

Juiz(a) da {{VARA}} Vara de Familia e Sucessoes da Comarca de {{CIDADE}}/{{UF}}.

{{REQUERENTE}}, [qualif], por advogado(a), arts. 610 ss. CPC e 1.785 ss. CC, requer **ABERTURA DE INVENTARIO JUDICIAL** dos bens de {{FALECIDO}}, falecido em {{DATA_OBITO}} em {{CIDADE_OBITO}} (doc. 01).

**F** Ultimo domicilio em {{ENDERECO}}/{{UF}}. Acervo: imoveis (matricula {{N}} — IPTU R$ {{V}}); contas (R$ {{V}}); **criptoativos** (carteira {{W}} — cotacao R$ {{V}}); dividas {{D}}. Total: R$ {{ACERVO}}.

**HERDEIROS** {{H1}}, {{H2}} (maiores capazes); {{H_MENOR}} ([X] anos, representado por {{REPRESENTANTE}}). Regime conjuge superstite: {{REGIME}}.

**R** CPC 610 — {{HIPOTESE: herdeiro menor / testamento / sem consenso}}. Res. CNJ 571/2024: incapaz sem anuencia expressa do MP impoe via judicial. CPC 48 + CC 1.785; CPC 617; CPC 620; STJ REsp 2.124.424/2025.

**A** Obrigatoriedade caracterizada. Foro correto. Inventariante: {{INVENTARIANTE}}, ordem art. 617.

**C — PEDIDOS** (a) abertura; (b) {{INVENTARIANTE}} + termo de compromisso; (c) 20d primeiras declaracoes; (d) citacao herdeiros + intimacao Fazenda + MP; (e) **autorizacao expressa para INVENTARIANTE DIGITAL** sobre cripto/exchanges/e-mail-nuvem; (f) reserva para {{HERDEIRO_PRETERIDO}} (CPC 628); (g) gratuidade {{se cabivel}}.

{{CIDADE}}, {{DATA}}. {{ADVOGADO_NOME}} — OAB/{{OAB_UF}} {{OAB_NUMERO}}.

> **Ressalva OAB:** saida operacional sujeita a revisao e responsabilidade tecnica do advogado com OAB ativa. Verifique vigencia das normas no ato do peticionamento. **Calculo do ITCMD em skill propria (`itcmd-calculo`).**

## 12. ALERTAS + INTEGRACAO

**PA-01** sem juizo moral. **PA-03/P1** Sum. 33/542/590; Temas 21/622/809/825(suprido LC 227/2026)/1.074; REsp 2.124.424; 2.139.412; 2.580.956; 2.026.250. **PA-08** 5d compromisso; 20d declaracoes; 15d art. 627; 15d Fazenda. **PA-09** foro ultimo domicilio. **PA-13** menor: supraprincipio + MP. Bens em outros Estados: ITCMD ao Estado de situacao (CF 155 §1º II). Testamento cerrado/particular: abertura previa (CC 1.875 + CPC 735). Empresa vira holding/M&A: encaminhamento generico (PA-17).

Acionada por `familia-master`, `triagem-familia` (T7-A), `/inventario`. Aciona `validador-legislacao-vigente`, `estilo-juridico-familia`, `localizacao-vara-familia`, **`itcmd-calculo`**. Entrega `revisao-final-familia` (R1-R4).
