# Direito-Familia-Adv-OS

> Plugin Claude Code/Cowork — sistema operacional do advogado familista brasileiro.

[![Versao](https://img.shields.io/badge/versao-0.1.0--alpha.1-blue)]() [![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow)]() [![Licenca](https://img.shields.io/badge/licenca-MIT-green)]()

---

## Visao Geral

Plugin de **direito de familia brasileiro** com 4 Camadas de governance, side-awareness (polo do cliente) e Revisao Tecnica R1-R4 sobre toda entrega.

### Cobertura
- **Divorcio** — judicial + extrajudicial (Res. 35 CNJ) + partilha de bens + alimentos compensatorios
- **Guarda** — compartilhada (regra geral CC art. 1.583), unilateral, modificacao, plano de parentalidade
- **Alimentos** — fixacao, revisao, exoneracao, execucao (Sumula 309 STJ — prisao civil), gravidicos (Lei 11.804)
- **Alienacao parental** (Lei 12.318/2010) — caracterizacao, medidas, pericia psicossocial
- **Paternidade** — investigacao, contestacao, socioafetiva, multiparentalidade (Tese 622 STF)
- **Uniao estavel** — reconhecimento, dissolucao, regime de bens, pacto antenupcial
- **Violencia domestica** — Lei Maria da Penha + JVDFM + interface civel-criminal
- **Adocao + tutela + curatela** — ECA + Lei 13.146/2015 (LBI — tomada de decisao apoiada)
- **Inventario em acao de familia** — sobrepartilha, colacao, redutivel

### Arquitetura
- **~32 skills** em 7 Tiers (Tier 0 master + Tier 1 transversais + Tier 2-6 tematicos)
- **Side-awareness** — alimentante × alimentando, guardiao × nao-guardiao, autor × reu
- **Protocolo P4 — Cruzamento Multi-esfera** — familia × criminal × ECA × sucessoes × previdenciario
- **Suprema Corte R1-R4** — revisao tecnica de excelencia em toda entrega

---

## Instalacao via UI Cowork

1. Abrir o Claude Cowork → Settings → Plugins
2. Aba "Pessoal" → "+" → "Adicionar marketplace"
3. Colar a URL do marketplace recebida na sua compra
4. Sincronizar e instalar
5. Rode `/start-familia` no Claude Cowork para configurar sua persona (advogado, OAB, cidade, frentes de atuacao, tom de voz)

(Manual visual completo com prints da instalacao acompanha o pacote do produto.)

---

## Configuracao Inicial

Apos instalar, rode em qualquer workspace:

```
/start-familia
```

O wizard pergunta:
- Nome do advogado, OAB e UF
- Nome do escritorio
- Cidade e UF de atuacao
- Frentes de atuacao (divorcio / guarda / alimentos / alienacao / Maria da Penha / paternidade / adocao / curatela / todos)
- Tom de voz (formal / acolhedor / direto)
- Modo de melhor saida (consensual-first / litigioso-first / hibrido)

Gera persona local em `<cwd>/direito-familia/persona.md` (fora do plugin) e ativa as skills.

---

## ATENCAO — LGPD + Segredo de Justica

**Direito de familia trabalha com dados altamente sensiveis:**
- Dados de menor (ECA + LGPD art. 14)
- Vitima de violencia domestica (sigilo absoluto)
- Processo em segredo de justica (CPC art. 189 II)
- Dados sensiveis de saude (Maria da Penha — laudos psicologicos)

**NUNCA configure o workspace de casos em pasta sincronizada** (Dropbox, iCloud, Google Drive, OneDrive). O plugin emite warning agressivo se detectar pasta sincronizada como root do cowork.

---

## Licenca

MIT — ver `LICENSE`.

---

## Autoria

Plugin desenvolvido pela equipe **IA Combativa Adv-OS** — sistema operacional do advogado brasileiro com IA.

Persona do operador (identidade do advogado-cliente) e **resolvida em runtime** via persona local. Plugin distribuido nao contem dados pessoais nem do desenvolvedor.

---

**Versao:** 0.1.0-alpha.1 (Sprint 0 — scaffold inicial, em desenvolvimento)
