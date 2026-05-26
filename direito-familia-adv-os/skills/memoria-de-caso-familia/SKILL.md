---
name: memoria-de-caso-familia
description: >
  MEMORIA DE CASO FAMILIA — Skill Tier 1. Executa o Protocolo P3 (Memoria de
  Decisao) e o regime de compartimentacao PA-21. Cria e mantem
  `<cwd>/direito-familia/casos/<caso-slug>/` para cada caso aberto, com `CASO.md`
  (polo, tipo, foro/vara, partes anonimizadas externamente, linha do tempo,
  checklist de documentos, proximo passo) e `MEMORY.md` evolutivo. Eh a FONTE
  UNICA do polo do cliente — toda skill produtora le dali. Atualiza apos cada
  decisao processual relevante e apos PostToolUse (debounce 60s anti-flap).
  Antes de nova producao, LE o CASO.md primeiro. Nunca mistura dados de casos
  diferentes (PA-21). Em pasta sincronizada (Dropbox/iCloud/Drive/OneDrive),
  emite warning agressivo e BLOQUEIA escrita de dado real ate confirmacao
  explicita do advogado (PA-22). Pasta gitignored por default (LGPD reforcada,
  segredo art. 189 CPC, ECA, vitima de VD).
---

# MEMORIA DE CASO FAMILIA

> Skill **Tier 1** — fonte unica de verdade sobre o caso. Implementa o
> **Protocolo P3** (Memoria de Decisao) e a **PA-21** (compartimentacao).
> Acionada na abertura, na retomada e ao final de cada etapa para registrar
> evolucao.

---

## 0. ESCOPO E ACIONAMENTO

Acionada por:
- `triagem-familia` na abertura ou retomada de caso.
- `/caso-familia` quando o operador pede status/atualizacao.
- Toda skill produtora ao concluir etapa (registrar decisao + atualizar prazo).
- Hook `PostToolUse` (Edit|Write) quando o cwd toca arquivo em
  `<cwd>/direito-familia/` — registra evento e aciona com debounce 60s
  (anti-flap).

## 1. ESTRUTURA CANONICA DA PASTA

```
<cwd>/direito-familia/                    raiz da operacao (gitignored por default)
├── cowork-state.json                     estado da workspace
├── persona.md                            identidade do advogado (resolvida em runtime)
├── config.md                             tom de voz, modo, frentes
├── .hook-state.json                      debounce dos hooks
├── .memory-evolver-pending.json          fila do PostToolUse
├── .audit-log.json                       log de PAs violadas
├── .snapshots/                           pre-compact snapshots
└── casos/                                1 subpasta por caso
    ├── caso-001-divorcio-<slug>/
    │   ├── CASO.md                       ficha (polo, tipo, foro, linha do tempo)
    │   ├── MEMORY.md                     log evolutivo do caso
    │   ├── partes.md                     dados das partes (so internamente)
    │   ├── docs/                         documentos do cliente
    │   ├── pecas/                        pecas produzidas (versionadas)
    │   └── jurisprudencia/               precedentes localizados
    └── caso-002-alimentos-<slug>/
```

**Slug do caso:** `caso-NNN-<tipo>-<parte-anonimizada-curta>` em kebab-case
(ex.: `caso-007-alimentos-fixacao-mr`, onde "mr" eh um codigo interno, nao o
nome real). Em outputs distribuidos, anonimizar (PA-23).

## 2. ABERTURA DE CASO NOVO

1. Verificar **se o cwd esta em pasta sincronizada** (vide secao 7). Sem
   confirmacao do advogado, abortar.
