# Templates

Opinionated templates for getting started with nix on the doctor cluster. You will learn how to install per-project and user-global packages (and environments).

## Project template

Initialize a nix flake project

```console
$ mkdir myproject
$ cd myproject
$ nix flake init --template github:TUM-DSE/doctor-cluster-config#project
$ git add flake.nix flake.lock # important or else nix won't find those files
```

It is good practice to versionate this folder with git!

With this newly initialized flake.nix you can enter your development shell

```console
$ nix develop
```

In this shell you now have `cmake` and `gcc` available. `zlib`, in this example, is available to the linker.

Note that `gcc` is wrapped by nixos of which you can inspect additional parameters with `NIX_DEBUG=1 gcc`.

## Home-manager template

```console
$ mkdir -p $HOME/.config/home-manager
$ cd $HOME/.config/home-manager
$ nix flake init --template github:TUM-DSE/doctor-cluster-config#home-manager
# edit home.nix
```

With this newly initialized flake.nix you can define user-global packages (, config files, user services and environment) in `home.nix`. 

Switch to your home configuration:

```console
$ ls ./flake.nix
$ nix run $HOME/.config/home-manager#switch-jdoe-hm
```

The example home-manager configuration will install `htop`.
