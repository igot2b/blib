//use blib!
//use pcruse2!


PPRINT ("pfly", "hai. I'll assist. AG8 to exit.              ", 2,1).

UNLOCK STEERING.
UNLOCK THROTTLE.



//FLYING CONDITIONS
// blib_pdir to 90. // flight direction
// blib_palt_low TO 500. // 100
//SET blib_palt_service TO servicelevel. // z.B. 20k
// blib_pIA_min to 0.001. // plane Intake Air limit
// blib_pAS_min to 50. // plane stable Air Speed limit 
// blib_pAS_des to 200. // plane stable Air Speed desired 
// blib_pthrottle to 0. // start with zero throttle
//FLYING CALCULATED
//SET blib_palt_mid TO blib_palt_service/4. // z.B. 5k
//SET blib_palt_high TO blib_palt_service-(blib_palt_service/5). // z.B. 16k (20k-4000)

//WAIT FOR TAKEOFF AFTER SANITY CHECK
//IF AIRSPEED < 10 AND ALTITUDE < 50000 {
//	SET blib_pthrottle to 1.
//	IF BRAKES ON THEN BRAKES OFF.
//}

//UNTIL ALT:RADAR > blib_palt_low {
//	PPRINT ("pcruse2", "[??] Low.                        ", 2,2).
//}


UNTIL AG8 {

	//AUTO WING SWEP
	//F14 WING SWEP
	run blib_pflya_f14.


	//AUTO LANDING MODE
	IF ALT:RADAR < 200 AND AIRSPEED < 200 {
		GEAR ON.
		PPRINT ("pfly", "Landing Mode ON.                       ", 2,2).
	}
	ELSE {
		GEAR OFF.
		PPRINT ("pfly", "Landing Mode OFF.                       ", 2,2).
	}

	
	
	WAIT 0.
	PPRINT ("pfly", "ACTIVE.                           ", 2,2).	
}

//BB
PPRINT ("pfly", "kthxbye.                           ", 2,2).