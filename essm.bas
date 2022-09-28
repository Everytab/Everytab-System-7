DECLARE SUB DELAY (dlay!)
DECLARE FUNCTION Hex2Bin$ (Hcs$)
90 CLS
CLS
COLOR 7, 0
CLS
SHELL "C:"
SHELL "CD \"
PRINT "ES/7 Loader for DOS"
DELAY .5
CLS
PRINT "REGLOAD"
PRINT "Reading Registry and Loading into Memory"
DELAY .1
OPEN "C:\sys.dat" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
OPEN "C:\sys.dat" FOR OUTPUT AS #1
WRITE #1, 0
WRITE #1, 0
WRITE #1, 0
PRINT "WARNING!!! : Registry was not found, had to be rebuilt"
DELAY .1
END IF
CLOSE #1
OPEN "C:\sys.dat" FOR INPUT AS #1
INPUT #1, e
INPUT #1, f$
INPUT #1, PASSE$
CLOSE #1
PRINT "The Read of the registry was succesful"
DELAY 1
ESID = 0
SMID = 0
Build$ = "15.01.313"
Ver$ = "October Release Candidate 1"
 CLS
164 DELAY .1
CLS
PRINT "ES/7 init..."
DELAY 1
CLS
CLS
CLS
CLS
BMP$ = "C:\boot.bmp"
OPEN BMP$ FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
PRINT "ES/7 15.01.313"
DELAY 15
ELSE
'=== Set the screen mode for a 640x480, 16 color BMP

SCREEN 12

'=== Skip header, go to pallette data

SEEK 1, 55

'=== Load Pallette

Pal$ = INPUT$(64, 1) '4 * 16
OUT &H3C8, 0
FOR x% = 1 TO LEN(Pal$) STEP 4
   OUT &H3C9, ASC(MID$(Pal$, x% + 2, 1)) \ 4
   OUT &H3C9, ASC(MID$(Pal$, x% + 1, 1)) \ 4
   OUT &H3C9, ASC(MID$(Pal$, x%, 1)) \ 4
NEXT

'=== Plot rows, pixel by pixel.

FOR y% = 479 TO 0 STEP -1
    Row$ = INPUT$(320, 1)
    FOR x% = 0 TO 639 STEP 2
      clr% = ASC(MID$(Row$, x% \ 2 + 1, 1))
      PSET (x%, y%), (clr% AND 240) \ 16
      PSET (x% + 1, y%), clr% AND 15
    NEXT
NEXT

CLOSE 1
SLEEP 2
END IF
SCREEN 0
CLS


PRINT e
IF e = 0 THEN
CLS
CLS
COLOR 15, 6
CLS
    PLAY "C"
    PLAY "D"
    PLAY "E"
    PLAY "F"
    PLAY "A"
