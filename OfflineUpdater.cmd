@echo off 
( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0""", "", "runas", 1 > "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
for /f %%a in ('wmic logicaldisk where "VolumeName='WINMH2LM'" get deviceid^|find ":"')do set "DrivePath=%%a" 
if not [%DrivePath%]==[] goto start 
if [%DrivePath%]==[] echo Automatic WINMH2LM detection failed! Enter drive Letter manually. 
:sdisk 
set /P DrivePath=Enter the drive letter of WINMH2LM ^(should be X:^): 
if [%DrivePath%]==[] goto sdisk 
if not "%DrivePath:~1,1%"==":" set DrivePath=%DrivePath%:
:start 
if not exist "%DrivePath%\Windows\" echo Error! Selected Disk "%DrivePath%" doesn't have any Windows installation. & pause & exit 
%~dp0\tools\DriverUpdater\%PROCESSOR_ARCHITECTURE%\DriverUpdater.exe -r %~sdp0 -d %~sdp0definitions\Desktop\ARM64\Internal\mh2lm.xml -p %DrivePath%
