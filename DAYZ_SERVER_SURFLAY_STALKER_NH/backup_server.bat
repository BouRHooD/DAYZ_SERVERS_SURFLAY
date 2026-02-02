@echo off
:: ========================================
:: DayZ Server Backup Script
:: ========================================
:: This script creates a backup of essential server files and folders
:: including mpmissions, keys, profile, serverDZ.cfg, serverStart.bat
:: and all folders containing @ or SERVER in their names

setlocal enabledelayedexpansion

:: Set backup directory path (fixed location)
set BACKUP_DIR=C:\Users\b0urh\OneDrive\Desktop\DAYZ_SERVERS_SURFLAY\DAYZ_SERVER_SURFLAY_STALKER_NH

echo.
echo ========================================
echo DayZ Server Backup Script
echo ========================================
echo Creating backup in: %BACKUP_DIR%
echo.

:: Create main backup directory
if not exist "%BACKUP_DIR%" (
    mkdir "%BACKUP_DIR%"
    echo [OK] Created backup directory: %BACKUP_DIR%
) else (
    echo [INFO] Backup directory already exists: %BACKUP_DIR%
)

:: Copy mpmissions folder (only mission.NHChernobyl, excluding storage_1)
echo.
echo [1/4] Copying mpmissions\mission.NHChernobyl folder (excluding storage_1)...
if exist "mpmissions\mission.NHChernobyl" (
    xcopy "mpmissions\mission.NHChernobyl" "%BACKUP_DIR%\mpmissions\mission.NHChernobyl\" /E /I /H /Y /Q /EXCLUDE:exclude_storage.txt
    echo [OK] mpmissions\mission.NHChernobyl copied successfully (storage_1 excluded)
) else (
    echo [WARNING] mpmissions\mission.NHChernobyl folder not found
)

:: Copy keys folder
echo.
echo [2/4] Copying keys folder...
if exist "keys" (
    xcopy "keys" "%BACKUP_DIR%\keys\" /E /I /H /Y /Q
    echo [OK] keys copied successfully
) else (
    echo [WARNING] keys folder not found
)

:: Copy profile folder
echo.
echo [3/4] Copying profile folder...
if exist "profile" (
    xcopy "profile" "%BACKUP_DIR%\profile\" /E /I /H /Y /Q
    echo [OK] profile copied successfully
) else (
    echo [WARNING] profile folder not found
)

:: Copy serverDZ.cfg file
echo.
echo [4/4] Copying configuration files...
if exist "serverDZ.cfg" (
    copy "serverDZ.cfg" "%BACKUP_DIR%\" /Y > nul
    echo [OK] serverDZ.cfg copied successfully
) else (
    echo [WARNING] serverDZ.cfg not found
)

:: Copy serverStart.bat file
if exist "serverStart.bat" (
    copy "serverStart.bat" "%BACKUP_DIR%\" /Y > nul
    echo [OK] serverStart.bat copied successfully
) else (
    echo [WARNING] serverStart.bat not found
)

:: Copy all folders containing @ in their name
echo.
echo ========================================
echo Copying folders with @ in name...
echo ========================================
set COUNT_AT=0
for /d %%D in (@*) do (
    echo Copying: %%D
    xcopy "%%D" "%BACKUP_DIR%\%%D\" /E /I /H /Y /Q
    set /a COUNT_AT+=1
    echo [OK] %%D copied successfully
)
echo Total @ folders copied: %COUNT_AT%

:: Summary
echo.
echo ========================================
echo Backup Complete!
echo ========================================
echo Backup location: %CD%\%BACKUP_DIR%
echo.
echo Backed up items:
echo - mpmissions\mission.NHChernobyl folder (excluding storage_1)
echo - keys folder
echo - profile folder
echo - serverDZ.cfg
echo - serverStart.bat
echo - %COUNT_AT% folders with @ in name
echo ========================================
echo.

pause
