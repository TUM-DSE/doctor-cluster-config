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

  sys-prog-upstreams = toset([
    "anti-cheat",
    "task1-syscalls-tum-test-student",
    "task2-fileio-tum-test-student",   # main, rust solution
    "task2-fileio-rgouicem",           # c solution
    "task3-processes-tum-test-student",
    "task4-concurrency-tum-test-student",
    "task5-memory-tum-test-student",
    "task6-sockets-tum-test-student",
    "task7-performance-tum-test-student",
    "task8-container-tum-test-student",
  ])
}

resource "github_team" "sys_prog_tutors_team" {
  provider = github.ls1-courses
  name = "sys-prog-tutors"
  description = "Tutors of the sys-prog course, improving it and helping students"
  privacy = "closed"
}

resource "github_team_membership" "sys_prog_tutors_membership" {
  provider = github.ls1-courses
  team_id = github_team.sys_prog_tutors_team.id
  for_each = local.sys-prog-tutors
  username = each.value
  role = "member"
}

resource "github_team_repository" "ls1_courses" {
  provider = github.ls1-courses
  team_id = github_team.sys_prog_tutors_team.id
  for_each = local.sys-prog-upstreams
  repository = each.value
  permission = "push"
}
