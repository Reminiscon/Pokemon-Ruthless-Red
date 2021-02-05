PewterCityObject:
	db $a ; border block

	db 7 ; warps
	warp 14, 7, 0, MUSEUM_1F
	warp 19, 5, 2, MUSEUM_1F
	warp 16, 17, 0, PEWTER_GYM
	warp 23, 29, 0, PEWTER_HOUSE_1
	warp 31,  5, 0, PEWTER_MART
	warp  5, 17, 0, PEWTER_HOUSE_2
	warp 31, 29, 0, PEWTER_POKECENTER

	db 7 ; signs
	sign 15, 25, 6 ; PewterCityText6
	sign 33, 19, 7 ; PewterCityText7
	sign 32,  5, 8 ; MartSignText
	sign 32, 29, 9 ; PokeCenterSignText
	sign  9,  5, 10 ; PewterCityText10
	sign 11, 17, 11 ; PewterCityText11
	sign  7, 23, 12 ; PewterCityText12

	db 5 ; objects
	object SPRITE_LASS, 8, 15, STAY, NONE, 1 ; person
	object SPRITE_BLACK_HAIR_BOY_1, 25, 22, STAY, NONE, 2 ; person
	object SPRITE_BLACK_HAIR_BOY_2,  7,  3, STAY, NONE, 3 ; person
	object SPRITE_BLACK_HAIR_BOY_2,  7, 25, WALK, 2, 4 ; person
	object SPRITE_BUG_CATCHER, 35, 16, STAY, DOWN, 5 ; person

	; warp-to
	warp_to 14, 7, PEWTER_CITY_WIDTH ; MUSEUM_1F
	warp_to 19, 5, PEWTER_CITY_WIDTH ; MUSEUM_1F
	warp_to 16, 17, PEWTER_CITY_WIDTH ; PEWTER_GYM
	warp_to 23, 29, PEWTER_CITY_WIDTH ; PEWTER_HOUSE_1
	warp_to 31,  5, PEWTER_CITY_WIDTH ; PEWTER_MART
	warp_to  5, 17, PEWTER_CITY_WIDTH ; PEWTER_HOUSE_2
	warp_to 31, 29, PEWTER_CITY_WIDTH ; PEWTER_POKECENTER
