---
description: Sub-rotina recursal — roteia entre Embargos de Declaracao (ED), Agravo de Instrumento (AI), Apelacao, Recurso Especial (REsp), Recurso Extraordinario (RE) ou contrarrazoes conforme o tipo de decisao alvo + polo do cliente. Aplica Camadas 1-3 + Protocolos P1-P7 + Suprema Corte R1-R4. Atalho oficial do Tier 5.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [ed | ai | apelacao | resp | re | contrarrazoes | descricao livre]
---

Voce foi acionado pelo comando `/recurso` do plugin Direito-Familia-Adv-OS.

Argumento recebido: `$ARGUMENTS`

**Objetivo:** rotear a demanda recursal para a skill operacional correta do Tier 5, conforme o tipo de decisao alvo + polo do cliente registrado no `CASO.md`.

## PROTOCOLO

1. **Verificar configuracao** — procurar `direito-familia/cowork-state.json` subindo a arvore. Se nao encontrar, sugerir `/start-familia` antes; em fallback, prosseguir avisando.

2. **Ler `CASO.md` do caso ativo** (`<cwd>/direito-familia/casos/<slug>/CASO.md`):
   - Polo do cliente (recorrente × recorrido) — **variavel-mae PA-05**;
   - Decisao alvo: interlocutoria / sentenca / acordao;
   - Data da intimacao (calculo do prazo);
   - Subdominio (divorcio, UE, alimentos, guarda, AP, inventario);
   - Vulnerabilidade especial (menor — PA-13/14; vitima VD — PA-16; idoso/PCD — PA-15);
   - Cruzamento P4 (Maria da Penha, ECA).

3. **Sem CASO.md aberto, acionar primeiro `/triagem-familia`** — sem trilha + polo, nao prosseguir.

4. **ROTEAMENTO — escolher UMA das 5 skills:**

| Sub-rotina | Skill acionada | Quando |
|------------|----------------|--------|
| `ed` | `ed-familia` | Decisao com vicio do CPC 1.022 (obscuridade, contradicao, omissao, erro material) OU prequestionamento previo a REsp/RE. Prazo **5 dias uteis**. |
| `ai` | `agravo-instrumento-familia` | Decisao **INTERLOCUTORIA** — alimentos provisorios, guarda provisoria, busca e apreensao, afastamento do lar, suspensao de visitas, sequestro de bens, bloqueio de patrimonio (CPC 1.015 I); ou mitigacao **Tema 988** STJ. Prazo **15 dias uteis**. |
| `apelacao` | `apelacao-familia` | **SENTENCA** adversa (CPC 203 §1º) — divorcio, alimentos, guarda, UE, paternidade, AP, inventario. Prazo **15 dias uteis**. |
| `resp` | `resp-re-familia` | **ACORDAO** do TJ que viola lei federal (CF 105 III "a"), valida ato local x lei federal ("b") ou diverge de outro tribunal ("c"). Prazo **15 dias uteis**. |
| `re` | `resp-re-familia` | **ACORDAO** do TJ que viola CF, declara inconstitucionalidade de tratado/lei federal, valida lei local x CF ou lei local x lei federal. Repercussao geral OBRIGATORIA (CPC 1.035). Prazo **15 dias uteis**. |
| `contrarrazoes` | `recurso-familia-contrarazoes` | Contraparte interpos qualquer recurso. Skill adaptativa monta contrarrazoes ao tipo (ED/AI/Apelacao/REsp/RE). Prazo: igual ao recurso original (5d ED; 15d demais). |

5. **Detecao automatica** quando o argumento for descricao livre:
   - "Sentenca esqueceu de", "decisao tem contradicao", "esclarecer", "prequestionar" → **ed**.
   - "Decisao liminar", "decisao provisoria adversa", "fixou alimentos provisorios", "negou guarda provisoria", "afastou do lar" → **ai**.
   - "Sentenca de divorcio", "sentenca de alimentos", "sentenca de guarda", "perdi na primeira instancia" → **apelacao**.
   - "Acordao do TJ violou lei", "acordao divergente", "levar pro STJ" → **resp**.
   - "Acordao violou CF", "questao constitucional", "Tema 622 multiparentalidade", "Tema 809 sucessao UE", "levar pro STF" → **re**.
   - "Contraparte recorreu", "preciso defender da apelacao", "contrarrazoes" → **contrarrazoes**.

