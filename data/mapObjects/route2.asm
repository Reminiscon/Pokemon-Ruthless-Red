Route2Object:
	db $f ; border block

	db 7 ; warps
	warp 30, 30, 0, ROUTE_24	;placeholder
	warp 3, 11, 1, VIRIDIAN_FOREST_EXIT
	warp 15, 19, 0, ROUTE_2_HOUSE
	warp 16, 35, 1, ROUTE_2_GATE
	warp 15, 39, 2, ROUTE_2_GATE
	warp 3, 43, 2, VIRIDIAN_FOREST_ENTRANCE
	warp 10,  9, 0, DIGLETTS_CAVE

	db 2 ; signs
	sign  5, 47, 9 ; Route2Text4
	sign 11, 11, 10 ; Route2Text5

	db 8 ; objects
	object SPRITE_LASS, 18, 10, STAY, DOWN, 1, OPP_COOLTRAINER_F, 5
	object SPRITE_LASS,  7, 10, STAY, DOWN, 2, OPP_LASS, 19
	object SPRITE_FISHER2,  3, 54, STAY, DOWN, 3, OPP_CUE_BALL, 10
	object SPRITE_BALL, 15, 50, STAY, NONE, 4, MOON_STONE
	object SPRITE_BALL, 15, 44, STAY, NONE, 5, HP_UP
	object SPRITE_BALL, 16,  8, STAY, NONE, 6, X_DEFEND
	object SPRITE_BALL, 17,  8, STAY, NONE, 7, ULTRA_BALL
	object SPRITE_BALL, 18,  8, STAY, NONE, 8, DIRE_HIT

	; warp-to
	warp_to 30, 30, ROUTE_2_WIDTH ; ROUTE_24	; Placeholder
	warp_to 3, 11, ROUTE_2_WIDTH ; VIRIDIAN_FOREST_EXIT
	warp_to 15, 19, ROUTE_2_WIDTH ; ROUTE_2_HOUSE
	warp_to 16, 35, ROUTE_2_WIDTH ; ROUTE_2_GATE
	warp_to 15, 39, ROUTE_2_WIDTH ; ROUTE_2_GATE
	warp_to 3, 43, ROUTE_2_WIDTH ; VIRIDIAN_FOREST_ENTRANCE
	warp_to 10,  9, ROUTE_2_WIDTH ; DIGLETTS_CAVE

	; unused
	warp_to 2, 7, 4
	db $12, $c7, $9, $7
	warp_to 2, 7, 4
	warp_to 2, 7, 4
	warp_to  2,  7, 4
