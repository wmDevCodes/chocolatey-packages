$ErrorActionPreference = 'Stop';
 
$packageName  = 'mobaxterm'
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://download.mobatek.net/2062020111930940/MobaXterm_Installer_v20.6.zip'
$checkSum     = '304782B10F3E9B4173B879968280DEFAF61F5032C4F1DAE42BD1B386185F90F1'
$checkSumType = 'SHA256'
$MsiInstaller = 'MobaXterm_installer_20.6.msi'
 
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