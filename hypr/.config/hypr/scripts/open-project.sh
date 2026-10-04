#!/usr/bin/env bash

set -euo pipefail

project_roots=(
    "$HOME/programming"
    "$HOME/projects"
    "$HOME/src"
    "$HOME/work"
    "$HOME/dotfiles"
)

projects=()
for root in "${project_roots[@]}"; do
    [[ -d "$root" ]] || continue
    projects+=("$root")
    while IFS= read -r project; do
        projects+=("$project")
    done < <(fd --type d --max-depth 2 --hidden \
        --exclude .git \
        --exclude node_modules \
        --exclude target \
        --exclude dist \
        . "$root" 2>/dev/null)
done

((${#projects[@]} > 0)) || exit 0

selection=$(
    printf '%s\n' "${projects[@]}" |
        sed "s#^$HOME#~#" |
        sort -f |
        fuzzel --dmenu -p "Open project  "
) || exit 0

[[ -n "$selection" ]] || exit 0
selection=${selection/#\~/$HOME}

exec zeditor "$selection"
