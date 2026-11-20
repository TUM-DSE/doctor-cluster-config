# Shared by every module that runs a flakelet: importing the flake's module
# from two places would declare its options twice.
{ inputs, ... }:
{
  imports = [ inputs.flakelet.nixosModules.flakelet ];
}
