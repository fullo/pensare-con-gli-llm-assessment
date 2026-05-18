#!/usr/bin/env bash
# Genera i 9 capitoli HTML da book/*.md con pandoc + template.
# Uso: ./build.sh
set -euo pipefail

BOOK="book"
TEMPLATE="${BOOK}/_template.html"

# Indice: chiave = numero (00..08), valori = file md, titolo breve (h1), label
declare -a CH=(
  "00-introduzione|Introduzione|Capitolo 00"
  "01-cosa-significa-pensare-con|Cosa significa «pensare-con»|Capitolo 01"
  "02-come-funziona-il-self-check|Come funziona il self-check|Capitolo 02"
  "03-le-quattro-domande|Le 4 domande|Capitolo 03"
  "04-scoring-e-gap|Scoring e Pensare-Con Gap|Capitolo 04"
  "05-come-leggere-il-risultato|Come leggere il risultato|Capitolo 05"
  "06-chiudere-il-gap|Chiudere il gap|Capitolo 06"
  "07-ricerca-e-fondamenti|Ricerca e fondamenti|Capitolo 07"
  "08-rischio-regolatorio|Compliance e AI Act · un limite dichiarato|Capitolo 08"
)

n=${#CH[@]}

for (( i=0; i<n; i++ )); do
  IFS='|' read -r slug title label <<< "${CH[$i]}"
  src="${BOOK}/${slug}.md"
  out="${BOOK}/${slug}.html"

  # prev / next
  prev=""; prev_title=""
  next=""; next_title=""
  if (( i > 0 )); then
    IFS='|' read -r pslug ptitle _ <<< "${CH[$((i-1))]}"
    prev="${pslug}.html"
    prev_title="${ptitle}"
  fi
  if (( i < n-1 )); then
    IFS='|' read -r nslug ntitle _ <<< "${CH[$((i+1))]}"
    next="${nslug}.html"
    next_title="${ntitle}"
  fi

  # Strip footer: tutto dall'ultimo '---' in poi (è la navigazione duplicata)
  # Trasforma anche i link interni .md → .html prima di pandoc.
  tmp=$(mktemp)
  awk '
    { lines[NR]=$0 }
    /^---[[:space:]]*$/ { last=NR }
    END {
      end = (last>0 ? last-1 : NR)
      for (k=1; k<=end; k++) print lines[k]
    }
  ' "$src" \
    | sed -E 's@\(([0-9]+-[a-z0-9-]+)\.md\)@(\1.html)@g' \
    > "$tmp"

  pandoc "$tmp" \
    --from gfm \
    --to html5 \
    --template="$TEMPLATE" \
    --metadata pagetitle="$title" \
    --metadata chapterlabel="$label" \
    --metadata slug="$slug" \
    --metadata description="$title — un estratto dal libro «Pensare con gli LLM, the Right Way» di Francesco Fullone." \
    --metadata prev="$prev" \
    --metadata prevtitle="$prev_title" \
    --metadata next="$next" \
    --metadata nexttitle="$next_title" \
    -o "$out"

  rm -f "$tmp"
  echo "  ✓ $out"
done

echo
echo "Generati $n capitoli in $BOOK/"
