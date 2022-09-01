CeladonCityMons:
	db $FF ;$0F
	IF DEF(_RED)
		db 45,ELECTRODE					;modified
		db 45,JUMPLUFF					;modified
		db 45,ELECTRODE					;modified
		db 45,JUMPLUFF					;modified
		db 45,BEEDRILL					;modified
		db 45,TANGELA					;modified
		db 45,BEEDRILL					;modified
		db 45,TANGELA					;modified
		db 45,SUDOWOODO					;modified
		db 45,SUDOWOODO					;modified
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 45,ELECTRODE					;modified
		db 45,JUMPLUFF					;modified
		db 45,ELECTRODE					;modified
		db 45,JUMPLUFF					;modified
		db 45,BEEDRILL					;modified
		db 45,TANGELA					;modified
		db 45,BEEDRILL					;modified
		db 45,TANGELA					;modified
		db 45,SUDOWOODO					;modified
		db 45,SUDOWOODO					;modified
	ENDC
	db $00
	