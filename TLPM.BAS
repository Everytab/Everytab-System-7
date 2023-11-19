OPTION BASE 1
REM The Trident Login & Permission Manager
REM Basically a cut down version of ESSM2.BAS which removes the user interface, but leaves behind the permission system.
REM Maintained by Everytab and greenland mainly.
DIM CMenuItem(6) AS STRING
DIM CChooseItem AS INTEGER
DIM CXMenuPosn AS INTEGER
DIM CYMenuPosn AS INTEGER
WIDTH 80, 35
OPEN "CONS:" FOR OUTPUT AS #7
PRINT #7, "TLPM has started"
CLOSE #7
90 CLS
WIDTH 80, 35
REM Loading the Language files
OPEN "C:\ES7\CONFIG\TVAR.SYS" FOR INPUT AS #1
ON ERROR GOTO 7773
INPUT #1, VAR1$
INPUT #1, VAR2$
INPUT #1, VAR3$
INPUT #1, VAR4$
INPUT #1, VAR5$
INPUT #1, VAR6$
INPUT #1, VAR7$
INPUT #1, VAR8$
INPUT #1, VAR9$
INPUT #1, VAR10$
INPUT #1, VAR11$
INPUT #1, VAR12$
INPUT #1, VAR13$
INPUT #1, VAR14$
INPUT #1, VAR15$
INPUT #1, VAR16$
INPUT #1, VAR17$
INPUT #1, VAR18$
INPUT #1, VAR19$
INPUT #1, VAR20$
INPUT #1, VAR21$
CLOSE #1
CLOSE #1
CLS
REM Setting colour
COLOR 7, 0
CLS
SHELL "C:"
SHELL "CD \"
PRINT VAR1$
SLEEP 3
PRINT ""
PRINT VAR2$
SLEEP 1
REM the anti admin abuse checker
SHELL ("DEL C:\ES7\CONFIG\SUPER.SYS")
REM checking if system has been initialized.
OPEN "C:\ES7\CONFIG\0.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
	ased = 1
	CLOSE #1
END IF
IF ased = 1 THEN
	CLOSE #1
	CLOSE #1
	OPEN "C:\ES7\CONFIG\0.SYS" FOR OUTPUT AS #1
	WRITE #1, 0
	WRITE #1, 0
	WRITE #1, 0
	PRINT VAR3$
	SLEEP 1
	CLOSE #1
ELSE
GOTO 1123456
END IF
1123456
CLOSE #1
CLOSE #1
CLOSE #1
OPEN "C:\ES7\CONFIG\0.SYS" FOR INPUT AS #1

INPUT #1, e
INPUT #1, f$
INPUT #1, PASSE$
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
SLEEP 3

REM --Very important--
REM
REM Build$ - Build no.
REM Ver$ - Version name
REM ESID - no use yet, will prolly be used for updater once that exists (if that will ever exist)
REM SMID - useless, might repurpose

ESID = 0
SMID = 0
Build$ = "16.00.339"
Ver$ = "Project Alpha"
164 SLEEP 1
PRINT VAR4$
SLEEP 1
CLS
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
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
CLOSE #1
	CLOSE #1
	PRINT "Everytab System/7 "; Ver$
		PRINT "Version "; Build$
		SLEEP 2
		PRINT "Starting Trident Shell Manager..."

	SLEEP 3
SCREEN 0
CLS
REM alright system ready, lesgo
	CLS
	PRINT VAR13$
	SLEEP 2.5
	CLS
	SLEEP 1
	CLS
	COLOR 15, 1
WIDTH 80, 50
	CLS
95 CLS
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
REM Getting multi user logins was PAIN
	PRINT "Login"
PRINT VAR17$
	PRINT VAR14$
	
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
		IF CCmmnd$ = "1" OR CCmmnd$ = CHR$(79) THEN CChooseItem = UBOUND(CMenuItem)

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
			PRINT VAR15$
			SLEEP 3
			GOTO 95
		ELSE
			feee$ = f1$
			PASSEe$ = PASSE1$
		END IF
	ELSEIF log$ = f2$ THEN
		IF e2 = 0 THEN
			PRINT VAR15$
			SLEEP 3
			GOTO 95
		ELSE
			feee$ = f2$
			PASSEe$ = PASSE2$
		END IF
	ELSEIF log$ = f3$ THEN
		IF e3 = 0 THEN
			PRINT VAR15$
			SLEEP 3
			GOTO 95
		ELSE
			feee$ = f3$
			PASSEe$ = PASSE3$
		END IF
	ELSEIF log$ = f4$ THEN
		IF e4 = 0 THEN
			PRINT VAR15$
			SLEEP 3
			GOTO 95
		ELSE
			feee$ = f4$
			PASSEe$ = PASSE4$
		END IF
	ELSEIF log$ = f5$ THEN
		IF e5 = 0 THEN
			PRINT VAR15$
			SLEEP 3
			GOTO 95
		ELSE
			feee$ = f5$
			PASSEe$ = PASSE5$
		END IF
	ELSE
		GOTO 112
	END IF
	CLS
	PRINT VAR16$
	PRINT VAR17$
	PRINT ""
	PRINT ""
	PRINT VAR18$
	PRINT ""
	PRINT "Username : "; feee$
	PRINT VAR19$
	PRINT ""
97 INPUT ">"; PASS$
98 IF PASS$ = PASSEe$ THEN
		GOTO 99282
	ELSE
			REM extra long label cause why not, not like the program will crash if the user enters the wwrong password too many times.
		GOTO 112345

	END IF

99282
	SLEEP 1
	SHELL "C:"
	SHELL "CD \"
	CLS
	CLS
			CLOSE #1
			CLOSE #1
			CLOSE #1
			CLOSE #1
			CLOSE #1
			CLOSE #1
			CLOSE #1
						REM admin check worked flawlessly for some reason, idk why.
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
						SHELL ("C:\ES7\BIN\SM.EXE")
						SHELL ("DEL C:\ES7\CONFIG\SM.SYS")
						CLS
						PRINT "Unfortunately, Trident Shell Manager has stopped"
						PRINT "Trident Shell Manager has been disabled, Please Diagnose the issue through non-GUI Mode"
						PRINT "You can choose to start recovery to reinstall TSM"
						PRINT "The system cannot continue, Please press CTRL + ALT + DEL to restart the system"
7202
						GOTO 7202
112345
REM Incorrect Password
CLS
PRINT VAR20$
PRINT VAR17$
PRINT ""
PRINT VAR21$
PLAY "A"
SLEEP 3
CLS
GOTO 95
DEFINT A-Z
7773
PRINT "Could not find translation file, reboot now"
7774
GOTO 7774
112 CLS
		
	SLEEP 1.5
	COLOR 15, 4
	PLAY "A"
	CLS
	CLS
	PRINT ""
	PRINT ""
	PRINT ""
	PRINT "FAIL : 00000002"
	PRINT "OS Revision "; Build$
	PRINT ""
	PRINT ""
	SLEEP 5
	CLS
	SLEEP 1
	GOTO 90

