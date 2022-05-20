CLS
COLOR 15, 1
CLS
PRINT "Everytab System/7 Setup"
PRINT "-----------------------"
PRINT ""
PRINT ""
PRINT "Welcome to Everytab System/7 Setup"
PRINT "This program shall go through the following"
PRINT ""
PRINT "1) Preparing your Hard Disk through the FDISK Utility"
PRINT "2) Formatting the Hard Disk and copying core MS-DOS Files"
PRINT "3) Copying Everytab System/7 Files"
PRINT ""
PRINT ""

PRINT "Press any key to continue"
DO
LOOP UNTIL INKEY$ <> ""


CLS
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
CHAIN "A:\FDISK"

