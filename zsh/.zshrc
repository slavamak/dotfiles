source "$HOME/.local/share/zap/zap.zsh"
source "$HOME/.config/zsh/completion.zsh"
source "$HOME/.asdf/asdf.sh"
source "$HOME/.asdf/completions/asdf.bash"

eval "$(starship init zsh)"

alias ls="exa -1 --group-directories-first"
alias la="exa -1a --group-directories-first"
alias ll="exa -l --group-directories-first"
alias lla="exa -la --group-directories-first"
alias tree="exa -T --group-directories-first"
alias pn="pnpm"
alias vim="nvim"
alias tms="tmux-sessionizer"

plug "agkozak/zsh-z"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-syntax-highlighting"
plug "MichaelAquilina/zsh-you-should-use"

bindkey -s ^f "tms\n"
