---
description: Sub-rotina de inventario judicial — aciona abertura + inventariante + primeiras declaracoes (skill inventario-judicial) e em sequencia o calculo do ITCMD (skill itcmd-calculo). Le o CASO.md para extrair polo (requerente · co-herdeiro · preterido · credor · meeiro), falecido, herdeiros (mapeando incapazes), acervo (com criptoativos), Estado de domicilio e Estados de situacao dos imoveis. Aplica Camadas 1-3 + Protocolos P1, P2, P3, P5, P7. Atalho do bloco T7 (sucessorio judicial) do contencioso de familia. Cobre CPC 610-673 + EC 132/2023 + LC 227/2026.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [abertura | itcmd | sobrepartilha | descricao livre]
---

Voce foi acionado pelo comando `/inventario` do plugin Direito-Familia-Adv-OS.

Argumento recebido: `$ARGUMENTS`

**Objetivo:** rotear demanda sucessoria judicial para o pipeline T7 — `inventario-judicial` (abertura + inventariante + primeiras declaracoes) seguido de `itcmd-calculo` (calculo + recolhimento), conforme o caso.

## PROTOCOLO

1. **Verificar configuracao** — procurar `direito-familia/cowork-state.json` subindo a arvore. Se nao encontrar, sugerir `/start-familia` antes; em fallback, prosseguir avisando.

2. **Ler `CASO.md` do caso ativo** (`<cwd>/direito-familia/casos/<slug>/CASO.md`):
   - Polo do cliente (requerente · co-herdeiro · preterido · credor · meeiro) — variavel-mae **PA-05**.
   - **Falecido** — nome, RG/CPF, data do obito, local do obito, ultimo domicilio (PA-09 — define foro).
   - **Herdeiros** — lista completa com idade (**mapear incapazes — gatilho CPC 610**), regime do conjuge superstite, companheiro com UE comprovavel (Tema 809).
   - **Testamento** — sim/nao + tipo (publico, cerrado, particular) + se ja aberto judicialmente (CC 1.875 + CPC 735).
   - **Acervo declarado** — imoveis (matricula + IPTU/ITR), contas, investimentos, quotas/holding, **criptoativos** (REsp 2.124.424/2025), bens no exterior (LC 227/2026), dividas.
   - **Estado de domicilio do falecido + Estados de situacao** dos imoveis (PA-11 — multiplas GAREs).
   - **Cruzamento P4** — divorcio pendente, UE post mortem, paternidade socioafetiva (Tema 622), pensao alimenticia em curso, falecimento por acidente (interface previdenciario — encaminhamento generico PA-17).

3. **Sem CASO.md aberto, acionar primeiro `/triagem-familia`** — sem trilha + polo + falecido qualificado, nao prosseguir.

4. **ROTEAMENTO — escolher fluxo:**

| Sub-rotina | Skill acionada | Quando |
|------------|----------------|--------|
| `abertura` | `inventario-judicial` (Tier 6A T7-A) | Inventario novo — peticao inicial + nomeacao de inventariante + primeiras declaracoes |
| `itcmd` | `itcmd-calculo` (Tier 6A T7-B) | Inventario ja aberto, em fase de calculo OU acao de ITCMD/MS contra arbitramento do Fisco |
| `sobrepartilha` | `inventario-judicial` (subprocedimento CPC 669-673) | Bens sonegados/descobertos pos-partilha — nos autos originais; ITCMD com aliquota da DATA DO OBITO |

5. **PIPELINE PADRAO (descricao livre ou caso completo):**
   1. `inventario-judicial` produz a peticao inicial de abertura + termo de compromisso do inventariante + primeiras declaracoes (CPC 620). Pedidos incluem **autorizacao expressa para INVENTARIANTE DIGITAL** (REsp 2.124.424/2025) se ha criptoativos/contas digitais no espolio.
   2. Apos avaliacao e citacoes (CPC 626-633), `itcmd-calculo` produz o memorial de calculo do ITCMD por **quinhao individual** (LC 227/2026), separando meacao (NAO tributa), aplicando aliquota estadual e mapeando bens em outros Estados.
   3. `revisao-final-familia` aplica R1-R4 antes de protocolar.

6. **Cumulacao detectavel:**
   - **Abertura + ITCMD** — caso completo desde o zero (pipeline padrao).
   - **Abertura + reserva de quinhao** — herdeiro preterido (paternidade/UE post mortem em vias ordinarias, CPC 628).
   - **Sobrepartilha + ITCMD** — bem descoberto apos partilha; ITCMD com aliquota da data do obito (anterioridade do fato gerador).
   - **Inventario + Maria da Penha** — falecido com violencia domestica em curso, vitima como herdeira: cruzamento P4 + supraprincipio melhor interesse do menor PA-13.

