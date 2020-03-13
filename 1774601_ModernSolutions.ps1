$processName="notepad"
KillThatProcess $processName

Bamboozle $path

function KillThatProcess ([string]$processName) 
{

    $processes=(Get-Process $processName)
    

    $input=(Read-Host ("There are "+(@(Get-Process $processName).count)+" processes with the name "+$ProcessName+", proceed? Y/N")).ToUpper() 

    if( $input -eq "Y")
    {
        $processes|kill
        Write-Host -BackgroundColor Green -ForegroundColor Black "The processes have been stopped"
    }
    else
    {
        
        Write-Host -BackgroundColor Red -ForegroundColor Yellow "Operation Cancelled"
    }
    
}

<#$path= Get-Location#>
function Bamboozle ([string] $path="default")
{
    [char]$letter=((65..90) | Get-Random -count 1)

    Write-Host -BackgroundColor black -ForegroundColor Red "Time to have some fun! All of your files containing letter: $letter will be destroyed. MUAHAHAHA"

    $list=ls *$letter* -File
    
    $list|Remove-Item -WhatIf
    
}


