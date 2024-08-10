Route16HouseObject:
	db $a ; border block

	db 2 ; warps
	warp 2, 7, 4, ROUTE_23
	warp 3, 7, 5, ROUTE_23

	db 0 ; signs

	db 2 ; objects
	object SPRITE_BRUNETTE_GIRL,  2,  3, STAY, RIGHT, 1 ; person
	object SPRITE_BIRD, 6, 4, WALK, 0, 2 ; person

	; warp-to
	warp_to 2, 7, ROUTE_16_HOUSE_WIDTH ; ROUTE_23
	warp_to 3, 7, ROUTE_16_HOUSE_WIDTH ; ROUTE_23
