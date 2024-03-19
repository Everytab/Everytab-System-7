OPTION BASE 1
REM The Trident Login & Permission Manager
REM Basically a cut down version of ESSM2.BAS which removes the user interface, but leaves behind the permission system.
REM Maintained by Everytab and greenland mainly.
DIM CMenuItem(6) AS STRING
DIM CChooseItem AS INTEGER
DIM CXMenuPosn AS INTEGER
DIM CYMenuPosn AS INTEGER
WIDTH 80, 35
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
90 CLS
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
SHELL DRV$ + ":"
SHELL "CD \"
PRINT VAR1$
PRINT ""
PRINT VAR2$
REM checking if system has been initialized.
OPEN DRV$ + ":\ES7\CONFIG\STATE.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
    ased = 1
END IF
CLOSE #1

IF ased = 1 THEN
    CLOSE #1
    CLOSE #1
    OPEN DRV$ + ":\ES7\CONFIG\STATE.SYS" FOR OUTPUT AS #1
    WRITE #1, 0
    PRINT VAR3$
    SLEEP 1
    CLOSE #1
ELSE
    GOTO 50
END IF
50
CLOSE #1
OPEN DRV$ + ":\ES7\CONFIG\STATE.SYS" FOR INPUT AS #1
INPUT #1, e
CLOSE #1
SLEEP 1

REM --Very important--
REM
REM Build$ - Build no.
REM Ver$ - Version name
REM ESID - no use yet, will prolly be used for updater once that exists (if that will ever exist)
REM SMID - useless, might repurpose

ESID = 0
SMID = 0
Build$ = "0.1.345"
Ver$ = "N/A"
164 SLEEP 1
PRINT VAR4$
SLEEP 1
CLS
CLS
CLOSE #1
PRINT "System/7 "; Ver$
PRINT "Version "; Build$
SLEEP 2
PRINT "Starting MENU Manager..."

SLEEP 3
SCREEN 0
CLS
REM is the system ready?
PRINT e
IF e = 0 THEN
    REM doesn't look like that, time for OOBE
    CLS
    CLS
    COLOR 15, 6
    CLS
1232 CLS
        PRINT VAR5$
        PRINT VAR17$
        PRINT VAR10$
        INPUT "Enter your password"; non$
        LET UBAR = 1
        PRINT VAR11$
        OPEN DRV$ + ":\ES7\CONFIG\STATE.SYS" FOR OUTPUT AS #1
        WRITE #1, 1
        CLOSE #1
        CLOSE #1
PRINT
        DO
        LOOP UNTIL INKEY$ <> ""
        OPEN DRV$ + ":\ES7\USER\ADMIN.USR" FOR OUTPUT AS #1
        WRITE #1, non$
        WRITE #1, UBAR
        CLOSE #1
        SHELL ("COPY " + DRV$ + ":\ES7\USER\ADMIN.USR " + DRV$ + ":\ES7\CONFIG\NULL.SYS")
        CLS
        PRINT VAR12$
        PRINT
7201
        GOTO 7201
    
ELSE
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
96 CLS
    PRINT VAR16$
    PRINT VAR17$
    PRINT ""
    PRINT ""
    PRINT VAR18$
    PRINT ""
    INPUT "Username >"; USR$
    ON ERROR GOTO 91
    OPEN DRV$ + ":\ES7\USER\" + USR$ + ".USR" FOR BINARY AS #1
    IF LOF(1) = 0 THEN
    BEEP
    PRINT "Invalid User"
    SHELL ("DEL " + DRV$ + ":\ES7\USER\" + USR$ + ".USR")
    SLEEP 3
    GOTO 96
    END IF
   CLOSE #1
   CLOSE #1
OPEN DRV$ + ":\ES7\USER\" + USR$ + ".USR" FOR INPUT AS #1
INPUT #1, PASSEe$
INPUT #1, UBAR
CLOSE #1
CLOSE #1
97 INPUT "Password >"; PASS$
98 IF PASS$ = PASSEe$ THEN
		GOTO 99
	ELSE
			REM extra long label cause why not, not like the program will crash if the user enters the wwrong password too many times.
		GOTO 51

	END IF

99
	SLEEP 1
	SHELL DRV$ +":"
	SHELL "CD \"
IF UBAR = 1 THEN
    OPEN DRV$ + ":\ES7\CONFIG\UBAR.SYS" FOR OUTPUT AS #1
        WRITE #1, 1
        CLOSE #1
        CLOSE #1
    ELSE
    OPEN DRV$ + ":\ES7\CONFIG\UBAR.SYS" FOR OUTPUT AS #1
        WRITE #1, 0
        CLOSE #1
        CLOSE #1
    END IF
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
					SHELL ("C:\ES7\BIN\SM.EXE")
						SHELL ("DEL C:\ES7\CONFIG\SM.SYS")
						CLS
						PRINT "Unfortunately, Trident Shell Manager has stopped"
						PRINT "Trident Shell Manager has been disabled, Please Diagnose the issue through non-GUI Mode"
						PRINT "You can choose to start recovery to reinstall TSM"
						PRINT "The system cannot continue, Please press CTRL + ALT + DEL to restart the system"
7202
						GOTO 7202
51
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

91
PRINT "User Error : Username cannot exceed 8 characters"
PRINT "Press any key to continue"
DO
LOOP UNTIL INKEY$ <> ""
GOTO 96