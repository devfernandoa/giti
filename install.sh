#!/bin/bash

# Define the giti script content
GITI_SCRIPT='#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -lt 1 ]; then
    echo "Usage:"
    echo "  giti \"commit message\""
    echo "  giti tag vX.X.X \"commit message\""
    exit 1
fi

# Function to add, commit, and push changes
add_commit_push() {
    local commit_message="$1"
    git status
    read -p "These are the changes, add, commit and push them (y/n)? " choice
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
    local commit_message="$2"
    read -p "Creating and pushing tag $tag_version, proceed (y/n)? " choice
    if [[ $choice =~ ^[Yy]$ ]]; then
        git tag -a "$tag_version" -m "$commit_message"
        git push origin "$tag_version"
        echo "Tag $tag_version created and pushed."
    else
        echo "Tag creation aborted."
    fi
}

# Main logic
if [ "$1" == "tag" ]; then
    if [ "$#" -ne 4 ]; then
        echo "Usage: giti tag vX.X.X \"commit message\""
        exit 1
    fi
    tag_version="$2"
    commit_message="$4"
    add_commit_push "$commit_message"
    create_and_push_tag "$tag_version" "$commit_message"
else
    commit_message="$1"
    add_commit_push "$commit_message"
fi'

# Write the script to /usr/local/bin/giti
echo "$GITI_SCRIPT" | sudo tee /usr/local/bin/giti > /dev/null

# Make the script executable
sudo chmod +x /usr/local/bin/giti

echo "giti has been installed successfully! You can now use it as a command."
