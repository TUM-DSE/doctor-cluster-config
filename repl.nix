# USAGE: nix repl ./repl.nix --argstr hostname <hostname>
{ hostname }:
(builtins.getFlake (toString ./.)).nixosConfigurations.${hostname}
