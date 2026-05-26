---
description: Atalho da trilha T2 — uniao estavel judicial. Aciona peticao-uniao-estavel (side-aware MODO AUTOR Inter Vivos / MODO AUTOR Post Mortem / MODO REU conforme polo). Cobre reconhecimento + dissolucao + partilha (CC 1.723-1.727; Lei 9.278/96 art. 7º par. unico) e reconhecimento post mortem para fins sucessorios (Tema 809 STF — CC 1.790 inconstitucional; aplica 1.829). Aplica P1 (Selo), P2 (checklist documental — IRPF, contas, redes sociais com ata notarial), P5 (foro CPC 53 I), P6 (side-awareness), P7 (R1-R4). Alias: /ue.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [descricao livre ou --post-mortem | --modo-reu]
---

Voce foi acionado pelo comando `/uniao-estavel` (alias `/ue`) do plugin Direito-Familia-Adv-OS (trilha **T2 — UE judicial**).

Argumento recebido: `$ARGUMENTS`

**Objetivo:** produzir peticao inicial (Inter Vivos OU Post Mortem) ou contestacao cruzada em acao de UE, alinhada ao polo do cliente (PA-05 + P6).

## PROTOCOLO

1. **Verificar CASO.md** — abrir `<cwd>/direito-familia/casos/<slug>/CASO.md`. Sem CASO.md aberto, acionar `/triagem-familia` antes. Confirmar **Polo do cliente** e **Modalidade da UE** (inter vivos / post mortem / contestacao). Sem dado, **pare e pergunte**.
2. **Acionar a skill `peticao-uniao-estavel`** (Tier 2A). Ela:
   - Le o polo (companheiro autor inter vivos / companheiro sobrevivente post mortem / companheiro requerido / herdeiro contestante) e flipa o modo
   - Aciona `validador-legislacao-vigente` (P1) para CC 1.521, 1.523, 1.723-1.727, 1.725, 1.790 (inconstitucional — Tema 809), 1.829, 1.831, 1.659; Lei 9.278/96 art. 7º par. unico; CPC 53 I, 313 V "a", 695-699; Sum. 380/382 STF; Temas 529/809/1.236 STF; Enunciado 573 CJF
   - Aplica P2 — checklist documental REFORCADO da UE (IRPF como dependente, contas conjuntas, plano de saude, previdencia privada, contas de consumo no endereco comum, fotos + redes sociais com ata notarial Lei 8.935/94 + Prov. CNJ 100/2020, testemunhas minimo 2, pacto escrito se houver, certidao de obito + qualificacao herdeiros no post mortem). Sem doc essencial, NAO redige
   - Aplica P5 — foro: ultimo domicilio do casal; com incapaz, domicilio do guardiao; post mortem segue ultimo domicilio do casal (STJ 2024)
   - Estrutura FIRAC bloco a bloco
   - Cumula pedidos: reconhecimento (com termo inicial e final precisos), dissolucao, partilha 50% (CC 1.725 + comunhao parcial supletiva), alimentos, guarda compartilhada, alimentos compensatorios (CC 1.694 §2º + Enunciado 573), direito real de habitacao (CC 1.831 + Lei 9.278 art. 7º par. unico) no post mortem, averbacao
   - Pede tutela de urgencia: alimentos provisorios (Lei 5.478 art. 4º) ou provisionais (CPC 300); guarda provisoria; sequestro/arrolamento (CPC 301); afastamento via CC 1.562 OU Lei 11.340 art. 22 II (LMP aplica integralmente — art. 5º III); quebra de sigilo bancario/fiscal (LC 105/2001)
   - MODO REU: gera preliminares (CPC 337) e teses — namoro qualificado, descontinuidade, ausencia de notoriedade, UE paralela vedada (Tema 529 STF + REsp 1.949.890/SC), periodo controverso, pacto patrimonial escrito, UE pre-1996 (Sum. 380 STF — exige prova de esforco comum, REsp 1.755.890/DF), indenizacao por servicos domesticos improcedente em UE caracterizada
3. **Aciona `revisao-final-familia`** (P7) antes de entregar. Veredito BLOQUEADA cancela.
4. **Atualizar CASO.md** ao final (P3).

**Atencao sucessoria (post mortem):** Tema 809 STF; concorrencia com descendentes (CC 1.829 I — interpretacao prevalente: somente sobre bens particulares; divergencia entre Turmas — `[VERIFICAR — afetacao a Secao]`); concorrencia com ascendentes (1.829 II); heranca exclusiva sem descendentes/ascendentes (1.829 III). Pleito reflexo previdenciario exige inicio de prova material (Lei 8.213/91 art. 16 §5º — Lei 13.846/2019).

**Vedacoes nucleares:** PA-01 (sem juizo moral); PA-06 (segredo CPC 189 II); PA-13 (melhor interesse supraprincipio); PA-19 (sem advocacia contra cliente); PA-23 (anonimizacao em prints).

**Skill a acionar:** `peticao-uniao-estavel`.
