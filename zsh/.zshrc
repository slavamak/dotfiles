[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

source "$HOME/.config/zsh/completion.zsh"

if [[ -f "$HOME/.asdf/asdf.sh" ]]; then
  source "$HOME/.asdf/asdf.sh"

  if [[ -f "$HOME/.asdf/completions/asdf.bash" ]]; then
    source "$HOME/.asdf/completions/asdf.bash"
  fi
fi

eval "$(starship init zsh)"

function exists() {
  command -v "$1" > /dev/null 2>&1
}

function add_to_path() {
  if [[ $PATH != *"$1"* ]]; then
    export PATH=$1:$PATH
  fi
}

plug "agkozak/zsh-z"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-syntax-highlighting"
plug "MichaelAquilina/zsh-you-should-use"

bindkey -s ^f "tmux-sessionizer\n"

alias ls="ls -p -G"
alias la="ls -A"
alias ll="ls -l"
alias lla="ls -lA"
alias pn="pnpm"
alias vim="nvim"

if exists exa; then
  alias ls="exa -1 --group-directories-first"
  alias la="exa -1a --group-directories-first"
  alias ll="exa -l --group-directories-first"
  alias lla="exa -la --group-directories-first"
  alias tree="exa -T --group-directories-first"
fi

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