2. Definir slug do caso a partir das partes — **codigo interno**, nao nome real.
3. Criar `casos/<slug>/` com subpastas `docs/`, `pecas/`, `jurisprudencia/`.
4. Gerar `CASO.md` a partir de `templates/CASO.md.tpl`, preenchendo:
   - **Polo do cliente** (obrigatorio — sem isso, nenhuma skill produtora avanca)
   - Tipo de acao (uma das 11 trilhas da `triagem-familia`)
   - Foro/Vara (vindo de `localizacao-vara-familia`)
   - Cidade/UF
   - Cliente / Contraparte (anonimizados externamente; internos so na pasta)
   - Estado civil, regime de bens, existencia de filhos menores, idade dos
     menores, situacao de violencia/vulnerabilidade
   - Cruzamento multi-esfera detectado (vindo de `cruzamento-multi-esfera`)
5. Gerar `MEMORY.md` evolutivo a partir do template.
6. Registrar a abertura na linha do tempo do `MEMORY.md`.

## 3. RETOMADA DE CASO EXISTENTE

1. Localizar a pasta `casos/<slug>/`.
2. Ler `CASO.md` (estado, polo, foro, linha do tempo, proximo passo) e
   `MEMORY.md` (log evolutivo).
3. Apresentar ao operador resumo curto: polo, fase atual, ultima etapa,
   pendencias, prazos vencendo.
4. Retomar de onde parou.

## 4. O CASO.md — FONTE UNICA DO POLO

Estrutura minima (preenchida na abertura, atualizada continuamente):

```markdown
# Caso <slug>

**Polo do cliente:** <autor/reu/alimentante/alimentando/requerente/requerido/...>
**Tipo:** <divorcio litigioso | UE | alimentos-fixacao | alimentos-revisional |
            alimentos-exoneracao | alimentos-execucao | guarda-originaria |
            modificacao-guarda | alienacao-parental | inventario-judicial |
            recurso | tutela-urgencia>
**Foro / Vara:** <Vara de Familia | Vara Civel | JVDFM | Vara dos Orfaos> —
                 Comarca de {{CIDADE}}/{{UF}}
**Cliente:** {{CLIENTE}}   (cod interno: <ID>)
**Contraparte:** {{CONTRAPARTE}}   (cod interno: <ID>)
**Vulnerabilidades:** <menor / idoso / PCD / vitima de VD / nenhum>
**Segredo de justica:** SIM (CPC 189 II) — anonimizar sempre em outputs distribuidos
**Cruzamento multi-esfera:** <familia x criminal | familia x ECA | familia x
sucessoes | familia x previdenciario | nenhum>

## Estado civil / Regime de bens
- Casamento: <civil/religioso com efeito civil>
- Regime: <comunhao parcial CC 1.658 | universal 1.667 | separacao convencional 1.687
   | separacao legal 1.641 + Sum. 377 STJ | participacao final aquestos 1.672>

## Filhos
- <Quantidade> menores | idades anonimizadas em outputs externos

## Linha do tempo
- [AAAA-MM-DD] Abertura do caso
- [AAAA-MM-DD] Triagem concluida — trilha T<N>
- [AAAA-MM-DD] Foro confirmado (P5)
- [AAAA-MM-DD] Selo P1 carimbado para peca <X>
- [AAAA-MM-DD] Peticao inicial entregue ao operador
- [AAAA-MM-DD] Designada audiencia de mediacao (CPC 695) em <data>

## Documentos (checklist P2)
- [x] Certidao de casamento atualizada
- [ ] Holerite/IR alimentante
- [ ] Comprovante de despesas do alimentando

## Decisoes tomadas
- [AAAA-MM-DD] Optei pelo rito comum CPC 693 ao inves de Lei 5.478 — sem
  prova pre-constituida de parentesco (fundamento)

## Pendencias / Pontos de omissao
- Confirmar endereco protegido da vitima (PA-16)

## Proximo passo
- Aguardar designacao de audiencia de mediacao
- Prazo de contestacao: 15d apos a audiencia (CPC 697)
```

**Sem o campo `Polo do cliente`, NENHUMA skill produtora avanca** (PA-05).

## 5. O MEMORY.md DO CASO — LOG EVOLUTIVO

Registro narrativo dos eventos do caso:

- **Linha do tempo** — data + etapa + resultado (triagem, Selo P1, peca,
  audiencia, decisao, recurso, R1-R4).
