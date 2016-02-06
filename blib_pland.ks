//use blib!
//use pland!
PPRINT ("pland", "hai. Approaching ground.                 ", 2,1).
//set blib_pthrottle to 0.3.


//LANDINGSETUP - use landing sanity!
UNTIL ALT:RADAR < 40 {
IF SHIP:GROUNDSPEED < 1 AND SHIP:AIRSPEED < 1 {
    PPRINT ("pland", "You're already landed...                   ", 2,2).
} ELSE {
		WHEN ALT:RADAR < blib_palt_low THEN {
			LOCK STEERING TO HEADING(blib_pdir,0).
			PPRINT ("pland", "[-1] Smooth.                   ", 2,2).
		}
		WHEN ALT:RADAR > blib_palt_low AND SHIP:ALTITUDE < blib_palt_mid THEN {
				LOCK STEERING TO HEADING(blib_pdir,-20).
				PPRINT ("pland", "[-20] Riding down.                   ", 2,2).
				BRAKES OFF.
		}
		WHEN SHIP:ALTITUDE > blib_palt_mid THEN {
				LOCK STEERING TO HEADING(blib_pdir,-10).
				PPRINT ("pland", "[-10] Smooth down.                   ", 2,2).
				IF AIRSPEED > 800 {
					BRAKES ON.
				}
				ELSE {
					BRAKES OFF.
				}
		}
    }
}


//LANDING
LOCK STEERING TO HEADING(blib_pdir,5).
PPRINT ("pland", "[5] Landing position.                   ", 2,2).
PPRINT ("pland", "Throttle to 0. Gear down.                   ", 2,2).
set blib_pthrottle to 0.
GEAR ON.
WAIT UNTIL ALT:RADAR < 20.
PPRINT ("pland", "Brakes on.                   ", 2,2).
BRAKES ON.
WAIT UNTIL ALT:RADAR < 1.
PPRINT ("pland", "Chutes out.                   ", 2,2).
CHUTES ON.
WAIT UNTIL AIRSPEED < 1 and ALT:RADAR < 1.

//BB
PPRINT ("pland", "kthxbye.                   ", 2,2).