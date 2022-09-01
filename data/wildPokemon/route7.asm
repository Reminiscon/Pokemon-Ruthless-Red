Route7Mons:
	db $0F
	IF DEF(_RED)
		db 45,WEEPINBELL				;modified
		db 45,GLOOM						;modified
		db 45,RATICATE					;modified
		db 45,FEAROW					;modified
		db 45,RATICATE					;modified
		db 45,FEAROW					;modified
		db 45,URSARING					;modified
		db 45,URSARING					;modified
		db 45,MAGCARGO					;modified
		db 45,HOUNDOOM					;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 45,WEEPINBELL				;modified
		db 45,GLOOM						;modified
		db 45,RATICATE					;modified
		db 45,FEAROW					;modified
		db 45,RATICATE					;modified
		db 45,FEAROW					;modified
		db 45,URSARING					;modified
		db 45,URSARING					;modified
		db 45,MAGCARGO					;modified
		db 45,HOUNDOOM					;modified
	ENDC
	db $00