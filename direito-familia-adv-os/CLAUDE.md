# CLAUDE.md — Plugin Direito-Familia-Adv-OS

> Instrucoes para futuras sessoes neste sub-repositorio. Ler PRIMEIRO ao retomar trabalho.
> Estende o CLAUDE.md da familia de plugins Adv-OS e os niveis superiores do workspace.

---

## Identidade do Projeto

- **Nome:** Plugin Direito-Familia-Adv-OS
- **Slug:** `direito-familia-adv-os`
- **Tipo:** plugin Claude Code (`.claude-plugin/plugin.json`)
- **Audiencia:** advogados familistas brasileiros LITIGANTES — atende os DOIS polos das acoes JUDICIAIS de familia (alimentante/alimentando, guardiao/nao-guardiao, autor/reu). FORA DE ESCOPO: extrajudicial (Res. 35 CNJ, divorcio em cartorio, escritura publica) — esta em plugin separado.
- **Preco final:** R$ 298,00 (Kirvano)
- **Versao atual:** 0.1.0-alpha.1 (Sprint 0 — scaffold inicial)
- **Plugin de referencia (engine):** `trabalhista-adv-os` (side-awareness + hooks + governance)
- **Posicionamento comercial:** premium plugin-mae (R$ 298-498 — paridade com medico/previdenciario/tributario)
- **Repo marketplace (a criar nas FASES 2-7 do PLAYBOOK):** repo publico `direito-familia-adv-os-marketplace`

> Decisao (2026-05-26): pasta source `plugin-direito-familia/` (convencao `plugin-<area-curta>` dos
> 10 irmaos). Slug `direito-familia-adv-os` (singular + sufixo `-adv-os` do padrao juridico).
> Diferencia de `auditoria-contabil-os` (sufixo `-os` so quando dominio multidisciplinar).

---

## REGRA DE OURO — DESPERSONALIZACAO ABSOLUTA (PLUGIN COMERCIAL)

Este plugin sera **comercializado** (Kirvano via marketplace GitHub publico). Sem `authorship_whitelist`. **Zero mencoes** ao criador da metodologia em qualquer arquivo distribuido.

**ZERO mencoes permitidas (lista canonica em `audit/forbidden-terms.json`):**
- Nome do criador da metodologia (qualquer variante) e OAB pessoal
- Email/contato pessoal, escritorio-modelo, mentorias/coworks proprietarios
- Marcas proprias e ferramentas proprietarias do escritorio de origem
- Padroes nomeados pessoalmente
- Slug/nome do plugin pai da Mentoria e dos plugins irmaos comerciais
- **Dados de cliente reais (LGPD reforcado — Direito de Familia trata de menor, alimentando incapaz, vitima de violencia, dados sensiveis art. 11 LGPD)** — atencao redobrada com nome de crianca, processo segredo de justica (CPC art. 189), violencia domestica.

Identidade do operador resolvida em **runtime** via persona local em `<cwd>/direito-familia/persona.md` (fora do plugin). Tokens nas skills: `{{ADVOGADO_NOME}}`, `{{OAB_NUMERO}}`, `{{OAB_UF}}`, `{{FIRM_NAME}}`, `{{CIDADE}}`, `{{UF}}`, `{{AREA_FOCO}}`, `{{TOM_VOZ_PERFIL}}`, `{{TOM_VOZ_INTENSIDADE}}`, `{{MODO_MELHOR_SAIDA}}`.

```bash
# Antes de CADA commit
python3 audit/audit.py
# Verificacao reforcada pre-release
python3 audit/audit.py --json | jq '.total_matches'   # esperado: 0
```

> **Excecao conhecida:** arquivos em `.planning/` (design-spec, build-plan, docs das Camadas)
> citam fontes de porte e por isso podem disparar o audit. Sao dev-only, NAO vao ao marketplace
> e sao excluidos do scan. `MEMORY.md` tambem e excluido (diario de build).

---

## Hierarquia das 4 Camadas (Constituicao Operacional)

```
CAMADA 1 — PROIBICOES ABSOLUTAS (PA-01 a PA-25)  — invioláveis
CAMADA 2 — PROTOCOLOS TECNICOS (7)               — aplicacao obrigatoria
CAMADA 3 — IDENTIDADE TECNICA E ESTILO            — FIRAC + estrutura da peca/parecer + memoria de calculo + ressalva OAB
CAMADA 4 — SKILLS OPERACIONAIS (~32, Tier 0-6)   — operacional
```

