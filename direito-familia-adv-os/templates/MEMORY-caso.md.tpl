# MEMORY.md — Caso {{CASO_SLUG}}

> Diario de evolucao deste caso de direito de familia. Persistente entre
> sessoes do Claude Code. Vive em
> `<COWORK>/direito-familia/casos/{{CASO_SLUG}}/MEMORY.md`. Atualizado a
> cada etapa do pipeline pela skill `memoria-de-caso-familia`.
>
> **Compartimentacao (PA-21):** este `MEMORY.md` cobre **apenas este caso**.
> Nunca misturar informacao de outro caso aqui.
>
> **LGPD reforcada (PA-22 + PA-23):** este arquivo contem dados internos
> reais. Pasta gitignored e fora de servico sincronizado.

---

## Identificacao do caso

- **Slug:** {{CASO_SLUG}}
- **Tipo de acao:** {{TIPO_ACAO}}
- **Polo do cliente:** {{POLO}}
- **Foro / vara:** {{FORO}}
- **Numero do processo:** {{NUMERO_PROCESSO}}
- **Fase processual:** {{FASE}}
- **Menor envolvido:** {{HA_MENOR}}
- **Vitima de VD:** {{HA_VIOLENCIA}}
- **Segredo de justica:** {{SEGREDO_JUSTICA}}

---

## Como funciona este diario

**Leitura automatica:** o Claude le este arquivo ao iniciar trabalho no
caso. Usa o que encontra para retomar de onde parou.

**Escrita:** a skill `memoria-de-caso-familia` registra aqui cada etapa
concluida do pipeline (triagem, auditoria documental, cruzamento
multi-esfera, jurisprudencia, linha estrategica, peca produzida,
auditoria R1-R4). Anotacoes manuais do operador ("lembre disso",
"anote", "registra que") tambem entram aqui.

---

## Linha do tempo do caso

| Data | Etapa | Resultado / Observacao |
|------|-------|------------------------|
| {{GENERATED_AT}} | Caso aberto | Polo: {{POLO}} · Tipo: {{TIPO_ACAO}} · Fase: {{FASE}} |

<!-- Exemplo de evolucao:
| 2026-05-27 | Triagem completa  | Identificado cruzamento Familia x Criminal
                                   (VD com medidas protetivas pendentes).
                                   Encaminhamento criminalista sinalizado. |
| 2026-05-28 | Auditoria documental | 7 docs ok, 3 pendentes (holerites
                                      alimentante, BO, laudo psicossocial). |
| 2026-05-30 | Tutela de urgencia   | Distribuida tutela de alimentos
                                      provisorios initio litis + guarda
                                      provisoria. Fundamento: CPC 300 +
                                      CC 1.586 + melhor interesse. |
-->

---

## Decisoes estrategicas (com alternativas descartadas)

> Cada decisao processual relevante fica registrada com:
> - Data
> - Decisao tomada
> - Fundamento (artigo + jurisprudencia)
> - Alternativa(s) descartada(s) e motivo
>
> Regra do P3: em consulta posterior, **NUNCA** recriar fundamento — usar
> esta memoria.

| Data | Decisao | Fundamento | Alternativa descartada |
|------|---------|------------|------------------------|
| — | — | — | — |

---

## Cruzamento multi-esfera (P4)

| Esfera | Detectado em | Status | Acao recomendada |
|--------|--------------|--------|------------------|
| — | — | — | — |

---

## Pendencias e pontos de omissao

*(Documentos essenciais faltantes, prazos a confirmar, dados a colher.
Sinalizados pela auditoria documental (P2) e pela Suprema Corte R1.)*

- [ ] —

---

## Pecas produzidas

> Cada peca produzida e auditada e listada com data, skill responsavel e
> veredito R1-R4.

| Data | Peca | Skill | Veredito |
|------|------|-------|----------|
| — | — | — | — |

---

## Notas manuais do operador

*(Espaco para "lembre disso", "anote", "registra que" — entrada manual
durante a conversa. A skill `memoria-de-caso-familia` migra para a tabela
adequada quando aplicavel.)*

---

**Workspace:** `{{COWORK_PATH}}`
**Caso:** {{CASO_SLUG}}
**Plugin:** `direito-familia-adv-os` v{{PLUGIN_VERSION}}
**Inicializado em:** {{GENERATED_AT}}
