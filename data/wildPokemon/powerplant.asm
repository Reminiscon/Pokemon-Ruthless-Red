PowerPlantMons:
	db $30 ;$0A
	db 41,ELECTRODE							
	db 41,ELECTABUZZ						
	db 42,ELECTRODE							
	db 42,ELECTABUZZ						
	db 43,ELECTRODE							
	db 43,ELECTABUZZ						
	db 41,MAGNETON							
	IF DEF(_RED)
		db 42,MAGNETON
		db 43,MAGNETON
		db 44,PORYGON
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 42,MAGNETON
		db 43,MAGNETON
		db 44,PORYGON
	ENDC
	db $00
