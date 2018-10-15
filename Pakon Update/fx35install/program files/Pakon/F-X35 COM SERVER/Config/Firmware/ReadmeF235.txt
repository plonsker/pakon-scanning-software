

************************************************************
MOTOR CONTROL BOARD FIRMWARE
************************************************************
------------------------------------------------------------
MCxx1B.HEX (decimal version 26)
	Reduces Film Jamming on F-235 Plus and F235Cs.
	Not compapable with TLA versions less than 29.8.
MCxx1A.HEX (decimal version 26)
------------------------------------------------------------
xx	comment
06	F235 other than those for 07
07	F235 sn 134-176 and 178-179
08	F235+ with PIC16 motor board
09*	F235 with PIC18 motor board (NOTE: repair only; this 
	configuration can only happen if an F235 is repaired 
	by replacing a PIC16 motor board 
	with a PIC18 motor board)
0A*	F235+ with PIC18 motor board

* the PIC18 motor board will never be relased for the F235/+




************************************************************
DX BOARD FIRMWARE
************************************************************
------------------------------------------------------------
DXyy0E.HEX (decimal version 14)
	improved aps perf sensing
DXyy0F.Hex (decimal version 15)
	internal release not used (pic 18 support)
DXyy10.HEX (decimal version 16)
	internal release not used (cross-talk alpha)
DXyy11.HEX (decimal version 17)
	Compensates/tolerates cross-talk between the data
	and clock channels for more robust dx reading
------------------------------------------------------------
yy	comment
02	board with PIC16
03*	board with PIC18

* the PIC18 dx board for the F-235 has not been released 
as of 7/05


************************************************************
LAMP BOARD FIRMWARE
************************************************************
------------------------------------------------------------
LPzz10.HEX
------------------------------------------------------------
zz	comment
01	no tachometer on cooling fan (two wires attached to 
	cooling fan on lamp board heat sink)
02	tachometer on cooling fan (three wires attached to 
	cooling fan on lamp board heat sink)


************************************************************
CCD BOARD FIRMWARE
************************************************************
------------------------------------------------------------
CD010F.HEX
------------------------------------------------------------
the one and only


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