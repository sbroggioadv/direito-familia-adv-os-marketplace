---
name: guarda-originaria
description: >
  GUARDA ORIGINARIA — Skill Tier 2B. Produz acao de guarda + regulamentacao de
  convivencia + alimentos C/C tutela de urgencia, modalidade COMPARTILHADA como
  regra (CC 1.584 §2º + Tema 1.137 STJ — REsp 1.878.041), unilateral so com
  inaptidao comprovada (violencia, abuso, abandono, dependencia ativa — Lei
  13.715/2018 + CC 1.638), alternada/nidacao em hipoteses excepcionais.
  Side-aware (requerente x requerido x detentor de fato). Inclui plano parental
  de 12 clausulas, pedido de estudo psicossocial (CPC 699), oitiva especializada
  (Lei 13.431/2017 + Res. 226/2024 CNJ + Res. 299/2019 CNJ), Sumula 383 STJ,
  REsp 1.629.994. Acione quando o operador disser guarda originaria, acao de
  guarda, guarda compartilhada, guarda unilateral, plano parental, tutela
  guarda provisoria, /guarda, ou T6.
---

# GUARDA ORIGINARIA

> Skill **Tier 2B** — trilha **T6**. Acao de guarda + convivencia + alimentos
> com tutela de urgencia, **side-aware**.

## 0. ESCOPO

Use quando ainda **nao ha** sentenca/acordo de guarda anterior. Se ja ha,
use `modificacao-guarda` (rebus sic stantibus). Se o eixo central e
alienacao parental, use `alienacao-parental` (a guarda eh consequencia).

## 1. HIERARQUIA

Camada 4. Consome P1 (Vigencia), P2 (Documental), P3 (Memoria), P4
(Cruzamento), P5 (Foro/Vara), P6 (Side-awareness), P7 (R1-R4). Reforco de
**PA-13** (melhor interesse supraprincipio), **PA-14** (oitiva
especializada), **PA-06** (segredo CPC 189 II) e **PA-23** (anonimizacao
quando menor).

## 2. SIDE-AWARENESS — 3 POLOS

| Polo | Quem | Pretensao tipica |
|------|------|------------------|
| **Requerente** | Quem ajuiza | Compartilhada com base no requerente OU unilateral fundamentada |
| **Requerido** | Quem e citado | Defender propria aptidao; recusar pedido de unilateral adverso |
| **Detentor de fato atual** | Quem ja exerce cuidado primario | Formalizar guarda atual + principio da continuidade |

Polo indefinido => **parar e perguntar** (PA-05 + PA-19).

## 3. AS 4 MODALIDADES

| Modalidade | Quando pleitear | Fundamento |
|------------|-----------------|------------|
| **Compartilhada** (REGRA) | Ambos aptos, mesmo com conflito; mesmo em cidades diferentes | CC 1.584 §2º + Lei 13.058/2014 + Tema 1.137 STJ (REsp 1.878.041) + REsp 2.038.760 |
| **Unilateral** | Inaptidao comprovada (violencia, abuso, dependencia ativa, condenacao) | CC 1.584 §2º parte final + Lei 13.715/2018 + CC 1.638 par. unico II |
| **Compartilhada com convivencia alternada** | Acordo + proximidade + escola unica + idade ≥6 | Construcao jurisprudencial |
| **Nidacao** | Transicao 6-12 meses por acordo | Sem texto — homologavel quando acordo |

**Inversoes pos-2014:** quem pede UNILATERAL prova inaptidao do outro.
Conflito **NAO** afasta compartilhada (Tema 1.137). Distancia geografica
**NAO** afasta compartilhada (REsp 1.878.041 e 2.038.760, ate paises
diferentes).

## 4. PRINCIPIOS REITORES

- **Melhor interesse da crianca como supraprincipio** (CF 227 + ECA 4º + CC
  1.586 + Conv. ONU 1989 — PA-13). Em conflito, vence a crianca.
- **Convivencia** — direito autonomo da crianca **e** do nao guardiao (CF
  227 + ECA 19 §3º + CC 1.589). Nao eh benesse do guardiao.
- **Igualdade dos genitores** (CF 5º I + CF 226 §5º) — "tender years
  doctrine" superada. "Menino precisa do pai" / "menina precisa da mae" sem
  amparo.
- **Oitiva especializada do menor** (PA-14) — sala adaptada + profissional
  capacitado + sem genitores + oitiva unica (nao revitimizacao). Sempre
  apontar Lei 13.431/2017 + CPC 699 + Res. 226/2024 CNJ + Res. 299/2019 CNJ.
  Acima de 12 anos: vontade tem peso significativo (Conv. ONU art. 12).

## 5. ESQUELETO DA PETICAO (MODO REQUERENTE)

