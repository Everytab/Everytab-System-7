OPTION BASE 1
DIM MenuItem(3) AS STRING
DIM ChooseItem AS INTEGER
DIM XMenuPosn AS INTEGER
DIM YMenuPosn AS INTEGER
CLS
COLOR 15, 1
CLS
PRINT "Everytab System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "Welcome to Everytab System/7 Setup"
PRINT "The Version on this disk is - April Release"
PRINT "This program shall go through the following"
PRINT ""
PRINT "1) Preparing your Hard Disk through the FDISK Utility (Standard Setup)"
PRINT "2) Formatting the Hard Disk and copying the base files (Standard Setup)"
PRINT "3) Copying Everytab System/7 Files"
PRINT ""
PRINT ""

PRINT "Press any key to continue"
DO
LOOP UNTIL INKEY$ <> ""
145 CLS
MenuItem$(1) = "Fresh Install - FDISK and format"
MenuItem$(2) = "Upgrade from MS-DOS or ES/7 September Release"
MenuItem$(3) = "Upgrade from FreeDOS based build"
PRINT "Everytab System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "Choose Fresh Setup if you have just partitioned the disk and restarted"
PRINT "DO NOT TRY UPGRADE SETUP IF YOU HAVE JUST MADE THE PARTITION"
PRINT "Use MS-DOS upgrades to upgrade older ES/7 (September Alpha and before)"
PRINT "For reinstalling after corruptions or for upgrading from the October Build, Use FreeDOS Upgrade (In testing)"

    ChooseItem = 1
XMenuPosn = 1
YMenuPosn = 10

GOSUB DrawMenu

'get cursor key movements and redraw menu
DO
	Cmmnd$ = INKEY$

	IF LEN(Cmmnd$) = 2 THEN Cmmnd$ = RIGHT$(Cmmnd$, 1)
      
	IF Cmmnd$ = "8" OR Cmmnd$ = CHR$(72) THEN GOSUB MoveUp
	IF Cmmnd$ = "2" OR Cmmnd$ = CHR$(80) THEN GOSUB MoveDown
	IF Cmmnd$ = "7" OR Cmmnd$ = CHR$(71) THEN ChooseItem = 1
	IF Cmmnd$ = "1" OR Cmmnd$ = CHR$(79) THEN ChooseItem = UBOUND(MenuItem)

	GOSUB DrawMenu
LOOP UNTIL Cmmnd$ = CHR$(13)

PRINT
COLOR 15, 1
PRINT "Item chosen ="; MenuItem(ChooseItem)
eeee$ = MenuItem(ChooseItem)
SLEEP 1
GOTO 1123

DrawMenu:
'Draw the menu
LOCATE YMenuPosn, XMenuPosn
FOR Count = 1 TO UBOUND(MenuItem$)
	IF Count = ChooseItem THEN COLOR 1, 7 ELSE COLOR 15, 1
	PRINT MenuItem$(Count)
	LOCATE CSRLIN, XMenuPosn
NEXT Count
RETURN

MoveUp:
IF ChooseItem = 1 THEN
	ChooseItem = UBOUND(MenuItem$)
ELSE
	ChooseItem = ChooseItem - 1
END IF
RETURN

MoveDown:
IF ChooseItem = UBOUND(MenuItem$) THEN
	ChooseItem = 1
ELSE
	ChooseItem = ChooseItem + 1
END IF
RETURN
1123
IF eeee$ = "Fresh Install - FDISK and format" THEN
GOTO 144
ELSEIF eeee$ = "Upgrade from MS-DOS or ES/7 September Release" THEN
GOTO 146
ELSEIF eeee$ = "Upgrade from FreeDOS based build" THEN
GOTO 146
ELSE
BEEP
GOTO 112
END IF

