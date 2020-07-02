$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'imagemanager'
  softwareName  = 'StorageCraft ImageManager*'
  fileType      = 'exe'
  url           = 'https://downloads.storagecraft.com/SP_Files/ImageManager_Setup_7.6.2.exe'
  silentArgs    = '/quiet IACCEPT=STORAGECRAFT.EULA Language=en-US Reboot=No'
  checksum      = 'D5715F4BA129938BD5EC1623104F7CFD7E8251E9E96E29F187F8F67FD0BE34D8'
  checksumType  = 'SHA256'
  unzipLocation = $toolsDir
}

Install-ChocolateyPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$env:USERPROFILE\Desktop\ImageManager.lnk" -TargetPath "C:\Program Files (x86)\StorageCraft\ImageManager\ImageManager.Client.exe"
