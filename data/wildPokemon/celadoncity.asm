Route7Mons:
	db $0F
	IF DEF(_RED)
		db 45,TANGELA					;modified
		db 45,TANGELA					;modified
		db 45,VICTREEBEL				;modified
		db 45,VICTREEBEL				;modified
		db 45,PINSIR					;modified
		db 45,PINSIR					;modified
		db 45,EXEGGUTOR					;modified
		db 45,EXEGGUTOR					;modified
		db 45,SCYTHER					;modified
		db 45,SCYTHER					;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 45,TANGELA					;modified
		db 45,TANGELA					;modified
		db 45,VICTREEBEL				;modified
		db 45,VICTREEBEL				;modified
		db 45,PINSIR					;modified
		db 45,PINSIR					;modified
		db 45,EXEGGUTOR					;modified
		db 45,EXEGGUTOR					;modified
		db 45,SCYTHER					;modified
		db 45,SCYTHER					;modified
	ENDC
	db $00
	