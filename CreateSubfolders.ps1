$baseFolderPath = "C:\Users\MarwanAdel\Alamana\Ahmad Alghamdi - مستندات الموظفين"  
$subFolders = @("Contract", "Job Offer", "Warning Letter", "Penality", "ID", "Residence", "Passport", "VISA", "Bank Account", "Salary", "Asset", "Settelment", "Loan", "Flight Ticket", "Annual Leave", "Contact Info")  

$folders = Get-ChildItem -Path $baseFolderPath -Directory

foreach ($folder in $folders) {
    foreach ($subFolder in $subFolders) {
        $newFolderPath = Join-Path -Path $folder.FullName -ChildPath $subFolder

        if (!(Test-Path -Path $newFolderPath)) {
            New-Item -ItemType Directory -Path $newFolderPath
        }
    }
}
