locals {
  sys-prog-tutors = toset([
    "pogobanane",
  ])
  sys-prog-students = toset([
    "Mic92"
  ])

  perms-TUM-DSE = {
    "doctor-cluster-config" = setunion(
      local.sys-prog-tutors, 
      local.sys-prog-students
    )
    "foo" = toset(["bar"])
  }

  # Nested loop over both lists, and flatten the result.
  perms1 = distinct(flatten([
    for repo, users in local.perms-TUM-DSE : [
      for user in users : {
        repo = repo
        user = user
      }
    ]
  ]))
}

resource "github_repository_collaborator" "doctor-cluster-students" {
  for_each   = { for repo in local.perms1 : "${repo.repo}.${repo.user}" => repo }
  provider   = github.TUM-DSE
  repository = each.value.repo
  username   = each.value.user
  permission = "pull"
}

#resource "github_repository_collaborator" "doctor-cluster-tutors" {
#  for_each   = local.sys-prog-students
#  provider   = github.TUM-DSE
#  repository = "doctor-cluster-config"
#  username   = each.value
#  permission = "pull"
#}
#
#resource "github_repository_collaborator" "add_users2" {
#  for_each   = local.sys-prog-tutors
#  provider   = github.ls1-courses
#  repository = "anti-cheat"
#  username   = each.value
#  permission = "pull"
#}
