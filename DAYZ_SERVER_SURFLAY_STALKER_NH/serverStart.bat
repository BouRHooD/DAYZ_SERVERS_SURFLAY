@echo off
:start
::Server name [!EDIT THIS!]
set serverName=SURFLAY STALKER NH
::Server files location
set serverDirectory="D:\DayZServer_SURFLAY_STALKER_NH"
::Server Port [DEFAULT is 2302]
set serverPort=2302
::Server config [DEFAULT is serverDZ.cfg - hostname= in serverDZ.cfg is what shows in the steam server browser. !EDIT AS NEEDED!.]
set serverConfig=serverDZ.cfg
::Server profile location. logfiles are written here and mods are configured here [DEFAULT]
set serverProfile=profile
::Logical CPU cores to use (Equal or less than available)
set serverCPU=4

::modlist should be of the form "-mod=@mod1;@mod2;@mod3;" Don't forget the surrounding quotes or mods with spaces in their names won't work
::Build mod list line by line
set modList="-mod=
set modList=%modList%@CF;
set modList=%modList%@Dabs Framework;
set modList=%modList%@VPPAdminTools;
set modList=%modList%@SFP;
set modList=%modList%@SFP_anim_system;
set modList=%modList%@SFP NPC's for Dayz Expansion;
set modList=%modList%@DayZ-Expansion-Bundle;
set modList=%modList%@DayZ-Expansion-Licensed;
set modList=%modList%@DayZ-Expansion-Animations;
set modList=%modList%@STALKER NewHorizon ChernobylZone;
set modList=%modList%@STALKER NewHorizon Objects;
set modList=%modList%@Winter Livonia;
set modList=%modList%@Winter Chernarus V2;
set modList=%modList%@Winter NH Chernobyl V2 (Re_uploading);
set modList=%modList%@SURFLAY_STALKER_NH;
set modList=%modList%@DayZ Editor Loader;
set modList=%modList%@AWBochka;
set modList=%modList%@TrashCan_SZ&P;
set modList=%modList%@ViewInventoryAnimation;
set modList=%modList%@Underground Bases;
set modList=%modList%@Zens Sleeping Mod;
set modList=%modList%@OMD_Radio;
::set modList=%modList%@Stalker Light and Effects;
set modList=%modList%@XZone STALKER Mutants;
set modList=%modList%@DayZ-Raven;
set modList=%modList%@PSY_Emission;
set modList=%modList%@Radiation;
set modList=%modList%@PVE_System;
set modList=%modList%@Code Lock;
set modList=%modList%@XZone Artifacts;
::set modList=%modList%@CargoSorting;
set modList=%modList%@CJ187-MoreMoney;
::set modList=%modList%@AI Bandits;
set modList=%modList%@SpawnerBubaku;
::set modList=%modList%@STALKER NPC(static);
::modList=%modList%@SPK(Stalker Pashka Kostum);
set modList=%modList%@Stalker Anomaly & Detectors Free V2;
set modList=%modList%@Forever_Burning_Campfire
set modList=%modList%"

::Build server mod list
set servermodList="-servermod=
set servermodList=%servermodList%@PSY_Server;
set servermodList=%servermodList%@PVE_System_Server;
set servermodList=%servermodList%@Radiation_servermod;
set servermodList=%servermodList%@SURFLAY_STALKER_NH_SERVER;
set servermodList=%servermodList%@Stalker Anomaly & Detectors Free V2_SERVER;
set servermodList=%servermodList%"

::Print mod lists to console
echo.
echo ========================================
echo LOADED MODS:
echo ========================================
echo %modList%
echo.
echo ========================================
echo SERVER MODS:
echo ========================================
echo %servermodList%
echo ========================================
echo.

::Sets title for terminal (DONT edit)
title %serverName% batch
::DayZServer location (DONT edit)
cd /D "%serverDirectory%"
:: This makes the profile directory if it doesn't already exist
if not exist "%serverProfile%" ( 
mkdir %serverProfile% > nul
) 
echo (%time%) %serverName% started.

::Launch parameters (edit end: -config=|-port=|-profiles=|-doLogs|-adminLog|-netLog|-freezeCheck|-filePatching|-BEpath=|-cpuCount=)
start "DayZ Server" /min DayZServer_x64.exe -config=%serverConfig% -port=%serverPort% -profiles=%serverProfile% -BEpath=battleye %modList% %servermodList% -cpuCount=%serverCPU% -dologs -adminlog -netlog -freezecheck

::Time in seconds before kill server process (14400 = 4 hours)
timeout 14400
taskkill /im DayZServer_x64.exe /F
::Time in seconds to wait before..
timeout 10
::Go back to the top and repeat the whole cycle again
goto start
