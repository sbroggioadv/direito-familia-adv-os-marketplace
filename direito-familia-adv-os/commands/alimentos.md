---
description: Sub-rotina de alimentos — roteia para fixacao, revisional, exoneracao ou execucao conforme o caso. Lê o polo do cliente no CASO.md e aciona a skill correta da familia de alimentos (T3-T5). Aplica Camadas 1-3 + Protocolos P1-P7. Atalho oficial do bloco mais frequente do contencioso de familia.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [fixacao | revisional | exoneracao | execucao | descricao livre]
---

Voce foi acionado pelo comando `/alimentos` do plugin Direito-Familia-Adv-OS.

Argumento recebido: `$ARGUMENTS`

**Objetivo:** rotear a demanda de alimentos para a skill operacional correta da familia T3-T5, conforme o caso e o polo do cliente registrado no `CASO.md`.

## PROTOCOLO

1. **Verificar configuracao** — procurar `direito-familia/cowork-state.json` subindo a arvore. Se nao encontrar, sugerir `/start-familia` antes; em fallback, prosseguir avisando.

2. **Ler `CASO.md` do caso ativo** (`<cwd>/direito-familia/casos/<slug>/CASO.md`):
   - Polo do cliente (alimentando × alimentante) — **variavel-mae PA-05**.
   - Sub-tipo (fixacao / revisional / exoneracao / execucao).
   - Vinculo (filiacao / casamento / UE).
   - Vulnerabilidade especial (menor, gestante, idoso, vitima VD).
   - Cruzamento P4 (Maria da Penha).

3. **Sem CASO.md aberto, acionar primeiro `/triagem-familia`** — sem trilha + polo, nao prosseguir.

4. **ROTEAMENTO — escolher UMA das 4 skills:**

| Sub-rotina | Skill acionada | Quando |
|------------|----------------|--------|
| `fixacao` | `fixacao-alimentos` | Acao originaria — primeira fixacao de pensao (provisorios, definitivos, gravidicos, compensatorios, transitorios, avoengos, universitario) |
| `revisional` | `revisional-alimentos` | Ja ha sentenca + houve **mudanca substancial e duradoura** do binomio (CC 1.699) — pedir reducao OU majoracao |
| `exoneracao` | `exoneracao-alimentos` | Ja ha sentenca + busca **EXTINCAO** (maioridade + autossustento Sum. 358; conclusao graduacao REsp 1.312.706; casamento/UE do ex-conjuge CC 1.708) |
| `execucao` | `execucao-alimentos` | Sentenca/acordo ja existe + **INADIMPLEMENTO** — rito CPC 528 (prisao Sum. 309) OU §8º (penhora); Tema 1.137 CNH/passaporte; Tema 1.230 salario; Lei 8.009/90 art. 3º III bem de familia |

5. **Detecao automatica** quando o argumento for descricao livre:
   - Termos como "primeira vez", "nunca fixou", "filho nasceu" → **fixacao**.
   - "Perdi emprego", "salario caiu", "novo filho", "doenca grave" → **revisional** (polo alimentante).
   - "Aumentou despesa", "alimentante esta ganhando mais" → **revisional** (polo alimentando).
   - "Filho fez 18", "filho concluiu faculdade", "ex casou de novo" → **exoneracao** (polo alimentante).
   - "Devedor nao paga ha X meses", "atraso de pensao", "preciso da prisao" → **execucao** (polo alimentando).

6. **Cumulacao detectavel:** se a demanda envolve mais de uma sub-rotina, executar em sequencia:
   - Fixacao + execucao (improvavel, mas possivel quando sentenca de fixacao ja gera inadimplemento imediato).
   - Revisional + execucao (pedir reducao enquanto se executa o atraso).
   - Exoneracao + execucao do atrasado (alimentante pede exoneracao mas alimentando executa pretericos).

7. **Side-awareness obrigatoria** — Protocolo **P6**:
   - Polo alimentando (recebe) — postura ofensiva: fixacao, majoracao, execucao com prisao.
   - Polo alimentante (paga) — postura defensiva: contestacao, revisional para reducao, exoneracao, defesa em execucao (justificativa CPC 528 §3º, HC com fungibilidade, impugnacao ao cumprimento).

8. **Sem polo definido, PARE e pergunte** — PA-05 + PA-19. **Sem polo, sem peca.**

9. **Cruzamento P4 — alertas especiais:**
   - **Maria da Penha (Lei 11.340)** — pensao em atraso pode configurar **violencia patrimonial** (art. 7º IV). Em execucao, esse cruzamento reforca o pedido coercitivo e justifica medidas atipicas mais robustas.
   - **Compensatorios NAO autorizam prisao civil** — natureza indenizatoria, nao alimentar pura.
   - **Gravidicos com DNA negativo pos-parto** — irrepetibilidade prevalece (REsp 1.629.423), salvo ma-fe.

10. **Aplicar Camada 1 (PAs)** em todo o fluxo:
    - **PA-01** — sem juizo moral sobre inadimplencia ou conduta do ex.
    - **PA-03 / P1** — Sumula 309, 358, 596, 621, Tema 886, Tema 1.137 (2026), Tema 1.230, CC 1.694/1.696/1.699/1.708/1.700 — confirmar vigencia.
    - **PA-06** — segredo de justica (CPC 189 II).
    - **PA-08** — prazos: 3 dias justificacao CPC 528 §3º; 15 dias contestacao (CPC 697); 15 dias impugnacao ao cumprimento.
    - **PA-13** — menor envolvido: supraprincipio melhor interesse.
    - **PA-16** — vitima VD: endereco do advogado como domicilio (CPC 77 V).

11. **Encerrar pelo Pipeline canonico:**
    - skill operacional roda → `revisao-final-familia` (Suprema Corte R1-R4) → entrega ao advogado.

**Skills disponiveis para acionamento:** `fixacao-alimentos`, `revisional-alimentos`, `exoneracao-alimentos`, `execucao-alimentos`. Em caso de duvida sobre a trilha correta apos leitura do CASO.md, **PERGUNTAR ao advogado** antes de produzir.
