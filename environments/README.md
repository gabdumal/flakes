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

Now you can enable this environment in your shell by running:

```sh
nix develop
```
