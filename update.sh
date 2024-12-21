# Define an array of folder paths
folders=(
    "environments/latex"
    "environments/rust"
    "environments/typescript"
    "environments/typst"
    "pure"
    "custom"
)

cd ~/.dotfiles/$HOSTNAME || { echo "Failed to cd into ~/.dotfiles/$HOSTNAME"; exit 1; }

# Loop through each folder path
for folder in "${folders[@]}"; do
    # Change directory to the folder
    cd "$folder" || { echo "Failed to cd into $folder"; exit 1; }
    
    # Execute the command
    nix flake update
    
    # Return to the original directory
    cd - || exit
done
