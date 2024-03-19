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
OPEN "DRIVE.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
DRV$ = "C"
PRINT "WARNING : DRIVE.SYS was not found, assuming root as C:\"
ELSE
OPEN "DRIVE.SYS" FOR INPUT AS #2
INPUT #2, DRV$
CLOSE #2
CLOSE #2
END IF
Build$ = "0.1.340"
Ver$ = "N/A"
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
OPEN "C:\ES7\CONFIG\UBAR.SYS" FOR INPUT AS #1
INPUT #1, UBAR
CLOSE #1
IF UBAR = 0 THEN
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
INPUT "This will DELETE ALL USERS on the system, Proceed? (Y/N)"; e$
		IF e$ = "Y" THEN
OPEN DRV$ + ":\ES7\CONFIG\STATE.SYS" FOR OUTPUT AS #1
		WRITE #1, 0
		CLOSE #1
SHELL ("DEL " + DRV$ + ":\ES7\USER\*.*")
		PRINT "The system has halted"
		PRINT "Press CTRL, ALT and DEL to restart"
		10
                GOTO 10
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
		PRINT "About System/7:-"
		PRINT ""
		PRINT "The System/7 Version "; Ver$
		PRINT "OS Build "; Build$
		PRINT ""
		PRINT "Credits :"
		PRINT "Developers - Everytab, greenland"
		PRINT "System/7 runs on a modified OpenDOS Install"
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
50
		PRINT "User Settings"
PRINT SVAR9$
PRINT "  Options are"
PRINT "  1) Add a user"
PRINT "  2) Delete a user"
PRINT "  3) Grant/Revoke Admin"
PRINT "  4) Cancel"
PRINT ""
PRINT ""
INPUT "Choose an option"; userop
IF userop = 1 THEN

INPUT "Enter the username"; USR$
INPUT "Enter the password"; USRP$
INPUT "Administrator? (1 - Yes, 0 - No)"; USRA
PRINT "Ready to Write"
PRINT "Press any key to write the values ..."
PRINT
DO
LOOP UNTIL INKEY$ <> ""
ON ERROR GOTO 110
OPEN DRV$ + ":\ES7\USER\" + USR$ + ".USR" FOR OUTPUT AS #1
WRITE #1, USRP$
WRITE #1, USRA
CLOSE #1
PRINT "Completed, press any key to exit"
PRINT
DO
LOOP UNTIL INKEY$ <> ""
GOTO 50
110 PRINT "Username exceeded 8 letters, aborted"
PRINT "Press any key to continue"
DO
LOOP UNTIL INKEY$ <> ""
GOTO 50
ELSEIF userop = 2 THEN
51
CLS
PRINT "Delete User"
PRINT SVAR9$
PRINT ""
INPUT "Username >"; USR$
        ON ERROR GOTO 110
	OPEN DRV$ + ":\ES7\USER\" + USR$ + ".USR" FOR BINARY AS #1
	IF LOF(1) = 0 THEN
	BEEP
	PRINT "Invalid User"
	SHELL ("DEL " + DRV$ + ":\ES7\USER\" + USR$ + ".USR")
	SLEEP 3
	GOTO 51
	END IF
   CLOSE #1
   CLOSE #1
OPEN DRV$ + ":\ES7\USER\" + USR$ + ".USR" FOR INPUT AS #1
INPUT #1, PASS$
INPUT #1, UBAR
CLOSE #1
CLOSE #1
 INPUT "Are you sure you want to DELETE the user?(Y/N)"; CONF$
 IF CONF$ = "Y" THEN
 SHELL ("DEL " + DRV$ + ":\ES7\USER\" + USR$ + ".USR")
 PRINT "Completed"
 SLEEP 2
 GOTO 50
ELSEIF CONF$ = "y" THEN
 SHELL ("DEL " + DRV$ + ":\ES7\USER\" + USR$ + ".USR")
 PRINT "Completed"
 SLEEP 2
 GOTO 50
 ELSEIF CONF$ = "N" THEN
 GOTO 50
ELSEIF CONF$ = "n" THEN
 GOTO 50
 ELSE
 BEEP
 PRINT "Invalid option entered"
 SLEEP 2
 GOTO 51
 END IF
ELSEIF userop = 3 THEN
52 CLS
PRINT "Revoke/Give Admin"
PRINT SVAR9$
PRINT ""
INPUT "Username >"; USR$
	OPEN DRV$ + ":\ES7\USER\" + USR$ + ".USR" FOR BINARY AS #1
	IF LOF(1) = 0 THEN
	BEEP
	PRINT "Invalid User"
	SHELL ("DEL " + DRV$ + ":\ES7\USER\" + USR$ + ".USR")
	SLEEP 3
	GOTO 52
	END IF
   CLOSE #1
   CLOSE #1
OPEN DRV$ + ":\ES7\USER\" + USR$ + ".USR" FOR INPUT AS #1
INPUT #1, PASS$
INPUT #1, UBAR
CLOSE #1
CLOSE #1
IF UBAR = 1 THEN
INPUT "Are you sure you want to REVOKE ADMIN from the user?(Y/N)"; CONF$
 IF CONF$ = "Y" THEN
 UBAR = 0
OPEN DRV$ + ":\ES7\USER\" + USR$ + ".USR" FOR OUTPUT AS #1
WRITE #1, PASS$
WRITE #1, UBAR
CLOSE #1
CLOSE #1
 PRINT "Completed"
 SLEEP 2
 GOTO 50
 ELSEIF CONF$ = "N" THEN
 GOTO 50
 ELSE
 BEEP
 PRINT "Invalid option entered"
 SLEEP 2
 GOTO 51
END IF
ELSEIF UBAR = 0 THEN
INPUT "Are you sure you want to GIVE ADMIN to the user?(Y/N)"; CONF$
 IF CONF$ = "Y" THEN
 UBAR = 1
OPEN DRV$ + ":\ES7\USER\" + USR$ + ".USR" FOR OUTPUT AS #1
WRITE #1, PASS$
WRITE #1, UBAR
CLOSE #1
CLOSE #1
 PRINT "Completed"
 SLEEP 2
 GOTO 50
 ELSEIF CONF$ = "N" THEN
 GOTO 50
 ELSE
 BEEP
 PRINT "Invalid option entered"
 SLEEP 2
 GOTO 51
END IF
END IF
ELSEIF userop = 4 THEN

GOTO 125
ELSE
BEEP
GOTO 50
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

