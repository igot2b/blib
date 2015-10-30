	//ressources
	PRINT "THESE ARE ALL THE RESOURCES active in this stage:".
	SET RESLIST TO STAGE:RESOURCES.
	FOR RES IN RESLIST {
		PRINT "Resource " + RES:NAME.
		PRINT "    value = " + RES:AMOUNT.
		PRINT "    which is "
			  + ROUND(100*RES:AMOUNT/RES:CAPACITY)
			  + "% full.".
	}