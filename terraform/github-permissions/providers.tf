terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
    sops = {
      source = "carlpett/sops"
    }
  }
}

provider "github" {
  alias = "TUM-DSE"
  token = data.sops_file.secrets.data["GITHUB_TOKEN"]
  owner = "TUM-DSE"
}

provider "github" {
  alias = "ls1-courses"
  token = data.sops_file.secrets.data["GITHUB_TOKEN"]
  owner = "ls1-courses"
}
