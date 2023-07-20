#!/bin/bash
#

if ! type "brew" &> /dev/null; then
  echo "Brew not installed! Installing..."
  source <"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Brew installed...skipping brew installation"
fi

if ! type "ansible-playbook" &> /dev/null; then
  echo "Ansible not installed! Installing..."
  brew update && brew install ansible
else 
  echo "Ansible installed. Done!"
fi

if [ -f "./personal.yml" ]; then
  ansible-playbook ./personal.yml --ask-vault-pass
else
  echo "No playbook found."
fi
