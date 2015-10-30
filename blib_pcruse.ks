//use blib!
//use pcruse!

PPRINT ("pcruse", "hai. You has full throttle.", 2,6).

PRINT "=======================================" AT (0,7).
LOCK THROTTLE TO 1.

//FLYING
UNTIL SHIP:ALTITUDE > blib_palt_service*2 OR ALT:RADAR < blib_palt_low/1.5 {
    WHEN SHIP:MAXTHRUST > 0 THEN {
    IF AIRSPEED < blib_pAS_min*2 {
        LOCK STEERING TO HEADING(blib_pdir,0). // Soft Up!
        PPRINT ("pcruse", "[0] Speeding up.                   ", 2,6).
    } ELSE {
        WHEN ALT:RADAR > blib_palt_low AND SHIP:ALTITUDE < blib_palt_mid THEN {
                LOCK STEERING TO HEADING(blib_pdir,80). // Up!
                PPRINT ("pcruse", "[80] Rising up.                   ", 2,6).
            }
        WHEN SHIP:ALTITUDE > blib_palt_mid AND SHIP:ALTITUDE < blib_palt_high THEN {
            LOCK STEERING TO HEADING(blib_pdir,40). // Soft.
            PPRINT ("pcruse", "[40] Rising soft.                   ", 2,6).
        }
        WHEN SHIP:ALTITUDE > blib_palt_high AND SHIP:ALTITUDE < blib_palt_service THEN {
            IF VERTICALSPEED < 0 {
                LOCK STEERING TO HEADING(blib_pdir,10). // Softer - Wenn Fallen dann stärker steigen.
                PPRINT ("pcruse", "[10] Rising softer.                   ", 2,6).
            } ELSE {
                LOCK STEERING TO HEADING(blib_pdir,5). // Softest - Sonst sanft steigen.
                PPRINT ("pcruse", "[5] Riding softest.                   ", 2,6).
            }
        }
        WHEN SHIP:INTAKEAIR > blib_pIA_min AND SHIP:ALTITUDE > blib_palt_service THEN {
            IF VERTICALSPEED < 0 {
                LOCK STEERING TO HEADING(blib_pdir,4). // Softer
                PPRINT ("pcruse", "[4] Riding most softest.                   ", 2,6).
            } ELSE  {
                LOCK STEERING TO HEADING(blib_pdir,2). // Hold!
                PPRINT ("pcruse", "[2] Riding servicelevel.                   ", 2,6).
            }
        }
//        WHEN SHIP:INTAKEAIR > blib_pIA_min AND SHIP:ALTITUDE > blib_palt_service+2000 THEN {
//            IF VERTICALSPEED < 0 OR AIRSPEED < blib_pAS_min {
//                LOCK STEERING TO HEADING (blib_pdir,-10). // Dive back down.
//                PPRINT ("pcruse", "[-10] Riding down.                   ", 2,6).
//            } ELSE  {
//                LOCK STEERING TO HEADING (blib_pdir,-4). // Gliding.
//                PPRINT ("pcruse", "[-4] Gliding course.                   ", 2,6).
//            }
//        }
    }
    }
    WHEN SHIP:MAXTHRUST = 0 THEN {
        WHEN SHIP:INTAKEAIR < blib_pIA_min AND SHIP:ALTITUDE > blib_palt_service THEN {
            LOCK STEERING TO HEADING (blib_pdir,-10). // Dive back down.
            PPRINT ("pcruse", "[-10] Riding down.                   ", 2,6).
        }
        WHEN SHIP:INTAKEAIR > blib_pIA_min AND SHIP:ALTITUDE > blib_palt_low*4 THEN {
            LOCK STEERING TO HEADING (blib_pdir,-6). // Gliding.
            PPRINT ("pcruse", "[-6] Gliding.                   ", 2,6).
        }
    }
    WAIT 0.
}

//BB
PPRINT ("pcruse", "kthxbye.                   ", 2,6).