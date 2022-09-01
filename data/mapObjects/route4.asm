Route4Object:
	db $2c ; border block

	db 4 ; warps
	warp 17, 13, 0, MT_MOON_POKECENTER
	warp 10,  1, 0, MT_MOON_1
	warp 48,  1, 7, MT_MOON_2
	warp 78,  1, 9, MT_MOON_2	;NEW

	db 5 ; signs
	sign 18, 13, 4 ; PokeCenterSignText
	sign  7,  3, 5 ; Route4Text5
	sign 51,  3, 6 ; Route4Text6
	sign 75,  9, 8 ; Route4Text8
	sign 79,  3, 9 ; Route4Text9

	db 4 ; objects
	object SPRITE_LASS, 12,  6, STAY, 0, 1 ; person
	object SPRITE_LASS, 47,  2, STAY, RIGHT, 2, OPP_LASS, 4
	object SPRITE_BALL, 34, 15, STAY, NONE, 3, TM_04
	object SPRITE_HIKER,  6, 13, STAY, RIGHT, 7, OPP_BLACKBELT, 10

	; warp-to
	warp_to 17, 13, ROUTE_4_WIDTH ; MT_MOON_POKECENTER
	warp_to 10,  1, ROUTE_4_WIDTH ; MT_MOON_1
	warp_to 48,  1, ROUTE_4_WIDTH ; MT_MOON_2
	warp_to 78,  1, ROUTE_4_WIDTH ; MT_MOON_2		;NEW
