Mansion3Object:
	db $1 ; border block

	db 6 ; warps
	warp 21, 24, 1, MANSION_2
	warp 26,  1, 3, MANSION_2
	warp  9, 18, 2, MANSION_2
	warp 19, 10, 4, MANSION_2
	warp 25, 10, 5, MANSION_2
	warp 27, 25, 6, MANSION_2

	db 0 ; signs

	db 5 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, 10, 20, STAY, DOWN, 1, OPP_BURGLAR, 5
	object SPRITE_OAK_AIDE, 20, 11, STAY, LEFT, 2, OPP_SCIENTIST, 11
	object SPRITE_BALL, 1, 16, STAY, NONE, 3, FIRE_STONE
	object SPRITE_BALL, 25, 5, STAY, NONE, 4, RARE_CANDY
	object SPRITE_BOOK_MAP_DEX, 13, 20, STAY, NONE, 5 ; person

	; warp-to
	warp_to 21, 24, MANSION_3_WIDTH ; MANSION_2
	warp_to 26,  1, MANSION_3_WIDTH ; MANSION_2
	warp_to  9, 18, MANSION_3_WIDTH ; MANSION_2
	warp_to 19, 10, MANSION_3_WIDTH ; MANSION_2
	warp_to 25, 10, MANSION_3_WIDTH ; MANSION_2
	warp_to 27, 25, MANSION_3_WIDTH ; MANSION_2
