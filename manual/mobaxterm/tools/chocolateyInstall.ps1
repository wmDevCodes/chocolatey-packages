$ErrorActionPreference = 'Stop';
 
$packageName  = 'mobaxterm'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://download.mobatek.net/1112019010310554/MobaXterm_Installer_v11.1.zip'
$checkSum     = '1E8898AB7A11A5AA9D8DA713E551E2805E53CF8FA7E33A169AF37FB32CE4221E'
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
  file          = Join-Path $toolsDir 'MobaXterm_installer_11.1.msi'
  file64        = Join-Path $toolsDir 'MobaXterm_installer_11.1.msi'
 
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}
 
Install-ChocolateyInstallPackage @packageArgs