Route17Object:
	db $43 ; border block

	db 0 ; warps

	db 6 ; signs
	sign 9, 51, 11 ; Route17Text11
	sign 9, 63, 12 ; Route17Text12
	sign 9, 75, 13 ; Route17Text13
	sign  9, 79, 14 ; Route17Text14
	sign  5, 119, 15 ; Route17Text15
	sign 17, 119, 16 ; Route17Text16

	db 10 ; objects
	object SPRITE_BIKER, 12,  9, STAY, LEFT, 1, OPP_CUE_BALL, 4
	object SPRITE_BIKER,  8, 21, STAY, RIGHT, 2, OPP_CUE_BALL, 5
	object SPRITE_BIKER,  5, 10, STAY, LEFT, 3, OPP_BIKER, 8
	object SPRITE_BIKER, 11, 128, STAY, RIGHT, 4, OPP_BIKER, 9
	object SPRITE_BIKER, 14, 132, STAY, LEFT, 5, OPP_BIKER, 10
	object SPRITE_BIKER,  8, 37, STAY, UP, 6, OPP_CUE_BALL, 6
	object SPRITE_BIKER,  9, 37, STAY, UP, 7, OPP_CUE_BALL, 7
	object SPRITE_BIKER, 18, 81, STAY, LEFT, 8, OPP_CUE_BALL, 8
	object SPRITE_BIKER, 11, 136, STAY, RIGHT, 9, OPP_BIKER, 11
	object SPRITE_BIKER,  6, 122, STAY, UP, 10, OPP_BIKER, 12
