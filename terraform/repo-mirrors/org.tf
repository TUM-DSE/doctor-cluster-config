resource "gitlab_group" "tum_dse" {
  name        = "TUM-DSE"
  path        = "TUM-DSE"
  visibility_level = "public"
}
