DECLARE SUB Mousedriver (ax%, bx%, cx%, dx%, rmouse%)
DECLARE SUB mouseshow ()
DECLARE FUNCTION Mouseinit% ()
DEFINT A-Z

DECLARE SUB DELAY (dlay!)
DECLARE FUNCTION VidMem% ()
DECLARE FUNCTION CMOSBattery% ()
DECLARE FUNCTION BitOn% (which%, IntVal%)
DECLARE FUNCTION DriveType% (Drv%)
DECLARE FUNCTION Hex2Bin$ (Hcs$)
DECLARE FUNCTION TotalMem% ()
90 CLS
CLS
COLOR 7, 0
CLS
SHELL "C:"
SHELL "CD \"
PRINT "ES/7 Loader for DOS v.1"
DELAY 4
CLS
PRINT "Registry Check v.1"
PRINT "Reading Registry and Loading into Memory"
DELAY 3
OPEN "sys.dat" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
OPEN "sys.dat" FOR OUTPUT AS #1
WRITE #1, 0
WRITE #1, 0
WRITE #1, 0
PRINT "WARNING!!! : Registry was not found, had to be rebuilt"
DELAY 1
END IF
CLOSE #1
OPEN "sys.dat" FOR INPUT AS #1
INPUT #1, e
INPUT #1, f$
INPUT #1, PASSE$
CLOSE #1
PRINT "The Read of the registry was succesful"
DELAY 2
DELAY 1
Build$ = "15.00.300"
Ver$ = "September Alpha Release"
 CLS
164 DELAY .1
CLS
PRINT "ES/7 init..."
DELAY 3
CLS
CLS
CLS
CLS
PRINT "The Everytab System/7 for DOS based Systems "; Ver$
DELAY 1
PRINT "OS Build "; Build$
DELAY 1.5
PRINT "Loading"
DELAY 3
CLS
PRINT "[          ]"
DELAY .2
CLS
PRINT "[=         ]"
DELAY .2
CLS
PRINT "[ =        ]"
DELAY .2
CLS
PRINT "[  =       ]"
DELAY .2
CLS
PRINT "[   =      ]"
DELAY .2
CLS
PRINT "[    =     ]"
DELAY .2
CLS
PRINT "[     =    ]"
DELAY .2
CLS
PRINT "[      =   ]"
DELAY .2
CLS
PRINT "[       =  ]"
DELAY .2
CLS
PRINT "[        = ]"
DELAY .2
CLS
PRINT "[         =]"
DELAY .2
CLS
PRINT "[          ]"
DELAY .2
CLS
PRINT "[=         ]"
DELAY .2
CLS
PRINT "[ =        ]"
DELAY .2
CLS
PRINT "[  =       ]"
DELAY .2
CLS
PRINT "[   =      ]"
DELAY .2
CLS
PRINT "[    =     ]"
DELAY .2
CLS
PRINT "[     =    ]"
DELAY .2
CLS
PRINT "[      =   ]"
DELAY .2
CLS
PRINT "[       =  ]"
DELAY .2
CLS
PRINT "[        = ]"
DELAY .2
CLS
PRINT "[         =]"
DELAY .2
CLS
PRINT "[          ]"
DELAY .2
CLS
PRINT "[=         ]"
DELAY .2
CLS
PRINT "[ =        ]"
DELAY .2
CLS
PRINT "[  =       ]"
DELAY .2
CLS
PRINT "[   =      ]"
DELAY .2
CLS
PRINT "[    =     ]"
DELAY .2
CLS
PRINT "[     =    ]"
DELAY .2
CLS
PRINT "[      =   ]"
DELAY .2
CLS
PRINT "[       =  ]"
DELAY .2
CLS
PRINT "[        = ]"
DELAY .2
CLS
PRINT "[         =]"
DELAY .2
CLS
PRINT "[          ]"
DELAY .2
CLS
PRINT "[=         ]"
DELAY .2
CLS
PRINT "[ =        ]"
DELAY .2
CLS
PRINT "[  =       ]"
DELAY .2
CLS
PRINT "[   =      ]"
DELAY .2
CLS
PRINT "[    =     ]"
DELAY .2
CLS
PRINT "[     =    ]"
DELAY .2
CLS
PRINT "[      =   ]"
DELAY .2
CLS
PRINT "[       =  ]"
DELAY .2
CLS
PRINT "[        = ]"
DELAY .2
CLS
PRINT "[         =]"
DELAY .2


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
PRINT "Post-Install Setup"
PRINT "================================================================================"
PRINT ""
PRINT "Welcome to the Everytab System/7"
INPUT "Enter your name"; nanme$
INPUT "Enter your password"; non$
PRINT "Ready to Write"
PRINT "Press any key to continue ..."
OPEN "sys.dat" FOR OUTPUT AS #1
WRITE #1, 1
PRINT
DO
LOOP UNTIL INKEY$ <> ""
WRITE #1, nanme$
WRITE #1, non$
CLOSE #1
PRINT "Press any key to restart ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
GOTO 90

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

PRINT "LOGIN"
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
    PRINT "NETMAN : Checking for connections"
    DELAY 1
    PRINT "NETMAN : No connection found"
    DELAY 1
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
    mouseshow
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
	PRINT "2) Browser Demo (no functionality)"
	PRINT "3) Decimal to Binary Converter"
	PRINT "4) Microsoft Word for MS-DOS (External)"
	PRINT "5) Legacy Calculator"
	PRINT "6) Plus Pak Launcher (Not available until 15.01)"
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
		CLS
		COLOR 15, 4
		CLS
		PRINT "SETTINGS > RESET"
		PRINT "================================================================================"
		PRINT ""
		PLAY "D"
		PLAY "A"
		PLAY "D"
