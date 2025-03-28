#!/bin/bash

# Define the giti script content
GITI_SCRIPT='#!/bin/bash

# If no arguments are provided, show git status and exit
if [ "$#" -eq 0 ]; then
    git status
    exit 0
fi

# Check if the correct number of arguments is provided
if [ "$#" -lt 1 ]; then
    echo "Usage:"
    echo "  giti                     # Show git status"
    echo "  giti \"commit message\"   # Add, commit, and push changes"
    echo "  giti vX.X.X              # Create a tag and push changes"
    exit 1
fi

# Function to add, commit, and push changes
add_commit_push() {
    local commit_message="$1"
    git status
    read -p "These are the changes, add, commit and push them? [Y/n] " choice
    choice=${choice:-y}  # Default to 'y' if the user presses Enter
    if [[ $choice =~ ^[Yy]$ ]]; then
        git add .
        git commit -m "$commit_message"
        git push
        echo "Changes committed and pushed."
    else
        echo "Aborted."
        exit 0
    fi
}

# Function to create and push a tag
create_and_push_tag() {
    local tag_version="$1"
    read -p "Creating and pushing tag $tag_version, proceed? [Y/n] " choice
    choice=${choice:-y}  # Default to 'y' if the user presses Enter
    if [[ $choice =~ ^[Yy]$ ]]; then
        git tag -a "$tag_version" -m "$tag_version"
        git push origin "$tag_version"
        echo "Tag $tag_version created and pushed."
    else
        echo "Tag creation aborted."
    fi
}

# Main logic
if [[ "$1" =~ ^v[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    # If the argument matches a version tag pattern (e.g., vX.X.X)
    tag_version="$1"
    add_commit_push "$tag_version"
    create_and_push_tag "$tag_version"
else
    # Otherwise, treat it as a regular commit message
    commit_message="$1"
    add_commit_push "$commit_message"
fi'

# Write the script to /usr/local/bin/giti
echo "$GITI_SCRIPT" | sudo tee /usr/local/bin/giti > /dev/null

# Make the script executable
sudo chmod +x /usr/local/bin/giti

echo "giti has been installed successfully! You can now use it as a command."
