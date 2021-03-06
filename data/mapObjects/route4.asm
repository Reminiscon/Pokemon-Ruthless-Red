Route4Object:
	db $2c ; border block

	db 3 ; warps
	warp 17, 13, 0, MT_MOON_POKECENTER
	warp 10,  1, 0, MT_MOON_1
	warp 24, 5, 7, MT_MOON_2

	db 3 ; signs
	sign 18, 13, 4 ; PokeCenterSignText
	sign  7,  3, 5 ; Route4Text5
	sign 27, 7, 6 ; Route4Text6

	db 4 ; objects
	object SPRITE_LASS, 13,  7, WALK, 0, 1 ; person
	object SPRITE_LASS, 27,  6, STAY, LEFT, 2, OPP_LASS, 4
	object SPRITE_BALL, 57,  3, STAY, NONE, 3, TM_04
	object SPRITE_HIKER, 6, 14, STAY, RIGHT, 7, OPP_BLACKBELT, 10

	; warp-to
	warp_to 17, 13, ROUTE_4_WIDTH ; MT_MOON_POKECENTER
	warp_to 10,  1, ROUTE_4_WIDTH ; MT_MOON_1
	warp_to 24, 5, ROUTE_4_WIDTH ; MT_MOON_2
