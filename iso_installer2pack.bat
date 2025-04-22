::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDpdWAuQAE+1BaAR7ebv/NaOsUIiXewsbI7X1rGcH/MD70bwZ5Nj02Jf+A==
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title ISO Installer - Spectre Edition
color 0a

echo [+] ISO Installer Spectre v2.0
echo [+] No F12s. No clicks. Solo instalacion directa.
echo.

echo Selecciona una ISO para descargar e instalar:
echo [1] Windows 7 (64 bits)
echo [2] Windows 10 (22H2)
echo [3] Windows 11 (22H2)
echo.

set /p choice=Elige una opcion (1-3): 

if "%choice%"=="1" (
    set iso_url=https://archive.org/download/windows-7-64-bits_202403/Windows%207%2064Bits.iso
    set iso_name=Windows7.iso
)
if "%choice%"=="2" (
    set iso_url=https://archive.org/download/en-us_windows_10_consumer_editions_version_22h2_updated_feb_2023_x64_dvd_c29e4bb3/en-us_windows_10_consumer_editions_version_22h2_updated_feb_2023_x64_dvd_c29e4bb3.iso
    set iso_name=Windows10.iso
)
if "%choice%"=="3" (
    set iso_url=https://archive.org/download/windows11_20220930/Win11_22H2_English_x64v1.iso
    set iso_name=Windows11.iso
)

echo.
set /p install_path=Escribe la ruta donde guardar la ISO (ej: C:\ISOs): 

if not exist "%install_path%" (
    echo [+] La ruta no existe. Creando directorio...
    mkdir "%install_path%"
)

echo.
echo [+] Descargando %iso_name% en %install_path%...
curl -L -o "%install_path%\%iso_name%" %iso_url%
echo.
echo [+] Descarga completada.

echo [+] Montando ISO desde %install_path%\%iso_name%...
PowerShell Mount-DiskImage -ImagePath "%install_path%\%iso_name%"
echo [+] Montaje completo. Revisa tu explorador para iniciar instalación.

pause
exit

