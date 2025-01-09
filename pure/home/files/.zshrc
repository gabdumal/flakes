## Nix
### Configuration
nix-edit() {
    case $1 in
        pure)
            code $HOME/dev/flakes
            ;;
        custom)
            code $HOME/.dotfiles/nixos/custom
            ;;
        *)
            echo "Unknown flake: $1. Available: pure, custom."
            ;;
    esac
}

### Deployment
nix-switch() {
    case $1 in
        home)
            home-manager switch -b backup --flake ~/.dotfiles/nixos/custom#custom
            ;;
        nixos)
            sudo nixos-rebuild switch --flake ~/.dotfiles/nixos/custom#custom
            ;;
        *)
            echo "Unknown system: $1. Available: home, nixos."
            ;;
    esac
}

develop() {
    case $1 in
        c_cpp|java|latex|python|rust|typescript|typst)
            nix develop ~/.dotfiles/nixos/environments/$1
            ;;
        *)
            echo "Unknown environment: $1. Available: c_cpp, java, latex, python, rust, typescript, typst."
            exit 1
            ;;
    esac
}

nix-update-all() {
    $HOME/.dotfiles/nixos/custom/update.sh
}
