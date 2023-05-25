SilphCo6Object:
	db $2e ; border block

	db 8 ; warps
	warp 16, 0, 1, SILPH_CO_7F
	warp 14, 0, 0, SILPH_CO_5F
	warp 18, 0, 0, SILPH_CO_ELEVATOR
	warp 3, 3, 4, SILPH_CO_4F
	warp 23,  3, 6, SILPH_CO_2F
	warp  3, 11, 12, SILPH_CO_3F
	warp  7, 15,  9, SILPH_CO_5F
	warp 21,  3, 26, SILPH_CO_1F ; ONE-WAY WARP

	db 0 ; signs

	db 10 ; objects
	object SPRITE_LAPRAS_GIVER, 10, 6, STAY, NONE, 1 ; person
	object SPRITE_LAPRAS_GIVER, 20, 6, STAY, NONE, 2 ; person
	object SPRITE_ERIKA, 21, 6, STAY, DOWN, 3 ; person
	object SPRITE_ERIKA, 11, 10, STAY, RIGHT, 4 ; person
	object SPRITE_LAPRAS_GIVER, 18, 13, STAY, UP, 5 ; person
	object SPRITE_ROCKET,  3,  7, STAY, UP, 6, OPP_ROCKET, 29
	object SPRITE_OAK_AIDE,  6, 11, STAY, DOWN, 7, OPP_SCIENTIST, 6
	object SPRITE_ROCKET, 24,  3, STAY, LEFT, 8, OPP_ROCKET, 30
	object SPRITE_BALL,  1, 11, STAY, NONE, 9, FULL_RESTORE
	object SPRITE_BALL,  4, 14, STAY, NONE, 10, X_ACCURACY

	; warp-to
	warp_to 16, 0, SILPH_CO_6F_WIDTH ; SILPH_CO_7F
	warp_to 14, 0, SILPH_CO_6F_WIDTH ; SILPH_CO_5F
	warp_to 18, 0, SILPH_CO_6F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to 3, 3, SILPH_CO_6F_WIDTH ; SILPH_CO_4F
	warp_to 23,  3, SILPH_CO_6F_WIDTH ; SILPH_CO_2F
	warp_to  3, 11, SILPH_CO_6F_WIDTH ; SILPH_CO_3F
	warp_to  7, 15, SILPH_CO_6F_WIDTH ; SILPH_CO_5F
	warp_to 21,  3, SILPH_CO_6F_WIDTH ; SILPH_CO_1F (ONE-WAY WARP)
