REM System/7 Source Code
REM (c) 2022-2024, System/7 Developers
REM
REM TODO : Add some stuff here
REM
REM
REM
REM

OPTION BASE 1
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
DIM DMenuItem(3) AS STRING
DIM DChooseItem AS INTEGER
DIM DXMenuPosn AS INTEGER
DIM DYMenuPosn AS INTEGER
DIM EMenuItem(2) AS STRING
DIM EChooseItem AS INTEGER
DIM EXMenuPosn AS INTEGER
DIM EYMenuPosn AS INTEGER
DECLARE FUNCTION Hex2Bin$ (Hcs$)
CLS
COLOR 0, 7
PRINT "S/7"
SLEEP 5
COLOR 7, 0
CLS
CLS
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
OPEN DRV$ + ":\ES7\CONFIG\UBAR.SYS" FOR OUTPUT AS #1
        WRITE #1, 0
        CLOSE #1
        CLOSE #1
OPEN DRV$ + ":\ES7\CONFIG\SM.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
    CLOSE #1
ELSE
    SHELL (DRV$ + ":\ES7\SYSTEM\TLPM.EXE")
END IF
REM Loading the Language files

OPEN DRV$ + ":\ES7\CONFIG\VAR.SYS" FOR INPUT AS #1
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
INPUT #1, VAR22$
INPUT #1, VAR23$
INPUT #1, VAR24$
INPUT #1, VAR25$
INPUT #1, VAR26$
INPUT #1, VAR27$
INPUT #1, VAR28$
INPUT #1, VAR29$
INPUT #1, VAR30$
INPUT #1, VAR31$
INPUT #1, VAR32$
INPUT #1, VAR33$
INPUT #1, VAR34$
INPUT #1, VAR35$
INPUT #1, VAR36$
INPUT #1, VAR37$
INPUT #1, VAR38$
INPUT #1, VAR39$
INPUT #1, VAR40$
INPUT #1, VAR41$
INPUT #1, VAR42$
INPUT #1, VAR43$
INPUT #1, VAR44$
INPUT #1, VAR45$
INPUT #1, VAR46$
INPUT #1, VAR47$
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
       
        GOTO 51

    END IF
99
    SLEEP 1
    SHELL DRV$ + ":"
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
    GOTO 123
END IF
CLS
CLS
123 CLS
CLS
MenuItem$(1) = VAR20$
MenuItem$(2) = VAR21$
MenuItem$(3) = VAR22$
MenuItem$(4) = VAR23$
PRINT "Welcome to MENU Manager, "; USR$
PRINT VAR17$
PRINT ""
PRINT ""
PRINT VAR24$
PRINT ""
COLOR 15, 1
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

IF ope$ = VAR21$ THEN
    REM one of the Session Manager leftovers... Quite useful tho
        SHELL (DRV$ + ":\ES7\SYSTEM\OP.EXE")
        GOTO 123

ELSEIF ope$ = VAR20$ THEN
124 CLS
    REM idk if I m replacing thing with user defined programs, but that would be painful.
    BMenuItem$(1) = VAR25$
    BMenuItem$(2) = VAR28$
    BMenuItem$(3) = VAR29$
    BMenuItem$(4) = VAR30$
    BMenuItem$(5) = VAR31$
    PRINT VAR20$
    PRINT VAR17$
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
    
    app$ = BMenuItem(BChooseItem)

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
    IF app$ = VAR25$ THEN
125 CLS
        CLOSE #1
        CLOSE #1
        IF UBAR = 1 THEN
        SHELL (DRV$ + ":\ES7\SYSTEM\SET.EXE")
        SHELL ("DEL " + DRV$ + ":\ES7\CONFIG\SUPER.SYS")
        GOTO 124
        ELSE
        PRINT "Settings is not available for this user"
        SLEEP 2
        GOTO 124
        END IF
    ELSEIF app$ = VAR28$ THEN

        CLOSE #1
        CLOSE #1
        
        OPEN DRV$ + ":\ES7\CONFIG\WORD.SYS" FOR BINARY AS #1
        IF LOF(1) = 0 THEN
            CLOSE #1
            PRINT VAR33$
            SLEEP 2
            GOTO 124
        ELSE
            SHELL (DRV$ + ":\OPENDOS\EDIT.COM")
            ON ERROR GOTO 113
            GOTO 124
        END IF
    ELSEIF app$ = VAR29$ THEN
        CLS
        REM another relic from Session manager, the calculator is far better now.
        SHELL (DRV$ + ":\ES7\SYSTEM\CALC.EXE")
        GOTO 124
    ELSEIF app$ = VAR30$ THEN

        CLOSE #1
        CLOSE #1
        CLOSE #1
        IF UBAR = 1 THEN
        GOTO 124
        SHELL (DRV$ + ":\ES7\SYSTEM\PLUS.EXE")
        SHELL ("DEL " + DRV$ + ":\ES7\CONFIG\SUPER.SYS")
        ELSE
        PRINT "Backup and Restore is not available for this user"
        SLEEP 2
        GOTO 124
        END IF
    ELSEIF app$ = VAR31$ THEN
        GOTO 123
    ELSE
        BEEP
        GOTO 112
    END IF
