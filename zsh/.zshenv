# Keep PATH entries unique; nested shells re-run the prepends below
typeset -U path PATH
. "$HOME/.cargo/env"
export PATH="$HOME/.local/bin:$PATH"

export EDITOR=micro
export VISUAL="zeditor --wait"
