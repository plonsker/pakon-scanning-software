@echo off
rem *****************************************************************
rem
rem This script allows you to set the falloff compensation in TLX.
rem Default value is 0.8
rem
rem 02-2016, Anders Granlund 
rem *****************************************************************


set pakondir=c:\Program Files\Pakon




cd %pakondir%\F-X35 COM SERVER\anselinstalldir\dataPathItems\falloff
set /p answer="Falloff compensation (default 0.8): "

if "%answer%"=="" (
set value=0.8
) else (
set value=%answer%
)

set filename=falloff-srcType-SUC-NEGATIVE_35-NO.dpi
attrib -R %filename%

echo #  min and max values should be in TRUE stops > %filename%
echo. >> %filename%
echo scale = 1250 >> %filename%
echo max = 4095 >> %filename%
echo stops = %value% >> %filename%
echo exposure_min = -0.5 >> %filename%
echo exposure_max =  7.0 >> %filename%

