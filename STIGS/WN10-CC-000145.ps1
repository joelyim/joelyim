<#
.SYNOPSIS: This PowerShell script ensures that Users must be prompted for a password on resume from sleep (on battery).


.NOTES
    Author: Joel Yim
    LinkedIn: https://www.linkedin.com/in/joelyim1
    GitHub: https://github.com/joelyim 
    Date Created: 2025-05-11
    Last Modified: 2025-05-11
    Version: 1.0
    CVEs: N/A
    Plugin IDs: N/A
    STIG-ID: WN10-AC-000005

.TESTED ON
    Date(s) Tested: 
    Tested By: 
    Systems Tested: 
    PowerShell Version: 

.USAGE
    Put any usage instructions here.

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" -Name "DCSettingIndex" -Value 1 -PropertyType DWord -Force

