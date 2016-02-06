//use blib!
//use pcore!
run blib_pcore.

//PLAUNCH - START THE PLANE
//RUN blib_plaunch.

//TRY NOT TO CRASH
UNTIL AG8 {
  
	//PFLY
	run blib_pfly.
	pfly.
  
	//PCRUSE
	//run blib_pcruse2.  
	//BEST GUESS UNTIL NOW
	//pcruse2(23000,1500). // blib_p_mk3 maxspeed and "bounce" - working direct mode
	
	
	//PORBIT
	//SHOOT FOR THE STARS
	//run blib_porbit.
	//Time to deorbit?
	//UNTIL ALTITUDE > APOAPSIS - 100 {
	//	PPRINT ("p", "pAPO - 100                      ", 2,1).
	//}
	//DEORBIT
	//run blib_pdeorb.

	
	//PLAND
	//run blib_pland.
}

//PEXIT
run blib_pexit.