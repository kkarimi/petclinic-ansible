#!/usr/bin/env bash
script_dir=`pwd`

# Assume Ansible available in environment
ansible-playbook ${script_dir}/plays/deploy.yml --ask-vault-pass "$@"