Producao em **FIRAC** por bloco.

```
EXMO. JUIZ DE DIREITO DA {{NUMERO}}ª VARA DE FAMILIA — {{COMARCA}}/{{UF}}
(foro do menor — Sumula 383 STJ)

{{QUALIFICACAO_AUTOR}}, vem propor
ACAO DE GUARDA, REGULAMENTACAO DE CONVIVENCIA E ALIMENTOS C/C TUTELA DE URGENCIA
em face de {{QUALIFICACAO_REU}}.

I — FATOS (objetivos — PA-01)
1. {{HISTORICO_UNIAO_E_FILIACAO}}.
2. {{FILHO_ANONIMIZADO}}, nascido em {{DATA}}, sob cuidado primario do Autor desde {{DATA}}; escola {{ESCOLA}}.
3. {{ROTINA_E_VINCULO}}. 4. {{CONDUTA_DO_REU — sem juizo moral}}.

II — DIREITO
II.1 Modalidade: compartilhada (REGRA — CC 1.584 §2º + Tema 1.137) OU unilateral fundamentada (Lei 13.715/2018 + CC 1.638 par. unico II).
II.2 Convivencia: plano parental anexo (§6).
II.3 Alimentos cumulados (CPC 327) — binomio.

III — TUTELA DE URGENCIA (CPC 300)
5. Fumus: vinculo + rotina + documentacao. Periculum: risco da demora.
6. Requer (i) guarda provisoria; (ii) convivencia provisoria; (iii) alimentos provisorios R$ {{VALOR}} ou {{X}}% liquidos.

IV — PEDIDOS
7. (a) tutela; (b) mediacao (CPC 695); (c) citacao; (d) estudo psicossocial (CPC 699); (e) oitiva do menor em escuta especializada (CPC 699 + Lei 13.431/2017 + Res. 226/2024 CNJ + Res. 299/2019 CNJ); (f) procedencia: guarda {{MODALIDADE}} + plano homologado + alimentos definitivos; (g) sucumbencia.
8. Provas: documental, testemunhal, pericial, oitiva pessoal.
9. Valor: R$ {{12_x_ALIMENTOS_+_SIMBOLICO}} (CPC 292 III).

{{LOCAL}}, {{DATA}}.
{{ADVOGADO_NOME}} — OAB/{{OAB_UF}} {{OAB_NUMERO}}

[Ressalva OAB — PA-07]
```

## 6. PLANO PARENTAL — 12 CLAUSULAS

1. Modalidade (compartilhada como regra — CC 1.583 §1º).
2. Base de moradia (CC 1.583 §3º) — endereco + cidade.
3. Rotina semanal — dias/horarios precisos com cada genitor.
4. Ferias escolares — revezamento Natal/Reveillon.
5. Datas comemorativas (Dia das Maes/Pais; Pascoa, Natal, Reveillon,
   aniversario — revezamento).
6. Comunicacao cotidiana — chamada/videochamada diaria 19h-21h. Obstrucao
   = AP (Lei 12.318 art. 2º par. unico II e III).
7. Decisoes fundamentais (escola, saude, religiao, viagens) — consenso ou
   suprimento.
8. Despesas (porcentagem ou itens — mensalidade, saude,
   extracurriculares).
9. Viagens nacionais — comunicacao previa 15 dias.
10. Viagens internacionais — autorizacao expressa de AMBOS (Decreto
    3.413/2000 + ECA 84-85). Negativa => suprimento na **Vara da Infancia
    e Juventude** (STJ 2025). Retencao indevida => Conv. Haia 1980
    (PA-12).
11. Mudanca de domicilio — comunicacao 60 dias + consentimento ou
    suprimento (CC 1.583 §3º).
12. Mediacao preventiva — camara privada (30d) antes de judicializar.

## 7. TUTELA DE URGENCIA — GUARDA PROVISORIA

**Requisitos (CPC 300):**
- Fumus: vinculo + situacao fatica consolidada + aptidao.
- Periculum: risco da demora; em regra, manutencao do **status quo**.

**Cuidado com tutela INVERSIVA** (crianca esta com o Reu, Autor quer pra
si): STJ rejeita mudancas abruptas (REsp 2.108.750-GO/2024). So viavel com
prova robusta — violencia documentada, abuso em apuracao com indicios
fortes, sumico (Lei 12.318 art. 2º VII), fraude. **Preferir** medida menos
drastica antes (visita supervisionada, acompanhamento, multa).

## 8. ESTUDO PSICOSSOCIAL (CPC 699)

**Obrigatorio** quando ha discussao de abuso ou alienacao parental.
**Recomendado** em toda guarda contenciosa.

