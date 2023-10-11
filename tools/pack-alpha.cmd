@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [220X.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\alpha-Drivers-Release
REM mkdir ..\..\alpha-Drivers-Release

mkdir alpha-Drivers-Full
mkdir alpha-Drivers-Full\components
mkdir alpha-Drivers-Full\definitions

xcopy /cheriky ..\components\QC8150\Device\DEVICE.SOC_QC8150.ALPHA alpha-Drivers-Full\components\QC8150\Device\DEVICE.SOC_QC8150.ALPHA
xcopy /cheriky ..\components\QC8150\Device\DEVICE.SOC_QC8150.ALPHA_MINIMAL alpha-Drivers-Full\components\QC8150\Device\DEVICE.SOC_QC8150.ALPHA_MINIMAL

xcopy /cheriky ..\components\QC8150\Platform alpha-Drivers-Full\components\QC8150\Platform

xcopy /cheriky ..\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.ALPHA_DESKTOP alpha-Drivers-Full\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.ALPHA_DESKTOP

xcopy /cheriky ..\components\ANYSOC alpha-Drivers-Full\components\ANYSOC

xcopy /cheriky ..\definitions\Desktop alpha-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\alpha-Drivers-Release\alpha-Drivers-Full.zip alpha-Drivers-Full\*

REM move alpha-Drivers-Full\components\QC8150 ..\components\QC8150
REM move alpha-Drivers-Full\definitions\Desktop ..\definitions

rmdir /Q /S alpha-Drivers-Full