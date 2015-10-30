//use blib!
//use porbit!

PPRINT ("porbit", "hai. Orbiting? Press AG2 to exit.        ", 2,1).

//TRY TO ORBIT  when under 70k.
IF APOAPSIS < 70000 AND SHIP:OXIDIZER > 0.001 {
	//Cycle Mode?
	IF SHIP:IntakeAir < 0.001 {
		TOGGLE AG9.
	}
	//ORBIT?
	UNTIL APOAPSIS > 85000 {
		LOCK STEERING TO HEADING(blib_pdir,20). // SHOOT FOR THE STARS
		PPRINT ("porbit", "Shoot for the stars                 ", 2,2).
		set blib_pthrottle to 0.8.
	}
	
	// SHOOT FOR ORBIT
	UNTIL ALTITUDE > APOAPSIS -1 {
		LOCK STEERING TO PROGRADE.
		set blib_pthrottle to 0.
		PPRINT ("porbit", "Waiting for Apoapsis.                ", 2,2).
	}
	
	//RAISE PERIAPSIS ON APOAPSIS.
	UNTIL PERIAPSIS > 70000 OR SHIP:OXIDIZER < 0.001 {
		set blib_pthrottle to 1.
		PPRINT ("porbit", "BURN BABY!                           ", 2,2).
	}
	set blib_pthrottle to 0.
	PPRINT ("porbit", "kthxbye.                           ", 2,2).
}

WAIT UNTIL AG2.