MansionMonsB1:
	db $0A
	IF DEF(_RED)
		db 82,MAGMAR
		db 82,MUK
		db 83,MAGMAR
		db 83,MUK
		db 83,CHARIZARD
		db 83,VENOMOTH
		db 84,CHARIZARD
		db 84,VENOMOTH
		db 85,HOUNDOOM
		db 85,MISDREAVUS
	ENDC
	IF (DEF(_BLUE) || DEF(_GREEN))
		db 82,MAGMAR
		db 82,MUK
		db 83,MAGMAR
		db 83,MUK
		db 83,CHARIZARD
		db 83,VENOMOTH
		db 84,CHARIZARD
		db 84,VENOMOTH
		db 85,HOUNDOOM
		db 85,MISDREAVUS
	ENDC
	db $00