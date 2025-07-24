# MoveFilesToMainFolders

This PowerShell script organizes files within employee folders by moving them into designated subfolders based on filename prefixes.

## Description

The script scans all subfolders inside the base directory:

C:\Users\MarwanAdel\Desktop\emlpoyee folder


For each file inside these subfolders, it reads the first two characters (prefix) of the filename and moves the file into the corresponding folder as per the predefined mapping:

| Prefix | Target Folder   |
|--------|-----------------|
| CO     | Contract        |
| JO     | Job Offer       |
| WL     | Warning Letter  |
| PE     | Penality        |
| ID     | ID              |
| RE     | Residence       |
| PA     | Passport        |
| Vi     | Visa            |
| DE     | Delegation      |
| BA     | Bank Account    |
| SA     | Salary          |
| AS     | Asset           |
| SE     | Settelment      |
| LO     | Loan            |
| FT     | Flight Ticket   |
| AN     | Annual Leave    |
| CI     | Contact Info    |
| IN     | Insurance       |
| AC     | Acknowledgment  |

Files that do not match any prefix will be moved into an `Others` folder within the same subfolder.

## How to Use

1. Set the `$baseFolderPath` variable to your main directory containing employee folders.
2. Make sure the subfolders listed in the mapping exist inside each employee folder.
3. Run the script in PowerShell.
4. The script will move files based on their prefixes into the correct folders.

## Notes

- The script checks if the target folder exists before moving a file; if not, it logs a warning.
- Files without a recognized prefix are safely moved to an `Others` folder to avoid data loss.
- Make sure you have the necessary permissions to move files and create folders in the target directories.

---

Created by Marwan Adel
