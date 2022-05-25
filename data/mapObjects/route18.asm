Route18Object:
	db $43 ; border block

	db 4 ; warps
	warp 37, 14, 0, ROUTE_18_GATE_1F
	warp 37, 15, 1, ROUTE_18_GATE_1F
	warp 44, 14, 2, ROUTE_18_GATE_1F
	warp 44, 15, 3, ROUTE_18_GATE_1F

	db 2 ; signs
	sign 43,  5, 4 ; Route18Text4
	sign 15,  1, 5 ; Route18Text5

	db 4 ; objects
	object SPRITE_BLACK_HAIR_BOY_1, 33,  6, STAY, RIGHT, 1, OPP_BIRD_KEEPER, 8
	object SPRITE_BLACK_HAIR_BOY_1, 33,  8, STAY, LEFT, 2, OPP_BIRD_KEEPER, 9
	object SPRITE_BLACK_HAIR_BOY_1, 36,  7, STAY, LEFT, 3, OPP_BIRD_KEEPER, 10
	object SPRITE_BLUE, 27, 11, STAY, NONE, 4 ; person

	; warp-to
	warp_to 37, 14, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
	warp_to 37, 15, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
	warp_to 44, 14, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
	warp_to 44, 15, ROUTE_18_WIDTH ; ROUTE_18_GATE_1F
