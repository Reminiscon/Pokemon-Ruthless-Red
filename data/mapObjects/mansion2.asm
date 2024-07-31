Mansion2Object:
	db $1 ; border block

	db 9 ; warps
	warp 5, 10, 4, MANSION_1
	warp 21, 24, 0, MANSION_3
	warp  9, 18, 2, MANSION_3
	warp 26,  1, 1, MANSION_3
	warp 19, 10, 3, MANSION_3
	warp 25, 10, 4, MANSION_3
	warp 21, 17, 9, MANSION_1 ; ONE-WAY WARP
	warp 27, 24, 5, MANSION_3
	warp  7,  2, 10, MANSION_1

	db 0 ; signs

	db 4 ; objects
	object SPRITE_BLACK_HAIR_BOY_2, 20, 12, STAY, LEFT, 1, OPP_BURGLAR, 4
	object SPRITE_BALL, 28, 7, STAY, NONE, 2, RARE_CANDY
	object SPRITE_BOOK_MAP_DEX,  5,  2, STAY, NONE, 3 ; person
	object SPRITE_BOOK_MAP_DEX, 3, 22, STAY, NONE, 4 ; person

	; warp-to
	warp_to 5, 10, MANSION_2_WIDTH ; MANSION_1
	warp_to 21, 24, MANSION_2_WIDTH ; MANSION_3
	warp_to  9, 18, MANSION_2_WIDTH ; MANSION_3
	warp_to 26,  1, MANSION_2_WIDTH ; MANSION_3
	warp_to 19, 10, MANSION_2_WIDTH ; MANSION_3
	warp_to 25, 10, MANSION_2_WIDTH ; MANSION_3
	warp_to 27, 24, MANSION_2_WIDTH ; MANSION_3
	warp_to  7,  2, MANSION_2_WIDTH ; MANSION_1
