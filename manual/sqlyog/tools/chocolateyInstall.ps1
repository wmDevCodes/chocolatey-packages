$url = 'https://s3.amazonaws.com/SQLyog_Community/SQLyog+13.1.3/SQLyog-13.1.3-0.x86Community.exe'
$url64 = 'https://s3.amazonaws.com/SQLyog_Community/SQLyog+13.1.3/SQLyog-13.1.3-0.x64Community.exe'

$packageArgs = @{
  packageName    = 'sqlyog'
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  checksum       = 'C8E9DC57DCB14CD10675251FA6C133A5CEE930449A6949A6011C40A29EF860FF'
  checksumType   = 'SHA256'
  checksum64     = '0429873305561121A85A6E0B55B202DF9AD3CCABD0D52168C09DF98D63E0799F'
  checksumType64 = 'SHA256'  
  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
