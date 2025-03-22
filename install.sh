#!/bin/bash

# Define the script content
GITI_SCRIPT='#!/bin/bash

# Check if a commit message is provided
if [ -z "$1" ]; then
    echo "Usage: giti \"commit message\""
    exit 1
fi

# Show git status
git status

# Prompt the user for confirmation
read -p "These are the changes, add, commit and push them (y/n)? " choice

if [[ $choice =~ ^[Yy]$ ]]; then
    # Add all changes
    git add .

    # Commit with the provided message
    git commit -m "$1"

    # Push changes
    git push
else
    echo "Aborted."
fi'

# Write the script to a file
echo "$GITI_SCRIPT" > giti

# Make the script executable
chmod +x giti

# Move the script to /usr/local/bin (requires sudo)
sudo mv giti /usr/local/bin/

echo "giti has been installed successfully! You can now use it as a command."
