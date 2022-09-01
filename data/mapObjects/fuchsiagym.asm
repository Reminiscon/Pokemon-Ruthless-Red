FuchsiaGymObject:
	db $3 ; border block

	db 2 ; warps
	warp 4, 17, 5, -1
	warp 5, 17, 5, -1

	db 0 ; signs

	db 8 ; objects
	object SPRITE_BLACKBELT,  5,  3, STAY, DOWN, 1, OPP_KOGA, 1
	object SPRITE_ROCKER,  0, 11, STAY, DOWN, 2, OPP_JUGGLER, 5
	object SPRITE_ROCKER,  0, 16, STAY, RIGHT, 3, OPP_JUGGLER, 4
	object SPRITE_ROCKER,  8, 14, STAY, UP, 4, OPP_JUGGLER, 6
	object SPRITE_ROCKER,  4, 12, STAY, LEFT, 5, OPP_TAMER, 1
	object SPRITE_ROCKER,  4,  5, STAY, LEFT, 6, OPP_TAMER, 2
	object SPRITE_ROCKER,  6,  5, STAY, RIGHT, 7, OPP_JUGGLER, 7
	object SPRITE_GYM_HELPER,  7, 17, STAY, UP, 8 ; person

	; warp-to
	warp_to 4, 17, FUCHSIA_GYM_WIDTH
	warp_to 5, 17, FUCHSIA_GYM_WIDTH
