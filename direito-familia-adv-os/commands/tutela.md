---
description: Sub-rotina de tutela de urgencia em familia — roteia para alimentos provisorios, guarda provisoria ou patrimonio (sequestro/afastamento do lar/busca e apreensao). Lê o polo do cliente no CASO.md e aciona a skill correta da familia T2. Aplica Camadas 1-3 + Protocolos P1-P7. Cobre initio litis em divorcio, UE, alimentos, guarda, Maria da Penha e Haia internacional.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [alimentos | guarda | patrimonio | afastamento | sequestro | busca-apreensao | descricao livre]
---

Voce foi acionado pelo comando `/tutela` do plugin Direito-Familia-Adv-OS (trilha **T2 — Tutela de Urgencia**).

Argumento recebido: `$ARGUMENTS`

**Objetivo:** rotear o pedido de tutela de urgencia para a skill operacional correta da familia T2, conforme o caso e o polo do cliente registrado no `CASO.md`.

## PROTOCOLO

1. **Verificar configuracao** — procurar `direito-familia/cowork-state.json` subindo a arvore. Se nao encontrar, sugerir `/start-familia` antes; em fallback, prosseguir avisando.

2. **Ler `CASO.md` do caso ativo** (`<cwd>/direito-familia/casos/<slug>/CASO.md`):
   - **Polo do cliente** — variavel-mae PA-05 / P6.
   - **Tipo de tutela** pretendida (alimentos / guarda / patrimonio / afastamento / busca apreensao).
   - **Vinculo** (filiacao / casamento / UE / paternidade investiganda).
   - **Vulnerabilidade especial** (menor PA-13, gestante, idoso PA-15, vitima VD PA-16).
   - **Cruzamento P4** (Maria da Penha, Henry Borel, Haia internacional, ECA).

3. **Sem CASO.md aberto, acionar primeiro `/triagem-familia`** — sem trilha + polo, nao prosseguir.

4. **ROTEAMENTO — escolher UMA das 3 skills:**

| Sub-rotina | Skill acionada | Quando |
|------------|----------------|--------|
| `alimentos` | `tutela-alimentos-provisorios` | Pedido de fixacao initio litis (Lei 5.478 art. 4º com prova pre-constituida) OU tutela antecipada incidental (CPC 300) em acao sem certidao do vinculo (paternidade investiganda, UE em discussao, gravidicos Lei 11.804). Contestacao / AI pelo polo alimentante. |
| `guarda` | `tutela-guarda-provisoria` | Pedido liminar de guarda provisoria (unilateral, compartilhada com lar de referencia, alternada ou inversao — CC 1.586 + CPC 300). Contestacao / AI pelo polo requerido. Aplica REsp 2.108.750/GO 2024 (pericia psicossocial em inversao). |
| `patrimonio` | `tutela-patrimonio-familia` | 3 hipoteses: (1) sequestro/arrolamento CPC 301 em divorcio/UE com risco patrimonial; (2) afastamento do lar — Lei 11.340 art. 22 II (VD com Lei 14.550/2023 + Lei 14.994/2024) OU CC 1.562 + CPC 300 (hipotese geral); (3) busca e apreensao de menor — CPC 538 + ECA (domestica) ou Conv. Haia 1980 / Dec. 3.413/2000 (internacional, Justica Federal). |

5. **Detecao automatica** quando o argumento for descricao livre:
   - "pensao initio litis", "alimentos antes da citacao", "fixar provisoria", "alimentos gravidicos" → **alimentos**.
   - "guarda liminar", "lar de referencia", "inversao de guarda", "alternada provisoria" → **guarda**.
   - "afastamento do lar", "Maria da Penha", "medida protetiva", "agressor", "VD" → **patrimonio** (B — afastamento LMP).
   - "separacao de corpos", "cessar coabitacao", "expulsar do imovel" → **patrimonio** (B — CC 1.562).
   - "sequestro de bens", "arrolamento", "dilapidacao", "bloqueio Pix", "SISBAJUD em divorcio" → **patrimonio** (A — sequestro).
   - "busca e apreensao", "subtracao de menor", "filho levado", "Haia", "internacional" → **patrimonio** (C — busca e apreensao).

