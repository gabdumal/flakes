nix flake update
git add .
git commit -m "Update packages"
home-manager switch -b backup --flake ~/.dotfiles/$HOSTNAME/custom#custom
sudo nixos-rebuild switch --flake ~/.dotfiles/$HOSTNAME/custom#custom
