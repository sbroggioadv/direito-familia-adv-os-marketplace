---
name: familia-onboarding
description: >
  FAMILIA ONBOARDING — Wizard de configuracao do plugin direito-familia-adv-os no ambiente do operador. Conduz perguntas estruturadas para criar a pasta direito-familia/ com identidade (nome, OAB, escritorio, cidade), frentes de atuacao (divorcio, UE, alimentos, guarda, alienacao parental, inventario, tutelas, recursos, laudo), tom de voz, modo de melhor saida (litigioso-first / consensual-first / hibrido) e ferramentas. Wizard travado em DIREITO DE FAMILIA JUDICIAL. Use quando o operador disser configurar familia, instalar direito de familia, primeira vez, /start-familia, onboarding familia.
---

# FAMILIA ONBOARDING

> Wizard de configuracao inicial **Tier 0**. Travado em DIREITO DE FAMILIA JUDICIAL. Linguagem acolhedora, tom didatico. Conduz o operador a configurar o plugin ao perfil do escritorio. Privacidade LGPD reforcada (familia trata de dado duplamente sensivel — menor + segredo CPC 189 + vitima VD).

---

## 0. ESCOPO E ACIONAMENTO

Acionada por `/start-familia` ou quando o operador disser "configurar familia", "primeira vez", "onboarding familia". Cria `<cwd>/direito-familia/` com identidade, frentes, tom, modo e configuracao das skills. Extrajudicial (Res. 35 CNJ) **fora de escopo** — outro plugin cobre.

## 1. REGRAS DO WIZARD

1. Portugues (Brasil), tom acolhedor e direto.
2. Uma pergunta por vez para campos criticos; agrupar relacionados.
3. Defaults inteligentes — Enter aceita.
4. Validar em tempo real (OAB numerica, UF 2 letras, email valido).
5. Confirmar antes de gravar (resumo + "confirma? s/n").
6. **Idempotencia** — se ja existe `direito-familia/cowork-state.json`, perguntar atualizar vs recriar.
7. **Privacidade reforcada** — NUNCA pedir CPF, dados de cliente real, nome de menor, endereco de vitima.
8. Plugin TRAVADO em DIREITO DE FAMILIA JUDICIAL.

---

## 2. FLUXO

### Bloco 0 — Abertura

> "Ola! Sou o assistente do **Plugin Direito-Familia-Adv-OS**. Vou te guiar na configuracao (~5 min). Ao final, as ~32 skills familiares estarao adaptadas ao seu escritorio. Pronto para comecar?"

### Bloco 1 — Diretorio de trabalho (cwd) — **ATENCAO LGPD REFORCADA**

Detectar o cwd. Mostrar:

> "Vou criar a pasta `direito-familia/` aqui em `<cwd>`.
>
> ⚠️ **ATENCAO LGPD REFORCADA — direito de familia tem dado duplamente sensivel:**
> - LGPD art. 11 (dado sensivel) + ECA (menor) + CPC 189 II (segredo de justica) + Maria da Penha (vitima)
> - Se este diretorio estiver dentro de pasta sincronizada (iCloud, OneDrive, Dropbox, Google Drive), os dados dos casos podem subir para a nuvem em violacao do segredo de justica.
>
> Recomendo um caminho **local**, fora de sync (ex: `~/casos-familia/` no Mac, `C:/casos-familia/` no Windows). Confirma este diretorio?"

Se for pasta sincronizada, alertar AGRESSIVAMENTE e exigir confirmacao expressa por escrito ("confirmo ciente do risco LGPD").

### Bloco 2 — Identidade do advogado

> "Preciso da sua identidade profissional:
> 1. Nome completo?
> 2. OAB (numero)?
> 3. UF da OAB?
> 4. Cidade do escritorio?
> 5. UF da cidade?
> 6. Nome do escritorio?
> 7. Email institucional (opcional)?
> 8. Telefone (opcional)?"

Validar: OAB (digitos e pontos), UF (2 letras maiusculas), email se preenchido.

### Bloco 3 — Frentes de atuacao  ← especifico do plugin familia

> "Quais frentes de direito de familia o escritorio mais atende? (multi-select, ou `todas`)
> - Divorcio litigioso
> - Uniao estavel judicial (reconhecimento + dissolucao + post mortem)
> - Alimentos (fixacao / revisional / exoneracao / execucao)
> - Guarda originaria
> - Modificacao de guarda
> - Alienacao parental (Lei 12.318)
> - Inventario judicial + ITCMD
> - Tutelas de urgencia familiares (alimentos provisorios, guarda provisoria, afastamento do lar)
> - Recursos (ED, AI, apelacao, REsp, RE)
> - Analise de laudo psicossocial
>
> Sua resposta nao restringe nenhuma skill — apenas registra o foco do escritorio."

Gravar em `config.md` o campo `Frentes`.

### Bloco 4 — Tom de voz

> "Perfil de tom:
> 1. **acolhedor-tecnico** *(default — familia trata de pessoas vulnerabilizadas)*
> 2. **tecnico-formal** — respeitoso, distante
> 3. **tecnico-combativo** — assertivo, adversarial
>
> Intensidade de 0 a 10? (default 6 — familia exige equilibrio)
>
> O tom **flipa automaticamente** em casos com menor ou vitima de VD para MAIS acolhedor + LGPD reforcada (PA-13, PA-16)."

### Bloco 5 — Modo de melhor saida  ← especifico do plugin familia

