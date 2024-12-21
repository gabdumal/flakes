# Define an array of folder paths
folders=(
    "pure"
    "custom"
)

# Loop through each folder path
for folder in "${folders[@]}"; do
    # Change directory to the folder
    cd "$folder" || { echo "Failed to cd into $folder"; exit 1; }
    
    # Execute the command
    nix flake update
    
    # Return to the original directory
    cd - || exit
done
