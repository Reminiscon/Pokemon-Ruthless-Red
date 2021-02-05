Route24Mons:
	db $19
	IF DEF(_RED)
		db 20,METAPOD				;modified
		db 20,KAKUNA				;modified
		db 20,METAPOD				;modified
		db 20,KAKUNA				;modified
		db 20,VOLTORB				;modified
		db 20,VOLTORB				;modified
		db 20,VOLTORB				;modified
		db 20,EXEGGCUTE				;modified
		db 20,EXEGGCUTE				;modified
		db 20,CHARMANDER			;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 20,METAPOD				;modified
		db 20,KAKUNA				;modified
		db 20,METAPOD				;modified
		db 20,KAKUNA				;modified
		db 20,VOLTORB				;modified
		db 20,VOLTORB				;modified
		db 20,VOLTORB				;modified
		db 20,EXEGGCUTE				;modified
		db 20,EXEGGCUTE				;modified
		db 20,CHARMANDER			;modified
	ENDC
	db $00