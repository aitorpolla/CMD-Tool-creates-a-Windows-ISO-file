@echo off
title ISO Detector - Spectre Module
color 0a

echo [+] ISO Detector Spectre v1.0
echo [+] Escaneando archivos ISO de Windows 7, 10 y 11...
echo.

set /p scan_path=Ruta a escanear (ej: C:\, D:\, etc): 

if not exist "%scan_path%" (
    echo [-] Ruta no valida.
    pause
    exit
)

echo [+] Buscando ISOs...

setlocal EnableDelayedExpansion
set found=0

for /r "%scan_path%" %%f in (*.iso) do (
    set "file=%%~nxf"
    echo !file! | findstr /i "windows7 win7 win_7" >nul && (
        echo [WIN7] %%f
        set found=1
    )
    echo !file! | findstr /i "windows10 win10 win_10" >nul && (
        echo [WIN10] %%f
        set found=1
    )
    echo !file! | findstr /i "windows11 win11 win_11" >nul && (
        echo [WIN11] %%f
        set found=1
    )
)

if !found! equ 0 (
    echo [-] No se encontraron ISOs conocidas.
) else (
    echo [+] Detección finalizada.
)

endlocal
pause
exit



