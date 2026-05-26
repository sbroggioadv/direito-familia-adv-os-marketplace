#!/usr/bin/env python3
"""
Hook UserPromptSubmit do plugin Direito-Familia-Adv-OS.

Logica (ativacao automatica por contexto):
1. Le o prompt via stdin (JSON padrao Claude Code hooks).
2. Detecta bypass explicito: flags `--no-corte`, `--quick`, `--no-suprema`, `/corte off`.
3. Detecta GATILHO DE FAMILIA via keywords (3 niveis):
   - Gatilho 1: prompt contem palavra "familia"/"familiar"/"divorcio"/"guarda"
   - Gatilho 2: keywords fortes do dominio (alimentos, alienacao parental, paternidade,
     pensao, uniao estavel, Maria da Penha, ECA, adocao, curatela, etc.)
   - Gatilho 3: comandos `/start-familia`, `/familia-master`, etc.
4. Se gatilho dispara:
   - Verifica se `direito-familia/cowork-state.json` existe no path atual
   - SIM: injeta protocolo R1-R4 + aponta para skill `familia-master`
   - NAO: sugere `/start-familia` ao usuario (mas nao bloqueia)
5. Se ha bypass: reafirma em stdout que o bypass foi aceito (transparencia).
6. Se nao eh tarefa de familia nem juridica geral: silencio (exit 0 sem output).

Tambem respeita state.json: se `suprema_corte.enabled = false`, nunca injeta R1-R4.

Stdlib only.
"""

from __future__ import annotations

import io
import json
import os
import re
import sys
from pathlib import Path

if sys.stdout.encoding and sys.stdout.encoding.lower() != "utf-8":
    sys.stdout = io.TextIOWrapper(sys.stdout.buffer, encoding="utf-8", errors="replace")
    sys.stderr = io.TextIOWrapper(sys.stderr.buffer, encoding="utf-8", errors="replace")

SCRIPT_DIR = Path(__file__).resolve().parent
PLUGIN_ROOT = SCRIPT_DIR.parent.parent
sys.path.insert(0, str(PLUGIN_ROOT / "scripts"))

import importlib.util
spec = importlib.util.spec_from_file_location("hook_utils", PLUGIN_ROOT / "scripts" / "hook-utils.py")
hook_utils = importlib.util.module_from_spec(spec)
spec.loader.exec_module(hook_utils)


# Gatilho 1: palavras-raiz do dominio (case insensitive, com/sem acento)
TRIGGER_FAMILIA = [
    r"\bdireito\s+de\s+fam[íi]lia\b",
    r"\bdireito\s+familiar\b",
    r"\bvara\s+de\s+fam[íi]lia\b",
    r"\bju[íi]zo\s+de\s+fam[íi]lia\b",
    r"\bacao\s+de\s+fam[íi]lia\b",
    r"\bação\s+de\s+fam[íi]lia\b",
    r"\bdiv[óo]rcio\b",
    r"\bguarda\s+(compartilhada|unilateral|alternada|de\s+filho)\b",
    r"\balimentos\b",
    r"\bpens[ãa]o\s+aliment[íi]cia\b",
    r"\bpens[ãa]o\s+aliment[ar][ar]?\b",
]

