PokemonTower4Object:
	db $1 ; border block

	db 2 ; warps
	warp  3,  9, 0, POKEMONTOWER_5
	warp 16,  9, 1, POKEMONTOWER_3

	db 0 ; signs

	db 6 ; objects
	object SPRITE_MEDIUM, 13,  7, STAY, DOWN, 1, OPP_CHANNELER, 4
	object SPRITE_MEDIUM, 10,  7, STAY, DOWN, 2, OPP_CHANNELER, 5
	object SPRITE_MEDIUM,  7,  7, STAY, DOWN, 3, OPP_CHANNELER, 6
	object SPRITE_BALL, 12, 10, STAY, NONE, 4, ELIXER
	object SPRITE_BALL,  8, 10, STAY, NONE, 5, FULL_HEAL
	object SPRITE_BALL, 15,  9, STAY, NONE, 6, RARE_CANDY

	; warp-to
	warp_to  3,  9, POKEMONTOWER_4_WIDTH ; POKEMONTOWER_5
	warp_to 16,  9, POKEMONTOWER_4_WIDTH ; POKEMONTOWER_3
