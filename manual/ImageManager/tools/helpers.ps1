function Remove-DesktopIcons {
 
    param (
        [parameter(Mandatory = $true)][ValidateNotNullOrEmpty()]$Name,
        [parameter(Mandatory = $false)]$Desktop
    )
 
    if(!$Desktop)  {
       $Desktop = 'All'
    }
 
    if ($Desktop -eq 'All') {
        foreach ($User in Get-ChildItem -Path "C:\Users") {
            Remove-FileItem -Path "C:\users\$($User)\desktop\$($Name).lnk"
        }
        Remove-FileItem -Path "C:\Users\default\desktop\$($Name).lnk"
        Remove-FileItem -Path "C:\Users\Public\Desktop\$($Name).lnk"
    } elseif ($Desktop -eq 'Public') {
        Remove-FileItem -Path "C:\Users\Public\Desktop\$($Name).lnk"
    } elseif ($Desktop -eq 'Default') {
        Remove-FileItem -Path "C:\Users\Default\desktop\$($Name).lnk"
    }
}

function Remove-FileItem {
 
    param (
        [parameter(Mandatory = $true)][ValidateNotNullOrEmpty()]$Path
    )
 
    try {
        Remove-Item `
            -Path $Path `
            -Recurse
        Write-Output `
            -InputObject "Remove $($Path)"
    }
    catch {
        Write-Output `
            -InputObject "Failed remove $($Path)"
    }
}