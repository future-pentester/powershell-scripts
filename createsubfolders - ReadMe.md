# Employee Folder Subfolders Creator

This PowerShell script automates the creation of specific subfolders inside each employee folder.

## Description

The script scans all employee folders located in the base directory:
C:\Users\MarwanAdel\Alamana\مستندات الموظفين
For each employee folder, it creates the following subfolders if they don't already exist:

- Contract
- Job Offer
- Warning Letter
- Penality
- ID
- Residence
- Passport
- VISA
- Bank Account
- Salary
- Asset
- Settelment
- Loan
- Flight Ticket
- Annual Leave
- Contact Info

This helps organize employee documents in a structured way.

## How to Use

1. Set the `$baseFolderPath` variable to the path containing employee folders.
2. Run the script in PowerShell.
3. The script will create the specified subfolders inside each employee folder.

## Notes

- The script checks if a subfolder exists before creating it, so it won’t overwrite existing folders.
- Make sure you have the necessary permissions to create folders in the target directory.

---

Created by Marwan Adel

