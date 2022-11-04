locals {
  chair_members = toset([
    "ackxolotl",      # Simon Ellmann
    "AtsushiKoshiba", # Atsushi Koshiba
    "bhatotia",       # Pramod Bhatotia
    "dgiantsidi",     # Dimitra Giantsidi
    "dimstav23",      # Dimitris Stavrakakis
    "harshanavkis",   # Harshavardhan Unnibhavi
    "manosgior",      # Emmanouil (Manos) Giortamis
    "mbailleu",       # Maurice Bailleu
    "Mic92",          # Jörg Thalheim
    "PBHDK",          # Paul Heidekrüger
    "pogobanane",     # Peter Okelmann
    "mjntum",         # Myoung Jin Nam
    "rgouicem",       # Redha Gouicem
    "jedichen121",    # Jiyang Chen
    "mmisono",        # Masanori Misono
  ])
}

resource "github_membership" "TUM-DSE" {
  for_each = local.chair_members
  username = each.value
  role     = "admin"
  provider = github.TUM-DSE
}

resource "github_membership" "ls1-courses" {
  for_each = local.chair_members
  username = each.value
  role     = "admin"
  provider = github.ls1-courses
}

resource "github_membership" "ls1-cloud-lab-course" {
  for_each = local.chair_members
  username = each.value
  role     = "admin"
  provider = github.ls1-cloud-lab-course
}

resource "github_membership" "ls1-sys-prog-course" {
  for_each = local.chair_members
  username = each.value
  role     = "admin"
  provider = github.ls1-sys-prog-course
}
