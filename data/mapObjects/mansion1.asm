Mansion1Object:
	db $2e ; border block

	db 10 ; warps
	warp 4, 27, 0, -1
	warp 5, 27, 0, -1
	warp 6, 27, 0, -1
	warp 7, 27, 0, -1
	warp 5, 10, 0, MANSION_2
	warp 27, 25, 0, MANSION_4
	warp 29, 14, 6, -1
	warp 29, 15, 6, -1
	warp  7, 23, 8, MANSION_1 ; ONE-WAY WARP
	warp  7,  2, 7, MANSION_2

	db 0 ; signs

	db 5 ; objects
	object SPRITE_OAK_AIDE, 16, 17, STAY, LEFT, 1, OPP_SCIENTIST, 13
	object SPRITE_BALL, 22,  6, STAY, NONE, 2, TM_47
	object SPRITE_BALL, 27,  9, STAY, NONE, 3, RARE_CANDY
	object SPRITE_FAT_BALD_GUY, 35, 13, STAY, DOWN, 4 ; person
	object SPRITE_GUARD,  5, 25, STAY, DOWN, 5 ; person

	; warp-to
	warp_to 4, 27, MANSION_1_WIDTH
	warp_to 5, 27, MANSION_1_WIDTH
	warp_to 6, 27, MANSION_1_WIDTH
	warp_to 7, 27, MANSION_1_WIDTH
	warp_to 5, 10, MANSION_1_WIDTH ; MANSION_2
	warp_to 27, 25, MANSION_1_WIDTH ; MANSION_4
	warp_to 29, 14, MANSION_1_WIDTH 
	warp_to 29, 15, MANSION_1_WIDTH
	warp_to  6, 14, MANSION_1_WIDTH ; MANSION_1 (ONE-WAY WARP)
	warp_to  5,  5, MANSION_1_WIDTH ; MANSION_1 (ONE-WAY WARP)
	warp_to  7,  2, MANSION_1_WIDTH ; MANSION_1
