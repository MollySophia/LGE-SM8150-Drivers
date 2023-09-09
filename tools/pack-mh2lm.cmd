@echo off


      SET HOUR=%time:~0,2%
      SET dtStamp9=%date:~-2%%date:~4,2%%date:~7,2%-0%time:~1,1%%time:~3,2%
      SET dtStamp24=%date:~-2%%date:~4,2%%date:~7,2%-%time:~0,2%%time:~3,2%

      if "%HOUR:~0,1%" == " " (SET dtStamp=%dtStamp9%) else (SET dtStamp=%dtStamp24%)


title [220X.%dtStamp%.prerelease] [Build preparation] [Packing Binaries]
REM rmdir /Q /S ..\..\mh2lm-Drivers-Release
REM mkdir ..\..\mh2lm-Drivers-Release

mkdir mh2lm-Drivers-Full
mkdir mh2lm-Drivers-Full\components
mkdir mh2lm-Drivers-Full\definitions

xcopy /cheriky ..\components\QC8150\Device\DEVICE.SOC_QC8150.MH2LM mh2lm-Drivers-Full\components\QC8150\Device\DEVICE.SOC_QC8150.MH2LM
xcopy /cheriky ..\components\QC8150\Device\DEVICE.SOC_QC8150.MH2LM_MINIMAL mh2lm-Drivers-Full\components\QC8150\Device\DEVICE.SOC_QC8150.MH2LM_MINIMAL

xcopy /cheriky ..\components\QC8150\Platform mh2lm-Drivers-Full\components\QC8150\Platform

xcopy /cheriky ..\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.MH2LM_DESKTOP mh2lm-Drivers-Full\components\QC8150\Graphics\GRAPHICS.SOC_QC8150.MH2LM_DESKTOP

xcopy /cheriky ..\components\ANYSOC mh2lm-Drivers-Full\components\ANYSOC

xcopy /cheriky ..\definitions\Desktop mh2lm-Drivers-Full\definitions\Desktop

"%ProgramFiles%\7-zip\7z.exe" a -tzip -r ..\..\mh2lm-Drivers-Release\mh2lm-Drivers-Full.zip mh2lm-Drivers-Full\*

REM move mh2lm-Drivers-Full\components\QC8150 ..\components\QC8150
REM move mh2lm-Drivers-Full\definitions\Desktop ..\definitions

rmdir /Q /S mh2lm-Drivers-Full