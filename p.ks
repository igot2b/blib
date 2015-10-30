//use blib!
//use pcore!
run blib_pcore.

//PLAUNCH - START THE PLANE
RUN blib_plaunch.

//TRY NOT TO CRASH
UNTIL AIRSPEED < 0.001 AND ALT:RADAR < 1 {
    //PCRUSE
    run blib_pcruse2.
    
	//BEST GUESS UNTIL NOW
	pcruse2(22500,1500). // blib_p_mk3 maxspeed and "bounce" - working direct mode
	
	//SOFTER TRY, NOT WORKING
	//pcruse2(22500,1200). // blib_p_mk3 direct
	//pcruse2(25000,1240). // blib_p_mk3 higher after direct
	
	//SHOOT FOR THE STARS
	run blib_porbit.
	
	//Time to deorbit?
	UNTIL ALTITUDE > APOAPSIS - 100 {
		PPRINT ("p", "pAPO - 100                      ", 2,1).
	}
	
	//DEORBIT
	run blib_pdeorb.
	
    //PLAND
    run blib_pland.
}

//PEXIT
run blib_pexit.