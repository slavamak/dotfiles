# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="susi"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "re5et" "refined" "flazz" "wuffers" "kolo" )

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.config/zsh_custom/

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  gh
  git
  # macos
  # ubuntu
  tmux
  z
)

# Actually load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Set custom aliases
alias ls="ls -p -G"
alias la="ls -A"
alias ll="ls -l"
alias lla="ll -A"
alias pn="pnpm"
alias vim="nvim"

if which exa >/dev/null; then
  alias ll="exa -l -g --icons"
  alias lla="ll -a"
fi

# Load bash aliases and settings, if presented
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/.bash_profile ]; then
  source ~/.bash_profile
fi

# Set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=nvim
