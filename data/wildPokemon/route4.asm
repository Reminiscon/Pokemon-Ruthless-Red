Route4Mons:
	db $14
	IF DEF(_RED)
		db 17,PIDGEY					;modified
		db 17,PIDGEY					;modified
		db 17,PONYTA					;modified
		db 18,PONYTA					;modified
		db 18,PIDGEOTTO					;modified
		db 18,PIDGEOTTO					;modified
		db 19,PIDGEOTTO					;modified
		db 19,POLIWAG					;modified
		db 19,POLIWAG					;modified
		db 20,BULBASAUR					;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 17,PIDGEY					;modified
		db 17,PIDGEY					;modified
		db 17,PONYTA					;modified
		db 18,PONYTA					;modified
		db 18,PIDGEOTTO					;modified
		db 18,PIDGEOTTO					;modified
		db 19,PIDGEOTTO					;modified
		db 19,POLIWAG					;modified
		db 19,POLIWAG					;modified
		db 20,BULBASAUR					;modified
	ENDC
	db $00