PowerPlantObject:
	db $2e ; border block

	db 3 ; warps
	warp  4, 32, 3, -1
	warp  5, 32, 3, -1
	warp 21,  0, 4, -1

	db 0 ; signs

	db 14 ; objects
	object SPRITE_BALL, 16, 34, STAY, NONE, 1, ELECTRODE, 45
	object SPRITE_BALL, 10,  6, STAY, NONE, 2, ELECTRODE, 45
	object SPRITE_BALL,  5,  6, STAY, NONE, 3, ELECTRODE, 45
	object SPRITE_BALL, 37, 18, STAY, NONE, 4, ELECTRODE, 45
	object SPRITE_BALL, 11, 16, STAY, NONE, 5, ELECTRODE, 45
	object SPRITE_BALL,  4, 26, STAY, NONE, 6, ELECTRODE, 45
	object SPRITE_BALL, 23, 17, STAY, NONE, 7, ELECTRODE, 45
	object SPRITE_BALL, 32, 34, STAY, NONE, 8, ELECTRODE, 45
	object SPRITE_BIRD, 21,  2, STAY, DOWN, 9, ZAPDOS, 50
	object SPRITE_BALL, 27,  5, STAY, NONE, 10, ULTRA_BALL
	object SPRITE_BALL, 19, 18, STAY, NONE, 11, X_SPECIAL
	object SPRITE_BALL, 18, 18, STAY, NONE, 12, FULL_RESTORE
	object SPRITE_BALL,  1,  1, STAY, NONE, 13, TM_25
	object SPRITE_BALL, 38,  1, STAY, NONE, 14, TM_33

	; warp-to
	warp_to  4, 32, POWER_PLANT_WIDTH
	warp_to  5, 32, POWER_PLANT_WIDTH
	warp_to 21,  0, POWER_PLANT_WIDTH
