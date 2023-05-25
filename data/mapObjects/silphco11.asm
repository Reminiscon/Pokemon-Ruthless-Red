SilphCo11Object:
	db $d ; border block

	db 6 ; warps
	warp  9,  0, 1, SILPH_CO_10F
	warp 13,  0, 0, SILPH_CO_ELEVATOR
	warp 15,  4, 2, SILPH_CO_11F ; UNUSED/BROKEN WARP
	warp  3,  2, 18, SILPH_CO_1F
	warp 11,  8, 5, SILPH_CO_1F	; ONE-WAY WARP
	warp 15,  8, 8, SILPH_CO_7F ; ONE-WAY WARP


	db 0 ; signs

	db 5 ; objects
	object SPRITE_MR_MASTERBALL,  7,  5, STAY, DOWN, 1 ; person
	object SPRITE_FOULARD_WOMAN, 10,  5, STAY, DOWN, 2 ; person
	object SPRITE_GIOVANNI,  6,  9, STAY, DOWN, 3, OPP_GIOVANNI, 2
	object SPRITE_CHIEF, 12, 15, STAY, LEFT, 4, OPP_CHIEF, 4
	object SPRITE_JUGGLER_X,  3, 16, STAY, UP, 5, OPP_JUGGLER_X, 1

	; warp-to
	warp_to  9,  0, SILPH_CO_11F_WIDTH ; SILPH_CO_10F
	warp_to 13,  0, SILPH_CO_11F_WIDTH ; SILPH_CO_ELEVATOR
	warp_to  6,  2, SILPH_CO_11F_WIDTH ; SILPH_CO_11F (UNUSED/BROKEN WARP)
	warp_to  3,  2, SILPH_CO_11F_WIDTH ; SILPH_CO_1F
	warp_to 11,  8, SILPH_CO_11F_WIDTH ; SILPH_CO_1F (ONE-WAY WARP)
	warp_to 15,  8, SILPH_CO_11F_WIDTH ; SILPH_CO_7F (ONE-WAY WARP)

