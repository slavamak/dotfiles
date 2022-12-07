SHELL=/bin/bash
UNAME=$(shell uname)
CURRENT_DIR=$(shell pwd)

install: clean copy prepare oh-my-zsh
safe-install: clean copy prepare

prepare:
ifeq ($(UNAME), Darwin)
	@echo 'Preparations to install MacOS packages has started..'
	-xcode-select --install
	brew tap homebrew/cask-fonts
	@echo 'Installing..'
	brew install exa fd fzf gawk gpg gh git htop lazygit neovim tree-sitter ripgrep tmux zsh
	-brew install font-iosevka-nerd-font iterm2 min --cask
	curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz && gunzip terminfo.src.gz
	-/usr/bin/tic -xe tmux-256color terminfo.src
endif
ifeq ($(UNAME), Linux)
	@echo 'Preparations to install Ubuntu packages has started..'
	sudo apt update -yy
	sudo apt upgrade -yy
	@echo 'Installing..'
	sudo apt install -yy build-essential checkinstall curl dirmngr exa fd-find fzf gawk gpg gcc g++ gh git htop ripgrep tmux zlib1g-dev zsh
	git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git
	cd nerd-fonts; \
		git sparse-checkout add patched-fonts/Iosevka
	./nerd-fonts/install.sh Iosevka
endif

update:
ifeq ($(UNAME), Darwin)
	@echo 'MacOS package update has started..'
	brew upgrade exa fd fzf gawk gpg gh git htop lazygit neovim tree-sitter ripgrep tmux zsh
	-brew upgrade font-iosevka-nerd-font iterm2 min --cask
endif
ifeq ($(UNAME), Linux)
	@echo 'Ubuntu package update has started..'
	sudo apt update -yy
	sudo apt upgrade -yy
	sudo apt install -yy curl dirmngr exa fd-find fzf gawk gpg gcc g++ gh git htop ripgrep tmux zsh
endif

copy:
	-mkdir -p ~/.config
	cp -R $(CURRENT_DIR)/.asdfrc ~/
	cp -R $(CURRENT_DIR)/.tool-versions ~/
	cp -R $(CURRENT_DIR)/.gitconfig ~/
	cp -R $(CURRENT_DIR)/.gitignore ~/
	cp -R $(CURRENT_DIR)/.stylua.toml ~/
	cp -R $(CURRENT_DIR)/.config/tmux/.tmux.conf ~/
	cp -R $(CURRENT_DIR)/.config/zsh/.zshrc ~/
	cp -R $(CURRENT_DIR)/.config/zsh/zsh_custom ~/.config/
	cp -R $(CURRENT_DIR)/.config/tmux ~/.config/
	cp -R $(CURRENT_DIR)/.config/nvim ~/.config/

clean:
	-rm -rf ~/.config/tmux
	-rm -rf ~/.config/zsh_custom
	-rm -rf ~/.config/nvim
	-rm -rf ~/.local/share/nvim

asdf:
	-rm -rf ~/.asdf
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
	asdf install

oh-my-zsh:
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc

node-packages:
	npm i -g @shopify/cli @shopify/theme pnpm
	# npm i -g tree-sitter-cli
