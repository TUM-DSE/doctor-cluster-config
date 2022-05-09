terraform {
  backend "http" {
    address        = "https://gitlab.com/api/v4/projects/33433812/terraform/state/github-permissions"
    lock_address   = "https://gitlab.com/api/v4/projects/33433812/terraform/state/github-permissions/lock"
    unlock_address = "https://gitlab.com/api/v4/projects/33433812/terraform/state/github-permissions/lock"
    username       = "TUM-DSE"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    retry_wait_min = "5"
  }
}
