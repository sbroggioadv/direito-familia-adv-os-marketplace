---
description: Aciona producao de peca em trilha de ALIENACAO PARENTAL (T8) — acao AUTONOMA ou INCIDENTAL fundada na Lei 12.318/2010 (art. 2º conceito; art. 4º procedimento + tramitacao prioritaria + tutela; art. 5º pericia biopsicossocial 90d; art. 6º 7 medidas escalonadas). Distingue AP de cuidado protetivo legitimo. Side-aware (vitima de alienacao x acusado de alienar). Oitiva especializada Lei 13.431/2017 + Res. 226/2024 CNJ + Res. 299/2019 CNJ. Interface Maria da Penha + Lei 13.715/2018 + Lei 14.344/2022.
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: [autonoma | --incidente | --acusado | descricao livre]
---

Voce foi acionado pelo comando `/alienacao-parental` (alias `/ap`) do plugin Direito-Familia-Adv-OS.

Argumento recebido: `$ARGUMENTS`

**Objetivo:** redigir peca em trilha **T8 — alienacao parental** (Lei 12.318/2010), seja como acao autonoma (medidas do art. 6º), incidente em acao em curso (art. 4º), ou defesa em modo acusado. **Cuidado:** STJ rejeita uso ligeiro (REsp 2.108.750-GO/2024) — ampla dilacao probatoria eh obrigatoria em acusacoes reciprocas; nunca usar a Lei 12.318 como arma generica.

## PROTOCOLO

1. **Confirmar polo do cliente** lendo o `CASO.md`:
   - **MODO VITIMA** — cliente sofre AP. Acao autonoma OU incidente.
   - **MODO ACUSADO** — cliente eh acusado de alienar. Defesa, com **cuidado protetivo legitimo** como possivel tese-mae.
   - Sem polo definido => **parar e perguntar** (PA-05 + PA-19).
2. **Antes de qualquer producao,** acionar `cruzamento-multi-esfera` (P4):
   - Concomitancia com Maria da Penha? Lei 11.340 + Lei 14.550/2023 + Lei 14.994/2024.
   - Falsa denuncia de abuso sexual? (Lei 12.318 art. 2º par. unico VI — forma severa) — paralela criminal: CP 138 calunia / CP 339 denunciacao caluniosa / CP 340 falsa comunicacao.
   - Filho como vitima indireta de VD? Lei 13.715/2018 + Lei 14.344/2022 (Henry Borel).
   - Encaminhamento criminal generico (PA-17 — sem citar produto).
3. **PA-13** (melhor interesse como supraprincipio) + **PA-14** (oitiva especializada Lei 13.431/2017 + Res. 226/2024 + Res. 299/2019 CNJ — nao revitimizacao, sala adaptada, profissional capacitado, genitores NUNCA presentes) + **PA-16** (sigilo absoluto do endereco da vitima quando aplicavel) + **PA-18** (sem opinar sobre conduta clinica) + **PA-23** (anonimizacao maxima).
4. **Aplicar P1** (Vigencia) antes de citar normas/jurisprudencia. Sem Selo, sem peca.
5. **Aplicar P2** (Integridade Documental):
   - Modo vitima: ata notarial de mensagens (CPC 384 — ouro); gravacoes ambientais (RE 583.937 STF, RG); diario de cumprimento datado; testemunhas qualificadas (Conselho Tutelar = ouro); videos; BOs; mediacoes frustradas; laudo do AT.
   - Modo acusado (sobretudo mae protetora): IML + laudo psicologico da crianca + depoimento especial (Lei 13.431) + qualquer prova de violencia anterior; cronologia da denuncia (anterior ao conflito => credibilidade; surgindo com o conflito => cautela).
6. **Distinguir AP de cuidado protetivo legitimo** (criterio central):
   - Origem (subita sem evento vs apos evento).
   - Discurso (decorado vs hesitante/fragmentado).
   - Ambivalencia (ausente vs presente).
   - Sintomas clinicos (queixas verbais vs somatizacao/regressao).
   - **Nao usar "SAP"** — sem reconhecimento CFP/CFM/OMS/APA.
7. **Aplicar P5** (Foro/Vara): vara de familia da comarca do menor (Sumula 383 STJ). Quando ha concomitancia VD, JVDFM em paralelo.
8. **Modo vitima => pedido escalonado** (art. 6º): tutela (declaracao de indicio + tramitacao prioritaria + visitacao assistida + fixacao de domicilio + multa + acompanhamento); merito I a VII conforme gravidade; pericia art. 5º (90d); oitiva especializada; MP (CPC 178 II); Conselho Tutelar (ECA 136 IV).
9. **Modo acusado => 6 teses canonicas** (Negativa + Cuidado protetivo legitimo + Impugnacao da pericia + Comportamento autentico + Ausencia de elementos do tipo + Proporcionalidade contra inversao). Em mae protetora acusada: **cuidado protetivo legitimo eh tese-mae + PA-16 maxima**.
10. **Pericia (art. 5º)** sempre — nomear AT e protocolar 12 quesitos canonicos. Sem pericia, sem inversao (escalonamento STJ).
11. **P7** Suprema Corte R1-R4 antes de entregar — acionar `revisao-final-familia` com atencao maxima em R3 a PA-13/14/16/18/23.

**Skills acionadas:** `alienacao-parental`; sempre `validador-legislacao-vigente`, `cruzamento-multi-esfera`, `localizacao-vara-familia`, `memoria-de-caso-familia`, `revisao-final-familia`. Quando ha laudo em disputa, encaminhar a `laudo-psicossocial-analise`. Quando ha modificacao de guarda como consequencia, articular com `modificacao-guarda`.

**Bypass aceito:** `--no-corte`, `--quick` ou `/corte off` — saida sem R1-R4, com ressalva OAB reforcada e log em `<cwd>/direito-familia/.audit-log.json`. PAs (Camada 1) permanecem invioláveis mesmo em bypass. Em AP, PA-13/14/16 sao **nunca** dispensaveis.
