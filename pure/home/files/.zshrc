# Nix
## Configuration
nix-edit() {
    case $1 in
        pure)
            code $HOME/dev/flakes
            ;;
        custom)
            code $HOME/.dotfiles/$HOST/custom
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
            home-manager switch -b backup --flake ~/.dotfiles/$HOST/custom#custom
            ;;
        nixos)
            sudo nixos-rebuild switch --flake ~/.dotfiles/$HOST/custom#custom
            ;;
        *)
            echo "Unknown system: $1. Available: home, nixos."
            ;;
    esac
}

develop() {
    case $1 in
        rust|typescript|typst|latex)
            env_path=~/.dotfiles/$HOST/environments/$1
            ;;
        *)
            echo "Unknown environment: $1. Available: rust, typescript, typst, latex."
            exit 1
            ;;
    esac
}

nix-update-all() {
    $HOME/.dotfiles/$HOST/custom/update.sh
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
