
CLS
COLOR 15, 1
CLS
PRINT "Everytab System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "Welcome to the Everytab System/7 Updater"
PRINT "Your system will be updated to the December Release"
PRINT ""
PRINT "1) Copying Everytab System/7 Files"
PRINT ""
PRINT ""

PRINT "Press any key to continue"
DO
LOOP UNTIL INKEY$ <> ""
146 CLS
PRINT "Everytab System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "Step 1 of Step 1"
PRINT "Copying Everytab System/7 files"
PRINT ""
PRINT "All Files will be copied to the root of C:"
PRINT ""
PRINT ""
PRINT "Press any key to start copying files"
DO
LOOP UNTIL INKEY$ <> ""
SLEEP 2
1112
SHELL ("C:")
SHELL ("CD ES7SETUP")
SHELL ("PKUNZIP -e -o -d ES7U.ZIP C:\")
ON ERROR GOTO 11111
SLEEP 5
CLS
PRINT "Everytab System/7 Setup"
PRINT "_______________________"
PRINT ""
PRINT ""
PRINT "The upgrade has completed"
PRINT "All the files has been copied"
PRINT ""
PRINT "The system will reboot into ES/7 in 5 seconds"
SLEEP 5
CLS
SHELL "A:\freedos\bin\fdapm warmboot"
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
	  SHELL "A:\freedos\bin\fdapm warmboot"
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
