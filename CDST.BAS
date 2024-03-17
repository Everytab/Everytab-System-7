OPTION BASE 1
CLS
COLOR 15, 1
CLS
COLOR 15, 7
REM 20 - Introduction
REM 50 - Exit
REM 75 - Invalid Drive/Partition not found
REM 80 - Set DRV$
REM 85 - Format New Partition
REM 100 - Hard disk options
REM 102 - Start FDISK
REM 107 - Enter command prompt
REM 110 - Drive Selection
REM 120 - Format
REM 130 - Confirm Format
REM 140 - Begin copy
REM 150 - Copy done



20
PRINT "System/7 Setup"
COLOR 15, 1
PRINT "______________"
PRINT ""
PRINT ""
PRINT "  Welcome to System/7 Setup"
PRINT "  This version of setup is for - Build 340 (0.1)"
PRINT "  This program shall go through the following"
PRINT ""
PRINT "  1) Preparing your hard drive"
PRINT "  2) Copying System/7 Files"
PRINT ""
PRINT ""
COLOR 0, 7
PRINT "Continue - Space, F3 - Exit"
DO
LET E$ = INKEY$
LOOP UNTIL E$ <> ""
IF E$ = CHR$(32) THEN
GOTO 100
ELSEIF E$ = CHR$(0) + CHR$(61) THEN
GOTO 50
ELSE
BEEP
CLS
GOTO 20
END IF


100
CLS
COLOR 15, 7
PRINT "System/7 Setup"
COLOR 15, 1
PRINT "______________"
PRINT ""
PRINT ""
PRINT "  Hard Drive Options"
PRINT "  Please perform one of the following actions :-"
PRINT "  "
PRINT "  - To select a drive letter, press Space"
PRINT "  - To partition a hard drive, press F1"
PRINT "  - To enter a command prompt, press F2"
PRINT "  - To exit System/7 setup, press F3
PRINT ""
DO
LET F$ = INKEY$
LOOP UNTIL F$ <> ""
IF F$ = CHR$(32) THEN
GOTO 110
ELSEIF F$ = CHR$(0) + CHR$(61) THEN
GOTO 50
ELSEIF F$ = CHR$(0) + CHR$(60) THEN
CLS
SHELL ("A:\COMMAND.COM")
GOTO 100
ELSEIF F$ = CHR$(0) + CHR$(59) THEN
CLS
SHELL ("A:\FDISK.COM")
CLS
PRINT "If you have just made a partition, Press CTRL, ALT and DEL to restart the system"
PRINT "Press any key to continue"
DO
LOOP UNTIL INKEY$ <> ""
GOTO 100
ELSE
BEEP
CLS
GOTO 100
END IF



110 CLS
PRINT "System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "  Please enter the letter of the drive you wish to install to"
PRINT "  Do not add a semi-colon or slash"
PRINT ""
INPUT D$
LET D1$ = MID$(D$, 1, 1)
ON ERROR GOTO 75
OPEN D1$ + ":\TEST.DAT" FOR OUTPUT AS #1
    WRITE #1, 1
CLOSE #1
OPEN D1$ + ":\TEST.DAT" FOR BINARY AS #1
IF LOF(1) = 0 THEN
    GOTO 75
ELSE
    GOTO 80
END IF
CLOSE #1

80 LET DRV$ = D1$
   GOTO 120

120 CLS
PRINT "Everytab System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "Format Options"
PRINT ""
PRINT "  Please perform one of the following actions :-"
PRINT "  "
PRINT "  - To format the target drive, press f"
PRINT "  - To not format the target drive, press F1"
PRINT "  - To exit System/7 setup, press F3





PRINT "Everytab System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "Format Options"
PRINT ""
PRINT "  WARNING : DRIVE " + DRV$ + ": WILL BE FORMATTED"
PRINT "  "
PRINT "  - To continue with the format, press c"
PRINT "  - To cancel, press esc"
PRINT "  - To exit System/7 setup, press F3

SHELL ("A:\FORMAT " + DRV$ + ": /U /S")

146 CLS

PRINT "Everytab System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "Step 3 of Step 3"
PRINT "Copying Everytab System files"
PRINT ""
PRINT "All Files will be copied to the root of C:"
PRINT ""
PRINT ""
PRINT "Press any key to start copying files"
DO
LOOP UNTIL INKEY$ <> ""
SLEEP 2
ELSE
GOTO 1112
END IF
1112
SHELL ("D:")
CLS
PRINT "Everytab System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "Apollo Setup"
PRINT "Select the type of DOS install to be installed"
PRINT ""
PRINT ""
PRINT ""
PRINT ""
SHELL ("PKUNZIP -e -o -d DOS.ZIP" + DRV$ + ":\")
SHELL ("PKUNZIP -e -o -d ES7.ZIP" + DRV$ + ":\")
ON ERROR GOTO 11111
SLEEP 5
CLS
PRINT "Everytab System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "Setup has completed"
PRINT "All the files has been copied"
PRINT ""
PRINT "During the OOBE, you can restore backed up user data"
PRINT "Please eject all removable disks and restart the computer"
PRINT ""


50
PRINT "System/7 Setup"
PRINT "______________"
PRINT ""
PRINT "  System/7 installation has been cancelled"
PRINT "  The system has been stopped, it is now safe to power off"
PRINT " "
PRINT "  - To reboot, press CTRL, ALT and DEL"
PRINT "
795
GOTO 795

75 
CLS
BEEP
PRINT "System/7 Setup"
PRINT "______________"
PRINT ""
PRINT "  The drive entered was invalid"
PRINT ""
PRINT "  - To go back and partition the drive, press space"
PRINT "  - To format the newly made partition, press f"
PRINT "  - To exit, press F3"
PRINT ""
DO
LET G$ = INKEY$
LOOP UNTIL G$ <> ""
IF G$ = CHR$(32) THEN
GOTO 100
ELSEIF F$ = CHR$(0) + CHR$(61) THEN
GOTO 50
ELSE
BEEP
GOTO 75
END IF

