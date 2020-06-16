$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$language = (Get-Culture).Name

switch ($language) {
   "pl-PL"  {$packageArgs['silentArgs'] += " Language=en-AU"; break}
   "cz-CZ"   {$packageArgs['silentArgs'] += " Language=cz-CZ"; break}
   "de-DE" {$packageArgs['silentArgs'] += " Language=de-DE"; break}
   "en-US"  {$packageArgs['silentArgs'] += " Language=en-US"; break}
   "en-AU" {$packageArgs['silentArgs'] += " Language=en-AU"; break}
   "es-ES" {$packageArgs['silentArgs'] += " Language=es-ES"; break}
   "fr-FR" {$packageArgs['silentArgs'] += " Language=fr-FR"; break}
   "it-IT" {$packageArgs['silentArgs'] += " Language=it-IT"; break}
   "ko-KR" {$packageArgs['silentArgs'] += " Language=ko-KR"; break}
   "ja-JP" {$packageArgs['silentArgs'] += " Language=en-AU"; break}
   "pt-PT" {$packageArgs['silentArgs'] += " Language=pt-PT"; break}
   "pt-BR" {$packageArgs['silentArgs'] += " Language=pt-BR"; break}
   "tr-TR" {$packageArgs['silentArgs'] += " Language=tr-TR"; break}
   "zh-CN" {$packageArgs['silentArgs'] += " Language=zh-CN"; break}
   "zh-TW" {$packageArgs['silentArgs'] += " Language=zh-TW"; break}
   default {$packageArgs['silentArgs'] += " Language=en-US"; break}
}

$packageArgs = @{
  packageName    = 'imagemanager'
  softwareName   = 'StorageCraft ImageManager*'
  fileType       = 'exe'
  url            = 'https://downloads.storagecraft.com/SP_Files/ImageManager_Setup_7.6.0.exe'
  silentArgs     = '/quiet IACCEPT=STORAGECRAFT.EULA Reboot=No'
  checksum       = 'F6819F19C0F0A384B5CB1E4433A7D214B29645DA599D9B5BAFC6B980795BB079'
  checksumType   = 'SHA256'
  unzipLocation  = $toolsDir
}

Install-ChocolateyPackage @packageArgs

Install-ChocolateyShortcut -ShortcutFilePath "$env:USERPROFILE\Desktop\ImageManager.lnk" -TargetPath "C:\Program Files (x86)\StorageCraft\ImageManager\ImageManager.Client.exe"
