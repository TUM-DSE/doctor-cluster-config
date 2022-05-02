locals {
  sys-prog-tutors = toset([
    "pogobanane",
  ])
  sys-prog-students = toset([
    "Mic92"
  ])

  # Nested loop over both lists, and flatten the result.
  schema_privileges = distinct(flatten([
    for schema in local. : [
      for privilege in local.privileges : {
        privilege = privilege
        schema    = schema
      }
    ]
  ]))
}

resource "github_repository_collaborator" "doctor-cluster-students" {
  for_each   = local.sys-prog-tutors
  provider   = github.TUM-DSE
  repository = "doctor-cluster-config"
  username   = each.value
  permission = "pull"
}

resource "github_repository_collaborator" "doctor-cluster-tutors" {
  for_each   = local.sys-prog-students
  provider   = github.TUM-DSE
  repository = "doctor-cluster-config"
  username   = each.value
  permission = "pull"
}

resource "github_repository_collaborator" "add_users2" {
  for_each   = local.sys-prog-tutors
  provider   = github.ls1-courses
  repository = "anti-cheat"
  username   = each.value
  permission = "pull"
}
