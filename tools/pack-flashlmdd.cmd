@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [220X.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\flashlmdd-Drivers-Release
REM mkdir ..\..\flashlmdd-Drivers-Release

mkdir flashlmdd-Drivers-Full
mkdir flashlmdd-Drivers-Full\components
mkdir flashlmdd-Drivers-Full\definitions

xcopy /cheriky ..\components\QC8150\Device\DEVICE.SOC_QC8150.FLASHLMDD flashlmdd-Drivers-Full\components\QC8150\Device\DEVICE.SOC_QC8150.FLASHLMDD
xcopy /cheriky ..\components\QC8150\Device\DEVICE.SOC_QC8150.FLASHLMDD_MINIMAL flashlmdd-Drivers-Full\components\QC8150\Device\DEVICE.SOC_QC8150.FLASHLMDD_MINIMAL

xcopy /cheriky ..\components\QC8150\Platform flashlmdd-Drivers-Full\components\QC8150\Platform

xcopy /cheriky ..\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.FLASHLMDD_DESKTOP flashlmdd-Drivers-Full\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.FLASHLMDD_DESKTOP

xcopy /cheriky ..\components\ANYSOC flashlmdd-Drivers-Full\components\ANYSOC

xcopy /cheriky ..\definitions\Desktop flashlmdd-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\flashlmdd-Drivers-Release\flashlmdd-Drivers-Full.zip flashlmdd-Drivers-Full\*

REM move flashlmdd-Drivers-Full\components\QC8150 ..\components\QC8150
REM move flashlmdd-Drivers-Full\definitions\Desktop ..\definitions

rmdir /Q /S flashlmdd-Drivers-Full