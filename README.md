# Gabdumal's pure flake

This is a flake that contains my pure configuration for NixOS.

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

Clone this repository to your local machine.

Personally, I like so set all my configuration in a directory named `.dotfiles` in my home directory.
Then, clone the repository to a folder named after the hostname of the machine I am configuring.

```sh
mkdir ~/.dotfiles
cd ~/.dotfiles
git clone https://github.com/gabdumal/flakes.git [hostname]
```

We will make changes only to the `impure` directory.
Enter the folder you just cloned, and then the `impure` directory.

```sh
cd [hostname]
cd impure
```

## Hardware configuration

You now need to generate your hardware configuration, by using the following commands

```sh
cd /etc/nixos
sudo nixos-generate-config
```

Copy the file `hardware-configuration.nix` to the flake directory that you have cloned the repository to.

```sh
sudo cp /etc/nixos/hardware-configuration.nix [path_of_the_flake_folder]/hardware-configuration.nix
```

If you have followed the suggestion to clone the repository to `~/.dotfiles`, the command would be the following, replacing `[hostname]`:

```sh
sudo cp /etc/nixos/hardware-configuration.nix ~/.dotfiles/[hostname]/impure/hardware-configuration.nix
```

Do **not** edit the contents of the `hardware-configuration.nix` file.
It must be automatically generated.

## Custom definitions

Replace the following placeholders in the `impure/flake.nix` file with the appropriate values:

```nix
  fullname = "[Full Name]";
  username = "[username]";
  hostname = "[hostname]";
```

Do **not** edit the `impure/flake.nix` file directly, neither the `impure/configuration.nix` and `impure/home.nix` files.

Only change the custom files, named `impure/custom-configuration.nix` and `impure/custom-home.nix`.

## Using

Now, `cd` into the `impure` flake directory.
Then, you can build the system with:

```sh
cd impure
sudo nix flake update
```

### NixOS

Rebuild the system with:

```sh
sudo nixos-rebuild switch --flake .#impure
```

### Home Manager

For the first time, you need to initialize home manager with:

```sh
nix run home-manager -- init --switch --flake .#impure
```

Then, you can rebuild the user environment with:

```sh
home-manager switch --flake .#impure -b .backup
```
