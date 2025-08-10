# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/cachyos-zsh-config/cachyos-config.zsh
setopt no_check_jobs

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(fnm env --use-on-cd --shell zsh)"
source "$HOME/.cargo/env"
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
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
# --- Angular CLI on-demand (completion and command inside Angular projects) ---

# Determines Angular project root by walking up the directory tree until angular.json is found.
__ng_project_root() {
  local dir=$PWD
  while [[ $dir != / ]]; do
    [[ -f "$dir/angular.json" ]] && { print -r -- "$dir"; return 0; }
    dir=${dir:h}
  done
  return 1
}

# Loads completion from a project-local CLI if available, otherwise from a global CLI.
# Uses a cache file to avoid spawning ng on every shell start; silent on failure.
typeset -g __ANGULAR_COMPLETION_LOADED_FOR=""
__ng_enable_completion_if_needed() {
  local root; root="$(__ng_project_root)" || return 0
  [[ "$__ANGULAR_COMPLETION_LOADED_FOR" == "$root" ]] && return 0

  local local_ng="$root/node_modules/.bin/ng"
  local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/ng"
  local cache_file="$cache_dir/_ng-${root//\//_}"
  mkdir -p "$cache_dir" 2>/dev/null

  if [[ -x "$local_ng" ]]; then
    "$local_ng" completion script >| "$cache_file" 2>/dev/null || return 0
    source "$cache_file" 2>/dev/null
    __ANGULAR_COMPLETION_LOADED_FOR="$root"
  elif (( $+commands[ng] )); then
    ng completion script >| "$cache_file" 2>/dev/null || return 0
    source "$cache_file" 2>/dev/null
    __ANGULAR_COMPLETION_LOADED_FOR="$root"
  fi
}

# Provides an ng wrapper that:
# - Inside an Angular project: prefers the project-local CLI, then global CLI, then npx @angular/cli.
# - Outside a project: uses the global CLI if available; otherwise returns an error.
__ng_wrapper() {
  local root; root="$(__ng_project_root)"
  if [[ -n "$root" ]]; then
    local local_ng="$root/node_modules/.bin/ng"
    if [[ -x "$local_ng" ]]; then
      "$local_ng" "$@"
      return $?
    elif (( $+commands[ng] )); then
      command ng "$@"
      return $?
    else
      npx -y @angular/cli "$@"
      return $?
    fi
  fi

  if (( $+commands[ng] )); then
    command ng "$@"
  else
    print -u2 "ng: not found (not in an Angular project and no global CLI installed)"
    return 127
  fi
}

# Ensures that the ng shim is defined and prefers the project-local CLI.
unfunction ng 2>/dev/null
function ng { __ng_wrapper "$@" }

# On directory changes, enables completion if inside a project.
__ng_chpwd() { __ng_enable_completion_if_needed }
typeset -ga chpwd_functions
chpwd_functions+=(__ng_chpwd)

# Performs a one-time completion load for the initial directory.
__ng_enable_completion_if_needed

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
