#!/usr/bin/env bash
set -euo pipefail

rm -Rf .terraform*
password=$(sops -d --output-type dotenv --extract '["GITLAB_TOKEN"]' ./secrets.enc.json)
terraform init -backend-config="password=${password}"
terraform apply
