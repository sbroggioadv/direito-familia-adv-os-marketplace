---
description: Inicia o wizard de configuracao do plugin Direito-Familia-Adv-OS — cria a pasta direito-familia/ com identidade, frentes de atuacao, tom, modo de melhor saida e politicas LGPD reforcadas (familia trata de dado duplamente sensivel).
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [--update para reconfigurar]
---

Voce foi acionado pelo comando `/start-familia` do plugin Direito-Familia-Adv-OS.

Argumento recebido: `$ARGUMENTS`

**Objetivo:** configurar o plugin de direito de familia judicial no ambiente do operador.

## PROTOCOLO

1. **Acionar a skill `familia-onboarding`** imediatamente — ela conduz o wizard completo (~5 min).
2. O wizard cria `<cwd>/direito-familia/` com `persona.md`, `config.md`, `casos/` e `cowork-state.json`, alem de `<cwd>/.claude/settings.local.json` apontando `FAMILIA_PERSONA` e `FAMILIA_COWORK_PATH`.
3. Se ja existir `direito-familia/cowork-state.json`, a skill oferece **continuar / atualizar / recriar** (idempotencia — casos preservados em todas as opcoes).
4. Se o argumento for `--update`, ir direto para o fluxo de atualizacao.

**Atencao LGPD reforcada:** direito de familia trata de dado **duplamente sensivel** (LGPD art. 11 + ECA + CPC 189 II segredo de justica + Maria da Penha). A skill emite **alerta agressivo** se o diretorio estiver em pasta sincronizada (iCloud, OneDrive, Dropbox, Google Drive) e exige confirmacao expressa por escrito do operador, ciente do risco.

**Escopo:** plugin travado em **DIREITO DE FAMILIA JUDICIAL** (contencioso). Extrajudicial (Res. 35 CNJ — divorcio em cartorio, escritura de UE, inventario administrativo) esta fora deste plugin.

**Skill a acionar:** `familia-onboarding`.
