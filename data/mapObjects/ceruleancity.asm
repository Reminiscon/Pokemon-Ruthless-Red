CeruleanCityObject:
	db $f ; border block

	db 10 ; warps
	warp 27, 11, 0, TRASHED_HOUSE
	warp 17, 15, 0, CERULEAN_HOUSE_1
	warp 13, 17, 0, CERULEAN_POKECENTER
	warp 30, 19, 0, CERULEAN_GYM
	warp 13, 25, 0, BIKE_SHOP
	warp 19, 25, 0, CERULEAN_MART
	warp 4, 11, 0, UNKNOWN_DUNGEON_1
	warp 27, 9, 2, TRASHED_HOUSE
	warp  1, 35, 1, CERULEAN_HOUSE_2
	warp  0, 35, 0, CERULEAN_HOUSE_2

	db 6 ; signs
	sign 23, 17, 12 ; CeruleanCityText12
	sign 17, 29, 13 ; CeruleanCityText13
	sign 20, 25, 14 ; MartSignText
	sign 14, 17, 15 ; PokeCenterSignText
	sign 11, 25, 16 ; CeruleanCityText16
	sign 23, 19, 17 ; CeruleanCityText17

	db 11 ; objects
	object SPRITE_BLUE, 20, 2, STAY, DOWN, 1 ; person
	object SPRITE_ROCKET, 30, 8, STAY, NONE, 2, OPP_ROCKET, 5
	object SPRITE_BLACK_HAIR_BOY_1, 31, 20, STAY, DOWN, 3 ; person
	object SPRITE_BLACK_HAIR_BOY_2, 20, 18, WALK, 1, 4 ; person
	object SPRITE_BLACK_HAIR_BOY_2,  9, 21, STAY, 2, 5 ; person
	object SPRITE_GUARD, 28, 12, STAY, DOWN, 6 ; person
	object SPRITE_LASS, 15, 26, STAY, LEFT, 7 ; person
	object SPRITE_SLOWBRO, 14, 26, STAY, DOWN, 8 ; person
	object SPRITE_LASS,  9, 27, STAY, 2, 9 ; person
	object SPRITE_BLACK_HAIR_BOY_2, 4, 12, STAY, DOWN, 10 ; person
	object SPRITE_GUARD, 27, 12, STAY, DOWN, 11 ; person

	; warp-to
	warp_to 27, 11, CERULEAN_CITY_WIDTH ; TRASHED_HOUSE
	warp_to 17, 15, CERULEAN_CITY_WIDTH ; CERULEAN_HOUSE_1
	warp_to 13, 17, CERULEAN_CITY_WIDTH ; CERULEAN_POKECENTER
	warp_to 30, 19, CERULEAN_CITY_WIDTH ; CERULEAN_GYM
	warp_to 13, 25, CERULEAN_CITY_WIDTH ; BIKE_SHOP
	warp_to 19, 25, CERULEAN_CITY_WIDTH ; CERULEAN_MART
	warp_to 4, 11, CERULEAN_CITY_WIDTH ; UNKNOWN_DUNGEON_1
	warp_to 27, 9, CERULEAN_CITY_WIDTH ; TRASHED_HOUSE
	warp_to  1, 35, CERULEAN_CITY_WIDTH ; CERULEAN_HOUSE_2
	warp_to  0, 35, CERULEAN_CITY_WIDTH ; CERULEAN_HOUSE_2
