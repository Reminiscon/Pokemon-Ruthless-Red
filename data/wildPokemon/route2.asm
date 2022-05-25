Route2Mons:
	db $19
	db 6,MANKEY				;modified
	db 6,MANKEY				;modified
	db 6,ODDISH				;modified
	db 6,ODDISH				;modified
	db 7,SANDSHREW			;modified
	IF DEF(_RED)
		db 7,SANDSHREW
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 7,SANDSHREW
	ENDC
	db 8,SLUGMA				;modified
	db 8,SLUGMA				;modified
	IF DEF(_RED)
		db 8,SLOWPOKE		;modified
		db 9,SNEASEL		;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 8,SLOWPOKE		;modified
		db 9,SNEASEL		;modified
	ENDC
	db $00
