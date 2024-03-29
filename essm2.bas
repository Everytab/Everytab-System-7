OPTION BASE 1
REM Load MENU Variables
DIM MenuItem(4) AS STRING
DIM ChooseItem AS INTEGER
DIM XMenuPosn AS INTEGER
DIM YMenuPosn AS INTEGER
DIM BMenuItem(7) AS STRING
DIM BChooseItem AS INTEGER
DIM BXMenuPosn AS INTEGER
DIM BYMenuPosn AS INTEGER
DIM CMenuItem(6) AS STRING
DIM CChooseItem AS INTEGER
DIM CXMenuPosn AS INTEGER
DIM CYMenuPosn AS INTEGER
DIM DMenuItem(4) AS STRING
DIM DChooseItem AS INTEGER
DIM DXMenuPosn AS INTEGER
DIM DYMenuPosn AS INTEGER
DIM EMenuItem(2) AS STRING
DIM EChooseItem AS INTEGER
DIM EXMenuPosn AS INTEGER
DIM EYMenuPosn AS INTEGER
DECLARE FUNCTION Hex2Bin$ (Hcs$)
90 CLS
CLS
COLOR 7, 0
CLS
SHELL "C:"
SHELL "CD \"
PRINT "ES/7 Loader for FreeDOS"
SLEEP 1
CLS
PRINT ""
PRINT "Checking /CONFIG for needed files"
DELAY .1
SHELL ("DEL C:\ES7\CONFIG\SUPER.SYS")
OPEN "C:\ES7\CONFIG\0.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
OPEN "C:\ES7\CONFIG\NULL.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
OPEN "C:\ES7\CONFIG\0.SYS" FOR OUTPUT AS #1
WRITE #1, 0
WRITE #1, 0
WRITE #1, 0
PRINT "Made new SuperUser File"
DELAY .1
END IF
CLOSE #1
ELSE
Print "The System has been tampered with, ES/7 cannot continue. The System has halted"
23
GOTO 23
END IF
OPEN "C:\ES7\CONFIG\0.SYS" FOR INPUT AS #1
INPUT #1, e
INPUT #1, f$
INPUT #1, PASSE$
CLOSE #1
PRINT "System state has been verified"
SLEEP 1
ESID = 0
SMID = 0
Build$ = "15.03.319"
Ver$ = "December Release (16-12 Beta)"
 CLS
164 SLEEP .1
CLS
PRINT "ES/7 init..."
SLEEP 1
CLS
CLS
CLS
CLS
BMP$ = "C:\ES7\BMP\BOOT.BMP"
OPEN BMP$ FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
PRINT "ES/7 15.03.318"
DELAY 10
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
    PLAY "E"
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
OPEN "C:\ES7\CONFIG\0.SYS" FOR OUTPUT AS #1
WRITE #1, 1
PRINT
DO
LOOP UNTIL INKEY$ <> ""
WRITE #1, nanme$
WRITE #1, non$
CLOSE #1
OPEN "C:\ES7\CONFIG\NULL.SYS" FOR OUTPUT AS #1
WRITE #1, 1
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
PRINT "Insert the floppy disk with the user data backup into Drive A"
PRINT "If the copying fails, the Post-Install Setup will start again on reboot"
PRINT ""
PRINT "Press any key to continue"
DO
LOOP UNTIL INKEY$ <> ""
SHELL ("COPY A:\SYS.DAT C:\ES7\CONFIG\NULL.SYS")
CLS
PRINT "Preparing to copy files"
SLEEP 1
SHELL ("COPY A:\SYS.DAT C:\ES7\CONFIG\0.SYS")
PRINT "Results shown above"
PRINT "Restarting in 5 seconds"
SLEEP 5
SHELL "fdapm warmboot"
ELSE
BEEP
GOTO 1232
END IF
ELSE
CLS
PRINT "Starting Login Session, Please Wait..."
SLEEP 2.5
CLS
SLEEP 1
CLS
COLOR 15, 1
CLS
95 CLS
PRINT "UserChooser v1"
PRINT "Choose a User"
OPEN "C:\ES7\CONFIG\1.SYS" FOR INPUT AS #1
INPUT #1, e1
INPUT #1, f1$
INPUT #1, PASSE1$
INPUT #1, a1
CLOSE #1
OPEN "C:\ES7\CONFIG\2.SYS" FOR INPUT AS #1
INPUT #1, e2
INPUT #1, f2$
INPUT #1, PASSE2$
INPUT #1, a2
CLOSE #1
OPEN "C:\ES7\CONFIG\3.SYS" FOR INPUT AS #1
INPUT #1, e3
INPUT #1, f3$
INPUT #1, PASSE3$
INPUT #1, a3
CLOSE #1
OPEN "C:\ES7\CONFIG\4.SYS" FOR INPUT AS #1
INPUT #1, e4
INPUT #1, f4$
INPUT #1, PASSE4$
INPUT #1, a4
CLOSE #1
OPEN "C:\ES7\CONFIG\5.SYS" FOR INPUT AS #1
INPUT #1, e5
INPUT #1, f5$
INPUT #1, PASSE5$
INPUT #1, a5
CLOSE #1
CMenuItem$(1) = f$
CMenuItem$(2) = f1$
CMenuItem$(3) = f2$
CMenuItem$(4) = f3$
CMenuItem$(5) = f4$
CMenuItem$(6) = f5$
  CChooseItem = 1
