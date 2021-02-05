SSAnne5Object:
	db $23 ; border block

	db 2 ; warps
	warp 13, 6, 0, SS_ANNE_3
	warp 13, 7, 0, SS_ANNE_3

	db 0 ; signs

	db 5 ; objects
	object SPRITE_BLACK_HAIR_BOY_2,  1,  6, STAY, RIGHT, 1 ; person
	object SPRITE_SAILOR,  4,  5, STAY, NONE, 2 ; person
	object SPRITE_BLACK_HAIR_BOY_1,  4,  8, STAY, NONE, 3 ; person
	object SPRITE_SAILOR, 11,  5, STAY, DOWN, 4, OPP_SAILOR, 1
	object SPRITE_SAILOR, 11,  8, STAY, UP, 5, OPP_SAILOR, 2

	; warp-to
	warp_to 13, 6, SS_ANNE_5_WIDTH ; SS_ANNE_3
	warp_to 13, 7, SS_ANNE_5_WIDTH ; SS_ANNE_3