- **Decisoes estrategicas** — fundamento de cada escolha relevante (rito,
  pedido cumulativo, tutela autonoma, recurso adequado).
- **Pendencias** — documentos faltantes, prazos a confirmar, anonimizacoes
  pendentes.
- **Pecas produzidas** — cada peca com data, polo, Selo P1 e veredito R1-R4.
- **Anotacoes manuais** do operador ("anote isso", "lembre disso") tambem entram.

Anotar **apos cada acao concluida**. Compactacao anti-flap: debounce 60s — se
ha dois Edits em sequencia rapida no mesmo arquivo, registrar um unico evento.

## 6. COMPARTIMENTACAO (PA-21)

- Cada caso vive **so na sua pasta**. Nenhuma skill le ou cita dados de outro
  caso.
- `MEMORY.md` de um caso cobre **apenas aquele caso**.
- Em outputs externos (manual, ebook, exemplo de skill), nada do CASO.md sai
  identificavel — sempre `[ANONIMO]` (PA-23).
- Plugin **nao indexa** o conjunto de casos pra busca cruzada. Cada caso eh
  uma ilha.

## 7. PASTA SINCRONIZADA (PA-22) — REGIME DURO

Familia trata de dado **duplamente sensivel**: menor (ECA art. 17/18 + LGPD
art. 14) + segredo de justica (CPC 189 II) + vitima de VD (Lei 11.340 +
Lei 14.344). Hook detecta se `<cwd>` esta em:

- Dropbox / Dropbox Business
- iCloud Drive / iCloud
- Google Drive / drive-fs / GoogleDrive
- OneDrive / OneDrive - <org>
- Box

Quando detectado:

1. **Warning agressivo** apresentado ao operador na primeira interacao da
   sessao:
   > "ATENCAO: cwd em pasta sincronizada. Direito de familia envolve dados
   > sensiveis (LGPD art. 11, ECA, segredo de justica CPC 189). Sincronizacao
   > automatica para nuvem pode violar sigilo profissional + LGPD. Recomenda-se
   > mover a operacao para pasta local nao-sincronizada."
2. **Bloqueio de escrita** de dado real (nome civil, CPF, endereco,
   diagnostico, nome de menor) ate que o advogado **confirme explicitamente**:
   "ciente do risco, prosseguir aqui mesmo".
3. Confirmacao gravada em `.audit-log.json` com timestamp.
4. Mesmo apos confirmacao, anonimizacao continua reforcada em outputs.

Sem confirmacao, plugin trabalha apenas com placeholders `{{...}}` na pasta.

## 8. PRAZOS NO CASO.md

Manter prazos atualizados (PA-08):

- ED: 5 dias uteis (CPC 1.022)
- AI / Apelacao / REsp / RE / EmbDiv / Agravo Interno: 15 dias uteis (CPC 219)
- Contestacao em acao de familia: 15 dias apos audiencia de mediacao (CPC 697)
- Replica: 15 dias
- Cumprimento de sentenca: 15 dias para pagamento voluntario (CPC 523)
- Recursais STJ/STF: confirmar com `validador-legislacao-vigente`

## 9. VEDACOES ESPECIFICAS

- **PA-21** — jamais misturar dados de casos diferentes.
- **PA-22** — sem confirmacao do advogado em pasta sincronizada, sem escrita
  de dado real.
- **PA-23** — outputs externos sempre anonimizados.
- **PA-05** — manter o campo `Polo do cliente` sempre preenchido.
- Nunca commitar dados de caso (`direito-familia/` gitignored por default).
- Nunca gravar pasta de caso fora de `<cwd>/direito-familia/casos/`.

## 10. INTEGRACAO

Acionada por: `triagem-familia`, `/caso-familia`, hook `PostToolUse`, e por
toda skill produtora ao final de etapa. Provê o `CASO.md` para todas as demais
skills — eh a **fonte unica do polo** (P6). O `/status-familia` agrega resumo
de todos os casos abertos lendo cada `CASO.md`.