7. **Detecao automatica** quando argumento for descricao livre:
   - "Pai/mae faleceu", "ja faleceu ha", "abrir inventario", "primeiras declaracoes", "falecido deixou" → **abertura**.
   - "Calcular ITCMD", "GARE", "aliquota progressiva", "holding herdada", "Fisco arbitrou" → **itcmd**.
   - "Apareceu bem que nao foi inventariado", "esqueceram de declarar imovel", "encontramos conta esquecida" → **sobrepartilha**.

8. **Cabimento JUDICIAL (CPC 610) — verificacao obrigatoria antes de abrir:**
   - Herdeiro **incapaz** sem anuencia expressa do MP (Res. CNJ 571/2024 → judicial mesmo com extrajudicial possivel).
   - **Testamento** nao aberto/cumprido.
   - **Ausencia de consenso** sobre quinhoes/bens.
   - **Conflito** sobre meacao/regime/sonegacao.
   - **Heranca jacente/vacante**.
   - **Paternidade/UE post mortem/preterido** — reserva de quinhao + via ordinaria.

   Sem hipotese caracterizada + todos maiores+capazes+concordes + sem testamento → **sugerir via extrajudicial** (Lei 11.441/2007 + Res. CNJ 35) — plugin separado.

9. **Modalidades — escolher antes de redigir:**
   - **Comum** (CPC 610-625) — default em conflito ou incapaz sem consenso.
   - **Arrolamento sumario** (CPC 659-663) — SEM limite de valor, todos maiores+capazes+concordes (Tema 1.074 STJ).
   - **Arrolamento comum** (CPC 664-666) — ate 1.000 SM (R$ 1.518.000 em 2026), cabivel mesmo com incapaz.
   - **Conversao extrajudicial → judicial** (Res. CNJ 35 art. 32).

10. **Side-awareness obrigatoria (P6):**
    - **Polo requerente do herdeiro maior** — postura ofensiva: abertura + inventariancia + plano de partilha favoravel.
    - **Polo co-herdeiro impugnante** — vista 15d CPC 627: erros/omissoes/sonegacao; impugnacao a nomeacao; contestacao a qualidade de herdeiro.
    - **Polo herdeiro preterido** — admissao antes da partilha (CPC 628) + via ordinaria + reserva de quinhao.
    - **Polo credor do herdeiro** — habilitacao no inventario (CC 1.813 — aceitar heranca em nome do renunciante para satisfazer creditos).
    - **Polo meeiro/conjuge superstite** — preservar meacao + concorrer com herdeiros (CC 1.829 + Tema 809).

11. **Aplicar Camada 1 (PAs):**
    - **PA-01** sem juizo moral entre herdeiros.
    - **PA-03/P1** Sum. 33 STJ; Sum. 542 STF; Sum. 590; Temas 21/622/809/825 (suprido LC 227/2026)/1.074; REsp 2.124.424/2025 (inventariante digital); 2.139.412/2025 (holding patrimonial); 2.580.956/2024 (Fisco arbitra); 2.026.250/2025 (doacao inoficiosa) — confirmar vigencia.
    - **PA-06** segredo de justica (CPC 189 II) — anonimizar herdeiros menores em modelos.
    - **PA-08** prazos: 5d compromisso; 20d primeiras declaracoes; 15d vista art. 627; 15d Fazenda art. 629.
    - **PA-09** foro do ultimo domicilio do falecido (CPC 48 + CC 1.785).
    - **PA-11** aliquota ITCMD varia por Estado — confirmar lei estadual vigente.
    - **PA-13** herdeiro menor: supraprincipio melhor interesse + MP intervem (CPC 178 + 698).
    - **PA-17** empresa do falecido vira holding/M&A: sinalizar encaminhamento generico a advogado especializado em societario/tributario, sem nome de produto.

12. **Cruzamento P4 — alertas especiais:**
    - **Maria da Penha** — falecido era agressor: vitima e herdeira preserva direitos sucessorios (indignidade exige acao autonoma — CC 1.815).
    - **Violencia contra menor** — Lei 14.344/2022 Henry Borel: representante legal apto a defender heranca do menor.
    - **Bens em outros Estados** — multiplas GAREs/DARJs/DAEs (CF 155 §1º II).
    - **Bens no exterior** — LC 227/2026 + pluralidade dos juizos sucessorios (CPC 23 II + STJ Inf. Extra 23/2025).
    - **Holding familiar** — STJ REsp 2.139.412/MT corta subavaliacao; atualizar laudo dos imoveis subjacentes.

13. **Encerrar pelo Pipeline canonico:**
    - skill operacional roda → `revisao-final-familia` (Suprema Corte R1-R4) → entrega ao advogado.

**Skills disponiveis para acionamento:** `inventario-judicial`, `itcmd-calculo`. Em caso de duvida sobre a hipotese de cabimento judicial (CPC 610) ou sobre a modalidade aplicavel (comum / arrolamento sumario / arrolamento comum), **PERGUNTAR ao advogado** antes de produzir peticao.