> "Direito de familia tem dois caminhos. Como voce prefere abordar a melhor saida do caso?
> 1. **litigioso-first** *(default neste plugin — escopo JUDICIAL)* — peticao inicial direto; mediacao CPC 697 acontece no curso da acao
> 2. **consensual-first** — sempre tentar acordo / mediacao previa antes de ajuizar; passar a litigio so se nao houver convergencia
> 3. **hibrido** — decidir caso a caso na triagem
>
> Importante: este plugin cobre **CONTENCIOSO JUDICIAL**. Saidas extrajudiciais (divorcio em cartorio, escritura de UE, inventario administrativo) sao cobertas por outro plugin."

Gravar em `config.md` o campo `Modo de melhor saida`.

### Bloco 6 — Suprema Corte R1-R4

> "O plugin tem a **Suprema Corte** — auditoria de 4 etapas (R1 Brief, R2 Conteudo, R3 Compliance, R4 Performance) que revisa toda peca, recurso, parecer e calculo antes da entrega. Manter ATIVA? (s/n — default: s)
>
> Voce sempre pode pular caso a caso com `--no-corte`, `--quick` ou `/corte off`."

### Bloco 7 — Ferramentas (opcional)

> "Voce usa alguma ferramenta especifica? (pode pular)
> - Sistema de gestao processual / controle de prazos?
> - Calculo de alimentos / ITCMD?
> - Transcricao de audiencias / mediacoes?
> - CRM?"

### Bloco 8 — Geracao dos arquivos

Apresentar resumo da configuracao e pedir "confirma? (s/n)". Confirmado, gerar:

1. **`<cwd>/direito-familia/cowork-state.json`** — via `python3 scripts/state.py init`, depois `set` para os demais campos.
2. **`<cwd>/direito-familia/persona.md`** — a partir de `templates/persona.md.tpl`, resolvendo todos os tokens `{{ADVOGADO_NOME}}`, `{{OAB_NUMERO}}`, `{{OAB_UF}}`, `{{FIRM_NAME}}`, `{{CIDADE}}`, `{{UF}}`, `{{TOM_VOZ_PERFIL}}`, `{{TOM_VOZ_INTENSIDADE}}`, `{{MODO_MELHOR_SAIDA}}`, `{{AREA_FOCO}}`.
3. **`<cwd>/direito-familia/config.md`** — a partir de `templates/config.md.tpl` (frentes, tom, modo de melhor saida, ferramentas).
4. **`<cwd>/direito-familia/casos/`** — pasta vazia onde cada caso sera compartimentado (PA-21).
5. **`<cwd>/.claude/settings.local.json`** — a partir de `templates/settings-local.json.tpl`, apontando `FAMILIA_PERSONA` e `FAMILIA_COWORK_PATH`.

### Bloco 9 — Encerramento

```
Plugin Direito-Familia configurado.

Operador: <nome> — OAB/<UF> <numero>
Escritorio: <firma> (<cidade>/<UF>)
Frentes: <lista de frentes>
Tom: <perfil> (intensidade <X>/10)
Modo de melhor saida: <litigioso-first | consensual-first | hibrido>
Suprema Corte: <ATIVA | DESATIVADA>

PROXIMOS PASSOS:
1. Reinicie a sessao (o hook SessionStart injeta a sua persona)
2. Use /familia-master para ativar a cadeia completa
3. Use /triagem-familia para abrir o primeiro caso
4. Ou faca uma pergunta com termos de familia — o plugin desperta sozinho
5. /status-familia para um diagnostico do ambiente
```

---

## 3. FLUXOS ALTERNATIVOS

### State ja existente (idempotencia)

> "Detectei uma configuracao existente. Operador: <nome>. Frentes: <lista>. O que deseja?
> (a) Continuar usando — nada muda
> (b) Atualizar — refaco os blocos que voce escolher
> (c) Recriar do zero — **isto apaga a configuracao atual** (os casos em `casos/` sao preservados)"

Se (c): confirmar duas vezes antes de prosseguir.

---

## 4. VEDACOES ESPECIFICAS

- **PA-22** (sync) — pasta sincronizada exige confirmacao expressa por escrito do operador, ciente do risco.
- **PA-23** (anonimizacao) — NUNCA coletar nome de cliente real, nome de menor, endereco de vitima VD, CPF, conteudo de laudo psicossocial no wizard.
- NUNCA sobrescrever `cowork-state.json` existente sem dupla confirmacao.
- NUNCA enviar dados a servicos externos durante o wizard.
- NUNCA perguntar area juridica generica — o plugin e travado em DIREITO DE FAMILIA JUDICIAL.
- Avisar sobre pasta sincronizada com **alerta agressivo** (familia tem dado duplamente sensivel — diferente do trabalhista/tributario).

## 5. CHECKLIST FINAL

- [ ] `<cwd>/direito-familia/cowork-state.json` valido no schema
- [ ] `<cwd>/direito-familia/persona.md` com tokens resolvidos
- [ ] `<cwd>/direito-familia/config.md` com frentes, tom, modo de melhor saida
- [ ] `<cwd>/direito-familia/casos/` criada (vazia)
- [ ] `<cwd>/.claude/settings.local.json` com `FAMILIA_PERSONA` e `FAMILIA_COWORK_PATH`
- [ ] LGPD: cwd NAO sincronizado OU confirmacao expressa registrada no state
- [ ] Frentes, tom de voz, modo de melhor saida e Suprema Corte definidos