6. **Side-awareness obrigatoria** — Protocolo **P6**:
   - **Polo recorrente:** acoes ofensivas — ED/AI/Apelacao/REsp/RE.
   - **Polo recorrido:** acao defensiva — `recurso-familia-contrarazoes`.
   - **Sem polo definido, PARE** (PA-05 + PA-19).

7. **Cascata recursal — encadeamento de skills:**
   - **Decisao liminar adversa** → opor `ed-familia` em 5d (se ha vicio) + `agravo-instrumento-familia` em 15d (apos intimacao da decisao dos ED, com efeito interruptivo CPC 1.026).
   - **Sentenca adversa** → `ed-familia` em 5d (prequestionar) + `apelacao-familia` em 15d.
   - **Acordao adverso** → `ed-familia` em 5d (prequestionar — essencial para REsp/RE) + `resp-re-familia` em 15d.
   - **Contraparte recorreu** → `recurso-familia-contrarazoes` no prazo do recurso original.

8. **Cruzamento P4 — alertas especiais:**
   - **Maria da Penha:** pensao em atraso configura **violencia patrimonial** (Lei 11.340 art. 7º IV) — reforca pedido coercitivo em apelacao em alimentos.
   - **ECA + Tema 622 STF (multiparentalidade):** acordao que nega registro de dupla paternidade comporta RE direto.
   - **Tema 809 STF (UE/sucessao):** afronta a equiparacao companheiro/conjuge comporta RE.

9. **Aplicar Camada 1 (PAs)** em todo o fluxo:
   - **PA-01** — sem juizo moral entre ex-conjuges nas razoes recursais.
   - **PA-03 / P1** — Sumulas e Temas vigentes: 7, 98, 211, 277, 283, 358, 568, 596 STJ; 279, 282, 283, 356 STF; Temas 622, 809, 498, 660, 988, 1.137, 1.187 — confirmar.
   - **PA-06** — segredo de justica (CPC 189 II) — pedir em todos os recursos.
   - **PA-08** — prazos: **5 dias** ED (CPC 1.023); **15 dias** AI/Apelacao/REsp/RE/Embargos Diverg./Agravo Interno (CPC 219).
   - **PA-13** — menor envolvido: supraprincipio do melhor interesse.
   - **PA-16** — vitima VD: endereco protegido em todas as pecas.

10. **Estrategia recursal canonica** (ordem do arquivo 07 §9):
    - **Decisao liminar adversa:** ED em 5d → AI em 15d → eventual pedido de efeito suspensivo/ativo.
    - **Sentenca adversa:** ED em 5d → Apelacao em 15d, capitulo por capitulo, com prequestionamento.
    - **Acordao adverso:** ED em 5d (prequestionar dispositivos federais/constitucionais) → REsp e/ou RE em 15d (simultaneos se ha dupla materia).
    - **Decisao monocratica no TJ:** Agravo Interno (CPC 1.021) em 15d.
    - **Inadmissao de REsp/RE na origem:** agravo CPC 1.042 (motivo "comum") OU agravo interno CPC 1.021 (RG/repetitivos) — confundir = erro grosseiro.

11. **Encerrar pelo Pipeline canonico:**
    - Skill operacional roda → `revisao-final-familia` (Suprema Corte R1-R4 — Camada 3) → entrega ao advogado.

**Skills disponiveis para acionamento:** `ed-familia`, `agravo-instrumento-familia`, `apelacao-familia`, `resp-re-familia`, `recurso-familia-contrarazoes`.

Em caso de duvida sobre qual recurso usar apos leitura do CASO.md (ex: cabe ED ou AI direto? cabe REsp ou RE ou ambos?), **PERGUNTAR ao advogado** antes de produzir — recurso errado eh **erro grosseiro** e pode levar a NAO conhecimento.