CXMenuPosn = 1
CYMenuPosn = 6

GOSUB CDrawMenu

'get cursor key movements and redraw menu
DO
	CCmmnd$ = INKEY$

	IF LEN(CCmmnd$) = 2 THEN CCmmnd$ = RIGHT$(CCmmnd$, 1)
      
	IF CCmmnd$ = "8" OR CCmmnd$ = CHR$(72) THEN GOSUB CMoveUp
	IF CCmmnd$ = "2" OR CCmmnd$ = CHR$(80) THEN GOSUB CMoveDown
	IF CCmmnd$ = "7" OR CCmmnd$ = CHR$(71) THEN CChooseItem = 1
	IF CCmmnd$ = "1" OR CCmmnd$ = CHR$(79) THEN CChooseItem = UBOUND(MenuItem)

	GOSUB CDrawMenu
LOOP UNTIL CCmmnd$ = CHR$(13)

PRINT
COLOR 15, 1
PRINT "User chosen ="; CMenuItem(CChooseItem)
log$ = CMenuItem(CChooseItem)
SLEEP 1
GOTO 126

CDrawMenu:
'Draw the menu
LOCATE CYMenuPosn, CXMenuPosn
FOR Count = 1 TO UBOUND(CMenuItem$)
	IF Count = CChooseItem THEN COLOR 1, 7 ELSE COLOR 15, 1
	PRINT CMenuItem$(Count)
	LOCATE CSRLIN, CXMenuPosn
NEXT Count
RETURN

CMoveUp:
IF CChooseItem = 1 THEN
	CChooseItem = UBOUND(CMenuItem$)
ELSE
	CChooseItem = CChooseItem - 1
END IF
RETURN

CMoveDown:
IF CChooseItem = UBOUND(CMenuItem$) THEN
	CChooseItem = 1
ELSE
	CChooseItem = CChooseItem + 1
END IF
RETURN
126
IF log$ = f$ THEN
feee$ = f$
PASSEe$ = PASSE$
ELSEIF log$ = f1$ THEN
IF e1 = 0 THEN
PRINT "The User has not been initialised"
ELSE
feee$ = f1$
PASSEe$ = PASSE1$
END IF
ELSEIF log$ = f2$ THEN
IF e2 = 0 THEN
PRINT "The User has not been initialised"
ELSE
feee$ = f2$
PASSEe$ = PASSE2$
END IF
ELSEIF log$ = f3$ THEN
IF e3 = 0 THEN
PRINT "The User has not been initialised"
ELSE
feee$ = f3$
PASSEe$ = PASSE3$
END IF
ELSEIF log$ = f4$ THEN
IF e4 = 0 THEN
PRINT "The User has not been initialised"
ELSE
feee$ = f4$
PASSEe$ = PASSE4$
END IF
ELSEIF log$ = f5$ THEN
IF e5 = 0 THEN
PRINT "The User has not been initialised"
ELSE
feee$ = f5$
PASSEe$ = PASSE5$
END IF
ELSE
GOTO 112
END IF
CLS
PRINT "Login"
PRINT "================================================================================"
PRINT ""
PRINT ""
PRINT "Please Login"
PRINT ""
PRINT "Username : "; feee$
PRINT "Enter the password"
PRINT ""
97 INPUT ">"; PASS$
98 IF PASS$ = PASSEe$ THEN
    SLEEP 1
    SHELL "C:"
    SHELL "CD \"
    CLS