ELSEIF ope$ = VAR22$ THEN

    CLOSE #1
    CLOSE #1

    OPEN DRV$ + ":\ES7\CONFIG\CONSOLE.SYS" FOR BINARY AS #1
    IF LOF(1) = 0 THEN
        CLOSE #1
        PRINT VAR34$
        SLEEP 2
        GOTO 123
    ELSE
        CLS
        CLS
        PRINT ("Type Exit to return to ES/7")
        SHELL (DRV$ + ":\COMMAND.COM")
        CLS
        CLS
        GOTO 123
    END IF
111 CLS
        
    SLEEP 1.5
    COLOR 15, 4
    PLAY "A"
    CLS
    CLS
    PRINT ""
    PRINT ""
    PRINT VAR36$
    PRINT ""
    PRINT "FAIL : 00000001"
    PRINT "OS Revision "; Build$
    PRINT ""
    PRINT ""
    PRINT VAR37$
    PRINT VAR38$
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
    PRINT VAR36$
    PRINT ""
    PRINT "FAIL : 00000002"
    PRINT "OS Revision "; Build$
    PRINT ""
    PRINT ""
    PRINT VAR37$
    PRINT VAR38$
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
    PRINT VAR36$
    PRINT ""
    PRINT "FAIL : 00000004"
    PRINT "OS Revision "; Build$
    PRINT ""
    PRINT ""
    PRINT VAR37$
    PRINT VAR38$
    SLEEP 5
    CLS
    SLEEP 1
    GOTO 90
    

114
        
    SLEEP 1.5
    PRINT "FAIL : 00000010"
    PRINT VAR37$
    PRINT "The system has been corrupted, Please reinstall"
ELSEIF ope$ = VAR23$ THEN
    CLS
    DMenuItem$(1) = VAR40$
    DMenuItem$(2) = VAR42$
    DMenuItem$(3) = VAR43$
    PRINT VAR44$
    PRINT VAR17$
    PRINT VAR45$
    PRINT ""
    DChooseItem = 1
    DXMenuPosn = 1
    DYMenuPosn = 5
    
    GOSUB DDrawMenu
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
    
    shut$ = DMenuItem(DChooseItem)

    GOTO 52

DDrawMenu:
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
52
    IF shut$ = VAR40$ THEN
        PRINT "Preparing to Exit"
        SLEEP 2
        CLS
        SLEEP 1
        COLOR 7, 0
        CLS
        CLS
        PRINT "Ending the Session"
        SLEEP 5
        CLS
        CLOSE #1
        SLEEP 1.5
        CLOSE #1
        CLOSE #1
        PRINT "The system has been halted"
        PRINT "It is now safe to power off the computer"
        PRINT ""
        PRINT " - To restart, press CTRL, ALT and DEL."
423
        GOTO 423
    ELSEIF shut$ = VAR42$ THEN
        CLS
        GOTO 95
    ELSEIF shut$ = VAR43$ THEN
        GOTO 123
    ELSE
        BEEP
        GOTO 52
    END IF
ELSE
    GOTO 112
END IF
51
CLS
PRINT VAR46$
PRINT VAR17$
PRINT ""
PRINT VAR47$
PLAY "A"
SLEEP 3
CLS
GOTO 95


7773
PRINT "FAIL : 0000004"
PRINT "OS Revision "; Build$
PRINT ""
PRINT ""
PRINT "The System cannot continue"
PRINT "Starting Recovery"
SLEEP 3
ON ERROR GOTO 1010
CHAIN DRV$ + ":\ES7\REC\HDST.EXE"
1010
PRINT "FATAL : Recovery not found"
PRINT "Please reinstall from the ES/7 CD-ROM"
10000
GOTO 10000

91
PRINT "User Error : Username cannot exceed 8 characters"
PRINT "Press any key to continue"
DO
LOOP UNTIL INKEY$ <> ""
GOTO 96

DEFINT A-Z

