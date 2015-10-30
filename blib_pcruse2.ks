//use blib!
//use pcruse2!

FUNCTION pcruse2 {
	PARAMETER servicelevel.
	PARAMETER speedlimit.

	PPRINT ("pcruse2", "hai. SpL: "+speedlimit+". SeL: "+servicelevel+". AG2 to exit.", 2,1).

	//FLYING CONDITIONS
	// blib_pdir to 90. // flight direction
	// blib_palt_low TO 500. // 100
	SET blib_palt_service TO servicelevel. // z.B. 20k
	// blib_pIA_min to 0.001. // plane Intake Air limit
	// blib_pAS_min to 50. // plane stable Air Speed limit 
	// blib_pAS_des to 200. // plane stable Air Speed desired 
	// blib_pthrottle to 0. // start with zero throttle
	//FLYING CALCULATED
	SET blib_palt_mid TO blib_palt_service/4. // z.B. 5k
	SET blib_palt_high TO blib_palt_service-(blib_palt_service/5). // z.B. 16k (20k-4000)

	//WAIT FOR TAKEOFF AFTER SANITY CHECK
	IF AIRSPEED < 10 AND ALTITUDE < 50000 {
		SET blib_pthrottle to 1.
		IF BRAKES ON THEN BRAKES OFF.
	}
	
	UNTIL ALT:RADAR > blib_palt_low {
		PPRINT ("pcruse2", "[??] Low.                        ", 2,2).
	}
	
	
	UNTIL ALT:RADAR < blib_palt_low {
		IF AG2 BREAK.
		IF SHIP:INTAKEAIR > 0.01 AND SHIP:MAXTHRUST < 0.01 {
			LOCK STEERING TO HEADING(blib_pdir,-10).
			PPRINT ("pcruse2", "[-10] Gliding.                         ", 2,2).
		}
		IF AIRSPEED < blib_pAS_min {
			LOCK STEERING TO HEADING(blib_pdir,-20).
			PPRINT ("pcruse2", "[-20] Needing speed.               ", 2,2).
		}
		IF AIRSPEED > blib_pAS_min AND AIRSPEED < blib_pAS_des AND SHIP:MAXTHRUST > 0.01 {
			LOCK STEERING TO HEADING(blib_pdir,20).
			PPRINT ("pcruse2", "[20] Trying to rise.                 ", 2,2).
		}
		IF AIRSPEED > blib_pAS_des AND SHIP:MAXTHRUST > 0.01 {
			SET blib_pthrottle to 1.
			IF SHIP:ALTITUDE < blib_palt_mid {
				LOCK STEERING TO HEADING(blib_pdir,45).
				PPRINT ("pcruse2", "[45] MID to HIGH.                        ", 2,2).
			} ELSE IF SHIP:ALTITUDE < blib_palt_high {
				LOCK STEERING TO HEADING(blib_pdir,30).
				PPRINT ("pcruse2", "[30] HIGH to SERVICE.                  ", 2,2).
			} ELSE IF SHIP:ALTITUDE < blib_palt_service {
				LOCK STEERING TO HEADING(blib_pdir,8).
				PPRINT ("pcruse2", "[8] REACH SERVICE.                   ", 2,2).    
			}
			IF SHIP:ALTITUDE > blib_palt_service AND SHIP:ALTITUDE < blib_palt_service+blib_palt_service*0.1 {
				LOCK STEERING TO HEADING(blib_pdir,3).
				PPRINT ("pcruse2", "[3] HOLD SERVICE.                   ", 2,2).     
			}
			IF SHIP:ALTITUDE > blib_palt_service+blib_palt_service*0.1 {
				LOCK STEERING TO HEADING(blib_pdir,-7).
				PPRINT ("pcruse2", "[-7] BACK to SERVICE.           ", 2,2).    
			}
		}
		IF AIRSPEED > speedlimit {
				BREAK.
		}
		WAIT 0.
	}

	//BB
	PPRINT ("pcruse2", "kthxbye.                           ", 2,2).
}