Route2Object:
	db $f ; border block

	db 6 ; warps
	warp 12, 9, 0, DIGLETTS_CAVE_EXIT
	warp 3, 11, 1, VIRIDIAN_FOREST_EXIT
	warp 15, 19, 0, ROUTE_2_HOUSE
	warp 16, 35, 1, ROUTE_2_GATE
	warp 15, 39, 2, ROUTE_2_GATE
	warp 3, 43, 2, VIRIDIAN_FOREST_ENTRANCE

	db 2 ; signs
	sign  5, 47, 8 ; Route2Text3
	sign 13, 11, 9 ; Route2Text4

	db 7 ; objects
	object SPRITE_BALL, 15, 50, STAY, NONE, 1, MOON_STONE
	object SPRITE_BALL, 15, 44, STAY, NONE, 2, HP_UP
	object SPRITE_BALL, 17,  2, STAY, NONE, 3, X_DEFEND
	object SPRITE_BALL, 18,  2, STAY, NONE, 4, ULTRA_BALL
	object SPRITE_BALL, 19,  2, STAY, NONE, 5, DIRE_HIT
	object SPRITE_LASS, 15,  4, STAY, RIGHT, 6, OPP_COOLTRAINER_F, 5
	object SPRITE_GIRL,  3, 54, STAY, DOWN, 7, OPP_LASS, 19

	; warp-to
	warp_to 12, 9, ROUTE_2_WIDTH ; DIGLETTS_CAVE_EXIT
	warp_to 3, 11, ROUTE_2_WIDTH ; VIRIDIAN_FOREST_EXIT
	warp_to 15, 19, ROUTE_2_WIDTH ; ROUTE_2_HOUSE
	warp_to 16, 35, ROUTE_2_WIDTH ; ROUTE_2_GATE
	warp_to 15, 39, ROUTE_2_WIDTH ; ROUTE_2_GATE
	warp_to 3, 43, ROUTE_2_WIDTH ; VIRIDIAN_FOREST_ENTRANCE

	; unused
	warp_to 2, 7, 4
	db $12, $c7, $9, $7
	warp_to 2, 7, 4
	warp_to 2, 7, 4
	warp_to 2, 7, 4
