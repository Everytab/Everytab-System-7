DIM CMenuItem(5) AS STRING
DIM CChooseItem AS INTEGER
DIM CXMenuPosn AS INTEGER
DIM CYMenuPosn AS INTEGER
DIM MenuItem(6) AS STRING
DIM ChooseItem AS INTEGER
DIM XMenuPosn AS INTEGER
DIM YMenuPosn AS INTEGER
DIM DMenuItem(3) AS STRING
DIM DChooseItem AS INTEGER
DIM DXMenuPosn AS INTEGER
DIM DYMenuPosn AS INTEGER
	    OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE#1
PRINT "Settings is only available for Admins"
SLEEP 2
GOTO 124
END IF
CMenuItem$(1) = "Reset Full System"
CMenuItem$(2) = "About"
CMenuItem$(3) = "User Settings"
CMenuItem$(4) = "Enable and disable apps"
CMenuItem$(5) = "Exit"
	    PRINT "Settings"
	    PRINT "================================================================================"
	    PRINT ""
	    PRINT "Options available are :-"
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
PRINT "Item chosen ="; CMenuItem(CChooseItem)
set$ = CMenuItem(CChooseItem)
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
	    IF set$ = "Reset Full System" THEN
444 CLS
		COLOR 15, 4
		CLS
		PRINT "Settings > Reset User File"
		PRINT "================================================================================"
		PRINT ""
		PLAY "D"
		PLAY "A"
		PLAY "D"
INPUT "***WARNING!!!*** THIS WILL RESET THE ENTIRE SYSTEM, ARE YOU SURE?(Y/N)"; e$
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
		SHELL ("fdapm reboot")
		ELSEIF e$ = "N" THEN
		CLS
		COLOR 15, 1
		CLS
		GOTO 125
		ELSE
		CLS
		GOTO 444
		END IF
	    ELSEIF set$ = "About" THEN
		CLS
		PRINT "Settings > About"
		PRINT "================================================================================"
		PRINT ""
		PRINT "About Everytab System/7:-"
		PRINT ""
		PRINT "The Everytab System/7 Version "; Ver$
		PRINT "OS Build "; Build$
		PRINT ""
		PRINT "Credits :"
		PRINT "Developers - Everytab, JayTheCoderX, greenland, Mark_ & CoroX_"
                PRINT "Graphic Designers - JayTheCoderX"
		PRINT "Everytab System/7 runs on a modified FreeDOS Install"
		PRINT ""
		PRINT "Press any key to continue ..."
		PRINT
		DO
		LOOP UNTIL INKEY$ <> ""
		GOTO 125
	    ELSEIF set$ = "Exit" THEN
		GOTO 124
            ELSEIF set$ = "User Settings"
	    CLS
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
MenuItem$(1) = f$
MenuItem$(2) = f1$
MenuItem$(3) = f2$
MenuItem$(4) = f3$
MenuItem$(5) = f4$
MenuItem$(6) = f5$
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
IF ope$ = f1$ THEN
PRINT "User 1"
PRINT "================================================================================"
INPUT "Initialised? (0 for no, other numbers will be treated as yes"; innit
INPUT "Enter your name"; nanme$
INPUT "Enter your password"; non$
INPUT "GIVE ADMIN RIGHTS??? (1 - YES, ANY OTHER NUMBER WILL BE NO)"; sus
PRINT "Ready to Write"
PRINT "Press any key to write the values ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
OPEN "C:\ES7\CONFIG\1.SYS" FOR OUTPUT AS #1
WRITE #1, 1
WRITE #1, nanme$
WRITE #1, non$
WRITE #1, sus
CLOSE #1
PRINT "Completed, Press any key to restart ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
SHELL "fdapm warmboot"

ELSEIF ope$ = f2$ THEN
PRINT "User 2"
PRINT "================================================================================"
INPUT "Initialised? (0 for no, other numbers will be treated as yes"; innit
INPUT "Enter your name"; nanme$
INPUT "Enter your password"; non$
INPUT "GIVE ADMIN RIGHTS??? (1 - YES, ANY OTHER NUMBER WILL BE NO)"; sus
PRINT "Ready to Write"
PRINT "Press any key to write the values ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
OPEN "C:\ES7\CONFIG\2.SYS" FOR OUTPUT AS #1
WRITE #1, 1
WRITE #1, nanme$
WRITE #1, non$
WRITE #1, sus
CLOSE #1
PRINT "Completed, Press any key to restart ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
SHELL "fdapm warmboot"

