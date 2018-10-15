@echo off
rem ********************************************************
rem
rem This script will convert and files in the temp folder,
rem generate a contact sheet, and move them to the out folder.
rem
rem - Format filenames "R<roll>F<frame>", ex: R23F07.jpg
rem - Converts Pakon raw files to 16bit tif
rem - Removes color cast from B&W scans
rem - Generates a contact sheet
rem - Moves to output folder
rem
rem Requires ImageMagick (www.imagemagick.org)
rem
rem Anders Granlund, 2016-05 
rem ********************************************************


:: Change these paths to fit your needs

set srcfolder=c:\TEMP
set outfolder=c:\PakonOut


rem ********************************************************
rem
rem Setup...
rem
rem ********************************************************
echo.
echo This script will convert all files in the temp folder,
echo generate a contact sheet, and move them to the out folder.
echo.
magick.exe -version > nul
if not %ERRORLEVEL% == 0 (
echo.
echo ERROR: Please install ImageMagick^! (www.imagemagick.org^)
echo.
pause
goto :EOF
)
echo Pakon temp folder: %srcfolder%
echo Pakon out folder:  %outfolder%
echo.
if not exist "%srcfolder%" (
echo ----------------------------------
echo ERROR: Invalid temp folder^!
echo ----------------------------------
echo.
pause
goto :EOF
)
if not exist "%outfolder%" (
mkdir %outfolder%
)
if not exist "%outfolder%" (
echo ----------------------------------
echo ERROR: Invalid out folder^!
echo ----------------------------------
echo.
pause
goto :EOF
)
set /p rollid="Enter roll ID:"
set /p info="Enter Roll description:"
set /p type="Enter Film type (1=C41, 2=B&W, 3=E6 (jpeg), 4=E6 (16bit tif):"
echo.


rem -------------------------------------------
rem B&W raw settings
rem -------------------------------------------
if "%type%"=="2" (
  set rawoptions= -depth 16 -gamma 2.2 -normalize
  set rawformat=tif

rem -------------------------------------------
rem E6 raw settings for JPEG output
rem -------------------------------------------
) else if "%type%" == "3" (
  set rawoptions= -gamma 2.2 -normalize
  set rawformat=jpg

rem -------------------------------------------
rem E6 raw settings for TIF output
rem -------------------------------------------
) else if "%type%" == "4" (
  set rawoptions= -depth 16 -gamma 2.2 -normalize
  set rawformat=tif

rem -------------------------------------------
rem C41 raw settings
rem -------------------------------------------
) else (
  set rawoptions= -depth 16 -gamma 2.2 -auto-level
  set rawformat=tif
)


cd /d %srcfolder%
for /r "%srcfolder%" %%f in (DX_ERROR.*) do (
del /q %%f
)



rem ********************************************************
rem
echo Fixing filenames...
rem
rem ********************************************************
for /r "%srcfolder%" %%f in (*) do (
call :FixFilename %%~dpf %%~nf %%~xf
)

rem ********************************************************
rem
echo Converting RAW files...
rem
rem ********************************************************
for /r "%srcfolder%" %%f in (*.raw) do (
echo.   Converting raw: %%~nf
rename %%f %%~nf.rgb
magick convert -endian LSB -size 3000x2000+16 -depth 16 -interlace plane %%~nf.rgb -compress none -interlace none %rawoptions% %%~nf.%rawformat%
del /q %%~nf.rgb
)


if "%type%" == "2" (
rem ********************************************************
rem
echo Removing B^&W color cast...
rem
rem ********************************************************
for /r "%srcfolder%" %%f in (*) do (
echo.   Desaturating: %%~nf
magick mogrify -modulate 100,0 %%f
)
)


rem ********************************************************
rem
echo Generating contact sheet...
rem
rem ********************************************************
magick montage -label "%%f" -title "R%rollid% - %info%" -font Arial -tile 6x7 -fill "gray" -pointsize 18 -background "#00000000" -bordercolor "#5F5F5F5F" -borderwidth 2 -geometry 300x200+20+10 *.* _R%rollid%.jpg


rem ********************************************************
rem
echo Moving to output folder...
rem
rem ********************************************************
for /r "%srcfolder%" %%f in (*) do (
echo.   Moving: %%~nxf
move /y %%f %outfolder%\%%~nxf
)

del /q %srcfolder%\*.*
echo Done!
goto :EOF



rem ********************************************************
rem
rem Make filename in format R<roll>F<frame>.
rem Example: R23F07
rem
rem ********************************************************
:FixFilename
set padded=0%2%
set lastchar=%padded:~-1%

if "%lastchar%"=="A" (
set number=%padded:~-3,2%
) else (
set number=%padded:~-2%
)

set name=R%rollid%F%number%
echo.   %1%2%3 : %name%%3
rename %2%3 %name%%3

