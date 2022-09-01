ViridianCityMons:
	db $19
	db 4,RATTATA			;modified
	db 4,PIDGEY				;modified
	db 4,RATTATA			;modified
	db 4,PIDGEY				;modified
	db 5,SANDSHREW			;modified
	IF DEF(_RED)
		db 4,VULPIX
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 4,VULPIX
	ENDC
	db 4,SLUGMA				;modified
	db 5,SLUGMA				;modified
	IF DEF(_RED)
		db 7,DROWZEE		;modified
		db 7,CUBONE			;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 7,DROWZEE		;modified
		db 7,CUBONE			;modified
	ENDC
	db $00