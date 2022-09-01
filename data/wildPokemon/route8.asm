Route8Mons:
	db $30 ;$0F
	IF DEF(_RED)
		db 39,PIDGEOT					;modified
		db 39,PIDGEOT					;modified
		db 40,PIDGEOT					;modified
		db 40,PIDGEOT					;modified
		db 39,BUTTERFREE				;modified
		db 39,BEEDRILL					;modified
		db 40,BEEDRILL					;modified
		db 40,BUTTERFREE				;modified
		db 40,DODRIO					;modified
		db 44,DODRIO					;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 39,PIDGEOT					;modified
		db 39,PIDGEOT					;modified
		db 40,PIDGEOT					;modified
		db 40,PIDGEOT					;modified
		db 39,BUTTERFREE				;modified
		db 39,BEEDRILL					;modified
		db 40,BEEDRILL					;modified
		db 40,BUTTERFREE				;modified
		db 40,DODRIO					;modified
		db 44,DODRIO					;modified
	ENDC
	db $00