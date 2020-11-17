
;; AutoIt V3 Script to Automate setting up Prescan for XPan film negatives.
;;
;; CONFIGURATION
;; Scan Base Selection, values: "4", "8", "16"
$BaseLevel = "16"
$WidthPx = 5530
$UnitWidth = 5736
$CroppingRight = 5529

;; Should we automatically open the "Scan" window after pre-scanning?
$OpenScanOnRun = True

;; Setup Default Scan Options
$UseScratchRemoval = True
$UsePremiumColorPath = False

;; How many strips to scan, Available options: "Single", "4", "5", "6"
$NumberOfStrips = "Single"

;; ------------------ End of Configuration ------------------------
;; SCRIPT BEGINS
$TitleTLX = "TLXClientDemo"
$TitlePrescan = "Pre-Scan Framing Adjust"
$TitleScan = "Scan Settings"
$PrescanOption = "35mm " + $BaseLevel + " Base"
$IdTopLevelScanButton = 1000

;; Prescan Ids
$IdWidth = 1084
$IdUnitWidth = 1085
$IdCroppingRight = 1088
$IdResetButton = 3
$IdOkButton = 1

;; Scan Settings Ids
$IdScanButton = 1

;; Select tlx client window
WinActivate($TitleTLX)

;; Select prescan 35mm 16base
WinMenuSelectItem($TitleTLX, "", "Pre-Scan", $PrescanOption)

;; Click reset
ControlClick($TitlePrescan, "", $IdResetButton);

;; Set width
ControlSetText($TitlePrescan, "", $IdWidth, $WidthPx)

;; Set UnitWidth
ControlSetText($TitlePrescan, "", $IdUnitWidth, $UnitWidth)

;; Set Right Cropping
ControlSetText($TitlePrescan, "", $IdCroppingRight, $CroppingRight)

;; Click Ok
ControlClick($TitlePrescan, "", $IdOkButton);

;; Optionally click scan
If $OpenScanOnRun Then
   ;; Click scan
   ControlClick($TitleTlx, "", $IdTopLevelScanButton);

   ;; Select base level
   If $BaseLevel == "16" Then
	  $IdBaseLevel = 1020
   ElseIf $BaseLevel == "8" Then
	  $IdBaseLevel = 1019
   Else
	  $IdBaseLevel = 1018
   EndIf
   ControlClick($TitleScan, "", $IdBaseLevel)

   ;; Select Number of Strips
   If $NumberOfStrips == "Single" Then
	  $IdStrip = 1023
   ElseIf $NumberOfStrips == "4" Then
	  $IdStrip = 1024
   ElseIf $NumberOfStrips == "5" Then
	  $IdStrip = 1025
   Else
	  $IdStrip = 1026
   EndIf
   ControlClick($TitleScan, "", $IdStrip)

   ;; Enable ICE
   If $UseScratchRemoval Then
	  ControlClick($TitleScan, "", "Scratch Removal")
   EndIf

   ;; Enable Premium Color Path
   If $UsePremiumColorPath Then
	  ControlClick($TitleScan, "", "Premium Color Path")
   EndIf

   ;; Select "Scan" Button as focused
   ControlFocus($TitleScan, "", $IdScanButton)

EndIf
