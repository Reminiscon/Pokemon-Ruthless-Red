LavenderTownObject:
	db $2c ; border block

	db 6 ; warps
	warp 3, 5, 0, LAVENDER_POKECENTER
	warp 14, 5, 0, POKEMONTOWER_1
	warp  5, 11, 0, LAVENDER_HOUSE_1
	warp 15, 13, 0, LAVENDER_MART
	warp 11, 13, 0, LAVENDER_HOUSE_2
	warp  1, 11, 0, NAME_RATERS_HOUSE

	db 6 ; signs
	sign 11, 9, 4 ; LavenderTownText4
	sign  7,  5, 5 ; LavenderTownText5
	sign 16, 13, 6 ; MartSignText
	sign 4, 5, 7 ; PokeCenterSignText
	sign  3, 13, 8 ; LavenderTownText8
	sign 17, 7, 9 ; LavenderTownText9

	db 3 ; objects
	object SPRITE_LITTLE_GIRL, 15, 9, WALK, 0, 1 ; person
	object SPRITE_BLACK_HAIR_BOY_1,  2, 15, STAY, NONE, 2 ; person
	object SPRITE_BLACK_HAIR_BOY_2,  9,  9, WALK, 2, 3 ; person

	; warp-to
	warp_to 3, 5, LAVENDER_TOWN_WIDTH ; LAVENDER_POKECENTER
	warp_to 14, 5, LAVENDER_TOWN_WIDTH ; POKEMONTOWER_1
	warp_to  5, 11, LAVENDER_TOWN_WIDTH ; LAVENDER_HOUSE_1
	warp_to 15, 13, LAVENDER_TOWN_WIDTH ; LAVENDER_MART
	warp_to 11, 13, LAVENDER_TOWN_WIDTH ; LAVENDER_HOUSE_2
	warp_to  1, 11, LAVENDER_TOWN_WIDTH ; NAME_RATERS_HOUSE
