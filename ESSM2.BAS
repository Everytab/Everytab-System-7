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
OPEN "C:\ES7\CONFIG\VAR.SYS" FOR INPUT AS #1
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
CLOSE #1
CLOSE #1
CLS
COLOR 7, 0
CLS
SHELL "C:"
SHELL "CD \"
PRINT VAR1$
SLEEP 1
CLS
PRINT ""
PRINT VAR2$
SLEEP 1
SHELL ("DEL C:\ES7\CONFIG\SUPER.SYS")
PRINT "[DEBUG] Deleted file?"
OPEN "C:\ES7\CONFIG\0.SYS" FOR BINARY AS #1
PRINT "Fresh install Detected"
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
END IF

CLOSE #1
CLOSE #1
CLOSE #1
OPEN "C:\ES7\CONFIG\0.SYS" FOR INPUT AS #1
INPUT #1, e
INPUT #1, f$
INPUT #1, PASSE$
CLOSE #1
OPEN "C:\ES7\CONFIG\NULL.SYS" FOR INPUT AS #1
INPUT #1, e9
INPUT #1, f9$
INPUT #1, PASSE9$
CLOSE #1
IF PASSE9$ = PASSE$ THEN
    GOTO 1111234
ELSE
    PRINT "The System has been tampered with, ES/7 cannot continue (non functional as of v319)"
END IF
1111234
PRINT "System state has been verified"
SLEEP 1
ESID = 0
SMID = 0
Build$ = "15.03.319"
Ver$ = "December Release (16-12 Beta)"
CLS
164 SLEEP 1
CLS
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
BMP$ = "C:\ES7\BMP\BOOT.BMP"
OPEN BMP$ FOR BINARY AS #1
IF LOF(1) = 0 THEN
    CLOSE #1
    PRINT "ES/7 15.03.319"
    SLEEP 10
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
        PRINT VAR12$
        PRINT
        DO
        LOOP UNTIL INKEY$ <> ""
        SHELL "fdapm warmboot"
    ELSEIF fes = 2 THEN
        PRINT "Post-Install Setup"
        PRINT VAR17$
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
    PRINT VAR13$
    SLEEP 2.5
    CLS
    SLEEP 1
    CLS
    COLOR 15, 1
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
    PRINT "UserChooser v1"
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
        feee$ = f$
        PASSEe$ = PASSE$
    ELSEIF log$ = f1$ THEN
        IF e1 = 0 THEN
            PRINT VAR15$
        ELSE
            feee$ = f1$
            PASSEe$ = PASSE1$
        END IF
    ELSEIF log$ = f2$ THEN
        IF e2 = 0 THEN
            PRINT VAR15$
        ELSE
            feee$ = f2$
            PASSEe$ = PASSE2$
        END IF
    ELSEIF log$ = f3$ THEN
        IF e3 = 0 THEN
            PRINT VAR15$
        ELSE
            feee$ = f3$
            PASSEe$ = PASSE3$
        END IF
    ELSEIF log$ = f4$ THEN
        IF e4 = 0 THEN
            PRINT VAR15$
        ELSE
            feee$ = f4$
            PASSEe$ = PASSE4$
        END IF
    ELSEIF log$ = f5$ THEN
        IF e5 = 0 THEN
            PRINT VAR15$
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
        GOTO 112345

    END IF
    99282
    SLEEP 1
    SHELL "C:"
    SHELL "CD \"
    CLS
    CLS
    PLAY "C"
    PLAY "D"
    PLAY "E"
    PLAY "E"
    PLAY "A"
    123 CLS
    MenuItem$(1) = VAR20$
    MenuItem$(2) = VAR21$
    MenuItem$(3) = VAR22$
    MenuItem$(4) = VAR23$
    PRINT "Welcome "; f$
    PRINT VAR17$
    PRINT ""
    PRINT ""
    PRINT VAR24$
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

    IF ope$ = VAR21$ THEN
        CLS
        PRINT VAR21$
        PRINT VAR17$
        99 CLS
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
    IF ope$ = VAR21$ THEN
        124 CLS
        BMenuItem$(1) = VAR25$
        BMenuItem$(2) = VAR26$
        BMenuItem$(3) = VAR27$
        BMenuItem$(4) = VAR28$
        BMenuItem$(5) = VAR29$
        BMenuItem$(6) = VAR30$
        BMenuItem$(7) = VAR31$
        PRINT VAR21$
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
        IF app$ = VAR25$ THEN
            125 CLS

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
            SHELL ("C:\ES7\BIN\SET.EXE")
            SHELL ("DEL C:\ES7\CONFIG\SUPER.SYS")
            GOTO 124
        ELSEIF app$ = VAR26$ THEN

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

            CLS
            OPEN "C:\ES7\CONFIG\WEB.SYS" FOR BINARY AS #1
            IF LOF(1) = 0 THEN
                CLOSE #1
                PRINT VAR32$
                SLEEP 2
                GOTO 124
            ELSE
                SHELL ("C:")
                CHDIR ("LYNX")
                ON ERROR GOTO 113
                SHELL ("DOSLYNX.EXE")
                ON ERROR GOTO 113
                GOTO 124
            END IF
        ELSEIF app$ = VAR27$ THEN
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
                SHELL "C:"
                CHDIR "\"
                ON ERROR GOTO 113
                CHDIR "WORD"
                ON ERROR GOTO 113
                SHELL "C:\WORD\WORD.COM"
                ON ERROR GOTO 113
                GOTO 124
            END IF
        ELSEIF app$ = VAR29$ THEN
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
            CLS
            PRINT "Backup and Restore was terminated unexpectedly,"
            PRINT "or was not found"
            PRINT "FAIL Code : 00000004"
            PRINT "Please Contact an ES/7 DevPartner"
            SLEEP 3
            GOTO 124
        ELSEIF app$ = VAR31$ THEN
            GOTO 123
        ELSE
            BEEP
            GOTO 112
        END IF
    ELSEIF ope$ = VAR22$ THEN

        CLOSE #1
        CLOSE #1
        CLOSE #1
        CLOSE #1
        CLOSE #1
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
            PRINT VAR34$
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
                PRINT VAR36$
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
                PRINT VAR36$
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
                PRINT VAR36$
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
        END IF
    ELSEIF ope$ = VAR23$ THEN
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
            PRINT VAR36$
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
112345
CLS
PRINT "Login > Invalid Password"
PRINT "================================================================================"
PRINT ""
PRINT "The Password which was entered is not correct."
PLAY "A"
SLEEP 3
CLS
GOTO 95



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

