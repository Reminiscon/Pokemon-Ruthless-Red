CeladonCityObject:
	db $f ; border block

	db 13 ; warps
	warp  4,  7, 0, CELADON_MART_1
	warp  8,  7, 2, CELADON_MART_1
	warp 16,  7, 0, CELADON_MANSION_1
	warp 16,  1, 2, CELADON_MANSION_1
	warp 17,  1, 2, CELADON_MANSION_1
	warp 45,  5, 0, CELADON_POKECENTER
	warp 46, 31, 0, CELADON_GYM
	warp 16, 31, 0, GAME_CORNER
	warp  4, 31, 3, ROCKET_HIDEOUT_4 ; beta warp re-purposed
	warp  9, 27, 0, CELADON_PRIZE_ROOM
	warp  7, 15, 0, CELADON_DINER
	warp 11, 15, 0, CELADON_HOUSE
	warp 15, 15, 0, CELADON_HOTEL

	db 9 ; signs
	sign  7,  9, 10 ; CeladonCityText10
	sign 21, 11, 11 ; CeladonCityText11
	sign 46,  5, 12 ; PokeCenterSignText
	sign 39, 31, 13 ; CeladonCityText13
	sign 15,  9, 14 ; CeladonCityText14
	sign 12,  7, 15 ; CeladonCityText15
	sign  3,  9, 16 ; CeladonCityText16
	sign 13, 27, 17 ; CeladonCityText17
	sign 15, 33, 18 ; CeladonCityText18

	db 9 ; objects
	object SPRITE_LITTLE_GIRL, 41,  4, WALK, 0, 1 ; person
	object SPRITE_OLD_PERSON, 39, 30, STAY, RIGHT, 2 ; person
	object SPRITE_GIRL, 41,  8, WALK, 1, 3 ; person
	object SPRITE_OLD_PERSON, 37,  4, STAY, DOWN, 4 ; person
	object SPRITE_OLD_PERSON, 24,  4, STAY, DOWN, 5 ; person
	object SPRITE_FISHER2, 12, 17, STAY, LEFT, 6 ; person
	object SPRITE_SLOWBRO, 11, 17, STAY, RIGHT, 7 ; person
	object SPRITE_ROCKET, 17, 17, WALK, 2, 8 ; person
	object SPRITE_ROCKET,  6, 17, WALK, 2, 9 ; person

	; warp-to
	warp_to  4,  7, CELADON_CITY_WIDTH ; CELADON_MART_1
	warp_to  8,  7, CELADON_CITY_WIDTH ; CELADON_MART_1
	warp_to 16,  7, CELADON_CITY_WIDTH ; CELADON_MANSION_1
	warp_to 16,  1, CELADON_CITY_WIDTH ; CELADON_MANSION_1
	warp_to 17,  1, CELADON_CITY_WIDTH ; CELADON_MANSION_1
	warp_to 45,  5, CELADON_CITY_WIDTH ; CELADON_POKECENTER
	warp_to 46, 31, CELADON_CITY_WIDTH ; CELADON_GYM
	warp_to 16, 31, CELADON_CITY_WIDTH ; GAME_CORNER
	warp_to  4, 31, CELADON_CITY_WIDTH ; ROCKET_HIDEOUT_4
	warp_to  9, 27, CELADON_CITY_WIDTH ; CELADON_PRIZE_ROOM
	warp_to  7, 15, CELADON_CITY_WIDTH ; CELADON_DINER
	warp_to 11, 15, CELADON_CITY_WIDTH ; CELADON_HOUSE
	warp_to 15, 15, CELADON_CITY_WIDTH ; CELADON_HOTEL
	
