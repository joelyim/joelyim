<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Joel Yim
    LinkedIn        :  www.linkedin.com/in/joelyim1
    GitHub          : https://github.com/joelyim 
    Date Created    : 2025-05-09
    Last Modified   : 2025-05-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000500.ps1 
#>

# YOUR CODE GOES HERE

# Set the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$name = "MaxSize"
$value = 0x00008000

# Ensure the registry path exists
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the DWORD value
New-ItemProperty -Path $registryPath -Name $name -Value $value -PropertyType DWord -Force
