//use blib_plaunch!
PPRINT ("plaunch", "hai.", 2,2).

//STARTSETUP - use launch sanity!
IF SHIP:SURFACESPEED > 10 AND SHIP:AIRSPEED > 10 {
    PPRINT ("plaunch", "You're already flying...                      ", 2,1).
} ELSE {
	PPRINT ("plaunch", "Brake. Light. Pitch 22 degrees.                    ", 2,1).
	BRAKES ON.
	LIGHTS ON.
	LOCK STEERING TO HEADING(90,22).

	//WAIT FOT INPUT
	//PPRINT ("plaunch", "Please press 1 to start.       ", 2,2).
	//WAIT UNTIL AG1.

	//COUNTDOWN AND LAUNCH
	PPRINT ("plaunch", "Counting down:                            ", 2,1).
	FROM {local countdown is 10.} UNTIL countdown = 3 STEP {SET countdown to countdown - 1.} DO {
		PPRINT ("plaunch", "T-" + countdown + "                        ", 2,2).
		WAIT 1. // pauses the script here for 1 second.
	}
	PPRINT ("plaunch", "T-3 Spooling up.                    ", 2,2).
	SET blib_pthrottle to 1.
	STAGE.
	WAIT 1.
	PPRINT ("plaunch", "T-2                               ", 2,2).
	WAIT 1.
	PPRINT ("plaunch", "T-1 Releasing brakes.              ", 2,2).
	BRAKES OFF.
	WAIT 1.
	PPRINT ("plaunch", "T-0 Rolling.                       ", 2,2).
	
	//LIFTOFF
	UNTIL SURFACESPEED > 60 AND ALT:RADAR > 100 {
		PPRINT ("plaunch", "Speeding up.                     ", 2,2).
	}
	GEAR ON. GEAR OFF.
	
	PPRINT ("plaunch", "Gear Up.                     ", 2,2).
}

WAIT 2.

//BB
PPRINT ("plaunch", "kthxbye.                   ", 2,2).