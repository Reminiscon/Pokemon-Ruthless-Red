Route11Mons:
	db $0F
	IF DEF(_RED)
		db 31,PERSIAN						;modified
		db 31,PERSIAN						;modified
		db 32,GROWLITHE						;modified
		db 32,GROWLITHE						;modified
		db 33,ARCANINE						;modified
		db 33,ARCANINE						;modified
		db 33,ELECTRODE						;modified
		db 33,ELECTRODE						;modified
		db 31,JYNX							;modified
		db 33,JYNX							;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 31,PERSIAN						;modified
		db 31,PERSIAN						;modified
		db 32,GROWLITHE						;modified
		db 32,GROWLITHE						;modified
		db 33,ARCANINE						;modified
		db 33,ARCANINE						;modified
		db 33,ELECTRODE						;modified
		db 33,ELECTRODE						;modified
		db 31,JYNX							;modified
		db 33,JYNX							;modified
	ENDC
	db $00
