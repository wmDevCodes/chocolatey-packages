$url = $url64 = 'https://s3.amazonaws.com/SQLyog_Community/SQLyog+13.1.6/SQLyog-13.1.6-0.x64Community.exe'
$checksum = '0766FF7479E33A2B0EA546FB4D830BC311CD1C320B7B7621FD18CB40D33204B2'
$checksumType = 'SHA256'

$packageArgs = @{
  packageName    = 'sqlyog'
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  checksum       = $checksum
  checksumType   = $checksumType
  checksum64     = $checksum
  checksumType64 = $checksumType
  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
