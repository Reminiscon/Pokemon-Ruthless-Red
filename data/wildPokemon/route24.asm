Route24Mons:
	db $19
	IF DEF(_RED)
		db 20,METAPOD				;modified
		db 20,KAKUNA				;modified
		db 20,KAKUNA				;modified
		db 20,METAPOD				;modified
		db 20,MAGNEMITE				;modified
		db 20,EXEGGCUTE				;modified
		db 21,MAGNEMITE				;modified
		db 21,EXEGGCUTE				;modified
		db 22,VOLTORB				;modified
		db 22,QUAGSIRE				;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 20,METAPOD				;modified
		db 20,KAKUNA				;modified
		db 20,KAKUNA				;modified
		db 20,METAPOD				;modified
		db 20,MAGNEMITE				;modified
		db 20,EXEGGCUTE				;modified
		db 21,MAGNEMITE				;modified
		db 21,EXEGGCUTE				;modified
		db 22,VOLTORB				;modified
		db 22,QUAGSIRE				;modified
	ENDC
	db $00