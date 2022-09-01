Route25Mons:
	db $0F
	IF DEF(_RED)
		db 20,SANDSHREW				;modified
		db 20,MACHOP				;modified
		db 21,SANDSHREW				;modified
		db 21,MACHOP				;modified
		db 21,FLAAFFY				;modified
		db 21,DROWZEE				;modified
		db 22,FLAAFFY				;modified
		db 22,DROWZEE				;modified
		db 21,GLOOM					;modified
		db 23,VILEPLUME				;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 20,SANDSHREW				;modified
		db 20,MACHOP				;modified
		db 21,SANDSHREW				;modified
		db 21,MACHOP				;modified
		db 21,FLAAFFY				;modified
		db 21,DROWZEE				;modified
		db 22,FLAAFFY				;modified
		db 22,DROWZEE				;modified
		db 21,GLOOM					;modified
		db 23,VILEPLUME				;modified
	ENDC
	db $00