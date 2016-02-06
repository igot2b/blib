//use blib_raw!
//use pcore!
//run blib_pcore.

//PLAUNCH - START THE PLANE
//RUN blib_plaunch.

// staging, throttle, steering, go
WHEN STAGE:LIQUIDFUEL < 0.1 THEN {
    STAGE.
    PRESERVE.
}
LOCK THROTTLE TO 1.
//LOCK STEERING TO R(0,0,-90) + HEADING(90,22).
STAGE.
WAIT UNTIL SHIP:ALTITUDE > 1000.

// P-loop setup
SET g TO KERBIN:MU / KERBIN:RADIUS^2.
LOCK accvec TO SHIP:SENSORS:ACC - SHIP:SENSORS:GRAV.
LOCK gforce TO accvec:MAG / g.
LOCK dthrott TO 0.05 * (1.2 - gforce).

SET thrott TO 1.
LOCK THROTTLE to thrott.

UNTIL SHIP:ALTITUDE > 40000 {
    SET thrott to thrott + dthrott.
    WAIT 0.1.
}


//print "Starting an upward rotation.".
//SET SHIP:CONTROL:PITCH TO 1.
//SET now to time:seconds.
//WAIT until time:seconds > now + 20.
//SET SHIP:CONTROL:PITCH to 0.0.

//print "Giving control back to the player now.".
//SET SHIP:CONTROL:NEUTRALIZE to True.





//PEXIT
//run blib_pexit.