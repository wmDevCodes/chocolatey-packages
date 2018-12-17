$ErrorActionPreference = 'Stop';
 
$packageName  = 'mobaxterm'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://download.mobatek.net/1102018093083521/MobaXterm_Installer_v11.0.zip'
$checkSum     = '789711D76EA0CF3D39B9A4B98FD66DD5A83B6E6309682B80C2B0FA57AF24E0C0'
$checkSumType = 'SHA256'
 
$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url            = $url
  url64bit       = $url

  checksum       = $checkSum
  checksumType   = $checkSumType
  checksum64     = $checkSum
  checksumType64 = $checkSumType
}
 
Install-ChocolateyZipPackage @packageArgs
 
$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  file          = Join-Path $toolsDir 'MobaXterm_installer_11.0.msi'
  file64        = Join-Path $toolsDir 'MobaXterm_installer_11.0.msi'
 
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}
 
Install-ChocolateyInstallPackage @packageArgs