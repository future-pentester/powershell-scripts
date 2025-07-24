$baseFolderPath = "C:\Users\MarwanAdel\Desktop\emlpoyee folder"  # المسار الرئيسي

# البحث عن جميع المجلدات الفرعية في المسار الأساسي
$subFolders = Get-ChildItem -Path $baseFolderPath -Directory -Recurse

foreach ($subFolder in $subFolders) {
    # البحث عن جميع الملفات داخل كل مجلد فرعي
    $files = Get-ChildItem -Path $subFolder.FullName -File

    foreach ($file in $files) {
        # التحقق من صيغة اسم الملف (يجب أن يبدأ بحرفين ويليه 6 أرقام بغض النظر عن الامتداد)
        if ($file.Name.Length -ge 8 -and $file.Name -match '^[A-Z]{2}\d{6}') {
            # استخراج السنة من آخر خانتين قبل الامتداد
            $year = "20" + $file.Name.Substring(6, 2)

            # مسار مجلد السنة داخل المجلد الفرعي الحالي
            $yearFolderPath = Join-Path -Path $subFolder.FullName -ChildPath $year

            # إنشاء المجلد إذا لم يكن موجوداً
            if (!(Test-Path -Path $yearFolderPath)) {
                New-Item -ItemType Directory -Path $yearFolderPath
            }

            # نقل الملف إلى مجلد السنة داخل المجلد الفرعي
            $destinationPath = Join-Path -Path $yearFolderPath -ChildPath $file.Name
            Move-Item -Path $file.FullName -Destination $destinationPath
            Write-Output "Moved file $($file.Name) to $year folder inside $($subFolder.Name)."
        } else {
            Write-Output "File $($file.Name) does not match the required format in folder $($subFolder.Name). Skipping."
        }
    }
}
