Route6Mons:
	db $0F
	IF DEF(_RED)
		db 27,MEOWTH						;modified
		db 27,MEOWTH						;modified
		db 27,MEOWTH						;modified
		db 27,MEOWTH						;modified
		db 28,VOLTORB						;modified
		db 28,VOLTORB						;modified
		db 28,VOLTORB						;modified
		db 28,VOLTORB						;modified
		db 29,LICKITUNG						;modified
		db 29,LICKITUNG						;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 27,MEOWTH						;modified
		db 27,MEOWTH						;modified
		db 27,MEOWTH						;modified
		db 27,MEOWTH						;modified
		db 28,VOLTORB						;modified
		db 28,VOLTORB						;modified
		db 28,VOLTORB						;modified
		db 28,VOLTORB						;modified
		db 29,LICKITUNG						;modified
		db 29,LICKITUNG						;modified
	ENDC
	db $00