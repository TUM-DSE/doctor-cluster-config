.PHONY: help

PSSH ?= pssh

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


deploy: ## deploy all servers
	echo hello

_pull_nixos_config:
	git -C /etc/nixos pull

_deploy_nixos:
	ssh -v $HOST
