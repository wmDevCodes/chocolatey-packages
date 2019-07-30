$url = 'https://s3.amazonaws.com/SQLyog_Community/SQLyog+13.1.5/SQLyog-13.1.5-0.x86Community.exe'
$url64 = 'https://s3.amazonaws.com/SQLyog_Community/SQLyog+13.1.5/SQLyog-13.1.5-0.x64Community.exe'

$packageArgs = @{
  packageName    = 'sqlyog'
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  checksum       = 'CCF0FE526E7B4931E8A76B7110E12DD8F705BD6AA666C03380B5B17329403101'
  checksumType   = 'SHA256'
  checksum64     = 'E3071A8D0F24D8C2A45000D0F6A53912CFC06EE752CB4F623C1B4D54A27903A0'
  checksumType64 = 'SHA256'  
  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