- Equipe tecnica do juizo eh regra.
- Metodologia: entrevistas individuais, observacao da diade, visita
  domiciliar, terceiros (escola, familiares).
- **Res. CFP 008/2010** — psicologo NAO decide guarda; aporta indicadores.
- **Quesitos do AT** — sempre nomear (CPC 466 §1º). 12 quesitos canonicos
  na skill `laudo-psicossocial-analise`.
- Prazo: 30-90 dias; pressionar acima de 120.

## 9. DOCUMENTOS (P2)

- [ ] Certidao de nascimento do(s) filho(s)
- [ ] RG/CPF do Autor; comprovante de residencia do Autor (estabilidade)
- [ ] Comprovante de residencia do Reu (competencia + contexto)
- [ ] Despesas com filho(s) (escola, saude, extracurriculares)
- [ ] Renda do Autor; estimativa de renda do Reu (holerite/IR)
- [ ] Fotos/videos/mensagens (preservar — STJ admite; preferir ata
      notarial CPC 384)
- [ ] Relatorios escolares/medicos
- [ ] BO se houver
- [ ] Plano parental sugerido

Falta de doc essencial => **NAO redigir**. Listar pendencias e devolver.

## 10. MODO REU — DEFESA (CPC 335)

**I — Contra UNILATERAL adversa:** "Compartilhada e regra (CC 1.584 §2º
+ Tema 1.137). O Autor nao provou inaptidao do Requerido. Conflito NAO
afasta (REsp 1.878.041 + REsp 1.629.994)."

**II — Melhores condicoes objetivas do Requerido:** escola/entorno;
suporte familiar; plano de saude; ambiente adequado.

**III — Capacidade emocional + disponibilidade:** carga horaria
compativel; rede de apoio; sem historico de risco.

**IV — Vinculo afetivo e continuidade:** reunioes escolares; consultas;
rotina diaria; testemunhas.

**V — Impugnacao do estudo psicossocial desfavoravel:** encaminhar a
`laudo-psicossocial-analise`. Caminhos: manifestacao em 15d (CPC 477
§1º); contra-laudo AT (CPC 465 §1º); esclarecimentos (CPC 477 §2º);
nova pericia (CPC 480). Ataque: oitiva unilateral; ausencia de visita
domiciliar; testes nao fundamentados; confusao opiniao/diagnostico;
tempo insuficiente; vieses de genero.

## 11. JURISPRUDENCIA CHAVE (P1)

- **Sumula 383 STJ** — competencia foro do detentor da guarda.
- **REsp 1.878.041-SP** (3ª T., Rel. Min. Nancy Andrighi, 25/05/2021 —
  Tema 1.137) — compartilhada como regra mesmo com conflito e cidades
  distintas.
- **REsp 1.629.994-RJ** (3ª T., Rel. Min. Nancy Andrighi, 06/12/2016) —
  compartilhada so afastada por inaptidao do ascendente.
- **REsp 2.038.760-RJ** (3ª T., 2023) — compartilhada nao impede mudanca
  internacional, preservado regime e melhor interesse.
- **REsp 2.108.750-GO** (3ª T., 2024) — ampla dilacao probatoria;
  vedacao a decisao sumaria em acusacoes reciprocas.
- **REsp 1.605.477-RS** (3ª T., 2016) — excepcionalidade da unilateral
  ante domicilio distante + idade lactente.
- **REsp 1.428.596-RS** (2ª S./3ª T., 2014) — compartilhada prioritaria;
  afastamento de preferencia materna automatica.
- **STJ 04/11/2025** — Vara da Infancia e Juventude competente para
  suprir autorizacao de passaporte/viagem internacional.

## 12. CRUZAMENTO MULTI-ESFERA (P4)

- Guarda + violencia => Familia × Criminal (Maria da Penha Lei 11.340 +
  Henry Borel Lei 14.344). Afastamento do lar (Lei 11.340 art. 22 III)
  **incluso** no escopo familiar. Medida protetiva no JVDFM em paralelo =>
  encaminhar a criminalista (PA-17 — sem citar produto).
- Guarda + ato infracional do filho => Familia × ECA infracional —
  encaminhar.
- Subtracao internacional => Conv. Haia 1980 + Decreto 3.413/2000
  (PA-12).

## 13. P7 — SUPREMA CORTE

R1 brief / R2 conteudo / R3 compliance / R4 performance antes de
entregar. Bypass so com `--no-corte` registrado. Camada 1 inviolavel.

## 14. ENCERRAMENTO

Toda saida carrega ressalva OAB (PA-07), anonimizacao reforcada (PA-23),
respeito a vontade do menor com discernimento (PA-13/14), e alinhamento
integral ao polo do cliente (P6 + PA-05/19).
