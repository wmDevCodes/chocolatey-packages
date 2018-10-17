$url = 'https://s3.amazonaws.com/SQLyog_Community/SQLyog+13.1.1/SQLyog-13.1.1-0.x86Community.exe'
$url64 = 'https://s3.amazonaws.com/SQLyog_Community/SQLyog+13.1.1/SQLyog-13.1.1-0.x64Community.exe'

$packageArgs = @{
  packageName    = 'sqlyog'
  fileType       = 'EXE'
  url            = $url
  url64bit       = $url64
  checksum       = 'B7A3A16FFE568C032B3BFED15E4F4DC8'
  checksumType   = 'md5'
  checksum64     = '3ED7CC08713122989ED6CED62FC2E38A'
  checksumType64 = 'md5'  
  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs
