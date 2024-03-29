provider "github" {
  alias = "owner"
  owner = var.org_name
}

provider "github" {
  alias = "bot"
  token = var.bot_github_token
}

data "github_user" "current" {
  username = ""
  provider = github.bot
}

resource "github_membership" "bot" {
  username = data.github_user.current.login
  role     = "admin"
  provider = github.owner
}

output "accept_invitation" {
  value = "Visit https://github.com/orgs/${var.org_name}/invitation as ${data.github_user.current.login} to accept the invitation"
}
