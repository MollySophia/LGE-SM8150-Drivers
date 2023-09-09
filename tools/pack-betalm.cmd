@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [220X.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\betalm-Drivers-Release
REM mkdir ..\..\betalm-Drivers-Release

mkdir betalm-Drivers-Full
mkdir betalm-Drivers-Full\components
mkdir betalm-Drivers-Full\definitions

xcopy /cheriky ..\components\QC8150\Device\DEVICE.SOC_QC8150.BETALM betalm-Drivers-Full\components\QC8150\Device\DEVICE.SOC_QC8150.BETALM
xcopy /cheriky ..\components\QC8150\Device\DEVICE.SOC_QC8150.BETALM_MINIMAL betalm-Drivers-Full\components\QC8150\Device\DEVICE.SOC_QC8150.BETALM_MINIMAL

xcopy /cheriky ..\components\QC8150\Platform betalm-Drivers-Full\components\QC8150\Platform

xcopy /cheriky ..\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.BETALM_DESKTOP betalm-Drivers-Full\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.BETALM_DESKTOP

xcopy /cheriky ..\components\ANYSOC betalm-Drivers-Full\components\ANYSOC

xcopy /cheriky ..\definitions\Desktop betalm-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\betalm-Drivers-Release\betalm-Drivers-Full.zip betalm-Drivers-Full\*

REM move betalm-Drivers-Full\components\QC8150 ..\components\QC8150
REM move betalm-Drivers-Full\definitions\Desktop ..\definitions

rmdir /Q /S betalm-Drivers-Full