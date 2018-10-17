$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'imagemanager'
  softwareName   = 'StorageCraft ImageManager*'
  fileType       = 'exe'
  url            = 'https://downloads.storagecraft.com/SP_Files/ImageManager_Setup_7.5.6.exe'
  silentArgs     = '/quiet IACCEPT=STORAGECRAFT.EULA Language=en-AU Reboot=No'
  checksum       = '650C91CD274F4E1E8BBA1B6191405711'
  checksumType   = 'md5'
  unzipLocation  = $toolsDir
}

Install-ChocolateyPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$env:USERPROFILE\Desktop\ImageManager.lnk" -TargetPath "C:\Program Files (x86)\StorageCraft\ImageManager\ImageManager.Client.exe"
