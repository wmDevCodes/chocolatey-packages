$ErrorActionPreference = 'Stop';
 
$packageName = 'mobaxterm'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.mobatek.net/1092018073012523/MobaXterm_Installer_v10.9.zip'
$url64      = 'https://download.mobatek.net/1092018073012523/MobaXterm_Installer_v10.9.zip'
 
$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  url           = $url
  url64bit      = $url64

  checksum      = '66214550140D01FA5995AF52EFA4230C729E598981D4B5D9F99BF563B01B7C97'
  checksumType  = 'sha256'
  checksum64    = '66214550140D01FA5995AF52EFA4230C729E598981D4B5D9F99BF563B01B7C97'
  checksumType64= 'sha256'
}
 
Install-ChocolateyZipPackage @packageArgs
 
$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  file          = Join-Path $toolsDir 'MobaXterm_installer_10.9.msi'
  file64        = Join-Path $toolsDir 'MobaXterm_installer_10.9.msi'
 
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}
 
Install-ChocolateyInstallPackage @packageArgs