$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. $toolsDir\helpers.ps1

$packageArgs = @{
  packageName   = 'imagemanager'
  softwareName  = 'StorageCraft ImageManager'
  fileType      = 'exe'
  unzipLocation = $toolsDir
}

$uninstalled = $false

[array]$key = Get-UninstallRegistryKey -SoftwareName $packageArgs.softwareName

if ($key.QuietUninstallString -eq 1)
{
  $key | ForEach-Object { 
    $packageArgs['file'] = "$($_.UninstallString)"
    if ($packageArgs['fileType'] -eq 'EXE')
    {
      
      $packageArgs['silentArgs'] = "$($_.PSChildName) $($packageArgs['silentArgs'])"
      $packageArgs['file'] = ''
    }

    Uninstall-ChocolateyPackage @packageArgs
  }
}
elseif ($key.QuietUninstallString -eq 0)
{
  Write-Warning "$packageName has already been uninstalled by other means."
}
elseif ($key.QuietUninstallString -gt 1)
{
  Write-Warning "$($key.QuietUninstallString) matches found!"
  Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
  Write-Warning "Please alert package maintainer the following keys were matched:"
  $key | ForEach-Object {Write-Warning "- $($_.DisplayName)"}
}

Remove-DesktopIcons -Name "ImageManager"