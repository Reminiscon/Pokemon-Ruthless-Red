Route6Mons:
	db $0F
	IF DEF(_RED)
		db 27,MEOWTH						;modified
		db 27,SKIPLOOM						;modified
		db 27,MEOWTH						;modified
		db 27,SKIPLOOM						;modified
		db 28,SLUGMA						;modified
		db 28,GRIMER						;modified
		db 28,SLUGMA						;modified
		db 28,GRIMER						;modified
		db 29,LICKITUNG						;modified
		db 31,LICKITUNG						;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 27,MEOWTH						;modified
		db 27,SKIPLOOM						;modified
		db 27,MEOWTH						;modified
		db 27,SKIPLOOM						;modified
		db 28,SLUGMA						;modified
		db 28,GRIMER						;modified
		db 28,SLUGMA						;modified
		db 28,GRIMER						;modified
		db 29,LICKITUNG						;modified
		db 31,LICKITUNG						;modified
	ENDC
	db $00