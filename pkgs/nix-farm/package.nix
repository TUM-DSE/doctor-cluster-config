{
  lib,
  python3,
  runCommand,
  nix-fast-build,
  pluginDispatcher,
}:
runCommand "nix-farm"
  {
    nativeBuildInputs = [ python3 ];
    meta.mainProgram = "nix-farm";
  }
  ''
    install -Dm755 ${./nix_farm.py} $out/bin/nix-farm
    substituteInPlace $out/bin/nix-farm \
      --replace-fail '@plugins@' '${pluginDispatcher}/lib/nix/plugins' \
      --replace-fail '@nix_fast_build@' '${lib.getExe nix-fast-build}'
    sed -i '1i #!${python3.interpreter}' $out/bin/nix-farm
    patchShebangs $out/bin
  ''
