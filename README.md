# Gabdumal's pure flake

This is a flake that contains my pure configuration for NixOS.

## Setup

You need to enable experimental features in your Nix configuration.
The procedure to do that varies depending on your setup.

Typically, you can find the `configuration.nix` file at `/etc/nixos/configuration.nix`.
Open it to edit.

```bash
cd /etc/nixos
sudo nano configuration.nix
```

If you are using NixOS, you can add the following to your `configuration.nix`, at the end, before the last `}`:

```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```

Save and close the file by pressing `Ctrl + O` and then `Enter`, and then `Ctrl + X`.

Then, rebuild the system with:

```bash
sudo nixos-rebuild switch
```

If you are using Nix on another system, you can add the following to your `nix.conf`:

```nix
experimental-features = nix-command flakes
```

## Installing

You will need the `git` package to clone this repository.

```bash
nix-shell -p git
```

Personally, I like so set all my configuration in a directory named `.dotfiles` in my home directory.

Create a folder named `nixos` in the `.dotfiles` directory, and clone the folder `custom` of this repository into it.

```bash
mkdir ~/.dotfiles
cd ~/.dotfiles
git clone --no-checkout https://github.com/gabdumal/flakes.git nixos
cd nixos
git sparse-checkout init --cone
git sparse-checkout set custom
git checkout
```

Nix flakes must be saved into a repository.
Configure a new one with the following commands.

```bash
cd ~/.dotfiles/nixos
rm -rf .git
rm flake.nim update.sh .gitignore
mv README.md custom
cd custom
git init
git branch -m main
git add .
```

Set your information in the repository.

```bash
git config user.name "[Full Name]"
git config user.email "[email]"
```

Commit the changes.

```bash
git commit -m "Initialize Nix configuration"
```

## Hardware configuration

You now need to generate your hardware configuration, by using the following commands

```bash
cd /etc/nixos
sudo nixos-generate-config
```

Copy the file `hardware-configuration.nix` to the flake directory that you have cloned the repository to.

```bash
sudo cp /etc/nixos/hardware-configuration.nix ~/.dotfiles/nixos/custom/system/hardware-configuration.nix
```

Commit the changes to the repository.

```bash
cd ~/.dotfiles/nixos/custom
git add ./system/hardware-configuration.nix

git commit -m "Add hardware configuration"
```

Do **not** edit the contents of the `hardware-configuration.nix` file.
It must be automatically generated.

## Custom definitions

Open the `custom/flake.nix` file to edit.

```bash
cd ~/.dotfiles/nixos/custom
nano flake.nix
```

Replace the following placeholders in the `custom/flake.nix` file with the appropriate values:

```nix
  fullname = "[Full Name]";
  username = "[username]";
  hostname = "nixos";
```

## Using

Do **not** edit the `custom/flake.nix` file directly, neither the `custom/configuration.nix`, the `custom/home/basic.nix` and the `custom/system/basic.nix` files.

You can change the files named `custom/home/home.nix` and `custom/system/system.nix`, and even creating new files.
In that case, remember to import them in the `custom/home/home.nix` and the `custom/system/system.nix` files with the following syntax:

```nix
# custom/home/home.nix
imports = [
  ./new-file.nix
];
```

### NixOS

Rebuild the system with:

```bash
sudo nixos-rebuild switch --flake ~/.dotfiles/nixos/custom#custom
```

In the next time, you can use this helper command instead:

```bash
nix-switch nixos
```

#### Flatpaks

To enable flatpaks, run the following commands:

```bash
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak update
```

### Home Manager

For the first time, you need to initialize home manager with:

```bash
nix run home-manager -- init --switch --flake ~/.dotfiles/nixos/custom#custom
```

Then, you can rebuild the user environment with:

```bash
home-manager switch --flake ~/.dotfiles/nixos/custom#custom -b backup
```

In the next time, you can use this helper command instead:

```bash
nix-switch home
```

## Configuring

In order to access the configuration files, you can use the following command:

```bash
nix-edit custom
```

After editing the files, you can commit the changes to the repository.

```bash
git add .
git commit -m "Update configuration"
```

Then, you can run the `switch` command.

### Updating

From time to time, you may want to update the flake inputs.
To do so, you can entre the `custom` directory, and use the following command:

```bash
cd ~/.dotfiles/nixos/custom
nix flake update
```

This will update the NixOS, the Home Manager and the environments inputs.

Then, commit the changes to the repository.
So you can run the `switch` command.

Or, you can use the `update` script to do all that process to you.

```bash
cd ~/.dotfiles/nixos/custom
./update.sh
```

Alternatively, run the following helper command instead:

```bash
nix-update-all
```

### Cleaning

You can clean the system of unused packages with the following command:

```bash
nix-collect-garbage -d
```
