SilphCo9Object:
	db $2e ; border block

	db 10 ; warps
	warp 14, 0, 0, SILPH_CO_10F
	warp 16, 0, 0, SILPH_CO_8F
	warp 18, 0, 0, SILPH_CO_ELEVATOR
	warp 9, 3, 7, SILPH_CO_3F
	warp 21,  7, 4, SILPH_CO_5F
	warp  3, 15, 12, SILPH_CO_1F ; ONE-WAY WARP
	warp 17, 15, 13, SILPH_CO_1F ; ONE-WAY WARP
	warp 23, 15,  7, SILPH_CO_4F
	warp  5,  3,  6, SILPH_CO_10F
	warp  7, 15, 24, SILPH_CO_1F ; ONE-WAY WARP

	db 0 ; signs

	db 4 ; objects
	object SPRITE_NURSE, 10,  7, STAY, DOWN, 1 ; person
	object SPRITE_ROCKET,  2,  4, STAY, UP, 2, OPP_ROCKET, 36
	object SPRITE_OAK_AIDE,  7, 12, STAY, DOWN, 3, OPP_SCIENTIST, 9
	object SPRITE_ROCKET, 13, 15, STAY, UP, 4, OPP_ROCKET, 37

	; warp-to
	warp_to 14, 0, SILPH_CO_9F_WIDTH ; SILPH_CO_10F
	warp_to 16, 0, SILPH_CO_9F_WIDTH ; SILPH_CO_8F
	warp_to 18, 0, SILPH_CO_9F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to 9, 3, SILPH_CO_9F_WIDTH ; SILPH_CO_3F
	warp_to 21,  7, SILPH_CO_9F_WIDTH ; SILPH_CO_5F
	warp_to  3, 15, SILPH_CO_9F_WIDTH ; SILPH_CO_1F (ONE-WAY WARP)
	warp_to 17, 15, SILPH_CO_9F_WIDTH ; SILPH_CO_1F (ONE-WAY WARP)
	warp_to 23, 15, SILPH_CO_9F_WIDTH ; SILPH_CO_4F
	warp_to  5,  3, SILPH_CO_9F_WIDTH ; SILPH_CO_10F
	warp_to  7, 15, SILPH_CO_9F_WIDTH ; SILPH_CO_1F (ONE-WAY WARP)
	