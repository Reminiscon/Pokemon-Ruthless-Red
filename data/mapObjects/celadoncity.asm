CeladonCityObject:
	db $f ; border block

	db 13 ; warps
	warp  4,  7, 0, CELADON_MART_1
	warp  8,  7, 2, CELADON_MART_1
	warp 16,  7, 0, CELADON_MANSION_1
	warp 16,  1, 2, CELADON_MANSION_1
	warp 17,  1, 2, CELADON_MANSION_1
	warp 39, 17, 0, CELADON_POKECENTER
	warp 32,  5, 0, CELADON_GYM
	warp 16, 31, 0, GAME_CORNER
	warp  4, 31, 3, ROCKET_HIDEOUT_4 ; beta warp re-purposed
	warp  9, 25, 0, CELADON_PRIZE_ROOM
	warp 25, 29, 0, CELADON_DINER
	warp 33, 29, 0, CELADON_HOUSE
	warp 41, 29, 0, CELADON_HOTEL

	db 9 ; signs
	sign  7,  9, 10 ; CeladonCityText10
	sign 19, 15, 11 ; CeladonCityText11
	sign 40, 17, 12 ; PokeCenterSignText
	sign 25,  5, 13 ; CeladonCityText13
	sign 15,  9, 14 ; CeladonCityText14
	sign 12,  7, 15 ; CeladonCityText15
	sign  3,  9, 16 ; CeladonCityText16
	sign 13, 25, 17 ; CeladonCityText17
	sign 15, 33, 18 ; CeladonCityText18

	db 9 ; objects
	object SPRITE_LITTLE_GIRL,  7, 12, WALK, 0, 1 ; person
	object SPRITE_OLD_PERSON, 25,  4, STAY, RIGHT, 2 ; person
	object SPRITE_GIRL, 14, 13, WALK, 1, 3 ; person
	object SPRITE_OLD_PERSON, 35, 16, STAY, DOWN, 4 ; person
	object SPRITE_OLD_PERSON, 22, 16, STAY, DOWN, 5 ; person
	object SPRITE_FISHER2, 35, 32, STAY, LEFT, 6 ; person
	object SPRITE_SLOWBRO, 32, 32, STAY, RIGHT, 7 ; person
	object SPRITE_ROCKET, 41, 31, WALK, 2, 8 ; person
	object SPRITE_ROCKET, 26, 32, WALK, 2, 9 ; person

	; warp-to
	warp_to  4,  7, CELADON_CITY_WIDTH ; CELADON_MART_1
	warp_to  8,  7, CELADON_CITY_WIDTH ; CELADON_MART_1
	warp_to 16,  7, CELADON_CITY_WIDTH ; CELADON_MANSION_1
	warp_to 16,  1, CELADON_CITY_WIDTH ; CELADON_MANSION_1
	warp_to 17,  1, CELADON_CITY_WIDTH ; CELADON_MANSION_1
	warp_to 39, 17, CELADON_CITY_WIDTH ; CELADON_POKECENTER
	warp_to 32,  5, CELADON_CITY_WIDTH ; CELADON_GYM
	warp_to 16, 31, CELADON_CITY_WIDTH ; GAME_CORNER
	warp_to  4, 31, CELADON_CITY_WIDTH ; ROCKET_HIDEOUT_4
	warp_to  9, 25, CELADON_CITY_WIDTH ; CELADON_PRIZE_ROOM
	warp_to 25, 29, CELADON_CITY_WIDTH ; CELADON_DINER
	warp_to 33, 29, CELADON_CITY_WIDTH ; CELADON_HOUSE
	warp_to 41, 29, CELADON_CITY_WIDTH ; CELADON_HOTEL
	