6. **Cumulacao detectavel:** tutela de urgencia em familia tipicamente cumula. Quando houver mais de uma frente, executar em sequencia E garantir cumulacao na MESMA peca quando viavel:
   - **Pacote padrao de divorcio litigioso com VD:** afastamento do lar (LMP art. 22 II) + alimentos provisorios (LMP art. 22 IV) + guarda provisoria + regulamentacao protegida de convivencia + sequestro de bens — gera **uma peca cumulada**, nao tres pecas separadas.
   - **Pacote padrao de dissolucao de UE litigiosa:** sequestro de bens + alimentos provisorios entre companheiros.
   - **Pacote padrao de paternidade investiganda:** alimentos provisorios via CPC 300 + busca e apreensao se houver subtracao.

7. **Side-awareness obrigatoria** — Protocolo **P6**:
   - **Polo requerente / vitima / alimentando** — postura ofensiva: pedir liminar + cumular + reforco do periculum.
   - **Polo requerido / acusado / alimentante** — postura defensiva: contestacao imediata (CPC 304 — impede estabilizacao); AI com efeito suspensivo (CPC 1.015 I + 1.019 I); ataque ao fumus / periculum / ausencia de pericia previa em inversao de guarda.

8. **Sem polo definido, PARE e pergunte** — PA-05 + PA-19. **Sem polo, sem peca.**

9. **Cruzamento P4 — alertas especiais:**
   - **Maria da Penha (Lei 11.340 + 14.550/2023 + 14.994/2024)** — afastamento eh medida protetiva autonoma; decisao em 48h; duracao indefinida enquanto houver risco; descumprimento eh crime (CP 24-A — Lei 13.641/2018); Sum. 600 STJ (sem coabitacao).
   - **Henry Borel (Lei 14.344/2022)** — protecao crianca/adolescente em ambiente domestico; cruza com afastamento + suspensao do poder familiar.
   - **Haia internacional (Dec. 3.413/2000)** — busca e apreensao com elemento internacional vai pra Justica Federal (CF 109 III); rito sumarissimo; excecoes do art. 13 da Conv.
   - **REsp 2.108.750/GO (2024)** — inversao de guarda exige pericia psicossocial previa (ou em sequencia se emergencia real).
   - **CPC 304 — estabilizacao** — restrita em familia (direitos indisponiveis); polo requerido deve contestar para impedir estabilizacao.

10. **Aplicar Camada 1 (PAs)** em todo o fluxo:
    - **PA-01** — sem juizo moral. Fatos OBJETIVOS.
    - **PA-03 / P1** — CPC 300/301/304/538/1.015, CC 1.562/1.586/1.589/1.642/1.694, Lei 5.478/68, Lei 11.340 (+ atualizacoes 2023/2024), Lei 13.058/2014, Lei 13.431/2017, Lei 14.344/2022, Conv. Haia 1980, Sum. 277/600 STJ, REsp 2.108.750/GO 2024, REsp 1.760.966/SP, REsp 1.938.645/CE — confirmar vigencia.
    - **PA-06** — segredo de justica (CPC 189 II) — todas as acoes de familia.
    - **PA-08** — prazos: AI 15 dias uteis (CPC 219 + 1.003 §5º); contestacao 15 dias apos audiencia de mediacao (CPC 697); decisao em 48h em Maria da Penha (LMP art. 18).
    - **PA-13** — menor: supraprincipio melhor interesse vence tudo.
    - **PA-14** — oitiva especializada (Lei 13.431/2017 + Res. 226/2024 + 299/2019 CNJ) — nunca em sala comum.
    - **PA-16** — vitima VD: endereco do advogado como domicilio (CPC 77 V); prints anonimizados.
    - **PA-22 / PA-23** — pasta sincronizada bloqueada; anonimizacao reforcada.

11. **Encerrar pelo Pipeline canonico:**
    - skill operacional roda → `revisao-final-familia` (Suprema Corte R1-R4) → entrega ao advogado.

**Skills disponiveis para acionamento:** `tutela-alimentos-provisorios`, `tutela-guarda-provisoria`, `tutela-patrimonio-familia`. Em caso de duvida sobre a hipotese correta apos leitura do CASO.md, **PERGUNTAR ao advogado** antes de produzir.
