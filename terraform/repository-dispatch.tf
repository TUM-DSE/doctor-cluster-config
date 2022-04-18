# Create a secret to trigger repository remote dispatch:
# https://github.com/TUM-DSE/nixpkgs/blob/6b6871a627869636715814ee92f9de257cbca751/.github/workflows/update-doctor-cluster-flake.yml#L14
resource "github_actions_secret" "github-token" {
  repository       = "nixpkgs"
  secret_name      = "ACCESS_TOKEN"
  plaintext_value  = data.sops_file.secrets.data["GITHUB_TOKEN"]
}