98.25 CLS
EMenuItem$(1) = "Session Manager (Mouse Based - GUI)"
EMenuItem$(2) = "Application Chooser (Arrow Key Based)"
    PRINT "Session Picker"
    PRINT "================================================================================"
    PRINT "Choose an session :-"
    EChooseItem = 1
EXMenuPosn = 1
EYMenuPosn = 3

GOSUB EDrawMenu

'get cursor key movements and redraw menu
DO
	ECmmnd$ = INKEY$

	IF LEN(ECmmnd$) = 2 THEN ECmmnd$ = RIGHT$(ECmmnd$, 1)
      
	IF ECmmnd$ = "8" OR ECmmnd$ = CHR$(72) THEN GOSUB EMoveUp
	IF ECmmnd$ = "2" OR ECmmnd$ = CHR$(80) THEN GOSUB EMoveDown
	IF ECmmnd$ = "7" OR ECmmnd$ = CHR$(71) THEN EChooseItem = 1
	IF ECmmnd$ = "1" OR ECmmnd$ = CHR$(79) THEN EChooseItem = UBOUND(EMenuItem)

	GOSUB EDrawMenu
LOOP UNTIL ECmmnd$ = CHR$(13)

PRINT
COLOR 15, 1
PRINT "Item chosen ="; EMenuItem(EChooseItem)
erj$ = EMenuItem(EChooseItem)
SLEEP 1
GOTO 99.25

EDrawMenu:
'Draw the menu
LOCATE EYMenuPosn, EXMenuPosn
FOR Count = 1 TO UBOUND(EMenuItem$)
	IF Count = EChooseItem THEN COLOR 1, 7 ELSE COLOR 15, 1
	PRINT EMenuItem$(Count)
	LOCATE CSRLIN, EXMenuPosn
NEXT Count
RETURN

EMoveUp:
IF EChooseItem = 1 THEN
	EChooseItem = UBOUND(EMenuItem$)
ELSE
	EChooseItem = EChooseItem - 1
END IF
RETURN

EMoveDown:
IF EChooseItem = UBOUND(EMenuItem$) THEN
	EChooseItem = 1
ELSE
	EChooseItem = EChooseItem + 1
END IF
RETURN
    99.25 
    IF erj$ = "Session Manager (Text-based GUI)" THEN
    SHELL "C:\ES7\BIN\SM.EXE"
	    SLEEP 1.5
	    COLOR 15, 4
	    PLAY "A"
	    CLS
	    CLS
	    PRINT ""
	    PRINT ""
	    PRINT "The system detected an processing"
	    PRINT "error at process 'Trident Shell Manager'"
	    PRINT ""
	    PRINT "FAIL : 00000003"
	    PRINT "OS Revision "; Build$
	    PRINT ""
	    PRINT ""
	    PRINT "The system has halted. Record the FAIL code"
	    PRINT "of the error and contact an Everytab System/7 Developer"
	    SLEEP 5
	    CLS
	    SLEEP 1
	    GOTO 90

    ELSE
    CLS
    PLAY "C"
    PLAY "D"
    PLAY "E"
    PLAY "E"
    PLAY "A"
