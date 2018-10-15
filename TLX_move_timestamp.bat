::This script clears the TLX Temp folder and moves the files with a datestamp, timestamp suffix and a random number to prevent from overwriting.
::To change the source/destination change the two variables below.
::11-2015 sawomedia

set firstfolder=c:\TEMP
set secondfolder=c:\SCANCLOUD


for /f "tokens=*" %%n in ('date /t') do set thisdate=%%n
set thisdate=%thisdate:/=-%
for /f "tokens=*" %%n in ('time /t') do set thistime=%%n
set thistime=%thistime::=-%
for /r "%firstfolder%" %%n in (*) do call :movefile "%%~nn" "%%~xn" "%%~dpn"
goto :EOF
:movefile
move "%~3\%~1%~2" "%secondfolder%\%~1_%thisdate%-%thistime%-%random%%~2"