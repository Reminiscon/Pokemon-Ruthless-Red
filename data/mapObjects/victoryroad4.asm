VictoryRoad4Object:
	db $2e ; border block

	db 68 ; warps
	warp  2, 57, 2, VICTORY_ROAD_3
	warp  3, 57, 3, VICTORY_ROAD_3
	warp  3, 55, 2, VICTORY_ROAD_4 ; ONE-WAY WARP
	
	warp 21, 19, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 23, 19, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 25, 19, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 27, 19, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 29, 19, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 31, 19, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 33, 19, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 35, 19, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	
	warp 21, 21, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 23, 21, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 25, 21, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 27, 21, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 29, 21, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 31, 21, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 33, 21, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 35, 21, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	
	warp 21, 23, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 23, 23, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 25, 23, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 27, 23, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 29, 23, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 31, 23, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 33, 23, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 35, 23, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	
	warp 21, 25, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 23, 25, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 25, 25, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 27, 25, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 29, 25, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 31, 25, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 33, 25, 3, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 35, 25, 4, VICTORY_ROAD_4 ; ONE-WAY WARP

	warp 21, 27, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 23, 27, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 25, 27, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 27, 27, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 29, 27, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 31, 27, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 33, 27, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 35, 27, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	
	warp 21, 29, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 23, 29, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 25, 29, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 27, 29, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 29, 29, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 31, 29, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 33, 29, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 35, 29, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	
	warp 21, 31, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 23, 31, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 25, 31, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 27, 31, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 29, 31, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 31, 31, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 33, 31, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 35, 31, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	
	warp 21, 33, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 23, 33, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 25, 33, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 27, 33, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 29, 33, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 31, 33, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 33, 33, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	warp 35, 33, 4, VICTORY_ROAD_4 ; ONE-WAY WARP
	
	warp  1,  3, 6, ROUTE_23 ; ONE-WAY WARP
	

	db 0 ; signs

	db 4 ; objects
	object SPRITE_JUGGLER_X,  3,  3, STAY, UP, 1, OPP_JUGGLER_X, 2
	object SPRITE_BLACK_HAIR_BOY_2, 28, 11, STAY, LEFT, 2, OPP_SUPER_NERD, 13
	object SPRITE_BLACK_HAIR_BOY_2, 15, 16, STAY, LEFT, 3, OPP_SUPER_NERD, 14
	object SPRITE_MEDIUM, 28, 35, STAY, DOWN, 4 ; person

	; warp-to
	warp_to  2, 57, VICTORY_ROAD_4_WIDTH ; VICTORY_ROAD_3
	warp_to  3, 57, VICTORY_ROAD_4_WIDTH ; VICTORY_ROAD_3
	warp_to  1, 45, VICTORY_ROAD_4_WIDTH ; VICTORY_ROAD_4 (ONE-WAY WARP)
	warp_to  3,  2, VICTORY_ROAD_4_WIDTH ; VICTORY_ROAD_4 (ONE-WAY WARP)
	warp_to 27, 56, VICTORY_ROAD_4_WIDTH ; VICTORY_ROAD_4 (ONE-WAY WARP)