# Gatilho 2: keywords fortes do dominio de familia brasileiro
DOMAIN_KEYWORDS = [
    # Diplomas e orgaos
    r"\bCC\s+art\.?\s*1\.?5[0-9]{2}\b",  # CC arts. 1.511-1.590 (familia)
    r"\bCC\s+art\.?\s*1\.?6[0-9]{2}\b",
    r"\bCC\s+art\.?\s*1\.?7[0-9]{2}\b",
    r"\bJVDFM\b", r"\bJ\.?V\.?D\.?F\.?M\.?\b",  # Juizado Violencia Domestica
    r"\bCNJ\b", r"\bRes\.?\s+35\s+CNJ\b",
    r"\bCRESS\b", r"\bCFP\b",  # Conselhos profissionais (perito psicossocial)
    # Divorcio e separacao
    r"\bdiv[óo]rcio\s+(judicial|litigioso|direto|indireto)\b",
    r"\bseparac[ãa]o\s+(judicial|de\s+corpos|de\s+fato)\b",
    r"\bEC\s+66/?2010\b",
    # Guarda e convivencia
    r"\bguardi[ãa]o\b", r"\bn[ãa]o-?guardi[ãa]o\b",
    r"\bregulamentac[ãa]o\s+de\s+(visitas|conviv[êe]ncia|guarda)\b",
    r"\bplano\s+de\s+parentalidade\b", r"\bplano\s+parental\b",
    r"\bbest\s+interest\b", r"\bmelhor\s+interesse\s+da\s+crianca\b",
    r"\bmelhor\s+interesse\s+da\s+criança\b",
    # Alimentos
    r"\bbin[ôo]mio\s+necessidade-?possibilidade\b",
    r"\balimentos\s+(grav[íi]dicos|provis[óo]rios|definitivos|transit[óo]rios|compensat[óo]rios)\b",
    r"\bLei\s+5\.?478\b", r"\bLei\s+11\.?804\b",
    r"\bexonerac[ãa]o\s+de\s+alimentos\b",
    r"\brevis[ãa]o\s+de\s+alimentos\b",
    r"\bpris[ãa]o\s+civil\s+por\s+alimentos\b",
    r"\bS[úu]mula\s+309\s+STJ\b",
    r"\balimentante\b", r"\balimentand[oa]\b",
    # Alienacao parental
    r"\bLei\s+12\.?318\b", r"\balienac[ãa]o\s+parental\b",
    r"\bs[íi]ndrome\s+de\s+alienac[ãa]o\s+parental\b",
    r"\bestudo\s+psicossocial\b", r"\bper[íi]cia\s+psicossocial\b",
    # Paternidade / filiacao
    r"\binvestigac[ãa]o\s+de\s+paternidade\b",
    r"\bcontestac[ãa]o\s+de\s+paternidade\b",
    r"\breconhecimento\s+(de|da)\s+(paternidade|maternidade|filiac[ãa]o)\b",
    r"\bpaternidade\s+socioafetiva\b", r"\bmultiparentalidade\b",
    r"\bTese\s+622\s+STF\b", r"\bRE\s+898\.060\b",
    r"\bexame\s+de\s+DNA\b", r"\bS[úu]mula\s+301\s+STJ\b",
    # Uniao estavel / casamento / regime de bens
    r"\buni[ãa]o\s+est[áa]vel\b",
    r"\bregime\s+de\s+bens\b",
    r"\bcomunh[ãa]o\s+(parcial|universal)\b",
    r"\bseparac[ãa]o\s+(total|convencional|obrigat[óo]ria)\s+de\s+bens\b",
    r"\bparticipac[ãa]o\s+final\s+nos\s+aquestos\b",
    r"\bpacto\s+antenupcial\b",
    r"\bdissoluc[ãa]o\s+de\s+uni[ãa]o\s+est[áa]vel\b",
    # Violencia domestica
    r"\bLei\s+Maria\s+da\s+Penha\b", r"\bLei\s+11\.?340\b",
    r"\bmedida\s+protetiva\b", r"\bmedidas\s+protetivas\s+de\s+urg[êe]ncia\b",
    r"\bviol[êe]ncia\s+dom[ée]stica\b", r"\bfemin[ií]cidio\b",
    r"\bart\.?\s+121\s+§\s*2[ºo]?-?A\b",
    # Adocao / tutela / curatela
    r"\badoc[ãa]o\b", r"\bECA\b", r"\bLei\s+8\.?069\b",
    r"\btutela\b", r"\bcuratela\b",
    r"\bLei\s+13\.?146\b", r"\bLBI\b", r"\bEstatuto\s+da\s+Pessoa\s+com\s+Defici[êe]ncia\b",
    r"\btomada\s+de\s+decis[ãa]o\s+apoiada\b",
    r"\binterdic[ãa]o\b",
    # Inventario familiar / sucessoes basicas
    r"\binvent[áa]rio\s+(judicial|extrajudicial)\b",
    r"\bpartilha\s+(de\s+bens|amig[áa]vel|judicial)\b",
    r"\bsobrepartilha\b",
    r"\bcolac[ãa]o\b", r"\bredut[íi]vel\b",
    # Outros conceitos
    r"\bdano\s+moral\s+em\s+familia\b",
    r"\babandono\s+(afetivo|material)\b",
    r"\bafili[ai]c[ãa]o\b",
    r"\bregistro\s+civil\s+das\s+pessoas\s+naturais\b",
    r"\bRC\s*PN\b",
    r"\bemancipac[ãa]o\b",
    r"\bsegredo\s+de\s+justic[ãa]\b",
    r"\bart\.?\s+189\s+CPC\b",
]

