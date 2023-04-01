CLS
COLOR 15, 1
CLS
PRINT "Everytab System/7 Setup"
PRINT "-----------------------"
PRINT ""
PRINT ""
PRINT "Welcome to Everytab System/7 Setup"
PRINT "The Version on this disk is - 15.06.326"
PRINT "This program shall go through the following"
PRINT ""
PRINT "1) Preparing your Hard Disk through the FDISK Utility"
PRINT "2) Formatting the Hard Disk and copying the base files"
PRINT "3) Copying Everytab System/7 Files"
PRINT ""
PRINT ""

PRINT "Press any key to continue"
DO
LOOP UNTIL INKEY$ <> ""

144 CLS
PRINT "Everytab System/7 Setup"
PRINT "-----------------------"
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
SHELL "A:\FDISK"
CLS
PRINT "Everytab System/7 Setup"
PRINT "-----------------------"
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
PRINT "-----------------------"
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
SHELL ("A:")
CHDIR "ES"
SHELL ("COPY *.* C: /Y")
SHELL ("C:")
SHELL ("mkdir word")
SHELL ("A:")
CHDIR "word"
SHELL ("COPY *.* C:\word /Y")
CLS

PRINT "Setup has completed, Press CTRL + ALT + DEL to restart"
10
GOTO 10



