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
::modlist should be of the form "-mod=@mod1;@mod2;@mod3;" Don't forget the surrounding quotes or mods with spaces in their names won't work // ;@STALKER NewHorizon Gameplay;@Stalker Anomaly & Detectors Free V2;@Stalker Anomaly & Detectors Free V2_SERVER;
::modlist=@XZone STALKER Mutants;@Ear-Plugs;@DayZ-Raven;@Zens Sleeping Mod;@SURFLAY_STALKER_NH;@PSY_Emission;@Radiation;@PVE_System;@Winter Livonia;@Winter Chernarus V2;@Winter NH Chernobyl V2 (Re_uploading);@OMD_Radio;@Underground Bases;@ViewInventoryAnimation;@Code Lockable Starter Shed;@Code Lock;@Mercedes-Benz AMG G63 W463;@XZone Artifacts;@Stalker Light and Effects;@SPK(Stalker Pashka Kostum);
::servermodList="-servermod=@SURFLAY_STALKER_NH_SERVER;@PSY_Server;@Radiation_servermod;@PVE_System_Server"
set modList="-mod=@CF;@Dabs Framework;@VPPAdminTools;@SFP;@SFP_anim_system;@SFP NPC's for Dayz Expansion;@DayZ-Expansion-Bundle;@DayZ-Expansion-Licensed;@DayZ-Expansion-Animations;@STALKER NewHorizon ChernobylZone;@STALKER NewHorizon Objects;@Winter Chernarus V2;@Winter NH Chernobyl V2 (Re_uploading);@Winter Livonia;@SURFLAY_STALKER_NH;@DayZ Editor Loader;@AWBochka;@TrashCan_SZ&P;@ViewInventoryAnimation;@Underground Bases;@Zens Sleeping Mod;@OMD_Radio;@Stalker Light and Effects;"
set servermodList="-servermod=@SURFLAY_STALKER_NH_SERVER;"
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
