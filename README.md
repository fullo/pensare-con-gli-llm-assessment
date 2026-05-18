[![License contenuti: CC BY-NC-SA 4.0](https://img.shields.io/badge/Contenuti-CC%20BY--NC--SA%204.0-blue.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![License codice: MIT](https://img.shields.io/badge/Codice-MIT-green.svg)](LICENSE)
[![Ispirato a: SW AI-Readiness](https://img.shields.io/badge/Ispirato%20a-SW%20AI--Readiness-orange.svg)](https://github.com/sw-craftsmanship-dojo/sw-ai-readiness-assessment)

# Pensare con LLM — Self-Assessment

<a href="https://leanpub.com/pensare-con-gli-llm"><img src="assets/copertina-small.jpg" alt="Copertina del libro «Pensare con gli LLM, the Right Way»" align="right" width="180" /></a>

Due self-check gratuiti basati sul libro **«Pensare con gli LLM, the Right Way»** di Francesco Fullone (Daruma Consulting).

<br>
<div align="center">
<a href="./index.html">
<img src="https://img.shields.io/badge/INIZIA_IL_SELF--CHECK_GRATUITO-5_min_·_4_domande_·_1_punteggio-C44A1A?style=for-the-badge&labelColor=1a1a2e" alt="Inizia il self-check" height="48" />
</a>
</div>
<br>

---

Adottare un LLM senza una postura critica produce 2 cose, entrambe misurabili: **velocità apparente** e **debito cognitivo**. Il primo si vede in pochi giorni, il secondo emerge in pochi mesi — quando un output mal firmato finisce in un contratto, in un commit, in una decisione che nessuno sa più ricostruire.

Questo repository ospita un'app statica con **2 self-check** complementari. 5 minuti. 4 domande. Un punteggio. Lo scopo non è dare un voto: è esporre **il vertice del Triangolo che scivola per primo** sotto stanchezza, fretta o pressione del calendario.

---

## I 2 self-check

| | A · Pensare-Con Readiness | B · Triangolo Self-Check |
|---|---|---|
| **Pubblico** | Team, manager, responsabili compliance | Singolo professionista |
| **Framework** | Le 4 decisioni esplicite (Cap 2 §2.4) | I 3 vertici + la Mappa 2×2 |
| **Output** | Pensare-Con Gap (alto/medio/basso/maturo) | Profilo di collasso + capitoli mirati |

---

## Start Here

| Sei pronto a… | Vai a |
|---|---|
| **Fare il self-check ora** | [Apri `index.html`](./index.html) |
| Capire prima il contesto | [00 · Introduzione](book/00-introduzione.html) ([sorgente .md](book/00-introduzione.md)) |
| Leggere le 4 domande offline | [03 · Le 4 domande](book/03-le-quattro-domande.html) |
| Capire il limite del libro | [08 · Compliance e AI Act: un limite dichiarato](book/08-rischio-regolatorio.html) |

---

## Indice dei capitoli

Ogni capitolo è disponibile come **pagina HTML impaginata** (con link al libro su LeanPub) e come **sorgente markdown** (per leggerli direttamente su GitHub).

1. [00 · Introduzione](book/00-introduzione.html) — Perché un altro self-check
2. [01 · Cosa significa pensare-con](book/01-cosa-significa-pensare-con.html) — Triangolo + Mappa 2×2 + 4 decisioni
3. [02 · Come funziona il self-check](book/02-come-funziona-il-self-check.html) — Istruzioni d'uso
4. [03 · Le 4 domande](book/03-le-quattro-domande.html) — **Il cuore**
5. [04 · Scoring e gap](book/04-scoring-e-gap.html) — Le fasce di lettura
6. [05 · Come leggere il risultato](book/05-come-leggere-il-risultato.html) — Pattern frequenti
7. [06 · Chiudere il gap](book/06-chiudere-il-gap.html) — Dalla dimensione bassa al capitolo
8. [07 · Ricerca e fondamenti](book/07-ricerca-e-fondamenti.html) — Bibliografia ragionata
9. [08 · Compliance e AI Act: un limite dichiarato](book/08-rischio-regolatorio.html) — Cosa il libro NON copre, e dove cercarlo

---

## Le 4 dimensioni · Assessment A (organizzazione)

| Dimensione | La domanda |
|---|---|
| **Delega** | Cosa state delegando all'LLM, e con quale regola scritta? |
| **Verifica** | Come verificate un output critico, prima di accettarlo? |
| **Responsabilità** | Chi firma — nome e cognome? |
| **Soglia** | Quando vi fermate, e con quale sentinel? |

## Le 4 dimensioni · Assessment B (individuo)

| Vertice / asse | La domanda |
|---|---|
| **Intento** | Sai cosa cerchi prima del primo prompt? |
| **Avversario** | Costruisci la verifica prima di accettare? |
| **Editore** | Puoi firmare e difendere quello che pubblichi? |
| **Mappa** | Riconosci se sei in orologio/nuvola × verità/conferma? |

---

## La ricerca dietro

Il libro e l'assessment poggiano su:

- **Karl Popper, *Of Clouds and Clocks* (1965)** — tassonomia dei problemi (orologi/nuvole).
- **Platone — *Apologia*, *Menone*, *Teeteto*** — pratica socratica (Cap 4).
- **Dhuliawala et al. (2023) — *Chain-of-Verification*** — base della pratica avversariale (Cap 5).
- **Anthropic 2025-2026** — adversarial verification, sentinel metrics.
- **EU AI Act, Art. 4** — alfabetizzazione AI obbligatoria dal 02/02/2025.

Vedi [07 · Ricerca e fondamenti](book/07-ricerca-e-fondamenti.md).

---

## Eseguire l'app in locale

L'app è statica. Apri `index.html` nel browser:

```bash
open index.html
# oppure, se preferisci un server locale:
python3 -m http.server 8080  # poi http://localhost:8080
```

Nessun backend, nessun tracking, nessuna registrazione. I dati restano nel browser. Il codice è MIT, i contenuti del libro CC BY-NC-SA 4.0.

## Modificare i capitoli del libro

Le pagine HTML in `book/*.html` sono **generate** dai sorgenti markdown `book/*.md` tramite `pandoc` + il template `book/_template.html`. Per rigenerarle dopo una modifica ai `.md`:

```bash
./build.sh
```

Richiede `pandoc` (`brew install pandoc` su macOS). Lo script:
- aggiunge a ogni capitolo header, footer, CTA «Compra il libro su LeanPub», navigazione prev/next;
- riscrive i link interni `.md` → `.html`;
- rimuove la navigazione duplicata in coda al sorgente markdown.

Se vuoi modificare lo stile, edita `styles.css` (condiviso fra `index.html` e tutti i capitoli).

---

## Hai bisogno di aiuto a leggere i tuoi risultati?

Se il self-check rivela un gap importante e operi in un contesto regolato (sanità, legale, finanziario, PA), [Daruma Consulting](https://daruma.consulting/) offre una **consulenza diagnostica** per tradurre il risultato in roadmap operativa.

---

## Debito intellettuale

Questo progetto è **strutturalmente ispirato** all'[AI Readiness Assessment](https://github.com/sw-craftsmanship-dojo/sw-ai-readiness-assessment) di SW Craftsmanship Dojo / BriX Consulting. Eredita lo schema (4 dimensioni, 5 minuti, 1 punteggio, capitoli di approfondimento, hook regolatorio) e diverge sui contenuti (postura cognitiva critica vs readiness ingegneristica). Vedi [ATTRIBUTION.md](ATTRIBUTION.md).

---

## License

- **Codice dell'app (`index.html`, CSS, JS)**: [MIT](LICENSE).
- **Contenuti del libro (markdown in `book/`)**: [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).
