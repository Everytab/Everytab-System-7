OPTION BASE 1
REM Load MENU Variables
REM The Everytab System/7 (Possible rename to DOS/7)
REM Maintained by Everytab and greenland mainly.
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
WIDTH 80, 35
OPEN "C:\ES7\CONFIG\SM.SYS" FOR BINARY AS #1
IF LOF(1) = 0 THEN
    CLOSE #1
ELSE
    SHELL ("C:\ES7\BIN\TLPM.EXE")
END IF
REM Loading the Language files
OPEN "C:\ES7\CONFIG\VAR.SYS" FOR INPUT AS #1
ON ERROR GOSUB FAIL4
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
OPEN "C:\ES7\CONFIG\0.SYS" FOR INPUT AS #1
INPUT #1, e
INPUT #1, f$
INPUT #1, PASSE$
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
CLOSE #1
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
    GOSUB OOBE
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
        initUser$ = f$
        PASSEe$ = PASSE$
    ELSEIF log$ = f1$ THEN
        IF e1 = 0 THEN
            PRINT VAR15$
            SLEEP 3
            GOTO 95
        ELSE
            initUser$ = f1$
            PASSEe$ = PASSE1$
        END IF
    ELSEIF log$ = f2$ THEN
        IF e2 = 0 THEN
            PRINT VAR15$
            SLEEP 3
            GOTO 95
        ELSE
            initUser$ = f2$
            PASSEe$ = PASSE2$
        END IF
    ELSEIF log$ = f3$ THEN
        IF e3 = 0 THEN
            PRINT VAR15$
            SLEEP 3
            GOTO 95
        ELSE
            initUser$ = f3$
            PASSEe$ = PASSE3$
        END IF
    ELSEIF log$ = f4$ THEN
        IF e4 = 0 THEN
            PRINT VAR15$
            SLEEP 3
            GOTO 95
        ELSE
            initUser$ = f4$
            PASSEe$ = PASSE4$
        END IF
    ELSEIF log$ = f5$ THEN
        IF e5 = 0 THEN
            PRINT VAR15$
            SLEEP 3
            GOTO 95
        ELSE
            initUser$ = f5$
            PASSEe$ = PASSE5$
        END IF
    ELSE
        GOSUB FAIL2
    END IF
    CLS
    PRINT VAR16$
    PRINT VAR17$
    PRINT ""
    PRINT ""
    PRINT VAR18$
    PRINT ""
    PRINT "Username : "; initUser$
    PRINT VAR19$
    PRINT ""
97 INPUT ">"; PASS$
98 IF PASS$ = PASSEe$ THEN
        GOTO 99282
    ELSE
        REM extra long label cause why not, not like the program will crash if the user enters the wwrong password too many times.
        GOSUB PassWrong

    END IF
99282
    SLEEP 1
    SHELL "C:"
    SHELL "CD \"
        
    GOTO 123
END IF
CLS
CLS
123 CLS
CLS
REM OS/2 menu clone lego
MenuItem$(1) = VAR20$
MenuItem$(2) = VAR21$
MenuItem$(3) = VAR22$
MenuItem$(4) = VAR23$
PRINT "Welcome to MENU Manager, "; f$
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
REM DON'T NUKE THE BELOW LINES, IT BREAKS THE PROGRAM EVEN THOUGH ITS NOT USED.
ope$ = MenuItem(ChooseItem)

IF ope$ = VAR21$ THEN
    CLS
    ap4p$ = "GUI"
    IF ap4p$ = "DIR" THEN
        SHELL "DIR /w"

    ELSEIF ap4p$ = "CD" THEN
        INPUT "Choose the directory to change to"; CD$
        ON ERROR GOSUB FAIL1
        CHDIR CD$
        ON ERROR GOSUB FAIL1
    ELSEIF ap4p$ = "DRIVE" THEN
        INPUT "Choose the Drive to change to"; D$
        ON ERROR GOSUB FAIL1
        SHELL D$
        ON ERROR GOSUB FAIL1

    ELSEIF ap4p$ = "RUN" THEN
        INPUT "Type the file name of the program"; r$
        ON ERROR GOSUB FAIL1
        SHELL r$
        ON ERROR GOSUB FAIL1

    ELSEIF ap4p$ = "GUI" THEN
        REM one of the Session Manager leftovers... Quite useful tho
        SHELL ("C:\ES7\BIN\OP.EXE")
        GOTO 123
    ELSE
        PLAY "A"
        GOTO 123
    END IF
END IF
IF ope$ = VAR20$ THEN
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
    IF app$ = VAR25$ THEN
125 CLS
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
        REM also don't worry, settings checks for SUPER.sys
        SHELL ("C:\ES7\BIN\SET.EXE")
        SHELL ("DEL C:\ES7\CONFIG\SUPER.SYS")
        GOTO 124
    ELSEIF app$ = VAR28$ THEN

        CLOSE #1
        CLOSE #1
        CLOSE #1
        CLOSE #1
        CLOSE #1
        CLOSE #1
        CLOSE #1
        OPEN "C:\ES7\CONFIG\WORD.SYS" FOR BINARY AS #1
        IF LOF(1) = 0 THEN
            CLOSE #1
            PRINT VAR33$
            SLEEP 2
            GOTO 124
        ELSE
            SHELL ("C:\OPENDOS\EDIT.COM")
            ON ERROR GOSUB FAIL3
            GOTO 124
        END IF
    ELSEIF app$ = VAR29$ THEN
        CLS
        REM another relic from Session manager, the calculator is far better now.
        SHELL ("C:\ES7\BIN\CALC.EXE")
        GOTO 124
    ELSEIF app$ = VAR30$ THEN

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
        GOTO 7773
    ELSEIF app$ = VAR31$ THEN
        GOTO 123
    ELSE
        BEEP
        GOSUB FAIL2
    END IF
