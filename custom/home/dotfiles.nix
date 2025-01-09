{ ... }:
{

  home.file = {

    ".config/ghostty/config" = {
      force = true;
      recursive = true;
      source = ./files/.config/ghostty/config;
    };

  };

}
