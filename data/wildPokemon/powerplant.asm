PowerPlantMons:
	db $0A
	db 38,ELECTRODE							;modified
	db 40,ELECTRODE							;modified
	db 42,ELECTRODE							;modified
	db 38,RAICHU							;modified
	db 42,RAICHU							;modified
	db 38,MAGNETON							;modified
	db 42,MAGNETON							;modified
	IF DEF(_RED)
		db 39,ELECTABUZZ
		db 43,ELECTABUZZ
		db 44,PORYGON
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 33,ELECTABUZZ
		db 33,RAICHU
		db 36,RAICHU
	ENDC
	db $00
