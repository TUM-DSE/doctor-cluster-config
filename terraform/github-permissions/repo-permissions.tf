locals {
  sys-prog-tutors = toset([
    "pogobanane",
  ])
  sys-prog-students = toset([
    "Mic92"
  ])

  sys-prog-TUM-DSE = {
    "doctor-cluster-config" = setunion(
      local.sys-prog-tutors, 
      local.sys-prog-students
    )
    "foo" = toset(["bar"])
  }

  sys-prog-ls1-courses = {
    "anti-cheat" = setunion(
      local.sys-prog-tutors
    )
    "foo" = toset(["bar"])
  }

  # Nested loop over both the object and the sets, and flatten the result.
  sys-prog-TUM-DSE-flat = distinct(flatten([
    for repo, users in local.sys-prog-TUM-DSE : [
      for user in users : {
        repo = repo
        user = user
      }
    ]
  ]))

  # Nested loop over both the object and the sets, and flatten the result.
  sys-prog-ls1-courses-flat = distinct(flatten([
    for repo, users in local.sys-prog-ls1-courses: [
      for user in users : {
        repo = repo
        user = user
      }
    ]
  ]))
}

resource "github_repository_collaborator" "sys_prog_TUM_DSE" {
  for_each   = { for repo in local.sys-prog-TUM-DSE-flat : "${repo.repo}.${repo.user}" => repo }
  # the provider cannot be variable within one module, so this stays fixed
  provider   = github.TUM-DSE
  repository = each.value.repo
  username   = each.value.user
  permission = "pull"
}

resource "github_repository_collaborator" "sys_prog_ls1_courses" {
  for_each   = { for repo in local.sys-prog-ls1-courses-flat : "${repo.repo}.${repo.user}" => repo }
  provider   = github.ls1-courses
  repository = each.value.repo
  username   = each.value.user
  permission = "pull"
}
