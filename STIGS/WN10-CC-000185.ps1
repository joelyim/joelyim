<#
.SYNOPSIS
    This PowerShell script ensures that the default autorun behavior is configured to prevent autorun commands.

.NOTES
    Author          : Joel Yim
    LinkedIn        :  www.linkedin.com/in/joelyim1
    GitHub          : https://github.com/joelyim 
    Date Created    : 2025-05-11
    Last Modified   : 2025-05-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000185 

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

Write-Host "Applying STIG-compliant settings for AutoRun (WN10-CC-000185)..." -ForegroundColor Yellow

# --- Group Policy-enforced location ---
$gpoPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"
New-Item -Path $gpoPath -Force | Out-Null

Set-ItemProperty -Path $gpoPath -Name "NoAutorun" -Type DWord -Value 1
Set-ItemProperty -Path $gpoPath -Name "AutorunDisabled" -Type DWord -Value 255
Write-Host "Configured: $gpoPath (NoAutorun = 1, AutorunDisabled = 255)"

# --- Manual policy location (CurrentVersion path, often checked by Tenable) ---
$manualPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
New-Item -Path $manualPath -Force | Out-Null

Set-ItemProperty -Path $manualPath -Name "NoAutorun" -Type DWord -Value 1
Set-ItemProperty -Path $manualPath -Name "AutorunDisabled" -Type DWord -Value 255
Write-Host "Configured: $manualPath (NoAutorun = 1, AutorunDisabled = 255)"

Write-Host "STIG settings applied. Run 'gpupdate /force' and reboot if required." -ForegroundColor Green
