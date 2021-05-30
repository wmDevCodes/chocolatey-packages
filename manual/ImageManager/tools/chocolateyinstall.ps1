$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'imagemanager'
  softwareName  = 'StorageCraft ImageManager*'
  fileType      = 'exe'
  url           = 'https://downloads.storagecraft.com/SP_Files/ImageManager_Setup_7.7.0.16.exe'
  silentArgs    = '/quiet IACCEPT=STORAGECRAFT.EULA Language=en-US Reboot=No'
  checksum      = '8FFE2EE352535597195A0483D4F37A86363CED13597E8DF3FE135A689FF5EF92'
  checksumType  = 'SHA256'
  unzipLocation = $toolsDir
}

Install-ChocolateyPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$env:USERPROFILE\Desktop\ImageManager.lnk" -TargetPath "C:\Program Files (x86)\StorageCraft\ImageManager\ImageManager.Client.exe"