1232 CLS
PRINT "Post-Install Setup"
PRINT "================================================================================"
PRINT ""
PRINT "Welcome to the Everytab System/7"
PRINT "Do you want to:"
PRINT "1) Enter a new username and password"
PRINT "2) Restore from a backup"
INPUT fes
IF fes = 1 THEN
CLS
PRINT "Post-Install Setup"
PRINT "================================================================================"
PRINT "Fresh Setup:"
INPUT "Enter your name"; nanme$
INPUT "Enter your password"; non$
PRINT "Ready to Write"
PRINT "Press any key to write the values ..."
OPEN "C:\sys.dat" FOR OUTPUT AS #1
WRITE #1, 1
PRINT
DO
LOOP UNTIL INKEY$ <> ""
WRITE #1, nanme$
WRITE #1, non$
CLOSE #1
PRINT "Completed, Press any key to restart ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
SHELL "fdapm warmboot"
ELSEIF fes = 2 THEN
PRINT "Post-Install Setup"
PRINT "================================================================================"
PRINT "Insert the disk with the backup"
PRINT "If this operation fails, do not worry. The Post-Install Setup will start again"
PRINT ""
PRINT "Press any key to continue"
DO
LOOP UNTIL INKEY$ <> ""
SHELL ("COPY A:\SYS.DAT C:\")
PRINT "[DEBUG] Result"
PRINT "Restarting in 10 seconds"
SLEEP 10
SHELL "fdapm warmboot"
ELSE
BEEP
GOTO 1232
END IF
ELSE
CLS
PRINT "Starting Login Session, Please Wait..."
DELAY 2.5
CLS
DELAY 1
CLS
COLOR 15, 1
CLS
95 CLS

PRINT "Login"
PRINT "================================================================================"
PRINT ""
PRINT ""
PRINT "Please Login"
PRINT ""
PRINT "Username : "; f$
PRINT "Enter the password"
PRINT ""
97 INPUT "PASSWORD>"; PASS$
98 IF PASS$ = PASSE$ THEN
    DELAY 1
    SHELL "C:"
    SHELL "CD \"
    CLS
98.25 CLS
    PRINT "Session Picker"
    PRINT "================================================================================"
    PRINT "Type 1 for Session Manager (Graphical with mouse), any other number else for Application chooser (Text-Based)"
    INPUT erj
    IF erj = 1 THEN
    CHAIN "C:\SM.EXE"
    ELSE
    CLS
    PLAY "C"
    PLAY "D"
    PLAY "E"
    PLAY "E"
    PLAY "A"
123 CLS
    PRINT "Welcome "; f$
    PRINT "================================================================================"
    PRINT ""
    PRINT ""
    PRINT "Please choose an task"
    PRINT ""
    PRINT "1) Built-in tasks"
    PRINT "2) Run an DOS App"
    PRINT "3) Command line"
    PRINT "4) End Session"
106 INPUT ">"; op
    IF op = 2 THEN
	    CLS
	    PRINT "RUNAPP"
	    PRINT "================================================================================"
	    PRINT "AVAILABLE COMMANDS :- DIR (SHOWS DIRECTORY LISTING), CD (ALLOWS TO CHANGE DIRECTORY), RUN (RUNS THE FILE), EXIT"
	    PRINT "Due to limitations, only commands with UPPERCASE are supported"
99 INPUT "APPRUN>"; ap4p$
	    IF ap4p$ = "DIR" THEN
	    SHELL "DIR /w"
	    GOTO 99
	    ELSEIF ap4p$ = "CD" THEN
	    INPUT "Choose the directory to change to"; CD$
	    ON ERROR GOTO 111
	    CHDIR CD$
	    ON ERROR GOTO 111
	    GOTO 99
	    ELSEIF ap4p$ = "DRIVE" THEN
	    INPUT "Choose the Drive to change to"; D$
	    ON ERROR GOTO 111
	    SHELL D$
	    ON ERROR GOTO 111
	    GOTO 99
	    ELSEIF ap4p$ = "RUN" THEN
	    INPUT "Type the file name of the program"; r$
	    ON ERROR GOTO 111
	    SHELL r$
	    ON ERROR GOTO 111
	    GOTO 99
	    ELSEIF ap4p$ = "EXIT" THEN
	    GOTO 123
	    ELSE
	    PLAY "A"
	    GOTO 99
	    END IF
	    END IF
    IF op = 1 THEN
124 CLS
PRINT "Built-in tasks"
PRINT "================================================================================"
	PRINT "Tasks :-"
	PRINT ""
	PRINT "1) Settings"
	PRINT "2) DOSLynx Web Browser"
	PRINT "3) Decimal to Binary Converter"
	PRINT "4) Microsoft Word for MS-DOS (External)"
	PRINT "5) Calculator"
	PRINT "6) Utilities"
	PRINT "7) < Return Back"
124.5 INPUT ">"; app
	IF app = 1 THEN
125 CLS
	    PRINT "SETTINGS"
	    PRINT "================================================================================"
	    PRINT ""
	    PRINT "Options available are :-"
	    PRINT ""
	    PRINT "1 - Reset"
	    PRINT "2 - About"
	    PRINT "3 - Exit"
126 INPUT ">"; set
	    IF set = 1 THEN
444 CLS
		COLOR 15, 4
		CLS
		PRINT "SETTINGS > RESET"
		PRINT "================================================================================"
		PRINT ""
		PLAY "D"
		PLAY "A"
		PLAY "D"
INPUT "***WARNING!!!*** THIS WILL RESET YOUR PASSWORD, ARE YOU SURE?(Y/N)"; e$
		IF e$ = "Y" THEN
OPEN "sys.dat" FOR OUTPUT AS #1
WRITE #1, 0
WRITE #1, 0
WRITE #1, 0
CLOSE #1
		PRINT "Press any key to restart ..."
		PRINT
		DO
		LOOP UNTIL INKEY$ <> ""
		GOTO 90
		ELSEIF e$ = "N" THEN
		CLS
		COLOR 15, 1
		CLS
		GOTO 125
		ELSE
		CLS
		GOTO 444
		END IF
	    ELSEIF set = 2 THEN
		CLS
		PRINT "SETTINGS > About"
		PRINT "================================================================================"
		PRINT ""
		PRINT "About Everytab System/7:-"
		PRINT ""
		PRINT "The Everytab System/7 Version "; Ver$
		PRINT "OS Build "; Build$
		PRINT ""
		PRINT "Changelog :"
		PRINT ""
		PRINT ""
		PRINT "Thanks to all the people who worked on FreeDOS!"
		PRINT "Everytab System/7 is based on a modified FreeDOS Install"
		PRINT "Press any key to continue ..."
		PRINT
		DO
		LOOP UNTIL INKEY$ <> ""
		GOTO 125
	    ELSEIF set = 3 THEN
		GOTO 124
	    ELSE
		BEEP
		GOTO 126

	    END IF
	ELSEIF app = 2 THEN
	    CLS
	    SHELL ("C:")
	    CHDIR ("LYNX")
	    SHELL ("DOSLYNX.EXE")
	    GOTO 124
	ELSEIF app = 3 THEN
	    REM binary
CLS
PRINT "Binary Coder"

SLEEP 5

start:

CLS
LOCATE 1, 1
PRINT "Binary coder"
PRINT "_____________"
PRINT ""
PRINT ""
PRINT ""
PRINT ""



INPUT "Enter Decimal number"; A
CLS
PRINT "Binary coder"
PRINT "_____________"
PRINT ""
PRINT ""
WHILE A <> 0
    PRINT A MOD 2;
    IF A MOD 2 = 1 THEN
	A = A \ 2
    ELSE A = A / 2
    END IF

WEND
PRINT ""
PRINT ""
PRINT "Binary code is reversed"
DELAY 5
GOTO 124

ELSEIF app = 4 THEN
SHELL "C:"
CHDIR "\"
ON ERROR GOTO 111
CHDIR "WORD"
ON ERROR GOTO 111
SHELL "C:\WORD\WORD.COM"
ON ERROR GOTO 111
GOTO 123
	ELSEIF app = 5 THEN
	    CLS
200 PRINT "Legacy Calculator"
	    PRINT ("+,-,x,_(Divide)")
	    PRINT "CHOOSE AN OPERATION"
	    INPUT "TRICALC>"; os$
	    IF os$ = "+" THEN
		PRINT "FIRST NO."
		INPUT "TRICALC>"; A
		PRINT "SECOND.NO"
		INPUT "TRICALC>"; B
		PRINT (A + B)
		DELAY 5
		GOTO 124.5
	      
	    ELSEIF os$ = "-" THEN
		PRINT "FIRST NO."
		INPUT "TRICALC>"; A
		PRINT "SECOND.NO"
		INPUT "TRICALC>"; B
		PRINT (A - B)
		DELAY 5
		GOTO 124.5
	      
	    ELSEIF os$ = "x" THEN
		PRINT "FIRST NO."
		INPUT "TRICALC>"; A
		PRINT "SECOND.NO"
		INPUT "TRICALC>"; B
		PRINT (A * B)
		DELAY 5
		GOTO 124.5
	       
	    ELSEIF os$ = "_" THEN
		PRINT "FIRST NO."
		INPUT "TRICALC>"; A
		PRINT "SECOND.NO"
		INPUT "TRICALC>"; B
		PRINT (A \ B)
		DELAY 5
		GOTO 124.5
	    ELSE
		PRINT "INVALID VALUE"
		DELAY 1
		GOTO 200

	    END IF
	    GOTO 124.5
	ELSEIF app = 6 THEN
	    SHELL "C:"
	    CHDIR "\"
	    CHAIN "PLUS.EXE"
	ELSEIF app = 7 THEN
	  GOTO 123
	ELSE
	    BEEP
	    GOTO 124.5
	END IF
    ELSEIF op = 3 THEN
	CLS
	COLOR 7, 0
	CLS
	PRINT "The Everytab System/7 Command Prompt"
	PRINT "Due to limitations, only commands with UPPERCASE are supported"
100 INPUT ">"; COMAND$
       IF COMAND$ = "EGG" THEN
	    PRINT "its not yet easter..."
	    GOTO 100
     ELSEIF COMAND$ = "EXIT" THEN
	    COLOR 15, 1
	    GOTO 123
     ELSEIF COMAND$ = "ABOUT" THEN
	    CLS
	    PRINT ("THE EVERYTAB SYSTEM/7 BUILD "); Build$
	    PRINT "?"
	    PRINT "Press any key to continue ..."
	    PRINT
	    DO
	    LOOP UNTIL INKEY$ <> ""
	    CLS
	    GOTO 100

	ELSEIF COMAND$ = "LETSCRASH" THEN
111 CLS
	    
	    DELAY 1.5
	    COLOR 7, 4
	    PLAY "A"
	    CLS
	    CLS
	    PRINT "FAIL 0000 ERRCD=fns ERAAC=**** ERLIM=********"
	    PRINT "EAX=00000000  EBX=fa00000 ECX=00000000 EDX=00000000"
	    PRINT "ESI=8rs29vn2 EDI=sk928=21 EBP=2993828 FLG=*********"
	    PRINT "CS:ES=0000:000000cc"
	    PRINT ""
	    PRINT ""
	    PRINT "The system detected an processing"
	    PRINT "error at location DOSAPPRUN:01"
	    PRINT ""
	    PRINT "FAIL : 00000000"
	    PRINT "OS Revision "; Build$
	    PRINT ""
	    PRINT ""
	    PRINT "The system has halted. Record the FAIL code"
	    PRINT "of the error and contact an Everytab System/7 Developer"
	    DELAY 5
	    CLS
	    DELAY 1
	    GOTO 90
	ELSEIF COMAND$ = "" THEN
	    GOTO 100
	ELSEIF COMAND$ = "CLS" THEN
	    CLS
	    GOTO 100

	ELSE
	    SHELL COMAND$
	    GOTO 100
	    ON ERROR GOTO 1233
1233 PRINT "Invalid Command"



	END IF
    ELSEIF op = 4 THEN
	CLS
	PRINT "SHUTDOWN"
	PRINT "================================================================================"
	PRINT "Choose an option "
	PRINT ""
	PRINT "1) End the session"
	PRINT "2) Restart the session"
	PRINT "3) Logoff"
	PRINT "4) < Return"
6465 INPUT ">"; shut
	IF shut = 1 THEN
	    PRINT "Preparing to Exit"
	    DELAY 2
	    CLS
	    DELAY 1
	    COLOR 7, 0
	    CLS
	    CLS
	    PRINT "Ending ES/7 Session"
	    PLAY "A"
	    PLAY "E"
	    PLAY "E"
	    PLAY "D"
	    PLAY "C"
	    DELAY 5
	    CLS
	    CLOSE #1
	    DELAY 1.5
	    SHELL "fdapm poweroff"
	    PRINT "No ACPI?"
	    PRINT "Well then...System shutdown is complete?"
	    PRINT "It is now safe to turn off the computer"
	   
423
GOTO 423
	ELSEIF shut = 2 THEN
	    PRINT "Preparing to restart session"
	    CLS
	    DELAY 1
	    CLS
	    COLOR 7, 0
	    CLS
	    CLS
	    PRINT "Restarting ES/7"
	    PLAY "A"
	    PLAY "E"
	    PLAY "E"
	    PLAY "D"
	    PLAY "C"

	    DELAY 5
	    CLS
	    DELAY 1
	    SHELL ("fdapm warmboot")
	ELSEIF shut = 3 THEN
	CLS
	    PLAY "A"
	    PLAY "E"
	    PLAY "E"
	    PLAY "D"
	    PLAY "C"

	GOTO 95
	ELSEIF shut = 4 THEN
	    GOTO 123
	ELSE
	    BEEP
	    GOTO 6465
	END IF
    ELSE
	BEEP
	GOTO 106
    END IF
    END IF
ELSE
    CLS
    PRINT "Login > Invalid Password"
    PRINT "================================================================================"
    PRINT ""
    PRINT "The Password which was entered is invalid for the user specified"
    PLAY "A"
    DELAY 3
    CLS
    GOTO 95
END IF
END IF

DEFINT A-Z
SUB DELAY (dlay!)
    start! = TIMER
    DO WHILE start! + dlay! >= TIMER
	IF start! > TIMER THEN start! = start! - 86400
    LOOP
END SUB

FUNCTION Hex2Bin$ (Hcs$)
   Hcs$ = UCASE$(Hcs$)
   lc = LEN(Hcs$)
   FOR x = 1 TO lc
      SELECT CASE MID$(Hcs$, x, 1)
	 CASE "0"
	    Out$ = Out$ + "0000"
	 CASE "1"
	    Out$ = Out$ + "0001"
	 CASE "2"
	    Out$ = Out$ + "0010"
	 CASE "3"
	    Out$ = Out$ + "0011"
	 CASE "4"
	    Out$ = Out$ + "0100"
	 CASE "5"
	    Out$ = Out$ + "0101"
	 CASE "6"
	    Out$ = Out$ + "0110"
	 CASE "7"
	    Out$ = Out$ + "0111"
	 CASE "8"
	    Out$ = Out$ + "1000"
	 CASE "9"
	    Out$ = Out$ + "1001"
	 CASE "A"
	    Out$ = Out$ + "1010"
	 CASE "B"
	    Out$ = Out$ + "1011"
	 CASE "C"
	    Out$ = Out$ + "1100"
	 CASE "D"
	    Out$ = Out$ + "1101"
	 CASE "E"
	    Out$ = Out$ + "1110"
	 CASE "F"
	    Out$ = Out$ + "1111"
      END SELECT
   NEXT
   Hex2Bin$ = Out$
END FUNCTION

