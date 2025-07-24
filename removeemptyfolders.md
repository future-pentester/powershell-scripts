# RemoveEmptyFolders

This PowerShell script recursively deletes all empty folders within a specified base directory.

## Description

The script scans all subdirectories inside the base path and removes any folder that contains no files or subfolders.

## How It Works

- Recursively gets all subfolders under the specified base directory.
- Checks if each folder is empty (no files or folders inside).
- Deletes the folder if it is empty.
- Outputs a message for every deleted folder.

## How to Use

1. Set the `$baseFolderPath` variable to the target directory you want to clean.
2. Run the script in PowerShell.
3. The script will delete all empty folders within that directory.

## Notes

- Make sure you have permission to delete folders in the target directory.
- Use with caution: deleted folders cannot be recovered unless you have backups.
- This script does not delete folders that contain files or other folders.

---

Created by Marwan Adel
