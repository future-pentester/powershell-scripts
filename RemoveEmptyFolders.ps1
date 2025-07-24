$baseFolderPath = "C:\Users\MarwanAdel\Desktop\emlpoyee folder"  # المسار الأساسي

# دالة لحذف المجلدات الفارغة
function Remove-EmptyFolders {
    param (
        [string]$folderPath
    )
    # احصل على جميع المجلدات الفرعية
    $folders = Get-ChildItem -Path $folderPath -Directory -Recurse

    foreach ($folder in $folders) {
        # تحقق مما إذا كان المجلد فارغًا
        if ((Get-ChildItem -Path $folder.FullName -Recurse | Measure-Object).Count -eq 0) {
            # حذف المجلد الفارغ
            Remove-Item -Path $folder.FullName -Force -Recurse
            Write-Output "Deleted empty folder: $($folder.FullName)"
        }
    }
}

# استدعاء الدالة على المجلد الرئيسي
Remove-EmptyFolders -folderPath $baseFolderPath