123 CLS
MenuItem$(1) = "Included Applications"
MenuItem$(2) = "Run an DOS App"
MenuItem$(3) = "Command line"
MenuItem$(4) = "End Session"
    PRINT "Welcome "; f$
    PRINT "================================================================================"
    PRINT ""
    PRINT ""
    PRINT "Please choose an task"
    PRINT ""
    ChooseItem = 1
XMenuPosn = 1
YMenuPosn = 7

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
SLEEP 1
GOTO 106

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
106
ope$ = MenuItem(ChooseItem)

    IF ope$ = "Run an DOS App" THEN
	    CLS
	    PRINT "Run an DOS App"
	    PRINT "==============================================================================="
            99 cls
	    PRINT "Current Folder :"
            SHELL "DIR /w"
	    PRINT "Commands- ls (shows files), cd (change folder), drive (change drive), run, exit"
            INPUT "Run App >"; ap4p$
	    IF ap4p$ = "listfiles" THEN
	    SHELL "DIR /p"
	    GOTO 99
	    ELSEIF ap4p$ = "cd" THEN
	    INPUT "Choose the directory to change to (To abort, type . )"; CD$
	    ON ERROR GOTO 111
	    CHDIR CD$
	    ON ERROR GOTO 111
	    GOTO 99
	    ELSEIF ap4p$ = "drive" THEN
	    INPUT "Type the Drive colon to change to "; D$
	    ON ERROR GOTO 111
	    SHELL D$
	    ON ERROR GOTO 111
	    GOTO 99
	    ELSEIF ap4p$ = "run" THEN
	    INPUT "Type the file name of the program"; r$
	    ON ERROR GOTO 111
	    SHELL r$
	    ON ERROR GOTO 111
	    GOTO 99
	    ELSEIF ap4p$ = "exit" THEN
	    GOTO 123
	    ELSE
	    PLAY "A"
	    GOTO 99
	    END IF
	    END IF
    IF ope$ = "Included Applications" THEN
124 CLS
BMenuItem$(1) = "Settings"
BMenuItem$(2) = "DOSLynx Web Browser"
BMenuItem$(3) = "Decimal to Binary Converter"
BMenuItem$(4) = "Microsoft Word for MS-DOS (External)"
BMenuItem$(5) = "Calculator"
BMenuItem$(6) = "Backup and Restore User File"
BMenuItem$(7) = "< Return Back"
PRINT "Built-in tasks"
PRINT "================================================================================"
	PRINT "Tasks :-"
	PRINT ""
    BChooseItem = 1
BXMenuPosn = 1
BYMenuPosn = 5

GOSUB BDrawMenu

'get cursor key movements and redraw menu
DO
	BCmmnd$ = INKEY$

	IF LEN(BCmmnd$) = 2 THEN BCmmnd$ = RIGHT$(BCmmnd$, 1)
      
	IF BCmmnd$ = "8" OR BCmmnd$ = CHR$(72) THEN GOSUB BMoveUp
	IF BCmmnd$ = "2" OR BCmmnd$ = CHR$(80) THEN GOSUB BMoveDown
	IF BCmmnd$ = "7" OR BCmmnd$ = CHR$(71) THEN BChooseItem = 1
	IF BCmmnd$ = "1" OR BCmmnd$ = CHR$(79) THEN BChooseItem = UBOUND(MenuItem)

	GOSUB BDrawMenu
LOOP UNTIL BCmmnd$ = CHR$(13)

PRINT
COLOR 15, 1
PRINT "Item chosen ="; BMenuItem(BChooseItem)
app$ = BMenuItem(BChooseItem)
SLEEP 1
GOTO 124.5

BDrawMenu:
'Draw the menu
LOCATE BYMenuPosn, BXMenuPosn
FOR Count = 1 TO UBOUND(BMenuItem$)
	IF Count = BChooseItem THEN COLOR 1, 7 ELSE COLOR 15, 1
	PRINT BMenuItem$(Count)
	LOCATE CSRLIN, BXMenuPosn
NEXT Count
RETURN

BMoveUp:
IF BChooseItem = 1 THEN
	BChooseItem = UBOUND(BMenuItem$)
ELSE
	BChooseItem = BChooseItem - 1