144 CLS
PRINT "Everytab System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "Step 1 of Step 3"
PRINT "Preparing your Hard Disk"
PRINT ""
PRINT "FDISK shall be loaded to make a partition"
PRINT "Remember to restart after making a partition"
PRINT "If a partition exists, exit FDISK while doing no changes"
PRINT ""
PRINT "Press any key to start FDISK"
DO
LOOP UNTIL INKEY$ <> ""
SHELL "FDISK"
CLS
PRINT "If you have just made a partition, Press Ctrl+Alt+Delete to restart the system"
PRINT "Else, Press any key to continue"
CLS
PRINT "Everytab System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "Step 2 of Step 3"
PRINT "Formatting and copying base files"
PRINT ""
PRINT "Please restart the computer after partitioning if not already done"
PRINT "WARNING : ALL DATA ON C: SHALL BE DESTROYED"
PRINT "Restart the computer to choose the upgrade option"
PRINT ""
PRINT "Press any key to FORMAT ALL DATA ON C:"
DO
LOOP UNTIL INKEY$ <> ""
SHELL "A:\FORMAT C: /U /S"

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
IF eeee = 1 THEN
PRINT "[MS-DOS] Deleting previous System files and saving old AUTOEXEC.BAT"
SHELL ("C:")
SHELL ("DEL C:\ESBACK\SYS.DAT")
SHELL ("RMDIR ESBACK")
SHELL ("MKDIR ESBACK")
SHELL ("COPY C:\SYS.DAT C:\ESBACK\SYS.DAT")
SHELL ("REN AUTOEXEC.BAT AUTOEXEC.OL")
SHELL ("DEL COMMAND.COM")
SHELL ("DEL CONTROLP.INI")
SHELL ("DEL CONFIG.SYS")
SHELL ("DEL MOUSE.COM")
SHELL ("DEL ESSM.EXE")
SHELL ("ATTRIB IO.SYS -H -S -R")
SHELL ("ATTRIB MSDOS.SYS -H -S -R")
SHELL ("DEL IO.SYS")
SHELL ("DEL MSDOS.SYS")
SHELL ("DEL SM.EXE")
SHELL ("DEL *.*")
SHELL ("A:")
SHELL ("CD FREEDOS")
SHELL ("CD BIN")
SHELL ("SYS C /BOOTONLY")
ON ERROR GOTO 11112
SLEEP 2
GOTO 1112
ELSEIF eeee = 2 THEN
PRINT "[FreeDOS] Saving old AUTOEXEC.BAT and FDAUTO.BAT"
SHELL ("C:")
SHELL ("DEL C:\ESBACK\SYS.DAT")
SHELL ("RMDIR ESBACK")
SHELL ("MKDIR ESBACK")
SHELL ("COPY C:\SYS.DAT C:\ESBACK\SYS.DAT")
SHELL ("REN AUTOEXEC.BAT AUTOEXEC.OL1")
SHELL ("REN FDAUTO.BAT FDAUTO.OL1")
SHELL ("DEL ESSM.EXE")
SLEEP 2
ELSE
GOTO 1112
END IF
1112
SHELL ("D:")
SHELL ("PKUNZIP -e -o -d APOLLO.ZIP C:\")
SHELL ("PKUNZIP -e -o -d ES7.ZIP C:\")
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
GOTO 50
ON ERROR GOTO 11114
11111
SLEEP 1.5
	    COLOR 15, 4
	    PLAY "A"
	    CLS
	    CLS
	    PRINT ""
	    PRINT ""
	    PRINT "The system detected an processing"
	    PRINT "error at process 'PKUNZIP'"
	    PRINT ""
	    PRINT "FAIL : 00000005"
	    PRINT "OS Revision - Setup"
	    PRINT ""
	    PRINT ""
	    PRINT "The system has halted. Record the FAIL code"
	    PRINT "of the error and contact an Everytab System/7 Developer"
	  PRINT "Please check the media's checksum to see if corruption present on disc"
PRINT "The files couldn't be copied"
	    SLEEP 5
	    CLS
	    SLEEP 1
SHELL "A:\freedos\bin\fdapm warmboot"
ON ERROR GOTO 11114
11112
SLEEP 1.5
	    COLOR 15, 4
	    PLAY "A"
	    CLS
	    CLS
	    PRINT ""
	    PRINT ""
	    PRINT "The system detected an processing"
	    PRINT "error at process 'SYS'"
	    PRINT ""
	    PRINT "FAIL : 00000006"
	    PRINT "OS Revision - Setup"
	    PRINT ""
	    PRINT ""
	    PRINT "The system has halted. Record the FAIL code"
	    PRINT "of the error and contact an Everytab System/7 Developer"
	  PRINT "Please check the media's checksum to see if corruption present on disc"
	  PRINT "The Bootloader couldn't be installed"
	    SLEEP 5
	    CLS
	    SLEEP 1
	  SHELL "A:\freedos\bin\fdapm warmboot"
ON ERROR GOTO 11114
11113
SLEEP 1.5
	    COLOR 15, 4
	    PLAY "A"
	    CLS
	    CLS
	    PRINT ""
	    PRINT ""
	    PRINT "The system detected an processing"
	    PRINT "error at process 'FDISK/FORMAT'"
	    PRINT ""
	    PRINT "FAIL : 00000007"
	    PRINT "OS Revision - Setup"
	    PRINT ""
	    PRINT ""
	    PRINT "The system has halted. Record the FAIL code"
	    PRINT "of the error and contact an Everytab System/7 Developer"
	  PRINT "Please check the media's checksum to see if corruption present on disc"
	  PRINT "The disk couldn't be partitioned/formatted"
	    SLEEP 5
	    CLS
	    SLEEP 1
	 PRINT "Press CTRL + ALT + DELETE to restart"
	    SLEEP 5
GOTO 50
	ON ERROR GOTO 11114
11114
SLEEP 1.5
	    COLOR 15, 4
	    PLAY "A"
	    CLS
	    CLS
	    PRINT ""
	    PRINT ""
	    PRINT "The system detected an processing"
	    PRINT "error at process 'FDAPM'"
	    PRINT ""
	    PRINT "FAIL : 00000008"
	    PRINT "OS Revision - Setup"
	    PRINT ""
	    PRINT ""
	    PRINT "The system has halted. Record the FAIL code"
	    PRINT "of the error and contact an Everytab System/7 Developer"
	  PRINT "Please check the media's checksum to see if corruption present on disc"
	  PRINT "Press CTRL + ALT + DELETE to restart"
	    SLEEP 5
	    CLS
	    SLEEP 1
111115
GOTO 111115
112 CLS
	    
	    SLEEP 1.5
	    COLOR 15, 4
	    PLAY "A"
	    CLS
	    CLS
	    PRINT ""
	    PRINT ""
	    PRINT "The system detected an processing"
	    PRINT "error at process 'MENU'"
	    PRINT ""
	    PRINT "FAIL : 00000002"
	    PRINT "OS Revision - SETUP"
	    PRINT ""
	    PRINT ""
	    PRINT "The system has halted. Record the FAIL code"
	    PRINT "of the error and contact an Everytab System/7 Developer"
	  PRINT "Please check the media's checksum to see if corruption present on disc"
	    SLEEP 5
	    CLS
	    SLEEP 1
	  SHELL "A:\freedos\bin\fdapm warmboot"
	ON ERROR GOTO 11114

