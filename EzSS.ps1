$gg = "Green"
$cc = "Cyan"
$rr = "Red"

$HOME_DIR = $env:USERPROFILE
$DOWNLOADS_DIR = Join-Path $HOME_DIR "Downloads"

function Set-ConsoleTitle {
    param([string]$Title)
    $host.ui.RawUI.WindowTitle = $Title
}

Set-ConsoleTitle "EzSS - v2.0.0"

function Clear-Host {
    [System.Console]::Clear()
}

function Show-Banner {
    $text = @"
+-----------------------------------------------------------+
|                                                           |
|                     ______     __________                 |
|                    / ____/___ / ___/ ___/                 |
|                   / __/ /_  / \__ \__ \                   |
|                  / /___  / /____/ /__/ /                  |
|                 /_____/ /___/____/____/                   |
|                                                           |
|-----------------------------------------------------------|
|                                                           |
|                    dsc.gg/BackGuards                      |
|                                                           |
|                   by BackGuards Studio                    |
|                                                           |
+-----------------------------------------------------------+
"@
    Write-Host $text -ForegroundColor $cc
}

function Show-Menu {
    $listopt = @"


+---------------------------+
|                           |
|    1 - UUID               |   
|    2 - Recycle Bin        |
|    3 - Recent elements    |
|    4 - Prefetch           |
|    5 - System Informer    |
|    6 - Everything         |
|    7 - Recuva             |
|                           |
|---------------------------|
|                           |
|  cls - Clear screen       |
|  clear - Clear screen     |
|  exit - Exits from EzSS   |
|                           |
+---------------------------+
"@
    Write-Host $listopt -ForegroundColor $cc
}

function Show-Menu2 {
    Clear-Host
    Show-Banner
    $listopt = @"


+---------------------------+
|                           |
|    1 - UUID               |   
|    2 - Recycle Bin        |
|    3 - Recent elements    |
|    4 - Prefetch           |
|    5 - System Informer    |
|    6 - Everything         |
|    7 - Recuva             |
|                           |
|---------------------------|
|                           |
|  cls - Clear screen       |
|  clear - Clear screen     |
|  exit - Exits from EzSS   |
|                           |
+---------------------------+
"@
    Write-Host $listopt -ForegroundColor $cc
}

function Show-Prompt {
    Write-Host "> " -ForegroundColor $gg -NoNewline
}

function Check-Process {
    param (
        [string]$processName,
        [string]$displayName
    )
    $process = Get-Process -Name $processName -ErrorAction SilentlyContinue
    return [PSCustomObject]@{
        Name = $displayName
        IsRunning = $null -ne $process
    }
}

$programs = @(
    @{ Name = "obs64"; DisplayName = "OBS Studio" },
    @{ Name = "GameBar"; DisplayName = "Xbox Game Bar" },
    @{ Name = "Streamlabs OBS"; DisplayName = "Streamlabs OBS" },
    @{ Name = "NVIDIA Share"; DisplayName = "NVIDIA GeForce Experience" },
    @{ Name = "NVIDIA app"; DisplayName = "NVIDIA App" },
    @{ Name = "Bandicam"; DisplayName = "Bandicam" },
    @{ Name = "Medal"; DisplayName = "Medal" }
)

$activePrograms = @()
foreach ($program in $programs) {
    $result = Check-Process -processName $program.Name -displayName $program.DisplayName
    if ($result.IsRunning) {
        $activePrograms += $result.Name
    }
}

try {
    Show-Banner
    if ($activePrograms.Count -gt 0) {
        Set-ConsoleTitle "EzSS - v2.0.0 | Error: $($activePrograms -join ', ') | Closing on 60 seconds..."
        Write-Host "There are a recording software running on the system: $($activePrograms -join ', ')" -ForegroundColor $rr
        Get-WmiObject Win32_ComputerSystemProduct | Select-Object UUID | Format-Table -AutoSize
        [System.Media.SystemSounds]::Asterisk.Play()
        Start-Sleep -Milliseconds 750
        [System.Media.SystemSounds]::Asterisk.Play()
        Start-Sleep -Milliseconds 500
        [System.Media.SystemSounds]::Asterisk.Play()
        Start-Sleep -Milliseconds 500
        [System.Media.SystemSounds]::Asterisk.Play()
        Start-Sleep -Milliseconds 500
        [System.Media.SystemSounds]::Asterisk.Play()
        Write-Host "Closing on 60 seconds..." -ForegroundColor $rr
        Start-Sleep -Milliseconds 60000
        exit
    }
    Show-Menu
    while ($true) {
        Show-Prompt
        $ezss = Read-Host
        
        switch ($ezss) {
            "1" {
                Write-Host
                Write-Host "UUID from the computer:" -ForegroundColor $cc
                Get-WmiObject Win32_ComputerSystemProduct | Select-Object UUID | Format-Table -AutoSize
            }

            "2" {
                Write-Host "Reclycle Bin modification date:" -ForegroundColor $cc
                Get-ChildItem -Path "C:\`$Recycle.Bin" -Force | ForEach-Object {
                    "{0} {1} {2}" -f $_.Name, $_.LastWriteTime.ToString("yyyy-MM-dd"), $_.LastWriteTime.ToString("HH:mm:ss")
                }
            }

            "3" {
                Write-Host "Opening the recent elements folder:" -ForegroundColor $cc
                Start-Process "explorer.exe" -ArgumentList "shell:recent"
            }

            "4" {
                Write-Host "Opening the prefetch folder:" -ForegroundColor $cc
                Start-Process "explorer.exe" -ArgumentList "C:\Windows\Prefetch"
            }

            "5" {
                $url = "https://altushost-swe.dl.sourceforge.net/project/systeminformer/systeminformer-3.1.24298-release-setup.exe?viasf=1"
                $ruta_descarga = Join-Path $DOWNLOADS_DIR "systeminformer-3.0.7660-release-setup.exe"
                Write-Host "Downloading System Informer..." -ForegroundColor $cc
                Invoke-WebRequest -Uri $url -OutFile $ruta_descarga
                Write-Host "System Informer has been downloaded sucessfully" -ForegroundColor $gg
            }

            "6" {
                $url = "https://www.voidtools.com/Everything-1.4.1.1026.x86-Setup.exe"
                $ruta_descarga = Join-Path $DOWNLOADS_DIR "Everything-1.4.1.1026.x64-Setup.exe"
                Write-Host "Downloading Everything..." -ForegroundColor $cc
                Invoke-WebRequest -Uri $url -OutFile $ruta_descarga
                Write-Host "Everything has been downloaded sucessfully" -ForegroundColor $gg
            }

            "7" {
                $url = "https://download.ccleaner.com/rcsetup154.exe"
                $ruta_descarga = Join-Path $DOWNLOADS_DIR "rcsetup154.exe"
                Write-Host "Downloading Recuva..." -ForegroundColor $cc
                Invoke-WebRequest -Uri $url -OutFile $ruta_descarga
                Write-Host "Recuva has been downloaded sucessfully" -ForegroundColor $gg
            }

            { $_ -in "cls", "clear" } {
                Show-Menu2
            }
            "exit" {
                Clear-Host
                exit
            }
        }
    }
}

catch {
    Write-Error $_.Exception.Message
}

finally {
    Clear-Host
}