END IF
RETURN

BMoveDown:
IF BChooseItem = UBOUND(BMenuItem$) THEN
	BChooseItem = 1
ELSE
	BChooseItem = BChooseItem + 1
END IF
RETURN
124.5
	IF app$ = "Settings" THEN
125 CLS
IF log$ = f$ THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
ELSEIF log$ = f$ THEN

IF a1 = 1 THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
END IF

ELSEIF log$ = f1$ THEN
IF a1 = 1 THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
END IF

ELSEIF log$ = f2$ THEN
IF a2 = 1 THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
END IF

ELSEIF log$ = f3$ THEN
IF a3 = 1 THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
END IF

ELSEIF log$ = f4$ THEN
IF a4 = 1 THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
END IF

ELSEIF log$ = f5$ THEN
IF a5 = 1 THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
END IF

END IF
SHELL ("C:\ES7\BIN\SET.EXE")
SHELL ("DEL C:\ES7\CONFIG\SUPER.SYS")
GOTO 124
	ELSEIF app$ = "DOSLynx Web Browser" THEN
	    CLS
	    OPEN "C:\ES7\CONFIG\WEB.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE#1
PRINT "The Web Browser has been disabled"
SLEEP 2
GOTO 124
END IF
	    SHELL ("C:")
	    CHDIR ("LYNX")
          ON ERROR GOTO 113
	    SHELL ("DOSLYNX.EXE")
          ON ERROR GOTO 113
	    GOTO 124
	ELSEIF app$ = "Decimal to Binary Converter" THEN
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
SLEEP 5
GOTO 124

ELSEIF app$ = "Microsoft Word for MS-DOS (External)" THEN
	   	    OPEN "C:\ES7\CONFIG\WORD.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE#1
PRINT "The Web Browser has been disabled"
SLEEP 2
GOTO 124
END IF
SHELL "C:"
CHDIR "\"
ON ERROR GOTO 113
CHDIR "WORD"
ON ERROR GOTO 113
SHELL "C:\WORD\WORD.COM"
ON ERROR GOTO 113
GOTO 124
	ELSEIF app$ = "Calculator" THEN
	    CLS
200 PRINT "Legacy Calculator"
	    PRINT (" + (addition), - (subtraction), x (multiplication) , _ (division)")
	    PRINT "Choose an option"
	    INPUT "TRICALC>"; os$
	    IF os$ = "+" THEN
		PRINT "Enter the first number"
		INPUT "TRICALC>"; A
		PRINT "Enter the second number"
		INPUT "TRICALC>"; B
		PRINT (A + B)
		SLEEP 5
		GOTO 124
	      
	    ELSEIF os$ = "-" THEN
		PRINT "Enter the first number"
		INPUT "TRICALC>"; A
		PRINT "Enter the second number"
		INPUT "TRICALC>"; B
		PRINT (A - B)
		SLEEP 5
		GOTO 124
	      
	    ELSEIF os$ = "x" THEN
		PRINT "Enter the first number"
		INPUT "TRICALC>"; A
		PRINT "Enter the second number"
		INPUT "TRICALC>"; B
		PRINT (A * B)
		SLEEP 5
		GOTO 124
	       
	    ELSEIF os$ = "_" THEN
		PRINT "Enter the first number"
		INPUT "TRICALC>"; A
		PRINT "Enter the second number"
		INPUT "TRICALC>"; B
		PRINT (A \ B)
		SLEEP 5
		GOTO 124
	    ELSE
		PRINT "The value specified is invalid"
		SLEEP 1
		GOTO 200

	    END IF
	    GOTO 124
	ELSEIF app$ = "Backup and Restore User File" THEN
	IF log$ = f$ THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
ELSEIF log$ = f$ THEN

IF a1 = 1 THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
END IF

ELSEIF log$ = f1$ THEN
IF a1 = 1 THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
END IF

ELSEIF log$ = f2$ THEN
IF a2 = 1 THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
END IF

ELSEIF log$ = f3$ THEN
IF a3 = 1 THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
END IF

