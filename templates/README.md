# Templates

## Project template

Initialize a simple project with nix flakes

```
$ mkdir myproject
$ cd myproject
$ nix flake init --template github:TUM-DSE/doctor-cluster-config#cluster-project
```

With this newly initialized flake.nix you can enter your development shell

```
$ nix develop .#cluster-project
```

In this shell you now have `make` and `gcc` available. `zlib`, in this example, is available to the linker.

Note that `gcc` is wrapped by nixos of which you can inspect additional parameters with `NIX_DEBUG=1 gcc`.


## Home-manager template