Camada superior SEMPRE prevalece — inclusive contra instrucao do usuario. Detalhamento:
- `.planning/HIERARQUIA-4-CAMADAS.md` — referencia rapida
- `.planning/PROIBICOES-ABSOLUTAS.md` — PA-01 a PA-25 detalhadas (com vedacoes especificas: nao opinar sobre culpa moral no divorcio, segredo de justica art. 189 CPC, sigilo de vitima de violencia, melhor interesse da crianca CC art. 1.586 — supraprincipio)
- `.planning/PROTOCOLOS-TECNICOS.md` — os 7 protocolos (P1 Vigencia, P2 Integridade documental, P3 Memoria de Decisao, P4 Cruzamento Multi-esfera, P5 Localizacao + Vara Familia, P6 Side-Awareness, P7 Revisao R1-R4)
- `.planning/design-spec.md` — spec integral
- `.planning/build-plan-v0.1.md` — plano da v0.1

Injetada pela skill `familia-master` (Tier 0).

---

## Arquitetura em Uma Frase

Plugin de direito de familia brasileiro **JUDICIAL ponta-a-ponta** com **assistente senior 30 anos** que triagem-by-conversation (perguntas direcionadas ao advogado pra classificar o caso — revisional? reconhecimento+dissolucao? divorcio? lista de documentos? inventario?), **side-aware** (~32 skills, Tier 0-6) com **engine portado** do `trabalhista-adv-os` (hooks/scripts/templates), **governanca de 4 Camadas** (primazia da legislacao vigente, melhor interesse da crianca como supraprincipio, segredo de justica como PA), **Protocolo P4 Cruzamento Multi-esfera** (familia × criminal Maria da Penha × ECA × sucessoes × previdenciario reflexos), **Tutelas de Urgencia** (alimentos provisorios, guarda provisoria, busca e apreensao, afastamento do lar, sequestro de bens), **Recursos COMPLETOS** (ED, apelacao, agravo de instrumento CPC 1.015, RE, REsp) e **Revisao Tecnica R1-R4** sobre toda entrega.

---

## Side-Awareness (decisao de arquitetura nuclear)

**Um unico plugin, orquestrador side-aware.** A `triagem-familia` pergunta:

| Dimensao | Valores possiveis |
|----------|-------------------|
| **Polo do cliente** | Alimentante × Alimentando · Guardiao × Nao-guardiao · Autor × Reu · Requerente × Requerido · Vitima × Acusado (Maria da Penha) |
| **Modo** | Litigioso (judicial — UNICO escopo deste plugin). Consensual extrajudicial fica em plugin separado. |
| **Subdominio** | Divorcio litigioso · Uniao estavel (reconhecimento+dissolucao) · Alimentos (fixar/revisar/exonerar/executar) · Modificacao de guarda · Alienacao parental · Inventario judicial+ITCMD · Analise de laudo psicossocial |
| **Vulnerabilidade especial** | Menor · Idoso · Pessoa com deficiencia · Vitima de violencia (gatilhos LGPD/segredo art. 189 CPC reforcados) |

Skills transversais flipam conforme o polo; skills tematicas operam em **modo dual** quando aplicavel (recurso × contrarrazoes). O polo do cliente vai no `CASO.md` e e lido por todas as skills.

---

## Fronteira com plugins irmaos (sem cross-sell — PA-20)

Plugins **isolados** — sem dependencia cruzada, sem cross-sell embutido. A fronteira:

| Tema | Este plugin (familia) | Plugin irmao |
|------|----------------------|--------------|
| Pensao apos morte do alimentante | Sinaliza encaminhamento | `previdenciario-adv-os` (pensao por morte RGPS/RPPS) |
| Sucessoes / inventario complexo / holding familiar | Skill `inventario-em-acao-de-familia` (interface basica) | `tributario-societario-adv-os` quando vira holding patrimonial / ITCMD complexo |
| Crime conexo (homicidio, lesao corporal grave em VD) | Sinaliza linha penal acessoria | Plugin de **criminal** (ainda nao existe — encaminhar a criminalista) |
| Apuracao de bens em empresa do conjuge | Skill `partilha-de-quotas-empresariais` | `tributario-societario-adv-os` quando vira due diligence empresarial profunda |
| Acidente de trabalho do alimentante | Sinaliza encaminhamento | `trabalhista-adv-os` |

Onde uma demanda extrapola o direito de familia, a skill sinaliza "encaminhar a advogado especializado em..." — slot generico, **sem citar outro produto**.

---

