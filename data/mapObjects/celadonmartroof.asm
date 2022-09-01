CeladonMartRoofObject:
	db $42 ; border block

	db 1 ; warps
	warp 17,  2, 0, CELADON_MART_5

	db 4 ; signs
	sign  0,  6, 3 ; CeladonMartRoofText3
	sign  0,  7, 4 ; CeladonMartRoofText4
	sign  8,  2, 5 ; CeladonMartRoofText5
	sign  9,  2, 6 ; CeladonMartRoofText6

	db 4 ; objects
	object SPRITE_BLACK_HAIR_BOY_2,  3,  2, STAY, DOWN, 1 ; person
	object SPRITE_LITTLE_GIRL,  2,  5, STAY, UP, 2 ; person
	object SPRITE_BLACK_HAIR_BOY_2, 11,  1, STAY, DOWN, 7, OPP_SUPER_NERD, 11
	object SPRITE_BLACK_HAIR_BOY_2, 10,  6, STAY, UP, 8, OPP_SUPER_NERD, 12

	; warp-to
	warp_to 17,  2, CELADON_MART_ROOF_WIDTH ; CELADON_MART_5
