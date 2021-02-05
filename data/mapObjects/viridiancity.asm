ViridianCityObject:
	db $f ; border block

	db 5 ; warps
	warp 13, 15, 0, VIRIDIAN_POKECENTER
	warp 29, 19, 0, VIRIDIAN_MART
	warp 21, 15, 0, VIRIDIAN_SCHOOL
	warp 21, 9, 0, VIRIDIAN_HOUSE
	warp 32, 7, 0, VIRIDIAN_GYM

	db 6 ; signs
	sign 17, 17, 8 ; ViridianCityText8
	sign 19,  5, 9 ; ViridianCityText9
	sign 21, 29, 10 ; ViridianCityText10
	sign 30, 19, 11 ; MartSignText
	sign 14, 15, 12 ; PokeCenterSignText
	sign 27, 7, 13 ; ViridianCityText13

	db 7 ; objects
	object SPRITE_BUG_CATCHER, 13, 23, WALK, 0, 1 ; person
	object SPRITE_GAMBLER, 34, 7, STAY, NONE, 2 ; person	;joenote - moved him out of the way just a tad
	object SPRITE_BUG_CATCHER,  8, 23, WALK, 0, 3 ; person
	object SPRITE_GIRL, 17, 9, STAY, RIGHT, 4 ; person
	object SPRITE_LYING_OLD_MAN, 18, 9, STAY, NONE, 5 ; person
	object SPRITE_FISHER2, 35, 26, STAY, LEFT, 6 ; person
	object SPRITE_GAMBLER, 17, 5, WALK, 2, 7 ; person

	; warp-to
	warp_to 13, 15, VIRIDIAN_CITY_WIDTH ; VIRIDIAN_POKECENTER
	warp_to 29, 19, VIRIDIAN_CITY_WIDTH ; VIRIDIAN_MART
	warp_to 21, 15, VIRIDIAN_CITY_WIDTH ; VIRIDIAN_SCHOOL
	warp_to 21, 9, VIRIDIAN_CITY_WIDTH ; VIRIDIAN_HOUSE
	warp_to 32, 7, VIRIDIAN_CITY_WIDTH ; VIRIDIAN_GYM
