PokemonTower5Object:
	db $1 ; border block

	db 2 ; warps
	warp  5,  9, 0, POKEMONTOWER_4
	warp 18,  9, 0, POKEMONTOWER_6

	db 0 ; signs

	db 6 ; objects
	object SPRITE_MEDIUM,  0, 17, STAY, NONE, 1 ; person
	object SPRITE_MEDIUM,  5, 13, STAY, UP, 2, OPP_CHANNELER, 7
	object SPRITE_MEDIUM,  8,  5, STAY, RIGHT, 3, OPP_CHANNELER, 8
	object SPRITE_MEDIUM, 13,  5, STAY, LEFT, 4, OPP_CHANNELER, 9
	object SPRITE_MEDIUM, 13, 13, STAY, UP, 5, OPP_CHANNELER, 10
	object SPRITE_BALL, 13,  9, STAY, NONE, 6, NUGGET

	; warp-to
	warp_to  5,  9, POKEMONTOWER_5_WIDTH ; POKEMONTOWER_4
	warp_to 18,  9, POKEMONTOWER_5_WIDTH ; POKEMONTOWER_6
