//use blib!

//print "IR Iavailable: " + ADDONS:IR:AVAILABLE.
//Print "Groups:".
for g in ADDONS:IR:GROUPS
{
	//PPRINT ("pfly", g:NAME + " contains " + g:SERVOS:LENGTH + " servos:", 2,13).
	for s in g:servos
	{
		//PRINT AIRSPEED.
		if AIRSPEED > 220
		{
			//PPRINT("pfly", " + s:NAME + ", position: " + s:POSITION.
			if g:NAME = "LWing"
			{
				s:MOVETO(15, 1).
				//PPRINT ("pfly", "LWing to 15                          ", 2,14).
			}
			else if g:NAME = "RWing"
			{
				s:MOVETO(45, 1).
				//PPRINT ("pfly", "RWing to 45                          ", 2,15).
			}
		}
		else
		//SPREAD WINGS
		{
			//print "    " + s:NAME + ", position: " + s:POSITION.
			if g:NAME = "LWing"
			{
				s:MOVETO(-15, 1).
				//PPRINT ("pfly", "LWing to -15                          ", 2,14).
			}
			else if g:NAME = "RWing"
			{
				s:MOVETO(15, 1).
				//PPRINT ("pfly", "RWing to 15                          ", 2,15).
			}
		}
	}
}