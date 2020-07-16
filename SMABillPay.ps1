<#
Purpose: Collec the current day's BillPay groups from a file and save it as an OpCon Property. 
NOTE: The needs to run on the OpCon server and use SAM's MSGIN path. 
Syntax: SMABillPay.ps1 -Filepath "C:\ProgramData\OpConxps\Billpay.txt" -PropertyName "SI.BillPay.[[$SCHEDULE DATE]].[[$SCHEDULE NAME]]" -MsginPath "C:\ProgramData\OpConxps\SAM\MSGIN" -MsginUser ocadm -MsginPass [[EventPass]]
Written By: David Cornelius
Tested: 2020
ExitCode: 20 = Unable to reach the File Path
ExitCode: 30 = Unable to reach the MSGIN Path on the OpCon Server
#>

param (
    [parameter(mandatory=$true)]
    [string]$FilePath,
    [parameter(mandatory=$true)]
    [string]$PropertyName,
    [parameter(mandatory=$true)]
    [string]$MsginPath,
    [parameter(mandatory=$true)]
    [string]$MsginUser,
    [parameter(mandatory=$true)]
    [string]$MsginPass
)
 
$ErrorActionPreference = “Stop"

if (!(Test-Path $FilePath))
    {
         $rc = 20
         Write-output [$(Get-Date)]:"Unable to access $FilePath -RC =$rc"
         [Environment]::Exit($rc)
  
    }

if (!(Test-Path $MsginPath))
    {
         $rc = 30
         Write-output [$(Get-Date)]:"Unable to access $MsginPath -RC =$rc"
         [Environment]::Exit($rc)
    }

$Date =  Get-Date -Format dd
$TokenValue = ((Select-String -Path "$FilePath" -Pattern "${Date}\:").Line -split ":")[1]
#The below line will write the event text to the PowerShell  and output it to the OpCon SAM MSGIN path
Write-Output "<EVENT>
   <TYPE>PROPERTY</TYPE>
   <ACTION>ADD</ACTION>
   <PROPNAME>$PropertyName</PROPNAME>
   <PROPVALUE>$TokenValue</PROPVALUE>
   <USERNAME>$MsginUser</USERNAME>
   <USERPWD>$MsginPass</USERPWD>
</EVENT>" | out-File -encoding ascii "$MsginPath\Event$((get-date).ToString("hhmmss")).txt"