444 INPUT "***WARNING!!!*** THIS WILL RESET YOUR PASSWORD, ARE YOU SURE?(Y/N)"; e$
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
		PRINT "The September Alpha Release, New User Interface and more..."
		PRINT ""
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
	    PRINT "Browser Demo"
	    PRINT "================================================================================"
	    PRINT "Checking connection..."
	    DELAY 1
	    PRINT ""
	    PRINT "NO connection, Terminating session"
	    DELAY 2
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
SHELL "WORD"
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
	    SHELL "PLUS.EXE"
	    GOTO 124.5
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
	    DELAY 1.5
	    PRINT "System shutdown is complete"
	    PRINT "It is now safe to turn off the computer"
	    CLOSE #1
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
	    GOTO 90
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
    PRINT "LOGIN > ERROR"
    PRINT "================================================================================"
    PRINT ""
    PRINT "The Password which was entered is invalid for the user specified"
    PLAY "A"
    DELAY 3
    CLS
    GOTO 95
END IF
END IF

FUNCTION BitOn (which, IntVal)
   BitOn = 0
   SELECT CASE which
      CASE 1: IF (IntVal AND 128) THEN BitOn = (-1)
      CASE 2: IF (IntVal AND 64) THEN BitOn = (-1)
      CASE 3: IF (IntVal AND 32) THEN BitOn = (-1)
      CASE 4: IF (IntVal AND 16) THEN BitOn = (-1)
      CASE 5: IF (IntVal AND 8) THEN BitOn = (-1)
      CASE 6: IF (IntVal AND 4) THEN BitOn = (-1)
      CASE 7: IF (IntVal AND 2) THEN BitOn = (-1)
      CASE 8: IF (IntVal AND 1) THEN BitOn = (-1)
      CASE 9: IF (IntVal AND (-32768)) THEN BitOn = (-1)
      CASE 10: IF (IntVal AND 16384) THEN BitOn = (-1)
      CASE 11: IF (IntVal AND 8192) THEN BitOn = (-1)
      CASE 12: IF (IntVal AND 4096) THEN BitOn = (-1)
      CASE 13: IF (IntVal AND 2048) THEN BitOn = (-1)
      CASE 14: IF (IntVal AND 1024) THEN BitOn = (-1)
      CASE 15: IF (IntVal AND 512) THEN BitOn = (-1)
      CASE 16: IF (IntVal AND 256) THEN BitOn = (-1)
   END SELECT
END FUNCTION

FUNCTION CMOSBattery%
	OUT &H70, &HD
	B% = INP(&H71)
	C = BitOn%(1, B%)
	CMOSBattery% = C
END FUNCTION

SUB DELAY (dlay!)
    start! = TIMER
    DO WHILE start! + dlay! >= TIMER
	IF start! > TIMER THEN start! = start! - 86400
    LOOP
END SUB

FUNCTION DriveType% (Drv%)
	OUT &H70, &H10
	B% = INP(&H71)
	IF Drv% = 1 THEN
		t$ = LEFT$(Hex2Bin$(LTRIM$(RTRIM$(HEX$(B%)))), 4)
	ELSE
		t$ = MID$(Hex2Bin$(LTRIM$(RTRIM$(HEX$(B%)))), 5, 4)
	END IF
	IF t$ = "0001" THEN DriveType% = 1
	IF t$ = "0010" THEN DriveType% = 2
	IF t$ = "0011" THEN DriveType% = 3
	IF t$ = "0100" THEN DriveType% = 4
END FUNCTION

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

SUB Mousedriver (ax%, bx%, cx%, dx%, rmouse%)
   DEF SEG = VARSEG(rmouse$)
   rmouse% = SADD(rmouse$)
END SUB

FUNCTION Mouseinit%
   ax% = 0
   Mousedriver ax%, 0, 0, 0, rmouse%
   Mouseinit% = ax%
END FUNCTION

SUB mouseshow
   ax% = 1
   Mousedriver ax%, 0, 0, 0, rmouse%
END SUB

SUB Mousestat (lb%, mb&, rb%, xmouse%, ymouse%)
   ax% = 3
   Mousedriver ax%, bx%, cx%, dx%, rmouse%
   lb% = ((bx% AND 1) <> 0)
   rb% = ((bx% AND 1) <> 0)
   mb% = -((bx% AND 4) \ 4)
   ymouse% = dx%
   xmouse% = cx%
END SUB

FUNCTION TotalMem%
	OUT &H70, &H15
	B% = INP(&H71)
	OUT &H70, &H16
	b1% = INP(&H71)
	a1% = CVI(CHR$(B) + CHR$(b1%))
	OUT &H70, &H17
	B% = INP(&H71)
	OUT &H70, &H18
	b1% = INP(&H71)
	a2% = CVI(CHR$(B) + CHR$(b1%))
	TotalMem% = a1% + a2%
END FUNCTION

FUNCTION VidMem%
 
' Returns the amount of Video Memory
' PC's BIOS only reports up to 256K, though.
'------------------------------------------------------------------------
 
DEF SEG = 0
vm = PEEK(&H487)
vm = Byte AND 96
vm = vm \ 32
vm = (vm + 1) * 64
DEF SEG
VidMem% = vm
 
END FUNCTION

