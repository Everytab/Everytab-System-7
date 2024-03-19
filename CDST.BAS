OPTION BASE 1
CLS
COLOR 15, 1
CLS

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
REM 150 - Migration wizard
REM 160 - COpy done



20
CLS
PRINT "System/7 Setup"
PRINT "______________"
PRINT ""
PRINT ""
PRINT "  Welcome to System/7 Setup"
PRINT "  This version of setup is for - Build 345 (0.1)"
PRINT "  This program shall go through the following"
PRINT ""
PRINT "  1) Preparing your hard drive"
PRINT "  2) Copying System/7 Files"
PRINT ""
PRINT ""
PRINT "  - To continue, press Space
PRINT "  - To exit, press F3"
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
PRINT "System/7 Setup"
PRINT "______________"
PRINT ""
PRINT ""
PRINT "  Hard Drive Options"
PRINT "  Please perform one of the following actions :-"
PRINT "  "
PRINT "  - To select a drive letter, press Space"
PRINT "  - To partition a hard drive, press F1"
PRINT "  - To enter a command prompt, press F2"
PRINT "  - To format a newly made partition, press f"
PRINT "  - To exit System/7 setup, press F3"
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
GOTO 100
ELSEIF F$ = CHR$(70) THEN
GOTO 85
ELSEIF F$ = CHR$(102) THEN
GOTO 85
ELSE
BEEP
CLS
GOTO 100
END IF



110 CLS
PRINT "System/7 Setup"
PRINT "______________"
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
PRINT "System/7 Setup"
PRINT "______________"
PRINT ""
PRINT ""
PRINT "Format Options"
PRINT ""
PRINT "  Please perform one of the following actions :-"
PRINT "  "
PRINT "  - To format the target drive, press f"
PRINT "  - To not format the target drive, press F1"
PRINT "  - To exit System/7 setup, press F3"
DO
LET H$ = INKEY$
LOOP UNTIL H$ <> ""
IF H$ = CHR$(0) + CHR$(61) THEN
GOTO 50
ELSEIF H$ = CHR$(0) + CHR$(59) THEN
GOTO 140
ELSEIF H$ = CHR$(70) THEN
GOTO 130
ELSEIF H$ = CHR$(102) THEN
GOTO 130
ELSE
BEEP
CLS
GOTO 120
END IF



130 CLS
PRINT "System/7 Setup"
PRINT "______________"
PRINT ""
PRINT ""
PRINT "Format Options"
PRINT ""
PRINT "  WARNING : DRIVE " + DRV$ + ": WILL BE FORMATTED"
PRINT "  "
PRINT "  - To continue with the format, press c"
PRINT "  - To cancel, press esc"
PRINT "  - To exit System/7 setup, press F3"
DO
LET I$ = INKEY$
LOOP UNTIL I$ <> ""
IF I$ = CHR$(0) + CHR$(61) THEN
GOTO 50
ELSEIF I$ = CHR$(27) THEN
GOTO 120
ELSEIF I$ = CHR$(67) THEN
SHELL ("A:\FORMAT " + DRV$ + ": /U /S /X")
GOTO 140
ELSEIF I$ = CHR$(99) THEN
SHELL ("A:\FORMAT " + DRV$ + ": /U /S /X")
GOTO 140
ELSE
BEEP
CLS
GOTO 130
END IF


