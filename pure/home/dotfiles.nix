{ ... }:
{

  home.file = {

    ".config/fish/functions/develop.fish" = {
      force = true;
      recursive = true;
      source = ./files/.config/fish/functions/develop.fish;
    };

    ".config/fish/functions/nix-edit.fish" = {
      force = true;
      recursive = true;
      source = ./files/.config/fish/functions/nix-edit.fish;
    };

    ".config/fish/functions/nix-switch.fish" = {
      force = true;
      recursive = true;
      source = ./files/.config/fish/functions/nix-switch.fish;
    };


    ".config/fish/functions/nix-update-all.fish" = {
      force = true;
      recursive = true;
      source = ./files/.config/fish/functions/nix-update-all.fish;
    };

  };

}
