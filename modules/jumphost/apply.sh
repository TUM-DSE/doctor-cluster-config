#!/usr/bin/env bash

set -eu -o pipefail

# The jumphost only accepts logins via personal LDAP accounts, so the remote
# user usually differs from the local one. Allow overriding it interactively
# or via $ANSIBLE_REMOTE_USER / first argument.
remote_user=${1:-${ANSIBLE_REMOTE_USER:-}}
if [[ -z $remote_user ]]; then
  read -r -p "Login user on the jumphost [$USER]: " remote_user
  remote_user=${remote_user:-$USER}
fi

ansible-playbook -i inventory sshd_setup.yml -u "$remote_user"
