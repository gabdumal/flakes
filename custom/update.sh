cd  ~/.dotfiles/nixos/custom
nix flake update
git add .
git commit -m "Update packages"
sudo nixos-rebuild switch --flake ~/.dotfiles/nixos/custom#custom
home-manager switch -b backup --flake ~/.dotfiles/nixos/custom#custom
cd -
