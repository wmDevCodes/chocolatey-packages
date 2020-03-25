$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = 'imagemanager'
  softwareName   = 'StorageCraft ImageManager*'
  fileType       = 'exe'
  url            = 'https://downloads.storagecraft.com/SP_Files/ImageManager_Setup_7.6.0.exe'
  silentArgs     = '/quiet IACCEPT=STORAGECRAFT.EULA Language=en-AU Reboot=No'
  checksum       = 'F6819F19C0F0A384B5CB1E4433A7D214B29645DA599D9B5BAFC6B980795BB079'
  checksumType   = 'SHA256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$env:USERPROFILE\Desktop\ImageManager.lnk" -TargetPath "C:\Program Files (x86)\StorageCraft\ImageManager\ImageManager.Client.exe"
