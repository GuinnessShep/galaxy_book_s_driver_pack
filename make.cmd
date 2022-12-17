curl.exe --output "C:\Windows\7z2201-arm64.exe" --url https://www.7-zip.org/a/7z2201-arm64.exe

C:\Windows\7z1900-x64.exe /S

curl.exe --output "C:\Windows\SGBG5G_VZW_RecoveryWin10.iso" --url https://ia904703.us.archive.org/4/items/sgbg-5-g-vzw-recovery-win-10/SGBG5G_VZW_RecoveryWin10.iso

unzip C:\Windows\SGBG5G_VZW_RecoveryWin10.iso

Dism /Get-ImageInfo/iSGBG5G_VZW_RecoveryWin10.isomagefile:"C:\Windows\SGBG5G_VZW_RecoveryWin10\sources\install.wim"

md C:\mount\install
md C:\mount\boot
md C:\mount\winrewinre

Dism /Mount-Image /ImageFile:"C:\Windows\SGBG5G_VZW_RecoveryWin10\sources\install.wim" /Index:1 /MountDir:"C:\mount\install"
Dism /Mount-Image /ImageFile:"C:\Windows\SGBG5G_VZW_RecoveryWin10\sources\boot.wim" /Index:2 /MountDir:"C:\mount\boot"
Dism /Mount-Image /ImageFile:"C:\mount\install\windows\system32\recovery\winre.wim" /Index:1 /MountDir:"C:\mount\winre"

Add-WindowsDriver -Path "C:\mount\install" -Driver "C:\drivers" -Recurse
Add-WindowsDriver -Path "C:\mount\boot" -Driver "C:\drivers" -Recurse
Add-WindowsDriver -Path "C:\mount\winre" -Driver "C:\drivers" -Recurse

Dism /Unmount-Image /MountDir:C:\mount\winre /Commit
Dism /Unmount-Image /MountDir:C:\mount\boot /Commit
Dism /Unmount-Image /MountDir:C:\mount\install /Commit

