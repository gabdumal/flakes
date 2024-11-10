# Nix
## Configuration
nix-edit-pure (){
    code $HOME/dev/flakes
}

nix-edit-custom(){
    code $HOME/.dotfiles/$HOST/custom
}

## Deployment
home-manager-switch(){
    rm ~/.ssh/known_hosts.backup
    home-manager switch -b backup --flake ~/.dotfiles/$HOST/custom#custom
}

nixos-switch(){
    sudo nixos-rebuild switch --flake ~/.dotfiles/$HOST/custom#custom
}

develop() {
    case $1 in
        rust)
            nix develop ~/.dotfiles/$HOST/environments/rust
            ;;
        typescript)
            nix develop ~/.dotfiles/$HOST/environments/typescript
            ;;
        typst)
            nix develop ~/.dotfiles/$HOST/environments/typst
            ;;
        *)
            echo "Unknown environment: $1"
            ;;
    esac
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
