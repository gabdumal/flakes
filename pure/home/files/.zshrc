# Nix
## Configuration
nix-edit() {
    case $1 in
        pure)
            code $HOME/dev/flakes
            ;;
        custom)
            code $HOME/.dotfiles/nixos
            ;;
        *)
            echo "Unknown flake: $1. Available: pure, custom."
            ;;
    esac
}

## Deployment
nix-switch() {
    case $1 in
        home)
            home-manager switch -b backup --flake ~/.dotfiles/nixos#custom
            ;;
        nixos)
            sudo nixos-rebuild switch --flake ~/.dotfiles/nixos#custom
            ;;
        *)
            echo "Unknown system: $1. Available: home, nixos."
            ;;
    esac
}

develop() {
    case $1 in
        c_cpp|java|latex|python|rust|typescript|typst)
            env_path=~/.dotfiles/nixos/environments/$1
            ;;
        *)
            echo "Unknown environment: $1. Available: c_cpp, java, latex, python, rust, typescript, typst."
            exit 1
            ;;
    esac
}

nix-update-all() {
    $HOME/.dotfiles/nixos/update.sh
}

# Programs
## Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Theme
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh)"
fi
eval "$(oh-my-posh init zsh --config ~/.dotfiles/omp.json)"

# Shell
eval $(thefuck --alias)
