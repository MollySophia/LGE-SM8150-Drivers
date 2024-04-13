@echo off 
(NET FILE||(powershell -command Start-Process '%0' -Verb runAs -ArgumentList '%* '&EXIT /B))>NUL 2>&1 
pushd "%~dp0" && cd %~dp0 
.\tools\DriverUpdater\%PROCESSOR_ARCHITECTURE%\DriverUpdater.exe -r . -d .\definitions\Desktop\ARM64\Internal\mh2lm.xml 
pause 