140 CLS
PRINT "System/7 Setup"
PRINT "______________"
PRINT ""
PRINT ""
PRINT "  Copy Files"
PRINT "  The files will be copied to " + DRV$ + ":"
PRINT ""
PRINT "  -To being copying the files, press c"
PRINT "  -To exit System/7 Setup, press F3"
PRINT ""
DO
LET H$ = INKEY$
LOOP UNTIL H$ <> ""
IF H$ = CHR$(0) + CHR$(61) THEN
GOTO 50
ELSEIF H$ = CHR$(67) THEN
CLS
SHELL ("R:")
SHELL ("PKUNZIP -e -o -d DOS.ZIP " + DRV$ + ":\")
SHELL ("PKUNZIP -e -o -d ES7.ZIP " + DRV$ + ":\")
SHELL ("COPY R:\REC\*.* " + DRV$ + ":\ES7\REC\")
SHELL ("COPY R:\ES7.zip " + DRV$ + ":\ES7\REC\")
SHELL ("COPY R:\PKUNZIP.EXE " + DRV$ + ":\ES7\REC\")
GOTO 150
ELSEIF H$ = CHR$(99) THEN
CLS
SHELL ("R:")
SHELL ("PKUNZIP -e -o -d DOS.ZIP " + DRV$ + ":\")
SHELL ("PKUNZIP -e -o -d ES7.ZIP " + DRV$ + ":\")
SHELL ("COPY R:\REC\*.* " + DRV$ + ":\ES7\REC\")
SHELL ("COPY R:\ES7.zip " + DRV$ + ":\ES7\REC\")
SHELL ("COPY R:\PKUNZIP.EXE " + DRV$ + ":\ES7\REC\")
GOTO 150
ELSE
BEEP
CLS
GOTO 140
END IF

150 CLS
PRINT "System/7 Setup"
PRINT "______________"
PRINT ""
PRINT "  System/7 Setup has copied the files"
PRINT ""
PRINT "  If you are installing over an older build, the user accounts will not be present"
PRINT "  Do you want to migrate the user files?"
PRINT ""
PRINT "  - To migrate the user files, press F1"
PRINT "  - To skip migrating the user files, press F2"
DO
LET L$ = INKEY$
LOOP UNTIL L$ <> ""
IF L$ = CHR$(0) + CHR$(59) THEN
PRINT "Checking files"
OPEN DRV$ + ":\ES7\CONFIG\0.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
    PRINT "The admin file was not found, skipping migration"
    SLEEP 3
    GOTO 160
END IF
CLOSE #1
PRINT "Starting Migration"
SHELL ("COPY " + DRV$ + :\ES7\CONFIG\0.SYS
ELSEIF L$ = CHR$(0) + CHR$(60) THEN

ELSE
BEEP
CLS
GOTO 150
END IF





160 CLS

PRINT "System/7 Setup"
PRINT "______________"
PRINT ""
PRINT ""
PRINT "  System/7 Setup has completed"
PRINT ""
PRINT "  The system has stopped, it is now safe to power off"
PRINT ""
PRINT "  - To reboot, press CTRL, ALT and DEL"
GOTO 795


50
CLS
PRINT "System/7 Setup"
PRINT "______________"
PRINT ""
PRINT "  System/7 installation has been cancelled"
PRINT "  The system has stopped, it is now safe to power off"
PRINT " "
PRINT "  - To reboot, press CTRL, ALT and DEL"
PRINT ""
795
GOTO 795

75
CLS
BEEP
PRINT "System/7 Setup"
PRINT "______________"
PRINT ""
PRINT "  The drive " + D1$ + ": is not formatted or doesn't exist"
PRINT ""
PRINT "  - To go back and partition the drive, press space"
PRINT "  - To format a newly made partition, press f"
PRINT "  - To exit, press F3"
PRINT ""
DO
LET G$ = INKEY$
LOOP UNTIL G$ <> ""
IF G$ = CHR$(32) THEN
GOTO 100
ELSEIF G$ = CHR$(0) + CHR$(61) THEN
GOTO 50
ELSEIF G$ = CHR$(70) THEN
GOTO 85
ELSEIF G$ = CHR$(102) THEN
GOTO 85
ELSE
BEEP
GOTO 75
END IF

85 CLS
PRINT "System/7 Setup"
PRINT "______________"
PRINT ""
PRINT ""
PRINT "Format Options"
PRINT ""
PRINT "  WARNING : DRIVE " + D1$ + ": WILL BE FORMATTED"
PRINT "  "
PRINT "  - To continue with the format, press c"
PRINT "  - To cancel, press esc"
PRINT "  - To exit System/7 setup, press F3"
DO
LET J$ = INKEY$
LOOP UNTIL J$ <> ""
IF J$ = CHR$(0) + CHR$(61) THEN
GOTO 50
ELSEIF J$ = CHR$(27) THEN
GOTO 100
ELSEIF J$ = CHR$(67) THEN
SHELL ("A:\FORMAT " + DRV$ + ": /U /S")
GOTO 110
ELSEIF J$ = CHR$(99) THEN
SHELL ("A:\FORMAT " + DRV$ + ": /U /S")
GOTO 110
ELSE
BEEP
CLS
GOTO 85
END IF

