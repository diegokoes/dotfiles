source /usr/share/cachyos-zsh-config/cachyos-config.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt no_check_jobs

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
eval "$(fnm env --use-on-cd --shell zsh)"
source "$HOME/.cargo/env"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/koes/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

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

# Angular CLI completion
if (( $+commands[ng] )); then
  source <(ng completion script 2>/dev/null)
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
export PNPM_HOME="/home/koes/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
