---
description: Aciona a skill `memoria-de-caso-familia` em modo "listar/resumir todos os casos abertos" — varre `<cwd>/direito-familia/casos/*/CASO.md` (PA-21 compartimentado) e devolve panorama compacto com polo, trilha, foro, status, proximo passo, pendencias documentais (P2), prazos abertos e bloqueios R1-R4.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [opcional: --completo para detalhar; --pendentes para so listar bloqueios; --slug <slug> para um caso especifico]
---

Voce foi acionado pelo comando `/status-familia` (alias `/status`) do plugin Direito-Familia-Adv-OS.

Argumento recebido: `$ARGUMENTS`

**Objetivo:** dar ao advogado um panorama compacto dos casos de familia ativos sob o escritorio — com polo, trilha, foro, proximo passo, pendencias documentais (P2), prazos abertos, bloqueios R1-R4 e flags de cruzamento multi-esfera.

## PROTOCOLO

1. **Localizar a pasta canonica do escritorio** — subir a arvore a partir do cwd ate achar `direito-familia/casos/`. Se nao existir, sugerir `/start-familia` antes.

2. **Validar PA-21** (compartimentacao por caso) e **PA-22** (pasta sincronizada) — checar `direito-familia/cowork-state.json`; se a pasta estiver em Dropbox/iCloud/Drive/OneDrive sem warning aceito, emitir aviso agressivo e abortar a varredura.

3. **Acionar `memoria-de-caso-familia`** em modo `listar`:
   - Varre todos os `direito-familia/casos/<slug>/CASO.md`;
   - Para cada caso, extrai: slug anonimo, polo do cliente, trilha (T1-T11), foro+vara, contraparte (anonima), proximo passo, pendencias documentais (P2 — checklist), prazos abertos, bloqueios R1-R4, flags de cruzamento multi-esfera (P4), vulnerabilidade especial (menor/idoso/PCD/vitima VD).

4. **Aplicar filtros conforme `$ARGUMENTS`:**
   - Sem flag → **resumo compacto** (1 linha por caso);
   - `--completo` → bloco detalhado por caso;
   - `--pendentes` → apenas casos com bloqueio R1-R4 (BLOQUEADA) ou pendencia documental critica;
   - `--slug <slug>` → apenas o caso indicado, em modo detalhado.

5. **Tabela compacta sugerida (modo resumo):**

| Slug | Polo | Trilha | Vara | Cruzamento | Proximo passo | Bloqueio |
|------|------|--------|------|-----------|---------------|----------|
| [slug] | [autor/reu] | [T1...T11] | [Vara Fam comarca/UF] | [familia/criminal/sucessoes/...] | [acao + prazo] | [livre / R3 BLOQUEADA] |

6. **Side-awareness:** se algum caso nao tem polo definido em CASO.md, **destacar como pendencia critica** (P6/PA-05).

7. **Anonimizacao obrigatoria (PA-23):**
   - Slug anonimo (nunca nome real);
   - Crianca → `[MENOR]`;
   - Contraparte → genericos (`[PARTE CONTRARIA]`);
   - Endereco de vitima VD → `[PROTEGIDO]`;
   - CPF/RG mascarados.

8. **Sigilo (PA-06 + PA-24):**
   - Nao replicar trechos de laudo psicossocial;
   - Nao expor dados de processo em segredo de justica em qualquer saida persistida.

**Atalhos:** `/status-familia`, `/status`.

**Skill a acionar:** `memoria-de-caso-familia` (modo `listar` / `resumir`).
