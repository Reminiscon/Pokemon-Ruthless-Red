Route5Mons:
	db $0F
	IF DEF(_RED)
		db 24,MANKEY					;modified
		db 24,KOFFING					;modified
		db 25,MANKEY					;modified
		db 25,KOFFING					;modified
		db 25,ABRA						;modified
		db 25,WEEPINBELL				;modified
		db 26,ABRA						;modified
		db 26,WEEPINBELL				;modified
		db 27,KADABRA					;modified
		db 28,SUDOWOODO					;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 24,MANKEY					;modified
		db 24,KOFFING					;modified
		db 25,MANKEY					;modified
		db 25,KOFFING					;modified
		db 25,ABRA						;modified
		db 25,WEEPINBELL				;modified
		db 26,ABRA						;modified
		db 26,WEEPINBELL				;modified
		db 27,KADABRA					;modified
		db 28,SUDOWOODO					;modified
	ENDC
	db $00