$url = $url64 = 'https://s3.amazonaws.com/SQLyog_Community/SQLyog+13.1.6/SQLyog-13.1.6-0.x64Community.exe'
$checksum = '42568B23642C3E00E11B6CEC958A4395B96538B04148B9855B4881392DCE66D1'
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
