MtMoon2Object:
	db $3 ; border block

	db 10 ; warps
	warp 16, 24, 2, MT_MOON_1
	warp 23, 11, 0, MT_MOON_3
	warp 25, 9, 3, MT_MOON_1
	warp 25, 15, 4, MT_MOON_1
	warp 21, 27, 1, MT_MOON_3
	warp 25, 27, 2, MT_MOON_3
	warp 23,  3, 3, MT_MOON_3
	warp 27,  3, 2, ROUTE_4
	warp  4, 24, 4, MT_MOON_3	;NEW
	warp 17, 17, 3, -1			;NEW

	db 0 ; signs

	db 6 ; objects
	object SPRITE_BALL,  6,  7, STAY, NONE, 1, FULL_RESTORE
	object SPRITE_BALL,  7,  6, STAY, NONE, 2, MIST_STONE
	object SPRITE_BALL,  7,  7, STAY, NONE, 3, TM_02
	object SPRITE_BALL,  6,  6, STAY, NONE, 4, MAX_REPEL
	object SPRITE_OAK_AIDE,  3, 21, STAY, DOWN, 5, OPP_CHIEF, 3
	object SPRITE_SLOWBRO,  1, 24, STAY, NONE, 6 ; person

	; warp-to
	warp_to 16, 24, MT_MOON_2_WIDTH ; MT_MOON_1
	warp_to 23, 11, MT_MOON_2_WIDTH ; MT_MOON_3
	warp_to 25, 9, MT_MOON_2_WIDTH ; MT_MOON_1
	warp_to 25, 15, MT_MOON_2_WIDTH ; MT_MOON_1
	warp_to 21, 27, MT_MOON_2_WIDTH ; MT_MOON_3
	warp_to 25, 27, MT_MOON_2_WIDTH ; MT_MOON_3
	warp_to 23,  3, MT_MOON_2_WIDTH ; MT_MOON_3
	warp_to 27,  3, MT_MOON_2_WIDTH	; ROUTE_4
	warp_to  4, 24, MT_MOON_2_WIDTH	; MT_MOON_3		;NEW
	warp_to 17, 17, MT_MOON_2_WIDTH	; ROUTE_4		;NEW
