# Configuracao — direito-familia-adv-os

> Configuracao operacional do plugin no ambiente do escritorio. Vive em
> `<COWORK>/direito-familia/config.md`. Gerada pelo `/start-familia`. Editavel
> manualmente — mudancas valem na proxima sessao.
>
> **LGPD reforcada:** este arquivo nao contem dado de cliente, mas vive na
> mesma arvore que os `casos/<slug>/`. Aplica PA-22 (pasta NAO sincronizada)
> e gitignore obrigatorio.

---

## Polos de atuacao

- **Polos:** {{POLOS}}
  <!-- autor | reu | alimentante | alimentando | guardiao | nao-guardiao |
       requerente | requerido | vitima | acusado | ambos -->

> Define para quais lados das acoes judiciais de familia o escritorio atua.
> A `triagem-familia` confirma o polo caso a caso e grava no `CASO.md`.
> Skills transversais flipam conforme o polo; `contestacao-familia` opera
> em modo dual.

---

## Frentes ativas (multi-select)

- [{{FRENTE_DIVORCIO}}] Divorcio litigioso
- [{{FRENTE_UNIAO_ESTAVEL}}] Uniao estavel (reconhecimento + dissolucao)
- [{{FRENTE_ALIMENTOS_FIXACAO}}] Alimentos — fixacao (9 modalidades, rito Lei 5.478 vs CPC)
- [{{FRENTE_ALIMENTOS_REVISIONAL}}] Alimentos — revisional (CC art. 1.699)
- [{{FRENTE_ALIMENTOS_EXONERACAO}}] Alimentos — exoneracao (Sum. 358 STJ)
- [{{FRENTE_ALIMENTOS_EXECUCAO}}] Alimentos — execucao (CPC 528 prisao + §8 penhora)
- [{{FRENTE_GUARDA}}] Guarda originaria (compartilhada como regra)
- [{{FRENTE_MODIFICACAO_GUARDA}}] Modificacao de guarda (rebus sic stantibus)
- [{{FRENTE_ALIENACAO_PARENTAL}}] Alienacao parental (Lei 12.318)
- [{{FRENTE_INVENTARIO}}] Inventario judicial + ITCMD
- [{{FRENTE_LAUDO_PSICOSSOCIAL}}] Analise critica de laudo psicossocial
- [{{FRENTE_TUTELAS}}] Tutelas de urgencia (alimentos provisorios, guarda provisoria, busca apreensao, afastamento do lar, sequestro)
- [{{FRENTE_RECURSOS}}] Recursos (ED, AI, Apelacao, REsp, RE — modo dual)

<!-- `[x]` ativa a frente, `[ ]` desativa. As skills daquela frente so se
     ativam se a frente estiver marcada — evita ruido em consultas fora
     do escopo do escritorio. -->

---

## Vulnerabilidades atendidas (eleva cuidado das skills)

- [{{VULN_MENOR}}] Menor (ECA + CPC 698 + sigilo)
- [{{VULN_IDOSO}}] Idoso (Lei 10.741)
- [{{VULN_PCD}}] Pessoa com deficiencia (Lei 13.146 + CC art. 4)
- [{{VULN_VITIMA_VD}}] Vitima de violencia domestica (Lei 11.340 + Lei 14.344)

> Estes flags elevam o tom acolhedor e aplicam anonimizacao reforcada por
> default em saidas externas. Em laudo psicossocial, ativa PA-24
> (sigilo profissional).

---

## Tom de voz

- **Perfil:** {{TOM_VOZ_PERFIL}}
  <!-- acolhedor (default familia) | tecnico-cordial | tecnico-didatico |
       tecnico-firme | personalizado -->
- **Intensidade combativa:** {{TOM_VOZ_INTENSIDADE}}/10
- **Postura default:** {{POSTURA_DEFAULT}}

---

## Modo de fluxo

- **Modo:** {{MODO_FLUXO}}
  <!-- checkpoint (default) | continuo -->

> `checkpoint` — o pipeline para e confirma com o advogado ao fim de cada fase
> (4 checkpoints). `continuo` — entrega o pacote completo de uma vez, sem parar.

---

## Modo de Melhor Saida

- **Modo:** {{MODO_MELHOR_SAIDA}}
  <!-- litigioso-first (default) | consensual-first | hibrido -->

> O plugin atende apenas litigio judicial. `consensual-first` aqui significa
> que as skills sinalizam quando a via judicial pode ser convertida em
> acordo homologado dentro do processo (CPC art. 487 III b).

---

## Suprema Corte (Revisao R1-R4)

- **Auditoria R1-R4:** {{SUPREMA_CORTE_STATUS}}
  <!-- ATIVA (default) | DESATIVADA -->
- Bypass por demanda: `--no-corte`, `--quick`, `/corte off`.

### Bypass `--no-corte` permitido?

- **Permitido:** {{NOCORTE_PERMITIDO}}
  <!-- sim | nao -->

> Default: `sim`. Se o escritorio quer travar a auditoria como regra
> (recomendado para escritorio que ainda calibra estilo), defina `nao`.

---

## Idioma

- **Idioma de output:** {{IDIOMA}}
  <!-- pt-BR (default) -->

---

## Estado para ITCMD default

- **UF default:** {{ESTADO_ITCMD_DEFAULT}}
  <!-- ex: SP, RJ, MG, RS — UF onde o escritorio atua com mais inventarios.
       Skill `itcmd-calculo` usa este valor como fallback quando o usuario
       nao informa a UF do de cujus. -->

---

## Ferramentas declaradas

- **Ferramentas:** {{FERRAMENTAS}}
  <!-- sistema de gestao processual, transcricao, CRM, etc. — campos livres.
       Skills leem para adaptar sugestoes SEM hardcode de produtos. -->

---

**Plugin:** `direito-familia-adv-os` v{{PLUGIN_VERSION}}
**Gerado em:** {{GENERATED_AT}}
**State source:** `{{COWORK_PATH}}/direito-familia/cowork-state.json`
