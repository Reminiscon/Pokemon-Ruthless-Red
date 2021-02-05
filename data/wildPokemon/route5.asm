Route5Mons:
	db $0F
	IF DEF(_RED)
		db 24,MANKEY					;modified
		db 24,MANKEY					;modified
		db 24,MANKEY					;modified
		db 24,MANKEY					;modified
		db 25,ABRA						;modified
		db 25,ABRA						;modified
		db 25,ABRA						;modified
		db 26,EXEGGCUTE					;modified
		db 26,EXEGGCUTE					;modified
		db 27,KADABRA					;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 24,MANKEY					;modified
		db 24,MANKEY					;modified
		db 24,MANKEY					;modified
		db 24,MANKEY					;modified
		db 25,ABRA						;modified
		db 25,ABRA						;modified
		db 25,ABRA						;modified
		db 26,EXEGGCUTE					;modified
		db 26,EXEGGCUTE					;modified
		db 27,KADABRA					;modified
	ENDC
	db $00