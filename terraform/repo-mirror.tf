data "github_repositories" "my-repos" {
  query = "org:TUM-DSE is:public"
}

data "github_repositories" "my-non-archived-repos" {
  query = "org:TUM-DSE is:public archived:false"
}

resource "gitlab_project" "repos" {
  for_each                            = toset(data.github_repositories.my-repos.full_names)
  name                                = element(split("/", each.key), 1)
  import_url                          = "https://github.com/${each.key}"
  mirror                              = true
  mirror_trigger_builds               = true
  mirror_overwrites_diverged_branches = true
  shared_runners_enabled              = false
  ci_config_path = lookup({
    "TUM-DSE/doctor-cluster-config" : ".gitlab-ci.yml@TUM-DSE/doctor-cluster-config",
    }, each.key,
    # sane default
  "")
  visibility_level = "public"
}

resource "gitlab_project_variable" "cachix-key" {
  for_each = toset([
    gitlab_project.repos["TUM-DSE/doctor-cluster-config"].id
  ])
  project   = each.key
  key       = "CACHIX_AUTH_TOKEN"
  value     = data.sops_file.secrets.data["CACHIX_AUTH_TOKEN"]
  protected = true
  masked    = true
}

resource "gitlab_project_variable" "github-token" {
  for_each = toset([
    gitlab_project.repos["TUM-DSE/doctor-cluster-config"].id
  ])
  project   = each.key
  key       = "GITHUB_TOKEN"
  value     = data.sops_file.secrets.data["GITHUB_TOKEN"]
  protected = true
  masked    = true
}

resource "gitlab_service_github" "github" {
  for_each       = toset(data.github_repositories.my-repos.names)
  project        = gitlab_project.repos["TUM-DSE/${each.key}"].id
  token          = data.sops_file.secrets.data["GITHUB_TOKEN"]
  repository_url = "https://github.com/TUM-DSE/${each.key}"
}

resource "github_repository_webhook" "gitlab" {
  for_each   = toset(data.github_repositories.my-non-archived-repos.names)
  repository = each.key

  configuration {
    url          = "https://gitlab.com/api/v4/projects/TUM-DSE%2F${each.key}/mirror/pull?private_token=${data.sops_file.secrets.data["GITLAB_TOKEN"]}"
    content_type = "form"
    insecure_ssl = false
  }

  active = true

  events = ["push", "pull_request"]
}
