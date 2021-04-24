CeladonMansion4Object:
	db $9 ; border block

	db 3 ; warps
	warp  6,  1, 1, CELADON_MANSION_3
	warp  2,  1, 2, CELADON_MANSION_3
	warp  2,  9, 0, CELADON_MANSION_5

	db 1 ; signs
	sign  3,  9, 3 ; CeladonMansion4Text3

	db 2 ; objects
	object SPRITE_LASS,  4,  6, STAY, RIGHT, 1, OPP_COOLTRAINER_F, 6
	object SPRITE_BLACK_HAIR_BOY_2,  6, 10, STAY, UP, 2, OPP_COOLTRAINER_M, 8

	; warp-to
	warp_to  6,  1, CELADON_MANSION_4_WIDTH ; CELADON_MANSION_3
	warp_to  2,  1, CELADON_MANSION_4_WIDTH ; CELADON_MANSION_3
	warp_to  2,  9, CELADON_MANSION_4_WIDTH ; CELADON_MANSION_5
