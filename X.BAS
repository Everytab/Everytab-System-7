REM This tha anti exit app
REM Also used if ESSM is missing
OPEN "C:\ESSM.EXE" FOR BINARY AS #1
REM Checking if ESSM exists
IF LOF(1) = 0 THEN
REM its 0 bytes so nope
CLOSE #1
	    COLOR 15, 4
	    PLAY "A"
	    CLS
	    CLS
	    PRINT ""
	    PRINT ""
	    PRINT "The system detected an critical processing"
	    PRINT "error at process 'KERNEL_NOT_FOUND'"
	    PRINT ""
	    PRINT "FAIL : 00000009"
	    PRINT ""
	    PRINT ""
	    PRINT "The system has halted. Record the FAIL code"
	    PRINT "of the error and contact an Everytab System/7 Developer"
PRINT "The kernel of ES/7 could not be found, please reinstall using upgrade"
10
REM its a crash, 00000009
GOTO 10

ELSE
REM Fake memory error if ESSM exists
PRINT "*VÌ3VÄ8‹ Ì?VÌDVÌIVÌRVÄW‹ ÌVÌ VÌ"
BEEP
20
GOTO 20
REM system now stuck in endless loop, person has to restart
END IF

