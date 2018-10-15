@Echo off
CLS

Echo Installing Files...
Echo   + WINASPI.DLL
copy WinNT\winaspi.dll %windir%\system > nul
Echo   + WOWPOST.EXE
copy WinNT\wowpost.exe %windir%\system > nul
Echo   + WNASPI32.DLL
copy WinNT\wnaspi32.dll %windir%\system32 > nul
Echo   + ASPI32.SYS
copy WinNT\aspi32.sys %windir%\system32\drivers > nul
Echo.
Echo Add Registry Settings...
%windir%\regedit.exe /s WinNT\winnt.reg
Echo Done!
Echo.
Echo Adaptec ASPI 4.60 (1021) Installed.
Echo Reboot your PC to make the changes active.

pause
exit
