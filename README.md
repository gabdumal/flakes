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

If you are using Nix on another system, you can add the following to your `nix.conf`:

```nix
experimental-features = nix-command flakes
```

## Installing

Create a new flake using the `impure` template with the following command.
You can change `./flake` to any other directory name you want.

```sh
nix flake new --template github:gabdumal/flakes#impure ./flake
```

## Hardware configuration

You now need to generate your hardware configuration, using the following commands

```sh
cd /etc/nixos
sudo nixos-generate-config
```

Copy the file `hardware-configuration.nix` to the flake directory.

```sh
sudo cp /etc/nixos/hardware-configuration.nix [path_of_the_flake_folder]/hardware-configuration.nix
```

Do **not** edit the contents of the `hardware-configuration.nix` file.
It must be automatically generated.

## Custom configuration

Edit the file named `custom-configuration.nix` in the flake directory.
This file is already defining some basic configurations.

Replace the following placeholders in the appropriate files:

- `[Full Name]` with your full name.
- `[username]` with your username;
- `[hostname]` with your hostname;

Since most of the places where they appear are in the form of variables, you only need to replace their definitions.

```nix
# custom-configuration.nix
let
  fullname = "[Full Name]";
  username = "[username]";
  hostname = "[hostname]";

# home.nix
let
  username = "[username]";
```

Feel free to add any other configuration you want to the `custom-configuration.nix` file.

## Using

Now, `cd` into the flake directory.

Then, you can build the system with:

```sh
sudo nix flake update
```

### NixOS

Rebuild the system with:

```sh
sudo nixos-rebuild switch --flake .#impure
```

### Home Manager

Rebuild the user environment with the following commands:

```sh
nix-shell '<home-manager>' -A install
home-manager switch --flake .#impure
```
