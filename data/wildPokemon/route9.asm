Route9Mons:
	db $0F
	IF DEF(_RED)
		db 33,EXEGGCUTE					;modified
		db 33,VULPIX					;modified
		db 33,POLIWHIRL					;modified
		db 33,EEVEE						;modified
		db 34,EXEGGCUTE					;modified
		db 34,VULPIX					;modified
		db 34,POLIWHIRL					;modified
		db 34,EEVEE						;modified
		db 35,PIKACHU					;modified
		db 35,PIKACHU					;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 33,EXEGGCUTE					;modified
		db 33,VULPIX					;modified
		db 33,POLIWHIRL					;modified
		db 33,EEVEE						;modified
		db 34,EXEGGCUTE					;modified
		db 34,VULPIX					;modified
		db 34,POLIWHIRL					;modified
		db 34,EEVEE						;modified
		db 35,PIKACHU					;modified
		db 35,PIKACHU					;modified
	ENDC
	db $00