ELSEIF ope$ = VAR22$ THEN
GOSUB CMD

ELSEIF ope$ = VAR23$ THEN
    CLS
    DMenuItem$(1) = VAR40$
    DMenuItem$(2) = VAR41$
    DMenuItem$(3) = VAR42$
    DMenuItem$(4) = VAR43$
    PRINT VAR44$
    PRINT VAR17$
    PRINT VAR45$
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
    IF shut$ = VAR40$ THEN
        PRINT "Preparing to Exit"
        SLEEP 2
        CLS
        SLEEP 1
        COLOR 7, 0
        CLS
        CLS
        PRINT "Ending the Session"
        PLAY "E"
        PLAY "F"
        PLAY "C"
        SLEEP 5
        CLS
        CLOSE #1
        SLEEP 1.5
        PRINT VAR36$
        PRINT ""
        PRINT "FAIL : 00000000"
        PRINT "OS Revision "; Build$
        PRINT ""
        PRINT ""
        PRINT "The system has halted, it is now safe to turn off the computer"
       
423
        GOTO 423
    ELSEIF shut$ = VAR41$ THEN
        PRINT "Preparing to restart the ES/7 session"
        CLS
        SLEEP 1
        CLS
        COLOR 7, 0
        CLS
        CLS
        PRINT "Restarting session"
        PLAY "E"
        PLAY "F"
        PLAY "C"

        SLEEP 5
        CLS
        SLEEP 1
        GOTO 90

    ELSEIF shut$ = VAR42$ THEN
        CLS
        PLAY "A"
        PLAY "E"
        PLAY "E"
        PLAY "D"
        PLAY "C"

        GOTO 95
    ELSEIF shut$ = VAR43$ THEN
        GOTO 123
    ELSE
        BEEP
        GOTO 6465
    END IF
ELSE
    GOSUB FAIL2
END IF


SUB FAIL1        
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
END SUB

SUB FAIL2
        
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
END SUB

SUB FAIL3        
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
    END SUB

SUB FAIL10
        
    SLEEP 1.5
    PRINT "FAIL : 00000010"
    PRINT VAR37$
    PRINT "The system has been corrupted, Please reinstall"
    GOTO 10000
END SUB


SUB FAIL4
PRINT "FAIL : 0000004"
PRINT "OS Revision "; Build$
PRINT ""
PRINT ""
PRINT "The System cannot continue"
PRINT "Starting Recovery"
CHAIN "C:\ES7REC\HDST.EXE"
ON ERROR GOTO 1010
1010
PRINT "FATAL : Recovery not found"
PRINT "Please reinstall from the ES/7 CD-ROM"
10000
GOTO 10000
END SUB

SUB OOBE
REM doesn't look like that, time for OOBE
    CLS
    CLS
    COLOR 15, 6
    CLS
    PLAY "C"
    PLAY "F"
    PLAY "F"
1232 CLS
    PRINT VAR5$
    PRINT VAR17$
    PRINT ""
    PRINT VAR6$
    PRINT VAR7$
    PRINT VAR8$
    PRINT VAR9$
    INPUT fes
    IF fes = 1 THEN
        CLS
        PRINT VAR5$
        PRINT VAR17$
        PRINT VAR10$
        INPUT "Enter your name"; nanme$
        INPUT "Enter your password"; non$
        PRINT VAR11$
        OPEN "C:\ES7\CONFIG\0.SYS" FOR OUTPUT AS #1
        WRITE #1, 1
        PRINT
        DO
        LOOP UNTIL INKEY$ <> ""
        WRITE #1, nanme$
        WRITE #1, non$
        CLOSE #1
        CLOSE #1
        CLOSE #1
        CLOSE #1
        SHELL ("COPY C:\ES7\CONFIG\0.SYS C:\ES7\CONFIG\NULL.SYS")
        CLS
        PRINT VAR12$
        PRINT
7201
        GOTO 7201
    ELSEIF fes = 2 THEN
        REM prolly going to remove this
        PRINT "Post-Install Setup"
        PRINT VAR17$
        PRINT "This will restore the User File from C:\ESBACK"
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
        PRINT "Restart by using ctrl + alt + del"
        GOTO 7201
        
    ELSE
        BEEP
        GOTO 1232
    END IF
END SUB

SUB PassWrong
CLS
PRINT VAR46$
PRINT VAR17$
PRINT ""
PRINT VAR47$
PLAY "A"
SLEEP 3
CLS
GOTO 95
END SUB

SUB CMD

CLOSE #1
CLOSE #1

    OPEN "C:\ES7\CONFIG\CONSOLE.SYS" FOR BINARY AS #1
    IF LOF(1) = 0 THEN
        CLOSE #1
        PRINT VAR34$
        SLEEP 2
        GOTO 123
    ELSE
        CLS
        COLOR 7, 0
        CLS
        PRINT ("Type Exit to return to ES/7")
        SHELL ("C:\COMMAND.COM")
        GOTO 123
    END IF
END SUB

DEFINT A-Z
