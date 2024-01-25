source "$HOME/.local/share/zap/zap.zsh"
source "$HOME/.config/zsh/completion.zsh"
source "$HOME/.asdf/asdf.sh"
source "$HOME/.asdf/completions/asdf.bash"
source "$HOME/.fzf.zsh"

eval "$(starship init zsh)"

alias ls="eza -1 --group-directories-first"
alias la="eza -1a --group-directories-first"
alias ll="eza -l --group-directories-first"
alias lla="eza -la --group-directories-first"
alias tree="eza -T --group-directories-first"
alias pn="pnpm"
alias vim="nvim"
alias tms="tmux-sessionizer"

plug "agkozak/zsh-z"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-syntax-highlighting"
plug "MichaelAquilina/zsh-you-should-use"

bindkey -s "^F" "tms\n"

# bindkey "^R" history-incremental-search-backward
bindkey -M isearch "^P" history-incremental-search-backward
bindkey -M isearch "^N" history-incremental-search-forward
bindkey "^P" history-search-backward
bindkey "^N" history-search-forward
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

bindkey "^Y" autosuggest-execute
bindkey "^\\" autosuggest-accept
bindkey "^ " autosuggest-clear

bindkey "^[B" backward-word
bindkey "^[F" forward-word

autoload edit-command-line
zle -N edit-command-line
bindkey "^X" edit-command-line
bindkey -M vicmd "^X" edit-command-line

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
