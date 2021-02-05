Route22Mons:
	db $19
	IF DEF(_RED)
		db 5,EEVEE			;modified
		db 4,ODDISH			;modified
		db 4,SLOWPOKE		;modified
		db 4,BELLSPROUT		;modified
		db 4,BELLSPROUT		;modified
		db 4,SLOWPOKE		;modified
		db 4,ODDISH			;modified
		db 5,TANGELA		;modified
		db 6,NIDORAN_F		;modified
		db 6,NIDORAN_M		;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 5,EEVEE			;modified
		db 4,ODDISH			;modified
		db 4,SLOWPOKE		;modified
		db 4,BELLSPROUT		;modified
		db 4,BELLSPROUT		;modified
		db 4,SLOWPOKE		;modified
		db 4,ODDISH			;modified
		db 5,TANGELA		;modified
		db 6,NIDORAN_F		;modified
		db 6,NIDORAN_M		;modified
	ENDC
	db $00
