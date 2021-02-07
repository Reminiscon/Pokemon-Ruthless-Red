CeladonCityObject:
	db $f ; border block

	db 13 ; warps
	warp  8, 13, 0, CELADON_MART_1
	warp 10, 13, 2, CELADON_MART_1
	warp 16,  7, 0, CELADON_MANSION_1
	warp 16,  1, 2, CELADON_MANSION_1
	warp 17,  1, 2, CELADON_MANSION_1
	warp  3, 33, 0, CELADON_POKECENTER
	warp 32,  5, 0, CELADON_GYM
	warp 16, 33, 0, GAME_CORNER
	warp 39, 19, 0, CELADON_MART_5 ; beta warp! no longer used
	warp  9, 25, 0, CELADON_PRIZE_ROOM
	warp 25, 29, 0, CELADON_DINER
	warp 33, 29, 0, CELADON_HOUSE
	warp 41, 29, 0, CELADON_HOTEL

	db 9 ; signs
	sign 45, 21, 10 ; CeladonCityText10
	sign 19, 15, 11 ; CeladonCityText11
	sign  4, 33, 12 ; PokeCenterSignText
	sign 25,  5, 13 ; CeladonCityText13
	sign 15,  9, 14 ; CeladonCityText14
	sign 12, 13, 15 ; CeladonCityText15
	sign 41, 21, 16 ; CeladonCityText16
	sign  9, 27, 17 ; CeladonCityText17
	sign 13, 33, 18 ; CeladonCityText18

	db 9 ; objects
	object SPRITE_LITTLE_GIRL,  8, 16, WALK, 0, 1 ; person
	object SPRITE_OLD_PERSON, 25,  4, STAY, RIGHT, 2 ; person
	object SPRITE_GIRL, 14, 16, WALK, 1, 3 ; person
	object SPRITE_OLD_PERSON, 35, 16, STAY, DOWN, 4 ; person
	object SPRITE_OLD_PERSON, 22, 16, STAY, DOWN, 5 ; person
	object SPRITE_FISHER2, 34, 32, STAY, LEFT, 6 ; person
	object SPRITE_SLOWBRO, 33, 32, STAY, RIGHT, 7 ; person
	object SPRITE_ROCKET, 26, 31, WALK, 2, 8 ; person
	object SPRITE_ROCKET, 41, 32, WALK, 2, 9 ; person

	; warp-to
	warp_to  8, 13, CELADON_CITY_WIDTH ; CELADON_MART_1
	warp_to 10, 13, CELADON_CITY_WIDTH ; CELADON_MART_1
	warp_to 16,  7, CELADON_CITY_WIDTH ; CELADON_MANSION_1
	warp_to 16,  1, CELADON_CITY_WIDTH ; CELADON_MANSION_1
	warp_to 17,  1, CELADON_CITY_WIDTH ; CELADON_MANSION_1
	warp_to  3, 33, CELADON_CITY_WIDTH ; CELADON_POKECENTER
	warp_to 32,  5, CELADON_CITY_WIDTH ; CELADON_GYM
	warp_to 16, 33, CELADON_CITY_WIDTH ; GAME_CORNER
	warp_to 39, 19, CELADON_CITY_WIDTH ; CELADON_MART_5
	warp_to  9, 25, CELADON_CITY_WIDTH ; CELADON_PRIZE_ROOM
	warp_to 25, 29, CELADON_CITY_WIDTH ; CELADON_DINER
	warp_to 33, 29, CELADON_CITY_WIDTH ; CELADON_HOUSE
	warp_to 41, 29, CELADON_CITY_WIDTH ; CELADON_HOTEL
