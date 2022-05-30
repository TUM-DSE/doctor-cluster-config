module "ls1-courses" {
  source = "./modules/github-push-bot"
  org_name = "ls1-courses"
  bot_github_token = data.sops_file.secrets.data["ls1-admin-bot-token"]
}
module "cloudlab-course" {
  source = "./modules/github-push-bot"
  org_name = "ls1-cloud-lab-course"
  bot_github_token = data.sops_file.secrets.data["ls1-admin-bot-token"]
}
module "ls1-sys-prog-course" {
  source = "./modules/github-push-bot"
  org_name = "ls1-sys-prog-course"
  bot_github_token = data.sops_file.secrets.data["ls1-admin-bot-token"]
}
