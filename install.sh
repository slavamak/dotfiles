#!/usr/bin/env zsh

case "$(uname -s)" in
  Darwin)
    # Install xCode cli tools
    echo "Installing commandline tools..."
    xcode-select --install

    # Install brew
    echo "Installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew analytics off

    # Brew taps
    echo "Installing brew formulae..."
    brew tap homebrew/cask-fonts
    brew tap homebrew/cask-versions

    # Brew formulae
    brew install exa
    brew install fd
    brew install fzf
    brew install gawk
    brew install gpg
    brew install gh
    brew install git
    brew install htop
    brew install lazygit
    brew install neovim
    brew install tree-sitter
    brew install ripgrep
    brew install tmux
    brew install mas
    brew install stow
    brew install starship

    # Brew cask
    brew install --cask figma
    brew install --cask font-iosevka
    brew install --cask font-iosevka-nerd-font
    brew install --cask google-chrome
    brew install --cask visual-studio-code
    brew install --cask iterm2-beta
    brew install --cask soundsource
    brew install --cask discord
    brew install --cask slack
    brew install --cask spotify
    brew install --cask transmission
    brew install --cask telegram
    brew install --cask karabiner-elements

    # Change default TERM
    echo "Getting the tmux-256color terminfo entry..."
    curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz
    /usr/bin/tic -xe tmux-256color terminfo.src

    # Mac App Store Apps
    echo "Installing mac app store apps..."
    mas install 1356178125 #Outline
    mas install 1291898086 #Toggle Track
    mas install 1352778147 #Bitwarden
    ;;

  Linux)
    # Update packages
    echo "Update packages..."
    sudo apt update -yy
    sudo apt upgrade -yy

    # Install packages
    echo "Installing packages..."
    sudo apt install -yy build-essential
    sudo apt install -yy checkinstall
    sudo apt install -yy curl
    sudo apt install -yy dirmngr
    sudo apt install -yy exa
    sudo apt install -yy fd-find
    sudo apt install -yy fzf
    sudo apt install -yy gawk
    sudo apt install -yy gpg
    sudo apt install -yy gcc
    sudo apt install -yy g++
    sudo apt install -yy gh
    sudo apt install -yy git
    sudo apt install -yy htop
    sudo apt install -yy ripgrep
    sudo apt install -yy tmux
    sudo apt install -yy zlib1g-dev
    sudo apt install -yy stow

    # Install fonts
    echo "Installing nerd fonts..."
    git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
    cd nerd-fonts
    git sparse-checkout add patched-fonts/Iosevka
    ./nerd-fonts/install.sh Iosevka
    ;;
esac

# Create symlinks
echo "Stowing configuration files..."
stow asdf
stow bin
stow git
stow keyboard
stow nvim
stow prompt
stow terminal
stow tmux
stow zsh

# Install zsh-zap
echo "Installing zsh plugin manager..."
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)

# Install asdf
echo "Installing asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

# Source zsh
echo "Sourcing zsh..."
source $HOME/.zshrc

# Install asdf plugins
echo "Installing asdf plugins..."
asdf plugin add nodejs
asdf plugin add ruby
asdf plugin add rust
asdf plugin add bun
asdf install

# Install nodejs packages
echo "Installing nodejs packages..."
npm i -g pnpm
source $HOME/.zshrc
pnpm add -g @shopify/cli
pnpm add -g @shopify/theme
