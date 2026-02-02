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
::Path to Workshop mods folder
set M=D:\SteamLibrary\steamapps\common\DayZ\!Workshop\

::Build mod list line by line
set modList="-mod=
set modList=%modList%%M%@CF;
set modList=%modList%%M%@Dabs Framework;
set modList=%modList%%M%@VPPAdminTools;
set modList=%modList%%M%@SFP;
set modList=%modList%%M%@SFP_anim_system;
set modList=%modList%%M%@SFP NPC's for Dayz Expansion;
set modList=%modList%%M%@DayZ-Expansion-Bundle;
set modList=%modList%%M%@DayZ-Expansion-Licensed;
::set modList=%modList%%M%@DayZ-Expansion-Animations;
set modList=%modList%%M%@STALKER NewHorizon ChernobylZone;
set modList=%modList%%M%@STALKER NewHorizon Objects (Legacy);
set modList=%modList%%M%@Winter Livonia;
set modList=%modList%%M%@Winter Chernarus V2;
set modList=%modList%%M%@Winter NH Chernobyl V2 (Re_uploading);
set modList=%modList%%M%@SURFLAY_STALKER_NH;
set modList=%modList%%M%@DayZ Editor Loader;
set modList=%modList%%M%@AWBochka;
set modList=%modList%%M%@TrashCan_SZ&P;
set modList=%modList%%M%@ViewInventoryAnimation;
set modList=%modList%%M%@Underground Bases;
set modList=%modList%%M%@Zens Sleeping Mod;
set modList=%modList%%M%@OMD_Radio;
set modList=%modList%%M%@XZone STALKER Mutants;
set modList=%modList%%M%@DayZ-Raven;
set modList=%modList%%M%@PSY_Emission;
set modList=%modList%%M%@Radiation;
set modList=%modList%%M%@PVE_System;
set modList=%modList%%M%@Code Lock;
set modList=%modList%%M%@XZone Artifacts;
::set modList=%modList%%M%@CargoSorting;
set modList=%modList%%M%@CJ187-MoreMoney;
::set modList=%modList%%M%@AI Bandits;
set modList=%modList%%M%@SpawnerBubaku;
set modList=%modList%%M%@S.T.A.L.K.E.R. Shrony(Tayniki) (Stash(Cache));
::modList=%modList%%M%@SPK(Stalker Pashka Kostum);
set modList=%modList%%M%@Stalker Anomaly & Detectors Free V2;
set modList=%modList%%M%@Forever_Burning_Campfire;
set modList=%modList%%M%@Search For Loot Improved;
set modList=%modList%%M%@STALKER Equipment;
set modList=%modList%"

::Build server mod list
set servermodList="-servermod=
set servermodList=%servermodList%@PSY_Server;
::set servermodList=%servermodList%@CacheSpawner_SERVER;
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
