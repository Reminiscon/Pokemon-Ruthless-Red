RocketHideout3Object:
	db $2e ; border block

	db 3 ; warps
	warp 25,  6, 1, ROCKET_HIDEOUT_2
	warp 19, 18, 0, ROCKET_HIDEOUT_4
	warp  3, 10, 4, ROCKET_HIDEOUT_4

	db 0 ; signs

	db 5 ; objects
	object SPRITE_ROCKET, 26, 12, STAY, UP, 1, OPP_ROCKET, 14
	object SPRITE_ROCKET, 12, 25, STAY, RIGHT, 2, OPP_ROCKET, 15
	object SPRITE_OAK_AIDE, 23, 18, STAY, UP, 3, OPP_SCIENTIST, 15
	object SPRITE_BALL, 26, 22, STAY, NONE, 4, TM_10
	object SPRITE_BALL, 20, 14, STAY, NONE, 5, RARE_CANDY

	; warp-to
	warp_to 25,  6, ROCKET_HIDEOUT_3_WIDTH ; ROCKET_HIDEOUT_2
	warp_to 19, 18, ROCKET_HIDEOUT_3_WIDTH ; ROCKET_HIDEOUT_4
	warp_to  3, 10, ROCKET_HIDEOUT_3_WIDTH ; ROCKET_HIDEOUT_4
