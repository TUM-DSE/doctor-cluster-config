terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
    }
    github = {
      source  = "integrations/github"
    }
    sops = {
      source  = "carlpett/sops"
    }
  }
}

provider "github" {
  owner = "TUM-DSE"
}

provider "gitlab" {
  token = data.sops_file.secrets.data["GITLAB_TOKEN"]
}
