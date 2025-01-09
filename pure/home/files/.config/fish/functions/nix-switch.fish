function nix-switch
    switch $argv[1]
        case home
            home-manager switch -b backup --flake ~/.dotfiles/nixos/custom#custom
        case nixos
            sudo nixos-rebuild switch --flake ~/.dotfiles/nixos/custom#custom
        case '*'
            echo "Unknown system: $argv[1]. Available: home, nixos."
    end
end
