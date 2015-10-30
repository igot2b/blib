//use blib!
//use pdeorb!

PPRINT ("pdeorb", "hai. Deorbiting.                        ", 2,1).

IF PERIAPSIS > 70000 {
	LOCK STEERING TO RETROGRADE.
	PPRINT ("pdeorb", "Retrograde. Wait 15.          ", 2,2).
	WAIT 15.

	set blib_pthrottle to 1.
	PPRINT ("pdeorb", "Burn retrograde.             ", 2,2).
	WAIT UNTIL PERIAPSIS < blib_palt_service.
	set blib_pthrottle to 0.
	LOCK STEERING TO PROGRADE.
	PPRINT ("pdeorb", "[??] Prograde.                  ", 2,2).	
	
}

IF PERIAPSIS < blib_palt_service + 1 {

	SET blib_pthrottle TO 0.

	//DEORBIT UNTIL SERVICE ALT
	UNTIL ALTITUDE < blib_palt_service {
		//prograde until 60k
		IF ALTITUDE > 60000 {
			LOCK STEERING TO PROGRADE.
			PPRINT ("pdeorb", "[??] Prograde.               ", 2,2).	
		}	
		//safe reentry when under 60k.
		IF ALTITUDE > blib_palt_service + 1000 AND ALTITUDE < 60000 {
			LOCK STEERING TO HEADING(blib_pdir,-1).
			BRAKES ON.
			PPRINT ("pdeorb", "[-1] Reentering safely.               ", 2,2).
		}
		//break when reaching service + buffer.
		IF ALTITUDE < blib_palt_service + 1000 {
			BREAK.	
		}
	}
}
UNTIL SHIP:AIRSPEED < 800 {
	PPRINT ("pdeorb", "[??] Slowing down to 800m/s.             ", 2,2).
}
BRAKES OFF.
PPRINT ("pdeorb", "kthxbye                        ", 2,2).