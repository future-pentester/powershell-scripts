# مسار المجلد الرئيسي
$baseFolderPath = "C:\Users\MarwanAdel\Desktop\emlpoyee folder"

# تعريف المجلدات والاختصارات المرتبطة بها
$folderMapping = @{
    "CO" = "Contract"
    "JO" = "Job Offer"
    "WL" = "Warning Letter"
    "PE" = "Penality"
    "ID" = "ID"
    "RE" = "Residence"
    "PA" = "Passport"
    "Vi" = "Visa"
    "DE" = "Delegation"
    "BA" = "Bank Account"
    "SA" = "Salary"
    "AS" = "Asset"
    "SE" = "Settelment"
    "LO" = "Loan"
    "FT" = "Flight Ticket"
    "AN" = "Annual Leave"
    "CI" = "Contact Info"
    "IN" = "Insurance"
    "AC" = "Acknowledgment"
}

# البحث عن جميع المجلدات الفرعية داخل المسار الرئيسي
$subFolders = Get-ChildItem -Path $baseFolderPath -Directory

foreach ($subFolder in $subFolders) {
    # البحث عن جميع الملفات داخل المجلد الفرعي
    $files = Get-ChildItem -Path $subFolder.FullName -File

    foreach ($file in $files) {
        # البحث عن الاختصار في بداية اسم الملف
        $filePrefix = $file.Name.Substring(0, 2)

        if ($folderMapping.ContainsKey($filePrefix)) {
            # مسار المجلد المناسب
            $targetFolder = Join-Path -Path $subFolder.FullName -ChildPath $folderMapping[$filePrefix]

            # إذا كان المجلد موجودًا، يتم نقل الملف
            if (Test-Path -Path $targetFolder) {
                $destinationPath = Join-Path -Path $targetFolder -ChildPath $file.Name
                Move-Item -Path $file.FullName -Destination $destinationPath
                Write-Output "Moved file $($file.Name) to folder $($folderMapping[$filePrefix]) in $($subFolder.Name)."
            } else {
                Write-Output "Folder $($folderMapping[$filePrefix]) is missing in $($subFolder.Name)."
            }
        } else {
            # مجلد "Others" داخل المجلد الفرعي
            $othersFolderPath = Join-Path -Path $subFolder.FullName -ChildPath "Others"

            # إنشاء مجلد "Others" إذا لم يكن موجودًا
            if (!(Test-Path -Path $othersFolderPath)) {
                New-Item -ItemType Directory -Path $othersFolderPath | Out-Null
            }

            # نقل الملف إلى مجلد "Others"
            $destinationPath = Join-Path -Path $othersFolderPath -ChildPath $file.Name
            Move-Item -Path $file.FullName -Destination $destinationPath
            Write-Output "Moved file $($file.Name) to folder Others in $($subFolder.Name)."
        }
    }
}
