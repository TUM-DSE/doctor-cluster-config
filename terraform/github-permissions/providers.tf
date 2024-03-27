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

provider "github" {
  alias = "ls1-cloud-lab-course"
  owner = "ls1-cloud-lab-course"
}

provider "github" {
  alias = "ls1-sys-prog-course"
  owner = "ls1-sys-prog-course"
}

provider "github" {
  alias = "ls1-adv-sys-prog-course"
  owner = "ls1-adv-sys-prog-course"
}
