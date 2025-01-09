function nix-edit
    switch $argv[1]
        case pure
            code $HOME/dev/flakes
        case custom
            code $HOME/.dotfiles/nixos/custom
        case '*'
            echo "Unknown flake: $argv[1]. Available: pure, custom."
    end
end
