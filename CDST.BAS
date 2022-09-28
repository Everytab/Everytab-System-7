CLS
COLOR 15, 1
CLS
PRINT "Everytab System/7 Setup"
PRINT "=============================================================================="
PRINT ""
PRINT ""
PRINT "Welcome to Everytab System/7 Setup"
PRINT "The Version on this disk is - 15.01.305"
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
PRINT "Everytab System/7 Setup"
PRINT "=============================================================================="
PRINT ""
PRINT ""
PRINT "Choose the Setup Type"
PRINT "1 - Upgrade Setup - To upgrade existing DOS or ES/7 Installs"
PRINT "2 - Standard Setup - For new computers, or if you want to not keep the existing files"
INPUT eeee
IF eeee = 1 THEN
GOTO 146
ELSEIF eeee = 2 THEN
GOTO 144
ELSE
BEEP
GOTO 145
END IF

144 CLS
PRINT "Everytab System/7 Setup"
PRINT "=============================================================================="
PRINT ""
PRINT ""
PRINT "Step 1 of Step 3"
PRINT "Preparing your Hard Disk"
PRINT ""
PRINT "FDISK shall be loaded to make a partition"
PRINT "If a partition exists, exit FDISK while doing no changes"
PRINT ""
PRINT "Press any key to start FDISK"
DO
LOOP UNTIL INKEY$ <> ""
SHELL "FDISK"
CLS
PRINT "Everytab System/7 Setup"
PRINT "=============================================================================="
PRINT ""
PRINT ""
PRINT "Step 2 of Step 3"
PRINT "Formatting and copying base files"
PRINT ""
PRINT "WARNING : ALL DATA ON C: SHALL BE DESTROYED"
PRINT "Restart the computer to choose the upgrade option"
PRINT ""
PRINT "Press any key to FORMAT ALL DATA ON C:"
DO
LOOP UNTIL INKEY$ <> ""
SHELL "A:\FORMAT C: /U /S"

146 CLS
PRINT "Everytab System/7 Setup"
PRINT "=============================================================================="
PRINT ""
PRINT ""
PRINT "Step 3 of Step 3"
PRINT "Copying Everytab System files"
PRINT ""
PRINT "All Files will be copied to the root of C:"
PRINT "Everytab System/7 will start on startup"
PRINT ""
PRINT "Press any key to start copying files"
DO
LOOP UNTIL INKEY$ <> ""
IF eeee = 1 THEN
PRINT "Deleting previous System files"
SHELL ("C:")
SHELL ("MKDIR ESTEMP")
SHELL ("COPY C:\SYS.DAT C:\ESTEMP\")
SHELL ("DEL AUTOEXEC.BAT")
SHELL ("DEL COMMAND.COM")
SHELL ("DEL CONTROLP.INI")
SHELL ("DEL CONFIG.SYS")
SHELL ("DEL MOUSE.COM")
SHELL ("DEL ESSM.EXE")
SHELL ("DEL SM.EXE")
SHELL ("DEL *.*")
SHELL ("COPY C:\ESTEMP\SYS.DAT C:\")
PRINT "[DEBUG] Deletion results above"
SLEEP 5
GOTO 1112
ELSE
GOTO 1112
END IF
1112
SHELL ("D:")
SHELL ("PKUNZIP -e -o -d ES7.ZIP C:\")
PRINT "[DEBUG] Extraction Results"
SLEEP 5
CLS
PRINT "Everytab System/7 Setup"
PRINT "=============================================================================="
PRINT ""
PRINT ""
PRINT "Setup has completed"
PRINT "All the files has been copied"
PRINT ""
PRINT "During the OOBE, you can restore backed up user data"
PRINT "The computer will restart in 10 seconds"
PRINT ""
SLEEP 10
CLS
SHELL "fdapm warmboot"


