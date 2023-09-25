all:
ifeq ($(shell uname), Linux)
	@echo 'Install required packages'
	sudo apt update -yy
	sudo apt install software-properties-common -yy
	sudo add-apt-repository -yy --update ppa:ansible/ansible
	sudo apt install ansible git zsh -yy
endif
ifeq ($(shell uname), Darwin)
	@echo 'Install command-line tools'
	-xcode-select --install
	@echo 'Install required packages'
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew analytics off
	brew install ansible git zsh
endif
	ansible-galaxy collection install community.general
	ANSIBLE_CONFIG="$(shell pwd)/ansible/ansible.cfg" \
	ansible-playbook ansible/setup.yml --ask-become-pass

uninstall:
	ANSIBLE_CONFIG="$(shell pwd)/ansible/ansible.cfg" \
	ansible-playbook ansible/rollback.yml --ask-become-pass
