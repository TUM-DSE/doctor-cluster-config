resource "github_repository_webhook" "buildbot" {
  repository = "doctor-cluster-config"

  configuration {
    url          = "https://buildbot.dos.cit.tum.de/change_hook/github"
    # needs to be kept in sync with eve's secrets
    secret       = data.sops_file.secrets.data["github-webhook-secret"]
    content_type = "form"
    insecure_ssl = false
  }

  active = true

  events = ["push", "pull_request"]
}
