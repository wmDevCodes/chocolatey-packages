$url = 'https://s3.amazonaws.com/SQLyog_Community/SQLyog+13.1.2/SQLyog-13.1.2-0.x86Community.exe'
$url64 = 'https://s3.amazonaws.com/SQLyog_Community/SQLyog+13.1.2/SQLyog-13.1.2-0.x64Community.exe'

$packageArgs = @{
  packageName    = 'sqlyog'
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  checksum       = '61493E6BC9F7E38EBC86056D39FC216BBB98020FECFA0C5DF7E659C3211FA26C'
  checksumType   = 'SHA256'
  checksum64     = 'A7EBD8CB9B26FE5304A6A833787E9CEEF973C507CA94550CB7D8D67D14D287E6'
  checksumType64 = 'SHA256'  
  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
