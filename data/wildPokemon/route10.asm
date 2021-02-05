Route10Mons:
	db $0F
	IF DEF(_RED)
		db 33,ELECTRODE					;modified
		db 34,ELECTRODE					;modified
		db 35,ELECTRODE					;modified
		db 36,ELECTRODE					;modified
		db 37,ELECTRODE					;modified
		db 33,MAGNETON					;modified
		db 35,MAGNETON					;modified
		db 37,MAGNETON					;modified
		db 36,ARBOK						;modified
		db 38,ARBOK						;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 33,ELECTRODE					;modified
		db 34,ELECTRODE					;modified
		db 35,ELECTRODE					;modified
		db 36,ELECTRODE					;modified
		db 37,ELECTRODE					;modified
		db 33,MAGNETON					;modified
		db 35,MAGNETON					;modified
		db 37,MAGNETON					;modified
		db 36,ARBOK						;modified
		db 38,ARBOK						;modified
	ENDC
	db $00