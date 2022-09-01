MoltenCavernObject:
	db $7d ; border block

	db 3 ; warps
	warp  2, 10, 0, ROUTE_24
	warp 16, 31, 1, ROUTE_24
	warp 17, 31, 1, ROUTE_24

	db 0 ; signs

	db 7 ; objects
	object SPRITE_BIRD,  3, 20, STAY, UP, 1, MOLTRES, 30
	object SPRITE_BALL,  2,  8, STAY, NONE, 2, REPEL
	object SPRITE_BALL, 11,  3, STAY, NONE, 3, ULTRA_BALL
	object SPRITE_BALL, 28,  3, STAY, NONE, 4, ULTRA_BALL
	object SPRITE_BALL, 28, 24, STAY, NONE, 5, ULTRA_BALL
	object SPRITE_BALL, 10, 26, STAY, NONE, 6, ULTRA_BALL
	object SPRITE_BALL, 10, 10, STAY, NONE, 7, ICE_HEAL

	; warp-to
	warp_to  2, 10, MOLTEN_CAVERN_WIDTH ; ROUTE_24
	warp_to 16, 31, MOLTEN_CAVERN_WIDTH ; ROUTE_24
	warp_to 17, 31, MOLTEN_CAVERN_WIDTH ; ROUTE_24
