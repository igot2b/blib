//use blib!
SET TERMINAL:WIDTH to 60.
SET TERMINAL:HEIGHT to 20.
CLEARSCREEN.

//STATUS PRINT
FUNCTION PSTATUS {
PARAMETER pcol.
PARAMETER prow.
    PRINT "pASP: "+ROUND(AIRSPEED)+" m/s      " AT (pcol,prow).
	PRINT "pVSP: "+ROUND(VERTICALSPEED)+" m/s      " AT (pcol,prow+1).
	PRINT "pALT: "+ROUND(ALTITUDE,2)+" m      " AT (pcol,prow+2).
	PRINT "rALT: "+ROUND(ALT:RADAR,2)+" m      " AT (pcol,prow+3).
	PRINT " Orbital Stuff      " AT (pcol,prow+4).
	PRINT "pAPO: "+ROUND(APOAPSIS,2)+" m      " AT (pcol,prow+5).
	PRINT "pPER: "+ROUND(PERIAPSIS,2)+" m      " AT (pcol,prow+6).
	//SPALTE 2
	PRINT "spOX: "+ROUND(SHIP:OXIDIZER)+" kg      " AT (pcol+25,prow).
	PRINT "spLF: "+ROUND(SHIP:LIQUIDFUEL)+" kg      " AT (pcol+25,prow+1).
}

//CUSTOM PRINT
FUNCTION PPRINT {
PARAMETER pmodule.
PARAMETER ptext.
PARAMETER pcol.
PARAMETER prow.
    PRINT "["+ROUND(MISSIONTIME)+"]["+pmodule+"] "+ptext AT (pcol,prow).
	PSTATUS (2,5).
}

//TAKE CONTROL
SAS OFF.

//GATHER STATS
SET blib_OX_start to SHIP:OXIDIZER.
SET blib_fuel_start to SHIP:LIQUIDFUEL.

//FLYING DEFINITION
SET blib_pdir to 90. // flight direction
SET blib_palt_low TO 400. // 100
SET blib_palt_service TO 15000. // z.B. 20k (startlevel)
SET blib_pIA_min to 0.001. // plane Intake Air limit
SET blib_pAS_min to 120. // plane stable Air Speed limit 
SET blib_pAS_des to 200. // plane stable Air Speed desired 
SET blib_pthrottle to 0. // start with zero throttle

//FLYING CALCULATED
SET blib_palt_mid TO blib_palt_service/4. // z.B. 5k
SET blib_palt_high TO blib_palt_service-(blib_palt_service/5). // z.B. 16k (20k-4000)

//INITIATE SHIT
PRINT "============================================================" AT (0,0).
PPRINT ("p", "hai. you called p. ", 2,1).
PPRINT ("pcore", "hai. Defaults loaded: "+blib_palt_service+":"+blib_palt_high+":"+blib_palt_mid, 2,2).
PRINT "============================================================" AT (0,3).
LOCK THROTTLE TO blib_pthrottle.

//LOAD FILES
SWITCH TO 0.