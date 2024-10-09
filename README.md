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

Create a file named `custom-configuration.nix` in the flake directory.

```sh
cd [path_of_the_flake_folder]
touch custom-configuration.nix
```

You need to add some basic configurations to the `custom-configuration.nix` file.
Set the content of the file as the snippet below.
Remember to replace:

- `[hostname]` with your hostname;
- `[username]` with your username;
- `[Your Name]` with your full name.

```nix
{ pkgs, lib, inputs, ... }:
{
  # Define a user account.
  users.users.[username] = {
    isNormalUser = true;
    description = "[Your Name]";
    extraGroups = [ "networkmanager" "wheel" "bluetooth" ];
    packages = with pkgs; [
      #  thunderbird
    ];
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "[username]";

  ## Networking
  networking.hostName = "[hostname]"; # Define your hostname.
}
```

Feel free to add any other configuration you want to the `custom-configuration.nix` file.

## Using

Now, `cd` into the flake directory.

Then, you can build the system with:

```sh
sudo nix flake update
```

And rebuild the system with:

```sh
sudo nixos-rebuild switch --flake .#impure
```
