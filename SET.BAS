DIM CMenuItem(5) AS STRING
DIM CChooseItem AS INTEGER
DIM CXMenuPosn AS INTEGER
DIM CYMenuPosn AS INTEGER
DIM MenuItem(5) AS STRING
DIM ChooseItem AS INTEGER
DIM XMenuPosn AS INTEGER
DIM YMenuPosn AS INTEGER
DIM BMenuItem(3) AS STRING
DIM BChooseItem AS INTEGER
DIM BXMenuPosn AS INTEGER
DIM BYMenuPosn AS INTEGER
Build$ = "16.01.338"
Ver$ = "Project Alpha"
OPEN "C:\ES7\CONFIG\SETVAR.SYS" FOR INPUT AS #1
INPUT #1, SVAR1$
INPUT #1, SVAR2$
INPUT #1, SVAR3$
INPUT #1, SVAR4$
INPUT #1, SVAR5$
INPUT #1, SVAR6$
INPUT #1, SVAR7$
INPUT #1, SVAR8$
INPUT #1, SVAR9$
INPUT #1, SVAR10$
INPUT #1, SVAR11$
INPUT #1, SVAR12$
INPUT #1, SVAR13$
INPUT #1, SVAR14$
INPUT #1, SVAR15$
INPUT #1, SVAR16$
INPUT #1, SVAR17$

CLOSE #1
CLOSE #1
COLOR 15, 1
CLS
CLS
CLS
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
		OPEN "C:\ES7\CONFIG\SUPER.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
PRINT SVAR1$
SLEEP 2
GOTO 124
END IF
125
CLS
CLS
CLS
CMenuItem$(1) = SVAR2$
CMenuItem$(2) = SVAR3$
CMenuItem$(3) = SVAR4$
CMenuItem$(4) = SVAR5$
CMenuItem$(5) = SVAR6$
		PRINT SVAR7$
		PRINT SVAR9$
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
PRINT ">"; CMenuItem(CChooseItem)
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
		PRINT SVAR9$
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
		PRINT SVAR9$
		PRINT ""
		PRINT "About Everytab System/7:-"
		PRINT ""
		PRINT "The Everytab System/7 Version "; Ver$
		PRINT "OS Build "; Build$
		PRINT ""
		PRINT "Credits :"
		PRINT "Developers - Everytab, greenland"
		PRINT "Everytab System/7 runs on a modified FreeDOS Install"
		PRINT ""
		PRINT "Press any key to continue ..."
		PRINT
		DO
		LOOP UNTIL INKEY$ <> ""
		GOTO 125
		ELSEIF set$ = "Exit" THEN
		GOTO 124
			ELSEIF set$ = "User Settings" THEN
		CLS
		PRINT "User Settings"
PRINT SVAR9$
PRINT "Choose a User to modify"
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
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
MenuItem$(1) = f1$
MenuItem$(2) = f2$
MenuItem$(3) = f3$
MenuItem$(4) = f4$
MenuItem$(5) = f5$
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
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
ope$ = MenuItem(ChooseItem)
IF ope$ = f1$ THEN
CLS
PRINT "User 1"
PRINT SVAR9$
INPUT "Initialised? (0 for no, other numbers will be treated as yes"; innit
INPUT "Enter your name"; nanme$
INPUT "Enter your password"; non$
INPUT "GIVE ADMIN RIGHTS??? (1 - YES, ANY OTHER NUMBER WILL BE NO)"; sus
PRINT "Ready to Write"
PRINT "Press any key to write the values ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
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
CLS
PRINT "User 2"
PRINT SVAR9$
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
CLS
PRINT "User 3"
PRINT SVAR9$
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
CLS
PRINT "User 4"
PRINT SVAR9$
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
CLS
PRINT "User 5"
PRINT SVAR9$
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

ELSEIF set$ = "Enable and disable apps" THEN
CLS
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
PRINT "Choose app (Will enable/disable)"
BMenuItem$(1) = "Console"
BMenuItem$(2) = "Trident Shell Manager"
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
CLOSE #1
OPEN "C:\ES7\CONFIG\CONSOLE.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
PRINT "Console Enabled"
ELSE
SHELL ("DEL C:\ES7\CONFIG\CONSOLE.SYS")
PRINT "Console Disabled"
END IF
SLEEP 2
GOTO 125

ELSEIF app$ = "Trident Shell Manager" THEN
	 OPEN "C:\ES7\CONFIG\SM.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
OPEN "C:\ES7\CONFIG\SM.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
PRINT "Trident Shell Manager Enabled"
ELSE
SHELL ("DEL C:\ES7\CONFIG\SM.SYS")
PRINT "Trident Shell Manager Disabled"
END IF
SLEEP 2
GOTO 125

ELSEIF app$ = "Edit" THEN
	 OPEN "C:\ES7\CONFIG\WORD.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
OPEN "C:\ES7\CONFIG\WORD.SYS" FOR OUTPUT AS #1
WRITE #1, 0
CLOSE #1
PRINT "Edit Enabled"
ELSE
SHELL ("DEL C:\ES7\CONFIG\WORD.SYS")
END IF
PRINT "Edit Disabled"
SLEEP 2
GOTO 125
		ELSE
		BEEP
		GOTO 125

		END IF
		END IF
124 END

