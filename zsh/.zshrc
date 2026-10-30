source /usr/share/cachyos-zsh-config/cachyos-config.zsh

setopt no_check_jobs

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
eval "$(fnm env --use-on-cd --shell zsh)"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups share_history
bindkey -e
# End of lines configured by zsh-newuser-install

# --- Angular CLI: prefer local over global ---
ng() {
  local dir=$PWD
  while [[ $dir != / ]]; do
    if [[ -f "$dir/angular.json" ]] && [[ -x "$dir/node_modules/.bin/ng" ]]; then
      "$dir/node_modules/.bin/ng" "$@"
      return $?
    fi
    dir=${dir:h}
  done
  command ng "$@"
}

# Angular CLI completion, cached: generating it spawns node (~130 ms per shell)
if (( $+commands[ng] )); then
  _ng_comp=${XDG_CACHE_HOME:-$HOME/.cache}/ng-completion.zsh
  [[ -s $_ng_comp && $_ng_comp -nt ${commands[ng]:A} ]] || ng completion script >| $_ng_comp 2>/dev/null
  source $_ng_comp
  unset _ng_comp
fi

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if [ -f "$tmp" ]; then
    local cwd="$(cat "$tmp")"
    rm -f "$tmp"
    if [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd "$cwd"
    fi
  fi
}
eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Run Calibre under the system Python (3.14) so it finds PyQt6,
# instead of the pyenv-shimmed python that shadows it.
alias calibre='PYENV_VERSION=system calibre'
alias calibredb='PYENV_VERSION=system calibredb'
alias ebook-convert='PYENV_VERSION=system ebook-convert'

# MSI EC performance modes (needs the msi-ec module)
alias comfort='echo comfort | sudo tee /sys/devices/platform/msi-ec/shift_mode'
alias turbo='echo turbo | sudo tee /sys/devices/platform/msi-ec/shift_mode'
alias ecmode='cat /sys/devices/platform/msi-ec/shift_mode'
