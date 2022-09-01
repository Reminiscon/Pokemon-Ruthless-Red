Route10Mons:
	db $FF ;$0F
	IF DEF(_RED)
		db 35,SANDSLASH					;modified
		db 35,MAGNETON					;modified
		db 36,SANDSLASH					;modified
		db 36,MAGNETON					;modified
		db 37,GROWLITHE					;modified
		db 37,TANGELA					;modified
		db 38,GROWLITHE					;modified
		db 38,TANGELA					;modified
		db 39,ARBOK						;modified
		db 40,MAGCARGO					;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 35,SANDSLASH					;modified
		db 35,MAGNETON					;modified
		db 36,SANDSLASH					;modified
		db 36,MAGNETON					;modified
		db 37,GROWLITHE					;modified
		db 37,TANGELA					;modified
		db 38,GROWLITHE					;modified
		db 38,TANGELA					;modified
		db 39,ARBOK						;modified
		db 40,MAGCARGO					;modified
	ENDC
	db $00