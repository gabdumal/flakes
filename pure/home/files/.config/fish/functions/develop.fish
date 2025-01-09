function develop
    set files (ls ~/.dotfiles/nixos/environments/ | grep -v -e 'README.md' -e 'update.sh')

    set match_found false
    for file in $files
        if test "$argv[1]" = "$file"
            nix develop ~/.dotfiles/nixos/environments/$argv[1]
            set match_found true
            break
        end
    end

    if test "$match_found" = false
        echo "Unknown environment: $argv[1]. Available: (string join , $files)."
    end
end
