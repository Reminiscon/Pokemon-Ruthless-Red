SilphCo2Object:
	db $2e ; border block

	db 10 ; warps
	warp 24, 0, 2, SILPH_CO_1F
	warp 26, 0, 0, SILPH_CO_3F
	warp 20, 0, 0, SILPH_CO_ELEVATOR
	warp 3, 3, 6, SILPH_CO_3F
	warp 13, 3, 4, SILPH_CO_8F
	warp 27, 15, 5, SILPH_CO_8F
	warp 9, 15, 4, SILPH_CO_6F
	warp 17, 11, 7, SILPH_CO_8F
	warp 24,  4, 19, SILPH_CO_1F ; ONE-WAY WARP
	warp 11,  6, 30, SILPH_CO_1F ; ONE-WAY WARP

	db 0 ; signs

	db 5 ; objects
	object SPRITE_ERIKA, 10, 1, STAY, UP, 1 ; person
	object SPRITE_OAK_AIDE,  7,  5, STAY, LEFT, 2, OPP_SCIENTIST, 1
	object SPRITE_OAK_AIDE, 23, 11, STAY, DOWN, 3, OPP_SCIENTIST, 2
	object SPRITE_ROCKET, 11,  9, STAY, UP, 4, OPP_ROCKET, 22
	object SPRITE_ROCKET, 24, 7, STAY, UP, 5, OPP_ROCKET, 23

	; warp-to
	warp_to 24, 0, SILPH_CO_2F_WIDTH ; SILPH_CO_1F
	warp_to 26, 0, SILPH_CO_2F_WIDTH ; SILPH_CO_3F
	warp_to 20, 0, SILPH_CO_2F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to 3, 3, SILPH_CO_2F_WIDTH ; SILPH_CO_3F
	warp_to 13, 3, SILPH_CO_2F_WIDTH ; SILPH_CO_8F
	warp_to 27, 15, SILPH_CO_2F_WIDTH ; SILPH_CO_8F
	warp_to 9, 15, SILPH_CO_2F_WIDTH ; SILPH_CO_6F
	warp_to 17, 11, SILPH_CO_2F_WIDTH ; SILPH_CO_8F
	warp_to 24,  4, SILPH_CO_2F_WIDTH ; SILPH_CO_1F (ONE-WAY WARP)
	warp_to 11,  6, SILPH_CO_2F_WIDTH ; SILPH_CO_1F (ONE-WAY WARP)
