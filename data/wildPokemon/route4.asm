Route4Mons:
	db $FF ;$14
	IF DEF(_RED)
		db 20,VOLTORB					;modified
		db 21,VOLTORB					;modified
		db 20,RHYHORN					;modified
		db 21,RHYHORN					;modified
		db 22,PIDGEOTTO					;modified
		db 22,PIDGEOTTO					;modified
		db 22,POLIWAG					;modified
		db 22,POLIWAG					;modified
		db 22,VOLTORB					;modified
		db 23,SKIPLOOM					;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 20,VOLTORB					;modified
		db 21,VOLTORB					;modified
		db 20,RHYHORN					;modified
		db 21,RHYHORN					;modified
		db 22,PIDGEOTTO					;modified
		db 22,PIDGEOTTO					;modified
		db 22,POLIWAG					;modified
		db 22,POLIWAG					;modified
		db 22,VOLTORB					;modified
		db 23,SKIPLOOM					;modified
	ENDC
	db $00