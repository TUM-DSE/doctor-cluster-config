provider "github" {
  alias = "owner"
  owner = var.org_name
  token = var.github_token
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
}
