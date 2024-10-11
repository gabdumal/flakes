# Gabdumal's development environments

This repository contains my development environments for NixOS.

## Setup

You need to enable experimental features in your Nix configuration.

The procedure to do that varies depending on your setup.

If you are using NixOS, you can add the following to your `configuration.nix`:

```nix
{
  #...

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  #...
}
```

Typically, you can find the `configuration.nix` file at `/etc/nixos/configuration.nix`.

If you are using Nix on another system, you can add the following to your `nix.conf`:

```nix
experimental-features = nix-command flakes
```

## Installing

The installation process is the same as described in the [README.md](../README.md#installing) file.

Now, enter the `environments` directory:

```sh
cd environments
```

Then, choose the environment you want to install, and enter its directory:

```sh
cd [environment]
```

For each, you need to construct the `flake.lock` file.
You can do that by running the following command:

```sh
sudo nix flake update
```

## Running

After having created the `flake.lock` file, you have two options to execute the environment.

### `nix develop`

This is the most traditional way to run a development environment.
You have to `cd` into the environment directory and run the following command:

```sh
nix develop
```

The problem with this approach is that the used shell is always `bash`.
If you want to use another shell, you can use the following command:

```sh
nix develop --impure --command zsh
```

### Direnv

You can also use [`nix-direnv`](https://github.com/nix-community/nix-direnv).

This will automatically load the environment when you `cd` into the directory.
Also, it uses the same shell that you are using in your terminal.

If you use the configuration from the [`pure`](../pure/flake.nix) flake in this repository, the `nix-direnv` will be already installed via `home-manager`.

For the first time you enable the environment, you have to `cd` into its folder, and run the following command:

```sh
direnv allow
```

#### Configuring projects

If you want to use `nix-direnv` in a project, can create a `.envrc` file in the root of the project with the following content:

```sh
use flake ./path/to/environment
```

If you have followed the suggestions in the [README.md](../README.md#installing) file, you can use the following content, replacing `[hostname]` and `[environment]` with the correct values:

```sh
use flake ~/.dotfiles/[hostname]/environments/[environment]
```

Then, enable the environment by running, the following command in the root of the project:

```sh
direnv allow
```
