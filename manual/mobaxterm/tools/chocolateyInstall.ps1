$ErrorActionPreference = 'Stop';
 
$packageName  = 'mobaxterm'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://download.mobatek.net/2032020060430358/MobaXterm_Installer_v20.3.zip'
$checkSum     = 'A6D79BACE0FECB58D2CE4C8A26377F14F4C9B8BE02D48891B44CC2EDE693C7F2'
$checkSumType = 'SHA256'
$MsiInstaller = 'MobaXterm_installer_20.3.msi'
 
$packageArgsZip = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  url            = $url
  url64bit       = $url
  checksum       = $checkSum
  checksumType   = $checkSumType
  checksum64     = $checkSum
  checksumType64 = $checkSumType
}
 
Install-ChocolateyZipPackage @packageArgsZip
 
$packageArgsMsi = @{
  packageName   = $packageName
  fileType      = 'MSI'
  file          = Join-Path $toolsDir $MsiInstaller 
  file64        = Join-Path $toolsDir $MsiInstaller
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}
 
Install-ChocolateyInstallPackage @packageArgsMsi