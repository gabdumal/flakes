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
    files=()
    while IFS= read -r file; do
        files+=("$file")
    done < <(ls ~/.dotfiles/nixos/environments/ | grep -v -e 'README.md' -e 'update.sh')

    match_found=false
    for file in "${files[@]}"; do
        if [ "$1" = "$file" ]; then
            nix develop ~/.dotfiles/nixos/environments/$1
            match_found=true
            break
        fi
    done

    if [ "$match_found" = false ]; then
        echo "Unknown environment: $1. Available: $(IFS=, ; echo "${files[*]}")."
    fi
}

nix-update-all() {
    $HOME/.dotfiles/nixos/custom/update.sh
}
