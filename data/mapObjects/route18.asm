Route18Object:
	db $43 ; border block

	db 2 ; warps
	warp 45, 10, 0, ROUTE_18_GATE_1F
	warp 45, 11, 1, ROUTE_18_GATE_1F

	db 2 ; signs
	sign 35,  5, 5 ; Route18Text5
	sign 15,  1, 6 ; Route18Text6

	db 4 ; objects
	object SPRITE_BLACK_HAIR_BOY_1, 33,  6, STAY, DOWN, 1, OPP_BIRD_KEEPER, 8
	object SPRITE_BLACK_HAIR_BOY_1, 33,  8, STAY, UP, 2, OPP_BIRD_KEEPER, 9
	object SPRITE_BLACK_HAIR_BOY_1, 38,  7, STAY, LEFT, 3, OPP_BIRD_KEEPER, 10
	object SPRITE_BLUE, 27, 11, STAY, NONE, 4 ; person

	; warp-to
	warp_to 45, 10, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
	warp_to 45, 11, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F

