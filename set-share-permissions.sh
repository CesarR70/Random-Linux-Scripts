#!/bin/bash

# Configuration (feel free to adjust these directory paths or add more as needed)
declare -A FOLDERS=(
    ["Movies"]="/mnt/Media/Movies"
    ["TV-Shows"]="/mnt/Media/TV-Shows"
    ["Dropzone"]="/mnt/Media/Dropzone"
)

# Please Change "FILE-OWNER" and "SHARE-GROUP" to reflect the Username and Group that the files should be set to
OWNER="FILE-OWNER"
GROUP="SHARE-GROUP"
PERMS="750"

# Function to check and fix permissions
fix_permissions() {
    local folder_name="$1"
    local folder_path="$2"

    echo -e "\n📂 Checking folder: $folder_name ($folder_path)"

    # Prompt the user for what directory they would like to run the script for
    read -p "Do you want to fix permissions for $folder_name? [y/N]: " answer
    answer=${answer,,}  # convert to lowercase
    if [[ "$answer" != "y" ]]; then
        echo "❌ Skipping $folder_name"
        return
    fi

    # Iterate over files and fix only incorrect permissions/ownership
    find "$folder_path" -print0 | while IFS= read -r -d '' file; do
        current_owner=$(stat -c "%U" "$file")
        current_group=$(stat -c "%G" "$file")
        current_perms=$(stat -c "%a" "$file")

        changes=()

        if [[ "$current_owner" != "$OWNER" || "$current_group" != "$GROUP" ]]; then
            chown "$OWNER:$GROUP" "$file"
            changes+=("ownership")
        fi

        if [[ "$current_perms" != "$PERMS" ]]; then
            chmod "$PERMS" "$file"
            changes+=("permissions")
        fi

        if [[ ${#changes[@]} -gt 0 ]]; then
            echo "✅ Updated ${changes[*]}: $file"
        fi
    done
}

# Loop through the defined folders
for name in "${!FOLDERS[@]}"; do
    path="${FOLDERS[$name]}"
    if [[ -d "$path" ]]; then
        fix_permissions "$name" "$path"
    else
        echo "⚠️  Warning: $path does not exist!"
    fi
done

echo -e "\n🎉 Done."
