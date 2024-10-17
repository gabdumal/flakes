{ ... }:
{

  home.file = {
    ".dotfiles/omp.json" = {
      source = ./files/.dotfiles/omp.json;
    };

    ".ssh/known_hosts" = {
      source = ./files/.ssh/known_hosts;
    };
  };

}
