Route25Mons:
	db $0F
	IF DEF(_RED)
		db 22,BUTTERFREE			;modified
		db 22,BEEDRILL				;modified
		db 22,BUTTERFREE			;modified
		db 22,BEEDRILL				;modified
		db 20,SANDSHREW				;modified
		db 20,SANDSHREW				;modified
		db 20,SANDSHREW				;modified
		db 20,ODDISH				;modified
		db 20,ODDISH				;modified
		db 22,GLOOM					;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 22,BUTTERFREE			;modified
		db 22,BEEDRILL				;modified
		db 22,BUTTERFREE			;modified
		db 22,BEEDRILL				;modified
		db 20,SANDSHREW				;modified
		db 20,SANDSHREW				;modified
		db 20,SANDSHREW				;modified
		db 20,ODDISH				;modified
		db 20,ODDISH				;modified
		db 22,GLOOM					;modified
	ENDC
	db $00