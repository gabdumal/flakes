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

Clone this repository to your local machine. You can change the name of the folder `flakes` to whatever you want.
Personally, I like so set all my flakes in a folder named `.dotfiles` in my home directory.

```sh
git clone https://github.com/gabdumal/flakes.git flakes
```

Now `cd` into the `environments` directory.

```sh
cd flakes/environments
```

Choose the environment you want to install and `cd` into it.

```sh
cd [environment]
```

Then build the environment.

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
