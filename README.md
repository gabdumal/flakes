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

If you are using NixOS, you can add the following to your `configuration.nix`, ate the end, before the last `}`:

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

Clone this repository to your local machine.

Personally, I like so set all my configuration in a directory named `.dotfiles` in my home directory.
Then, clone the repository to a folder named after the hostname of the machine I am configuring.

```bash
mkdir ~/.dotfiles
cd ~/.dotfiles
git clone https://github.com/gabdumal/flakes.git [hostname]
```

We will make changes only to the `custom` directory.
Enter the folder you just cloned, and then the `custom` directory.

```bash
cd [hostname]
cd custom
```

## Hardware configuration

You now need to generate your hardware configuration, by using the following commands

```bash
cd /etc/nixos
sudo nixos-generate-config
```

Copy the file `hardware-configuration.nix` to the flake directory that you have cloned the repository to.

```bash
sudo cp /etc/nixos/hardware-configuration.nix [path_of_the_flake_folder]/system/hardware-configuration.nix

# If you have followed the suggestion to clone the repository to `~/.dotfiles`, the command would be the following, replacing `[hostname]`:

sudo cp /etc/nixos/hardware-configuration.nix ~/.dotfiles/[hostname]/custom/system/hardware-configuration.nix
```

Do **not** edit the contents of the `hardware-configuration.nix` file.
It must be automatically generated.

## Custom definitions

Open the `custom/flake.nix` file to edit.

```bash
cd ~/.dotfiles/[hostname]/custom
nano flake.nix
```

Replace the following placeholders in the `custom/flake.nix` file with the appropriate values:

```nix
  fullname = "[Full Name]";
  username = "[username]";
  hostname = "[hostname]";
```

Do **not** edit the `custom/flake.nix` file directly, neither the `custom/configuration.nix`, the `custom/home/basic.nix` and the `custom/system/basic.nix` files.

You can change the files named `custom/home/home.nix` and `custom/system/system.nix`, and even creating new files.
In that case, remember to import them in the `custom/home/home.nix` and the `custom/system/system.nix` files with the following syntax:

```nix
# custom/home/home.nix
imports = [
  ./new-file.nix
];
```

## Using

Open the `custom` directory, so you can update the system with the following commands:

```bash
cd ~/.dotfiles/[hostname]/custom
nix flake update
```

Then, you have to configure this configuration folder as a repository.
Run the following commands to initialize the repository.
Remember to replace `[Full Name]` and `[email]` with your full name and email.

```bash
git config user.name "[Full Name]"
git config user.email "[email]"
git add .
git commit -m "Initialize Nix configuration"
```

### NixOS

Rebuild the system with:

```bash
sudo nixos-rebuild switch --flake ~/.dotfiles/[hostname]/custom#custom
```

In the next time, you can use this helper command instead:

```bash
nix-switch nixos
```

### Home Manager

For the first time, you need to initialize home manager with:

```bash
nix run home-manager -- init --switch --flake ~/.dotfiles/[hostname]/custom#custom
```

Then, you can rebuild the user environment with:

```bash
home-manager switch --flake .#custom -b backup
```

In the next time, you can use this helper command instead:

```bash
nix-switch home
```

### Nix develop

You can enter a development environment with the following command.\
`<flake>` is the path to the flake directory.

```bash
nix develop <flake_path>
```

For example, to enter the `typescript` environment, you can use the following command.

```bash
nix develop ~/.dotfiles/[username]/environments/typescript
```

Or, you can use the following helper command instead for the pre-defined environments.\
`<environment>` is the name of one of the following: [latex, rust, typescript, typst].

```bash
develop <environment>
```

You can find more information on the topic in [Nix Development instructions](environments/README.md).

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
nix flake update
```

This will update the NixOS, the Home Manager and the environments inputs.

Then, commit the changes to the repository.
So you can run the `switch` command.

### Cleaning

You can clean the system of unused packages with the following command:

```bash
nix-store --gc
```