# Gatilho 3: commands prefixados do plugin
PLUGIN_COMMANDS = [
    "/start-familia",
    "/familia-master",
    "/triagem-familia",
    "/caso-familia",
    "/divorcio",
    "/guarda",
    "/alimentos",
    "/alienacao-parental",
    "/paternidade",
    "/maria-penha",
    "/adocao",
    "/peticao-familia",
    "/contestacao-familia",
    "/recurso-familia",
    "/parecer-familia",
    "/jurisprudencia-familia",
    "/revisao-familia-final",
    "/status-familia",
]

# Keywords juridicas gerais (fallback — se prompt eh juridico mas nao familia,
# ainda assim aplica protocolo cauteloso de Suprema Corte)
LEGAL_KEYWORDS_GENERAL = [
    r"\bpeticao\b", r"\bpetição\b", r"\bcontestacao\b", r"\bcontestação\b",
    r"\brecurso\b", r"\bapelacao\b", r"\bapelação\b",
    r"\bembargos\b", r"\breplica\b", r"\bréplica\b",
    r"\bparecer\b", r"\bjurisprudencia\b", r"\bjurisprudência\b",
    r"\bsentenca\b", r"\bsentença\b", r"\bdecisao\b", r"\bdecisão\b",
    r"\baudiencia\b", r"\baudiência\b", r"\bprocesso\b",
]

BYPASS_TOKENS = [
    "--no-corte",
    "--no-suprema",
    "--quick",
    "/corte off",
    "/corte-off",
]


def _load_input() -> dict:
    raw = sys.stdin.read().strip()
    if not raw:
        return {}
    try:
        return json.loads(raw)
    except Exception:
        return {}


def _matches_any(text: str, patterns: list[str]) -> bool:
    for pat in patterns:
        if re.search(pat, text, re.IGNORECASE):
            return True
    return False


def _is_familia(prompt: str) -> bool:
    """Detecta se o prompt e do dominio de familia (gatilhos 1, 2 ou 3)."""
    if _matches_any(prompt, TRIGGER_FAMILIA):
        return True
    if _matches_any(prompt, DOMAIN_KEYWORDS):
        return True
    low = prompt.lower()
    for cmd in PLUGIN_COMMANDS:
        if cmd.lower() in low:
            return True
    return False


def _is_legal_general(prompt: str) -> bool:
    """Detecta se e tarefa juridica em geral (mesmo nao sendo de familia)."""
    return _matches_any(prompt, LEGAL_KEYWORDS_GENERAL)


def _has_bypass(prompt: str) -> str | None:
    low = prompt.lower()
    for token in BYPASS_TOKENS:
        if token in low:
            return token
    return None


def _has_familia_state(cowork: Path | None) -> bool:
    """Verifica se existe `direito-familia/cowork-state.json` no path."""
    if cowork is None:
        return False
    return (cowork / "direito-familia" / "cowork-state.json").exists()


def _suprema_corte_enabled(cowork: Path | None) -> bool:
    """Le state.json e verifica suprema_corte.enabled. Default true se ausente."""
    if cowork is None:
        return True
    sf = cowork / "direito-familia" / "cowork-state.json"
    if not sf.exists():
        return True
    try:
        state = json.loads(sf.read_text(encoding="utf-8"))
        return bool(state.get("suprema_corte", {}).get("enabled", True))
    except Exception:
        return True


def _resolve_cowork() -> Path | None:
    """Resolve COWORK root via env FAMILIA_COWORK_PATH ou cwd ancestral."""
    env = os.environ.get("FAMILIA_COWORK_PATH") or os.environ.get("COWORK_PATH")
    if env:
        p = Path(env)
        if (p / "direito-familia" / "cowork-state.json").exists():
            return p
    return hook_utils.find_cowork(Path.cwd())


