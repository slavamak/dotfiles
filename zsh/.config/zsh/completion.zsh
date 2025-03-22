fpath+="$ZSH_COMPLETIONS"
fpath+="${ASDF_DATA_DIR:-$HOME/.asdf}/completions"

autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit

zstyle ':completion:*' use-cache on
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
