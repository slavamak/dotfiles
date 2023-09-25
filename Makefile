all:
ifeq ($(shell uname), Linux)
	@echo 'Install required packages'
	apt update -yy
	apt install software-properties-common -yy
	add-apt-repository -yy --update ppa:ansible/ansible
	apt install ansible zsh sudo -yy
endif
ifeq ($(shell uname), Darwin)
	@echo 'Install command-line tools'
	-xcode-select --install
	@echo 'Install required packages'
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew analytics off
	brew install ansible zsh
endif
	ansible-galaxy collection install community.general
	ANSIBLE_CONFIG="$(shell pwd)/ansible/ansible.cfg" \
	ansible-playbook ansible/setup.yml --ask-become-pass

uninstall:
	ANSIBLE_CONFIG="$(shell pwd)/ansible/ansible.cfg" \
	ansible-playbook ansible/rollback.yml --ask-become-pass
