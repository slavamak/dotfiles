function add_to_path() {
  if [[ $PATH != *"$1"* ]]; then
    export PATH=$1:$PATH
  fi
}

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000000
export SAVEHIST=1000000
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export EDITOR="nvim"
export GIT_EDITOR="$EDITOR"
export DOTFILES="$HOME/.dotfiles"
export PNPM_HOME="$HOME/Library/pnpm"

add_to_path "$PNPM_HOME"
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/.local/scripts"
