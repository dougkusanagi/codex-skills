#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
manifest="$repo_root/skills.lock"
only=""

if [[ "${1:-}" == "--only" ]]; then
  [[ -n "${2:-}" ]] || { echo "Uso: $0 [--only nome]" >&2; exit 2; }
  only="$2"
elif [[ -n "${1:-}" ]]; then
  echo "Uso: $0 [--only nome]" >&2
  exit 2
fi

command -v npx >/dev/null 2>&1 || { echo "npx é necessário (Node.js)." >&2; exit 1; }

while IFS='|' read -r name source skill ref; do
  [[ -z "$name" || "$name" == \#* ]] && continue
  [[ -n "$only" && "$name" != "$only" ]] && continue
  echo "Instalando $name ($source@$ref)..."
  npx -y skills add "https://github.com/$source/tree/$ref/$skill" --skill "$skill" --agent codex --global --copy --yes
done < "$manifest"

if [[ -n "$only" ]] && ! grep -q "^${only}|" "$manifest"; then
  echo "Skill não encontrada no catálogo: $only" >&2
  exit 1
fi

echo "Skills instaladas. Reinicie a sessão do Codex se necessário."
