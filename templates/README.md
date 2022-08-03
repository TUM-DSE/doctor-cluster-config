# Templates

Opinionated templates for getting started with nix on the doctor cluster. You will learn how to install per-project and user-global packages (and environments).


## Using templates

Initialize a nix flake project

```
$ mkdir myproject
$ cd myproject
$ nix flake init --template github:TUM-DSE/doctor-cluster-config#project-template
```

It is good practice to versionate this folder with git!


## Project template

```
$ nix flake init --template github:TUM-DSE/doctor-cluster-config#project-template
```

With this newly initialized flake.nix you can enter your development shell

```
$ nix develop .#cluster-project
```

In this shell you now have `make` and `gcc` available. `zlib`, in this example, is available to the linker.

Note that `gcc` is wrapped by nixos of which you can inspect additional parameters with `NIX_DEBUG=1 gcc`.


## Home-manager template

```
$ nix flake init --template github:TUM-DSE/doctor-cluster-config#home-manager
```

With this newly initialized flake.nix you can define user-global packages (, config files, user services and environment) in `home.nix`. 

Switch to your home configuration:

```
$ ls ./flake.nix
$ nix run .#switch-jdoe-hm
```
