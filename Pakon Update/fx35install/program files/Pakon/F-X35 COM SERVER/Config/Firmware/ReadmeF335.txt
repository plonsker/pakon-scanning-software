
************************************************************
MOTOR BOARD FIRMWARE
************************************************************
------------------------------------------------------------
MDxxyy.HEX 
------------------------------------------------------------
xx	hardware version comment
00	Initial Release

yy	firmware version comment
04	Initial Release
05      Raised Limit on Motor Speed (June 2006)



************************************************************
LED BOARD FIRMWARE
************************************************************
------------------------------------------------------------
LQxxyy.HEX 
------------------------------------------------------------
xx	hardware version comment
01	Initial Release

yy	firmware version comment
08	Initial Release
09      Internal Use Only
0A      Fixed Blower Slow Error and Green Tap 1 calibration


************************************************************
DX BOARD FIRMWARE
************************************************************
------------------------------------------------------------
DYxxyy.HEX 
------------------------------------------------------------
xx	hardware version comment
00	Initial Release

yy	firmware version comment
01	Initial Release
02	Compensates/tolerates cross-talk between the data
	and clock channels for more robust dx reading
************************************************************
ccD BOARD FIRMWARE
************************************************************
------------------------------------------------------------
CExxyy.HEX 
------------------------------------------------------------
xx	hardware version comment
00	Initial Release

yy	firmware version comment
04	Initial Release


************************************************************
APS BOARD FIRMWARE
************************************************************
------------------------------------------------------------
APXX0F.HEX - Initial Release
APXX13.HEX - Auto adjustment of perf sense threshold on 
             boards rev 04 and up.
           - Kinder, gentler retraction
APXX15.HEX - Improved CM1 reading in presence of CM2 data
APXX16.HEX - Perf sensor calibration altered to allow use
             of second source LEDs
------------------------------------------------------------
XX	comment
03	original mof board
04	03 reworked with digital potted perf sensor
05	new mof board with digital potted perf sensor