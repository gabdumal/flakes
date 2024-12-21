{ ... }:
{

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  imports = [

  ];

  catppuccin = {
    enable = true;
    flavor = "latte";
  };

}
