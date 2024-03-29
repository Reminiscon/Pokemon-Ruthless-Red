VermilionCityObject:
	db $43 ; border block

	db 9 ; warps
	warp 11, 3, 0, VERMILION_POKECENTER
	warp 29,  7, 0, POKEMON_FAN_CLUB
	warp  9, 11, 0, VERMILION_MART
	warp 12, 27, 0, VERMILION_GYM
	warp  7, 17, 0, VERMILION_HOUSE_1
	warp 18, 31, 0, VERMILION_DOCK
	warp 19, 31, 0, VERMILION_DOCK
	warp 21, 11, 0, VERMILION_HOUSE_3
	warp 33,  7, 0, VERMILION_HOUSE_2

	db 7 ; signs
	sign 23,  3, 7 ; VermilionCityText7
	sign 35, 11, 8 ; VermilionCityText8
	sign 10, 11, 9 ; MartSignText
	sign 12, 3, 10 ; PokeCenterSignText
	sign 27,  7, 11 ; VermilionCityText11
	sign  7, 27, 12 ; VermilionCityText12
	sign 15, 21, 13 ; VermilionCityText13

	db 6 ; objects
	object SPRITE_FOULARD_WOMAN, 14, 22, STAY, DOWN, 1 ; person
	object SPRITE_GAMBLER, 15,  5, STAY, NONE, 2 ; person
	object SPRITE_SAILOR, 19, 30, STAY, UP, 3 ; person
	object SPRITE_GAMBLER, 30, 10, STAY, NONE, 4 ; person
	object SPRITE_SLOWBRO, 29, 13, WALK, 1, 5 ; person
	object SPRITE_SAILOR, 25, 27, WALK, 2, 6 ; person

	; warp-to
	warp_to 11, 3, VERMILION_CITY_WIDTH ; VERMILION_POKECENTER
	warp_to 29,  7, VERMILION_CITY_WIDTH ; POKEMON_FAN_CLUB
	warp_to  9, 11, VERMILION_CITY_WIDTH ; VERMILION_MART
	warp_to 12, 27, VERMILION_CITY_WIDTH ; VERMILION_GYM
	warp_to  7, 17, VERMILION_CITY_WIDTH ; VERMILION_HOUSE_1
	warp_to 18, 31, VERMILION_CITY_WIDTH ; VERMILION_DOCK
	warp_to 19, 31, VERMILION_CITY_WIDTH ; VERMILION_DOCK
	warp_to 21, 11, VERMILION_CITY_WIDTH ; VERMILION_HOUSE_3
	warp_to 33,  7, VERMILION_CITY_WIDTH ; VERMILION_HOUSE_2
