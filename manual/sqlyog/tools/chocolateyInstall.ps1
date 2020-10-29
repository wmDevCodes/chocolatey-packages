$url = $url64 = 'https://s3.amazonaws.com/SQLyog_Community/SQLyog+13.1.7/SQLyog-13.1.7-0.x64Community.exe'
$checksum = 'F6F5697E71A31DBC2201D623F59047CF7B79B8E537404A94A9C5608EBB159E5D'
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
