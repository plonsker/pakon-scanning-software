@Echo off
CLS
Echo   - WINASPI.DLL
IF EXIST %windir%\system\winaspi.dll (
  del %windir%\system\winaspi.dll > nul
) ELSE (
  Echo     [ file does not exist ]
)
Echo   - WOWPOST.EXE
IF EXIST %windir%\system\wowpost.exe (
  del %windir%\system\wowpost.exe > nul
) ELSE (
  Echo     [ file does not exist ]
)
Echo   - WNASPI32.DLL
IF EXIST %windir%\system32\wnaspi32.dll (
  del %windir%\system32\wnaspi32.dll > nul
) ELSE (
Echo     [ file does not exist ]
)
Echo   - ASPI32.SYS
IF EXIST %windir%\system32\drivers\aspi32.sys (
  del %windir%\system32\drivers\aspi32.sys > nul
) ELSE (
  Echo     [ file does not exist ]
)
Echo Done!
Echo.
Echo ASPI Layer has been removed.
Echo Reboot your PC to make the changes active.

pause

exit
