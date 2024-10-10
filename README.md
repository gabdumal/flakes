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

You now need to generate your hardware configuration, by using the following commands

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