ELSEIF ope$ = f3$ THEN
PRINT "User 3"
PRINT "================================================================================"
INPUT "Initialised? (0 for no, other numbers will be treated as yes"; innit
INPUT "Enter your name"; nanme$
INPUT "Enter your password"; non$
INPUT "GIVE ADMIN RIGHTS??? (1 - YES, ANY OTHER NUMBER WILL BE NO)"; sus
PRINT "Ready to Write"
PRINT "Press any key to write the values ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
OPEN "C:\ES7\CONFIG\3.SYS" FOR OUTPUT AS #1
WRITE #1, 1
WRITE #1, nanme$
WRITE #1, non$
WRITE #1, sus
CLOSE #1
PRINT "Completed, Press any key to restart ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
SHELL "fdapm warmboot"

ELSEIF ope$ = f4$ THEN
PRINT "User 4"
PRINT "================================================================================"
INPUT "Initialised? (0 for no, other numbers will be treated as yes"; innit
INPUT "Enter your name"; nanme$
INPUT "Enter your password"; non$
INPUT "GIVE ADMIN RIGHTS??? (1 - YES, ANY OTHER NUMBER WILL BE NO)"; sus
PRINT "Ready to Write"
PRINT "Press any key to write the values ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
OPEN "C:\ES7\CONFIG\4.SYS" FOR OUTPUT AS #1
WRITE #1, 1
WRITE #1, nanme$
WRITE #1, non$
WRITE #1, sus
CLOSE #1
PRINT "Completed, Press any key to restart ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
SHELL "fdapm warmboot"

ELSEIF ope$ = f5$ THEN
PRINT "User 5"
PRINT "================================================================================"
INPUT "Initialised? (0 for no, other numbers will be treated as yes"; innit
INPUT "Enter your name"; nanme$
INPUT "Enter your password"; non$
INPUT "GIVE ADMIN RIGHTS??? (1 - YES, ANY OTHER NUMBER WILL BE NO)"; sus
PRINT "Ready to Write"
PRINT "Press any key to write the values ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
OPEN "C:\ES7\CONFIG\5.SYS" FOR OUTPUT AS #1
WRITE #1, 1
WRITE #1, nanme$
WRITE #1, non$
WRITE #1, sus
CLOSE #1
PRINT "Completed, Press any key to restart ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
SHELL "fdapm warmboot"
ELSE
BEEP
GOTO 124
END IF
ELSEIF set$ = "Enable and disable apps"
CLS
PRINT "Choose app (Will enable/disable)"
BMenuItem$(1) = "Console"
BMenuItem$(2) = "DOSLynx Web Browser"
BMenuItem$(3) = "Microsoft Word"
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
	IF app$ = "Console" THEN
	 OPEN "C:\ES7\CONFIG\CONSOLE.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE#1
OPEN "C:\ES7\CONFIG\CONSOLE.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
ELSE
SHELL ("DEL C:\ES7\CONFIG\CONSOLE.SYS")
END IF
PRINT "OPERATION COMPLETED"
SLEEP 2
GOTO 124

ELSEIF app$ = "DOSLynx Web Browser" THEN
	 OPEN "C:\ES7\CONFIG\WEB.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE#1
OPEN "C:\ES7\CONFIG\WEB.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
ELSE
SHELL ("DEL C:\ES7\CONFIG\WEB.SYS")
END IF
PRINT "OPERATION COMPLETED"
SLEEP 2
GOTO 124

ELSEIF app$ = "Microsoft Word" THEN
	 OPEN "C:\ES7\CONFIG\WORD.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE#1
OPEN "C:\ES7\CONFIG\WORD.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
ELSE
SHELL ("DEL C:\ES7\CONFIG\WEB.SYS")
END IF
PRINT "OPERATION COMPLETED"
SLEEP 2
GOTO 124
	    ELSE
		BEEP
		GOTO 112

	    END IF
124 END
