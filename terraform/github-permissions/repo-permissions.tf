locals {
  sys-prog-tutors = toset([
    # SoSe22
    "jfly609",
    "catarinalegria",
    "emilshkhlyv",
    "yuae-tum",
    "zhangluktim",
    "ensarkaya",
    "weigsimo",
    "schnedom",
  ])

  sys-prog-students = setunion(
    local.sys-prog-tutors,
    toset([
    ])
  )

  sys-prog-TUM-DSE = {
  }

  sys-prog-ls1-courses = {
    "anti-cheat" = local.sys-prog-tutors
    "task1-syscalls-tum-test-student" = local.sys-prog-tutors
    "task2-fileio-tum-test-student" = local.sys-prog-tutors   # main, rust solution
    "task2-fileio-masi456" = local.sys-prog-tutors            # cpp solution
    "task2-fileio-rgouicem" = local.sys-prog-tutors           # c solution
    "task3-processes-tum-test-student" = local.sys-prog-tutors
    "task4-concurrency-tum-test-student" = local.sys-prog-tutors
    "task5-memory-tum-test-student" = local.sys-prog-tutors
    "task6-sockets-tum-test-student" = local.sys-prog-tutors
    "task7-performance-tum-test-student" = local.sys-prog-tutors
    "task8-container-tum-test-student" = local.sys-prog-tutors
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
  permission = "push"
}

resource "github_repository_collaborator" "sys_prog_ls1_courses" {
  for_each   = { for repo in local.sys-prog-ls1-courses-flat : "${repo.repo}.${repo.user}" => repo }
  provider   = github.ls1-courses
  repository = each.value.repo
  username   = each.value.user
  permission = "push"
}
