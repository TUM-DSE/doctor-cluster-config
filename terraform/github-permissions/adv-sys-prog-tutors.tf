locals {
  adv-sys-prog-tutors = toset([
    "julianpritzi",      # Julian Pritzi
    "taugoust",          # Theofilos Augoustis
    "Simon04090",        # Simon Kammermeier
    "FreakyPenguin",     # Antoine Kaufmann
  ])

  adv-sys-prog-upstreams = toset([
    "anti-cheat",
    "adv-sys-prog-0-container",
    "adv-sys-prog-0-container-solution",
    "adv-sys-prog-1-unikernel",
    "adv-sys-prog-1-unikernel-solution",
    "adv-sys-prog-2-kvm",
    "adv-sys-prog-2-kvm-solution",
    "adv-sys-prog-4-fuzzing",
    "adv-sys-prog-4-fuzzing-solution",
    "adv-sys-prog-3-secure-vm",
    "adv-sys-prog-3-secure-vm-solution",
    "adv-sys-prog-5-simbrick",
    "adv-sys-prog-5-simbrick-solution",
  ])
}

resource "github_team" "adv_sys_prog_tutors_team" {
  provider    = github.ls1-courses
  name        = "adv-sys-prog-tutors"
  description = "Tutors of the adv-sys-prog course, improving it and helping students"
  privacy     = "closed"
}

resource "github_team_membership" "adv_sys_prog_tutors_membership" {
  provider = github.ls1-courses
  team_id  = github_team.adv_sys_prog_tutors_team.id
  for_each = local.adv-sys-prog-tutors
  username = each.value
  role     = "member"
}

resource "github_team_repository" "adv_sys_prog_team_repositories" {
  provider = github.ls1-courses
  team_id = github_team.adv_sys_prog_tutors_team.id
  for_each = local.adv-sys-prog-upstreams
  repository = each.value
  permission = "push"
}

resource "github_membership" "adv_sys_prog_tutors_ls1-adv-sys-prog-course" {
  for_each = local.adv-sys-prog-tutors
  username = each.value
  role     = "admin"
  provider = github.ls1-adv-sys-prog-course
}
