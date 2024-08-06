$gg = "Green"
$GG = "Cyan"
$CC = "Cyan"
$RE = "Cyan"

$SISU = $env:USERNAME
$HOME_DIR = $env:USERPROFILE
$DOWNLOADS_DIR = Join-Path $HOME_DIR "Downloads"

function Set-ConsoleTitle {
    param([string]$Title)
    $host.ui.RawUI.WindowTitle = $Title
}

Set-ConsoleTitle "EzSS - v1.0.0"

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
|                  discord.inotatch.com                     |
|                                                           |
+-----------------------------------------------------------+
"@
    Clear-Host
    Write-Host $text -ForegroundColor $CC
    Start-Sleep -Milliseconds 4567
    Clear-Host
}

function Show-Menu {
    Show-Banner
    $listopt = @"

Seleciona una opcion para continuar:
 1 - UUID
 2 - Papelera de reciclaje
 3 - Elementos recientes
 4 - Prefetch
 5 - System Informer
 6 - Everything
 7 - Recuva
"@
    Write-Host $listopt
}

function Show-Menu2 {
    Clear-Host
    $listopt = @"

Seleciona una opcion para continuar:
 1 - UUID
 2 - Papelera de reciclaje
 3 - Elementos recientes
 4 - Prefetch
 5 - System Informer
 6 - Everything
 7 - Recuva
"@
    Write-Host $listopt
}

function Show-Prompt {
    Write-Host "> " -ForegroundColor $gg -NoNewline
}

try {
    Show-Menu
    while ($true) {
        Show-Prompt
        $ezss = Read-Host
        
        switch ($ezss) {
            "1" {
                Write-Host
                Get-WmiObject Win32_ComputerSystemProduct | Select-Object UUID | Format-Table -AutoSize
            }
            "2" {
                Get-ChildItem -Path "C:\`$Recycle.Bin" -Force | ForEach-Object {
                    "{0} {1} {2}" -f $_.Name, $_.LastWriteTime.ToString("yyyy-MM-dd"), $_.LastWriteTime.ToString("HH:mm:ss")
                }
            }
            "3" {
                Start-Process "explorer.exe" -ArgumentList "shell:recent"
            }
            "4" {
                Start-Process "explorer.exe" -ArgumentList "C:\Windows\Prefetch"
            }
            "5" {
                $url = "https://kumisystems.dl.sourceforge.net/project/systeminformer/systeminformer-3.0.7660-release-setup.exe?viasf=1"
                $ruta_descarga = Join-Path $DOWNLOADS_DIR "systeminformer-3.0.7660-release-setup.exe"
                Write-Host "Descargando el System Informer..." -ForegroundColor $CC
                Invoke-WebRequest -Uri $url -OutFile $ruta_descarga
                Write-Host "Se ha descargado el System Informer correctamente" -ForegroundColor $gg
            }
            "6" {
                $url = "https://www.voidtools.com/Everything-1.4.1.1026.x64-Setup.exe"
                $ruta_descarga = Join-Path $DOWNLOADS_DIR "Everything-1.4.1.1026.x64-Setup.exe"
                Write-Host "Descargando el Everything..." -ForegroundColor $CC
                Invoke-WebRequest -Uri $url -OutFile $ruta_descarga
                Write-Host "Se ha descargado el Everything correctamente" -ForegroundColor $gg
            }
            "7" {
                $url = "https://download.ccleaner.com/rcsetup154.exe"
                $ruta_descarga = Join-Path $DOWNLOADS_DIR "rcsetup154.exe"
                Write-Host "Descargando el Recuva..." -ForegroundColor $CC
                Invoke-WebRequest -Uri $url -OutFile $ruta_descarga
                Write-Host "Se ha descargado el Recuva correctamente" -ForegroundColor $gg
            }
            { $_ -in "cls", "clear" } {
                Show-Menu2
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