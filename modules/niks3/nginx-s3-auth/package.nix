# nginx module (nixpkgs-style attrset for services.nginx.additionalModules).
# Built statically into nginx via --add-module; the nginx buildsystem invokes
# cargo through config.make (see auto/rust from ngx-rust).
{
  lib,
  cargo,
  rustc,
  rustPlatform,
}:
let
  vendoredDeps = rustPlatform.importCargoLock { lockFile = ./Cargo.lock; };
in
{
  name = "s3-auth";
  src = lib.fileset.toSource {
    root = ./.;
    fileset = lib.fileset.unions [
      ./Cargo.toml
      ./Cargo.lock
      ./auto
      ./config
      ./config.make
      ./module
      ./sigv4
    ];
  };
  inputs = [
    cargo
    rustc
    rustPlatform.bindgenHook
  ];
  preConfigure = ''
    export CARGO_HOME=$TMPDIR/cargo-home
    mkdir -p "$CARGO_HOME"
    cat > "$CARGO_HOME/config.toml" <<EOF
    [source.crates-io]
    replace-with = "vendored-sources"

    [source.vendored-sources]
    directory = "${vendoredDeps}"
    EOF
    export NGX_RUSTC_OPT="--offline"
  '';
  meta = {
    description = "AWS SigV4 signing variables for proxying to S3";
    license = [ lib.licenses.mit ];
  };
}