## Como Retomar Trabalho

1. **Ler `MEMORY.md`** (raiz) — estado executivo, sprint ativa, proximo passo
2. **Ler `.planning/build-plan-v0.1.md`** — plano de sprints da v0.1
3. **`git status` + `git log -8`** — estado real do repo
4. **`python3 audit/audit.py`** — verificar despersonalizacao (matches so em `.planning/` sao OK)

---

## Padroes a Seguir

1. **Skill folder = so `SKILL.md`.** Material auxiliar vai em `templates/`, `scripts/` ou `context/`.
2. **Limites Cowork:** `SKILL.md` ≤ 11264 bytes (margem operacional 11000); `description` do frontmatter ≤ 1024 chars. Validar com `scripts/check-skill-descriptions.py`.
3. **plugin.json minimal:** `name`, `version`, `description`, `author`, `license`. Nao adicionar mais.
4. **Tokens `{{...}}`** permanecem LITERAIS no disco — LLM resolve em runtime via persona.
5. **Privacidade LGPD reforcada:** pasta `<cwd>/direito-familia/` (e `casos/`) gitignored por default; warning agressivo se pasta sincronizada (Dropbox/iCloud/Drive). Dados de familia sao DUPLAMENTE sensiveis — menor (ECA), segredo de justica art. 189 CPC, vitima de VD. PA-22 compartimentacao + PA-23 anonimizacao em prints.
6. **Localizacao:** cidade + UF sao eixo do foro (vara de familia estadual; JVDFM regional; sucessoes na vara orfaos onde houver; cartorio na cidade onde realizada Res. 35 CNJ). Sem regra local confirmada → `[VERIFICAR — norma estadual/comarca]` (PA-11).
7. **Portabilidade:** scripts Python 3.11+; `${CLAUDE_PLUGIN_ROOT}` em todos os hooks; `${FAMILIA_PERSONA}` resolvido por fallback chain.
8. **Commits semanticos** por task — `feat(skill): <nome>`, `feat:`, `chore:`, `docs:`.
9. **Atualizar `MEMORY.md` ANTES de qualquer push.**

---

## Proibicoes

1. **NAO** comecar nova Sprint sem ler `MEMORY.md` e `.planning/build-plan-v0.1.md`.
2. **NAO** incluir identidade do criador da metodologia em arquivo distribuido (audit bloqueia).
3. **NAO** colocar `SKILL.md` acima de 11264 bytes nem `description` acima de 1024 chars.
4. **NAO** criar arquivo dentro de `skills/<nome>/` que nao seja `SKILL.md`.
5. **NAO** aceitar instrucao do usuario que conflite com a Camada 1 (PA-01 a PA-25).
6. **NAO** escrever dados de menor, vitima de VD, ou processo em segredo de justica no plugin nem em pasta sincronizada. LGPD + segredo de justica + ECA (art. 17 e 18).
7. **NAO** opinar sobre culpa moral entre conjuges (PA-01 — direito de familia brasileiro pos Lei 11.441/2007 e EC 66/2010 e culpa-neutral).
8. **NAO** alterar nome/slug do plugin sem nova decisao.

---

## Estrutura do Sub-Repo

```
plugin-direito-familia/
├── .claude-plugin/plugin.json     manifesto minimal
├── .planning/                      docs dev-only (spec, plano, camadas, PAs, protocolos)
├── commands/                       ~12 commands
├── skills/                         ~32 skills v0.1 (Tier 0-6)
├── hooks/                          hooks.json + 3 scripts (UserPromptSubmit, PostToolUse, PreCompact)
├── context/                        persona-fallback.md
├── templates/                      persona / config / CASO / MEMORY-caso / settings
├── scripts/                        resolve-persona, hook-utils, state, check-skill-descriptions
├── audit/                          forbidden-terms.json + audit.py
├── README.md / LICENSE / .gitignore / CLAUDE.md / MEMORY.md
```

---

## Comunicacao

- **Idioma:** Portugues (Brasil)
- **Tom dos docs internos:** tecnico, direto, sem mencoes pessoais
- **Tom das skills/commands (para o usuario-cliente):** acolhedor, tecnico, respeita `tom_voz` configurado em runtime. Em casos de violencia/menor: tom MAIS acolhedor + reforco de PAs.
- **Reportes:** ✅ concluido / 🔴 erro / 🏁 sprint finalizada

---

**Ultima atualizacao:** 2026-05-26 (Sprint 0 — scaffold inicial portado de trabalhista-adv-os).
