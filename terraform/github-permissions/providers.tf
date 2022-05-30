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
  owner = "TUM-DSE"
}

provider "github" {
  alias = "ls1-courses"
  owner = "ls1-courses"
}
