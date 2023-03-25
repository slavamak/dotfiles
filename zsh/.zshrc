[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

source "$HOME/.config/zsh/completion.zsh"

ASDF_DIR="${ASDF_DIR:-$HOME/.asdf}"
ASDF_COMPLETIONS="$ASDF_DIR/completions"

if [[ -f "$ASDF_DIR/asdf.sh" ]]; then
  source "$ASDF_DIR/asdf.sh"

  if [[ -f "$ASDF_COMPLETIONS/asdf.bash" ]]; then
    source "$ASDF_COMPLETIONS/asdf.bash"
  fi
fi

if [ -f "$HOME/.bash_aliases" ]; then
  source "$HOME/.bash_aliases"
fi

if [ -f "$HOME/.bash_profile" ]; then
  source "$HOME/.bash_profile"
fi

eval "$(starship init zsh)"

function exists() {
  command -v "$1" >/dev/null 2>&1
}

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

plug "agkozak/zsh-z"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-syntax-highlighting"

alias ls="ls -p -G"
alias la="ls -A"
alias ll="ls -l"
alias lla="ll -A"
alias pn="pnpm"

if exists nvim; then
  alias vim="nvim"
fi

if exists exa; then
  alias ll="exa -l -g --icons"
  alias lla="ll -a"
fi

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="vim"

export PNPM_HOME="$HOME/Library/pnpm"
export PATH=$PNPM_HOME:"$HOME/bin":"/usr/local/bin":"$HOME/.local/bin":$PATH