ELSEIF log$ = f4$ THEN
IF a4 = 1 THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
END IF

ELSEIF log$ = f5$ THEN
IF a5 = 1 THEN
OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
END IF

END IF
	    SHELL ("C:\ES7\BIN\PLUS.EXE")
	    
	    SHELL ("DEL C:\ES7\CONFIG\SUPER.SYS")
            CLS
            PRINT "Backup and Restore was terminated unexpectedly,"
            PRINT "or was not found"
            PRINT "FAIL Code : 00000004"
            PRINT "Please Contact an ES/7 DevPartner"
            SLEEP 3
            GOTO 124
	ELSEIF app$ = "< Return Back" THEN
	  GOTO 123
	ELSE
	    BEEP
	    GOTO 112
	END IF
    ELSEIF ope$ = "Command line" THEN
    	    OPEN "C:\ES7\CONFIG\CONSOLE.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE#1
PRINT "The Console has been disabled"
SLEEP 2
GOTO 123
END IF
	CLS
	COLOR 7, 0
	CLS
	PRINT "The Everytab System/7 Command Prompt"
PRINT ""
100 INPUT ">"; COMAND$
       IF COMAND$ = "EGG" THEN
	    PRINT "its not yet easter..."
	    GOTO 100
     ELSEIF COMAND$ = "exit" THEN
	    COLOR 15, 1
	    GOTO 123
     ELSEIF COMAND$ = "about" THEN
	    PRINT "The Everytab System/7 Build "; Build$
	    GOTO 100

	ELSEIF COMAND$ = "LETSCRASHREEDS" THEN
111 CLS
	    
	    SLEEP 1.5
	    COLOR 15, 4
	    PLAY "A"
	    CLS
	    CLS
	    PRINT ""
	    PRINT ""
	    PRINT "The system detected an processing"
	    PRINT "error at process 'BASIC:SHELL'"
	    PRINT ""
	    PRINT "FAIL : 00000001"
	    PRINT "OS Revision "; Build$
	    PRINT ""
	    PRINT ""
	    PRINT "The system has halted. Record the FAIL code"
	    PRINT "of the error and contact an Everytab System/7 Developer"
	    SLEEP 5
	    CLS
	    SLEEP 1
	    GOTO 90
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
	    PRINT "OS Revision "; Build$
	    PRINT ""
	    PRINT ""
	    PRINT "The system has halted. Record the FAIL code"
	    PRINT "of the error and contact an Everytab System/7 Developer"
	    SLEEP 5
	    CLS
	    SLEEP 1
	    GOTO 90
113 CLS
	    
	    SLEEP 1.5
	    COLOR 15, 4
	    PLAY "A"
	    CLS
	    CLS
	    PRINT ""
	    PRINT ""
	    PRINT "The system detected an critical processing"
	    PRINT "error at process 'SYSTEM_FILE'"
	    PRINT ""
	    PRINT "FAIL : 00000004"
	    PRINT "OS Revision "; Build$
	    PRINT ""
	    PRINT ""
	    PRINT "The system has halted. Record the FAIL code"
	    PRINT "of the error and contact an Everytab System/7 Developer"
	    SLEEP 5
	    CLS
	    SLEEP 1
	    GOTO 90
	ELSEIF COMAND$ = "" THEN
	    GOTO 100
	ELSEIF COMAND$ = "cls" THEN
	    CLS
	    GOTO 100

	ELSE
	    SHELL COMAND$
            ON ERROR GOTO 1233
	    GOTO 100
	    ON ERROR GOTO 1233
1233 PRINT "Invalid Command"



	END IF
    ELSEIF ope$ = "End Session" THEN
	CLS
DMenuItem$(1) = "End the session"
DMenuItem$(2) = "Restart the session"
DMenuItem$(3) = "Logoff"
DMenuItem$(4) = "< Return"
	PRINT "End Session"
	PRINT "================================================================================"
	PRINT "Choose an option "
	PRINT ""
    DChooseItem = 1
DXMenuPosn = 1
DYMenuPosn = 5

GOSUB DDrawMenu

