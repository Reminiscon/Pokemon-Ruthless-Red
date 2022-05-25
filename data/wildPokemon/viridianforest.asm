ForestMons:
	db $08
	IF DEF(_RED)
		db 6,GASTLY		;modified
		db 6,CATERPIE
		db 6,WEEDLE
		db 7,KAKUNA		;modified
		db 7,METAPOD	;modified
		db 6,VENONAT	;modified
		db 6,PARAS  	;modified
		db 7,PIKACHU	;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 6,GASTLY		;modified
		db 6,CATERPIE
		db 6,WEEDLE
		db 7,KAKUNA		;modified
		db 7,METAPOD	;modified
		db 6,VENONAT	;modified
		db 6,PARAS  	;modified
		db 7,PIKACHU	;modified
	ENDC
	db 7,PINSIR			;modified
	db 9,PINSIR			;modified
	db $00