def main() -> int:
    payload = _load_input()
    prompt = payload.get("prompt") or payload.get("user_prompt") or ""
    if not isinstance(prompt, str) or not prompt.strip():
        return 0

    cowork = _resolve_cowork()
    bypass = _has_bypass(prompt)

    is_fam = _is_familia(prompt)
    is_legal_other = _is_legal_general(prompt) and not is_fam

    # Caso 1: bypass explicito
    if bypass and (is_fam or is_legal_other):
        sys.stdout.write(
            f"[direito-familia-adv-os] Bypass detectado ({bypass}). "
            "Pecas, recursos, pareceres e calculos serao entregues SEM validacao "
            "da Suprema Corte (R1-R4). Use por sua conta e risco.\n"
        )
        return 0

    # Caso 2: tarefa de familia + plugin configurado
    if is_fam and _has_familia_state(cowork):
        if not _suprema_corte_enabled(cowork):
            sys.stdout.write(
                "[direito-familia-adv-os] Demanda de familia detectada. "
                "Suprema Corte DESATIVADA na configuracao. Aciono apenas a cadeia de skills.\n"
                "Acionar skill: familia-master.\n"
            )
        else:
            sys.stdout.write(
                "[direito-familia-adv-os] Demanda de familia detectada. Plugin ativado.\n"
                "\n"
                "PROTOCOLO AUTOMATICO:\n"
                "1. Acionar skill `familia-master` (Tier 0 — sempre ativa)\n"
                "2. Aplicar Hierarquia das 4 Camadas (1-Proibicoes, 2-Protocolos, 3-Estilo, 4-Skills)\n"
                "3. Verificar as Proibicoes Absolutas (PA-01 a PA-25), com atencao especial:\n"
                "   - Melhor interesse da crianca como supraprincipio (CC art. 1.586)\n"
                "   - Segredo de justica (CPC art. 189 II) em acoes de familia\n"
                "   - Vedacao a opinar sobre culpa moral (pos EC 66/2010 — divorcio direto)\n"
                "   - Coerencia de polo (peca alinhada ao lado do cliente no CASO.md)\n"
                "   - Anonimizacao em prints/exemplos (dados de menor / vitima de VD)\n"
                "4. Aplicar Protocolo P4 — Cruzamento Multi-esfera se houver:\n"
                "   familia × criminal (Maria da Penha) × ECA infracional × sucessoes × previdenciario\n"
                "5. Antes de entregar: Suprema Corte R1->R2->R3->R4 (revisao-final-familia)\n"
                "\n"
                "Bypass disponivel: `--no-corte`, `--quick`, `/corte off`.\n"
            )
        return 0

    # Caso 3: tarefa de familia mas plugin NAO configurado
    if is_fam and not _has_familia_state(cowork):
        sys.stdout.write(
            "[direito-familia-adv-os] Detectei demanda de direito de familia, mas o plugin "
            "ainda nao foi configurado neste diretorio.\n"
            "\n"
            "RECOMENDACAO: rode /start-familia para configurar (~5 min).\n"
            "Vou criar uma pasta `direito-familia/` aqui com sua identidade (OAB/UF), "
            "frentes de atuacao (alimentante/alimentando/guardiao/nao-guardiao/vitima/acusado), "
            "tom de voz e configuracao das skills de familia.\n"
            "\n"
            "ATENCAO LGPD: a pasta `direito-familia/casos/` armazenara dados sensiveis "
            "(processo em segredo de justica art. 189 CPC, dados de menor ECA, "
            "vitima de violencia domestica). NAO use pastas sincronizadas (Dropbox/iCloud/Drive).\n"
            "\n"
            "Caso queira prosseguir SEM configurar, trabalho em modo fallback generico "
            "(persona neutra, qualidade reduzida). Apenas avise.\n"
        )
        return 0

    # Caso 4: tarefa juridica geral (nao de familia) — protocolo cauteloso
    if is_legal_other:
        sys.stdout.write(
            "[direito-familia-adv-os] Tarefa juridica detectada (nao especificamente de familia). "
            "Aplique protocolo padrao:\n"
            "1. Questionamento previo (sem suposicoes silenciosas).\n"
            "2. Apresentar estrutura + premissas antes de redigir.\n"
            "3. Aguardar confirmacao do usuario.\n"
            "4. Antes de entregar: executar Suprema Corte R1-R4 se aplicavel.\n"
            "Bypass: `--no-corte`, `--quick`, `/corte off`.\n"
        )
        return 0

    # Caso default: nao e tarefa juridica, nem de familia — silencio
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
