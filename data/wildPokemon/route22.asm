Route22Mons:
	db $80 ;$19
	IF DEF(_RED)
		db 4,ODDISH			;modified
		db 4,BELLSPROUT		;modified
		db 5,ODDISH			;modified
		db 5,BELLSPROUT		;modified
		db 4,WOOPER			;modified
		db 5,WOOPER			;modified
		db 5,NIDORAN_F		;modified
		db 5,NIDORAN_M		;modified
		db 6,RHYHORN		;modified
		db 6,EEVEE			;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 4,ODDISH			;modified
		db 4,BELLSPROUT		;modified
		db 5,ODDISH			;modified
		db 5,BELLSPROUT		;modified
		db 4,WOOPER			;modified
		db 5,WOOPER			;modified
		db 5,NIDORAN_F		;modified
		db 5,NIDORAN_M		;modified
		db 6,RHYHORN		;modified
		db 6,EEVEE			;modified
	ENDC
	db $00
