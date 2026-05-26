---
description: Abre, retoma, lista ou resume um caso de direito de familia — gerencia a pasta do caso, o CASO.md (P3 — Memoria de Decisao) e o MEMORY.md compartimentado (PA-21).
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [acao] [slug-do-caso] — ex: novo divorcio-fulano-x-beltrana | listar | resumo alimentos-execucao-fulano | atualizar guarda-fulano
---

Voce foi acionado pelo comando `/caso-familia` do plugin Direito-Familia-Adv-OS.

Argumento recebido: `$ARGUMENTS`

**Objetivo:** abrir um caso novo, retomar um caso existente, listar casos abertos ou resumir um caso especifico — sempre via skill `memoria-de-caso-familia`, respeitando compartimentacao (PA-21) e LGPD reforcada (PA-22 + PA-23).

---

## PROTOCOLO

### 1. Resolver acao a partir de `$ARGUMENTS`

Parse o argumento na forma `[acao] [slug-ou-descricao]`. Acoes suportadas:

| Acao | Sinonimos aceitos | O que faz |
|------|-------------------|-----------|
| `novo` | `abrir`, `criar`, `open`, `new` | Abre caso novo — aciona `triagem-familia` antes |
| `listar` | `list`, `ls`, `casos` | Lista todos os casos abertos em `<COWORK>/direito-familia/casos/` |
| `resumo` | `resumir`, `status`, `mostrar`, `show` | Le `CASO.md` + `MEMORY.md` e apresenta resumo executivo |
| `atualizar` | `update`, `evolver` | Adiciona linha na linha do tempo / decisoes / proximo passo |
| `fechar` | `arquivar`, `close` | Marca caso como arquivado (move para `casos/_arquivados/<slug>/`) |

Se a acao nao for clara, default = `novo` quando ha slug; `listar` quando vazio.

### 2. Verificar precondicoes (PA-22)

Antes de qualquer escrita em `<COWORK>/direito-familia/`:

1. Confirmar que `$COWORK_PATH` esta resolvido (env var ou fallback).
2. Detectar se o caminho contem `Dropbox`, `iCloud`, `Google Drive`, `OneDrive`, `Sync` — se sim, **PARAR e avisar agressivamente** o advogado-cliente. Direito de familia trata dado sensivel duplo (ECA + segredo de justica + LGPD art. 11). Sem confirmacao explicita "ciente do risco, prosseguir", o comando aborta.
3. Garantir que `<COWORK>/direito-familia/.gitignore` existe e contem `casos/` + `*.md` + `partes.md`.

### 3. Acionar a skill `memoria-de-caso-familia`

Esta skill (Tier 1 — transversal) e a unica autorizada a:
- Criar/abrir/atualizar `CASO.md` (P3)
- Criar/abrir/atualizar `MEMORY.md` (diario do caso)
- Listar casos
- Resumir caso

Passe o argumento, o `$COWORK_PATH` resolvido e o `acao` decidido. A skill cuida do resto.

### 4. Fluxo por acao

#### 4.1 `novo <slug-ou-descricao>`

1. Se slug nao informado, pedir descricao curta e gerar slug (kebab-case, sem acentos, sem dados pessoais — `divorcio-001`, `alimentos-revisional-002`, `guarda-modificacao-003`).
2. Acionar `triagem-familia` para:
   - Classificar o caso em uma das 11 trilhas (divorcio, UE, alimentos fixacao/revisional/exoneracao/execucao, guarda originaria/modificacao, alienacao parental, inventario+ITCMD, laudo psicossocial).
   - Confirmar polo do cliente.
   - Detectar vulnerabilidades (menor, idoso, PcD, vitima VD).
   - Identificar cruzamento multi-esfera (P4).
3. Criar a pasta `casos/<slug>/` com:
   - `CASO.md` (a partir do template `CASO.md.tpl`, com tokens preenchidos)
   - `MEMORY.md` (a partir do template `MEMORY-caso.md.tpl`)
   - `docs/` (vazia)
   - `pecas/` (vazia)
4. Registrar caso aberto em `<COWORK>/direito-familia/cowork-state.json` no array `casos.abertos`.
5. Confirmar com o operador antes de criar (mostrar slug + tipo + polo).

#### 4.2 `listar`

1. Ler `<COWORK>/direito-familia/casos/*/CASO.md`.
2. Apresentar tabela: **Slug · Tipo · Polo · Fase · Proximo passo · Datas criticas (prazos abertos)**.
3. Casos arquivados (`casos/_arquivados/`) sao listados em segunda tabela, recolhida.

#### 4.3 `resumo <slug>`

1. Ler `casos/<slug>/CASO.md` + `casos/<slug>/MEMORY.md`.
2. Apresentar resumo executivo:
   - Identificacao (slug, tipo, polo, foro, fase)
   - Partes (anonimizadas no chat — sempre PA-23, mesmo internamente, para nao deixar nome em transcript de sessao)
   - Ultimas 3 decisoes estrategicas (com fundamento)
   - Documentos pendentes
   - Esferas paralelas detectadas
   - Proximo passo
   - Prazos abertos com vencimento ate 30 dias
   - Audit log de violacoes (se houver)

#### 4.4 `atualizar <slug>`

1. Perguntar ao operador o que adicionar (decisao processual, documento juntado, peca produzida, etc.).
2. Skill `memoria-de-caso-familia` decide em qual tabela do `CASO.md` e do `MEMORY.md` entra.
3. Registrar com data, fundamento (se decisao) e alternativa descartada (se houver).

#### 4.5 `fechar <slug>`

1. Confirmar com o operador (este caso ainda tem prazos abertos? recursos pendentes?).
2. Mover pasta para `casos/_arquivados/<slug>/`.
3. Atualizar `cowork-state.json` (`casos.arquivados`).

---

## REGRAS HARD

1. **Compartimentacao (PA-21):** este comando NUNCA pode misturar dados de casos diferentes em uma mesma operacao. Cada escrita escopo isolado.
2. **Anonimizacao externa (PA-23):** em qualquer saida que va para chat externo / log / commit / ebook / screenshot, aplicar mascaramento. Nome de menor sempre `[MENOR ANONIMIZADO]`.
3. **Segredo de justica (PA-06, CPC art. 189):** se `SEGREDO_JUSTICA = sim` no `CASO.md`, qualquer skill chamada depois disso herda o flag e tem que aplicar sigilo na saida.
4. **Sem cross-sell de plugin irmao (PA-20):** encaminhamentos sao genericos ("especialista criminalista", "especialista previdenciarista") — sem citar produto, marca ou plugin.
5. **Audit pre-commit (PA-25):** se o comando criar/editar artefato distribuivel, executar `audit/audit.py` antes de devolver controle ao operador.

---

**Skill principal a acionar:** `memoria-de-caso-familia` (Tier 1 — transversal).
**Skill encadeada (quando `acao = novo`):** `triagem-familia` (Tier 0 — orquestracao).
**Skill encadeada (quando ha cruzamento detectado):** `cruzamento-multi-esfera` (Tier 1).
**Skill encadeada (sempre antes de devolver):** `localizacao-vara-familia` (Tier 1) se houver mudanca de foro/UF/comarca.