'get cursor key movements and redraw menu
DO
	DCmmnd$ = INKEY$

	IF LEN(DCmmnd$) = 2 THEN DCmmnd$ = RIGHT$(DCmmnd$, 1)
      
	IF DCmmnd$ = "8" OR DCmmnd$ = CHR$(72) THEN GOSUB DMoveUp
	IF DCmmnd$ = "2" OR DCmmnd$ = CHR$(80) THEN GOSUB DMoveDown
	IF DCmmnd$ = "7" OR DCmmnd$ = CHR$(71) THEN DChooseItem = 1
	IF DCmmnd$ = "1" OR DCmmnd$ = CHR$(79) THEN DChooseItem = UBOUND(MenuItem)

	GOSUB DDrawMenu
LOOP UNTIL DCmmnd$ = CHR$(13)

PRINT
COLOR 15, 1
PRINT "Item chosen ="; DMenuItem(DChooseItem)
shut$ = DMenuItem(DChooseItem)
SLEEP 1
GOTO 6465

DDrawMenu:
'Draw the menu
LOCATE DYMenuPosn, DXMenuPosn
FOR Count = 1 TO UBOUND(DMenuItem$)
	IF Count = DChooseItem THEN COLOR 1, 7 ELSE COLOR 15, 1
	PRINT DMenuItem$(Count)
	LOCATE CSRLIN, DXMenuPosn
NEXT Count
RETURN

DMoveUp:
IF DChooseItem = 1 THEN
	DChooseItem = UBOUND(DMenuItem$)
ELSE
	DChooseItem = DChooseItem - 1
END IF
RETURN

DMoveDown:
IF DChooseItem = UBOUND(DMenuItem$) THEN
	DChooseItem = 1
ELSE
	DChooseItem = DChooseItem + 1
END IF
RETURN
6465 
	IF shut$ = "End the session" THEN
	    PRINT "Preparing to Exit"
	    SLEEP 2
	    CLS
	    SLEEP 1
	    COLOR 7, 0
	    CLS
	    CLS
	    PRINT "Ending the Session"
	    PLAY "A"
	    PLAY "E"
	    PLAY "E"
	    PLAY "D"
	    PLAY "C"
	    SLEEP 5
	    CLS
	    CLOSE #1
	    SLEEP 1.5
	    SHELL "fdapm poweroff"
          ON ERROR GOTO 113
	    PRINT "The system detected an processing"
	    PRINT "error at process 'fdm poweroff'"
	    PRINT ""
	    PRINT "FAIL : 00000000"
	    PRINT "OS Revision "; Build$
	    PRINT ""
	    PRINT ""
	    PRINT "The system has reached a point where shutdown using ACPI has failed"
	    PRINT "The system has halted, it is now safe to turn off the computer"
	   
423
GOTO 423
	ELSEIF shut$ = "Restart the session" THEN
	    PRINT "Preparing to restart session"
	    CLS
	    SLEEP 1
	    CLS
	    COLOR 7, 0
	    CLS
	    CLS
	    PRINT "Restarting the system"
	    PLAY "A"
	    PLAY "E"
	    PLAY "E"
	    PLAY "D"
	    PLAY "C"

	    SLEEP 5
	    CLS
	    SLEEP 1
	    SHELL ("fdapm warmboot")
          ON ERROR GOTO 113
	ELSEIF shut$ = "Logoff" THEN
	CLS
	    PLAY "A"
	    PLAY "E"
	    PLAY "E"
	    PLAY "D"
	    PLAY "C"

	GOTO 95
	ELSEIF shut$ = "< Return" THEN
	    GOTO 123
	ELSE
	    BEEP
	    GOTO 6465
	END IF
    ELSE
	GOTO 112
    END IF
    END IF
ELSE
    CLS
    PRINT "Login > Invalid Password"
    PRINT "================================================================================"
    PRINT ""
    PRINT "The Password which was entered is not correct."
    PLAY "A"
    SLEEP 3
    CLS
    GOTO 95
END IF
END IF

DEFINT A-Z

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

		
