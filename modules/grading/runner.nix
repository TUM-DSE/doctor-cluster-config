{ pkgs, inputs }:
let
  image = inputs.srg-grading.packages.${pkgs.stdenv.hostPlatform.system}.runner-image;
in
pkgs.runCommand "grading-runner"
  {
    nativeBuildInputs = [
      pkgs.skopeo
      pkgs.jq
    ];
  }
  ''
    mkdir -p "$out"
    # Use the exact OCI manifest imported by containerd for both consumers.
    skopeo --tmpdir "$TMPDIR" --insecure-policy copy docker-archive:${image} oci:oci:runner
    digest=$(jq -er '.manifests | if length == 1 then .[0].digest else error("expected one runner manifest") end' oci/index.json)
    printf 'grading.local/grading/runner@%s\n' "$digest" > "$out/reference"
    tar --sort=name --mtime=@1 --owner=0 --group=0 --numeric-owner -C oci -cf "$out/image.tar" .
    cat > "$out/profiles.toml" <<EOF
    [registry]
    image_prefix = "grading.local/grading"
    runner_images = ["grading.local/grading/runner@$digest"]
    timeout_seconds = 86400
    [registry.resources]
    cpu = 10
    memory_gib = 32
    storage_gib = 64
    EOF
  ''
