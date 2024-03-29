SaffronGymObject:
	db $2e ; border block

	db 28 ; warps
	warp 10, 33, 2, -1
	warp 11, 33, 2, -1
	warp 13, 31, 2, SAFFRON_GYM ; ONE-WAY WARP
	warp  3, 19, 7, SAFFRON_GYM
	warp  5, 19, 8, SAFFRON_GYM
	warp  3, 21, 9, SAFFRON_GYM
	warp  5, 21, 10, SAFFRON_GYM
	warp 21, 21, 3, SAFFRON_GYM
	warp 21, 31, 4, SAFFRON_GYM
	warp 19, 27, 5, SAFFRON_GYM
	warp  3, 33, 6, SAFFRON_GYM
	warp  3, 25, 15, SAFFRON_GYM
	warp 19, 25, 16, SAFFRON_GYM
	warp  3, 31, 17, SAFFRON_GYM
	warp 19, 31, 18, SAFFRON_GYM
	warp 21, 19, 11, SAFFRON_GYM
	warp  5, 33, 12, SAFFRON_GYM
	warp 19, 33, 13, SAFFRON_GYM
	warp 21, 27, 14, SAFFRON_GYM
	warp  5, 27, 22, SAFFRON_GYM
	warp  5, 25, 23, SAFFRON_GYM
	warp  5, 31, 24, SAFFRON_GYM
	warp 19, 19, 19, SAFFRON_GYM
	warp 21, 25, 20, SAFFRON_GYM
	warp 19, 21, 21, SAFFRON_GYM
	warp 21, 33,  0, SAFFRON_GYM_2 ; ONE-WAY WARP
	warp  3, 27,  1, SAFFRON_GYM_2 ; ONE-WAY WARP
	warp 13, 23,  6, SAFFRON_GYM_2 ; ONE-WAY WARP

	db 0 ; signs

	db 9 ; objects
	object SPRITE_GIRL, 11, 24, STAY, DOWN, 1, OPP_SABRINA, 1
	object SPRITE_MEDIUM, 27, 13, STAY, DOWN, 2, OPP_CHANNELER, 14
	object SPRITE_BUG_CATCHER, 21, 18, STAY, DOWN, 3, OPP_PSYCHIC_TR, 1
	object SPRITE_MEDIUM,  2, 25, STAY, RIGHT, 4, OPP_CHANNELER, 15
	object SPRITE_BUG_CATCHER, 18, 27, STAY, RIGHT, 5, OPP_PSYCHIC_TR, 2
	object SPRITE_MEDIUM,  5, 30, STAY, DOWN, 6, OPP_CHANNELER, 16
	object SPRITE_BUG_CATCHER, 19, 30, STAY, DOWN, 7, OPP_PSYCHIC_TR, 3
	object SPRITE_BUG_CATCHER,  3, 18, STAY, DOWN, 8, OPP_PSYCHIC_TR, 4
	object SPRITE_GYM_HELPER, 12, 31, STAY, DOWN, 9 ; person

	; warp-to
	warp_to 10, 33, SAFFRON_GYM_WIDTH ; SAFFRON_CITY
	warp_to 11, 33, SAFFRON_GYM_WIDTH ; SAFFRON_CITY
	warp_to  4, 20, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to  3, 19, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to  5, 19, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to  3, 21, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to  5, 21, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to 21, 21, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to 21, 31, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to 19, 27, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to  3, 33, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to  3, 25, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to 19, 25, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to  3, 31, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to 19, 31, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to 21, 19, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to  5, 33, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to 19, 33, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to 21, 27, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to  5, 27, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to  5, 25, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to  5, 31, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to 19, 19, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to 21, 25, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	warp_to 19, 21, SAFFRON_GYM_WIDTH ; SAFFRON_GYM
	;warp_to  6,  1, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP) 
	;warp_to 18,  1, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP) 
	
	warp_to  3, 20, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to 20, 27, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to  5, 32, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to 21, 20, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to 19, 32, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to  4, 25, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	
	warp_to 21, 20, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	;warp_to 12, 18, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to  3, 20, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to 19, 32, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to  5, 32, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to 20, 27, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	
	warp_to  4, 25, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to 19, 32, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to 21, 20, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to  3, 20, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to 20, 27, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to  5, 32, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	
	warp_to  4, 25, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to 11, 27, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	
	warp_to 21, 20, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to  3, 20, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	warp_to 19, 32, SAFFRON_GYM_WIDTH ; SAFFRON_GYM (ONE-WAY WARP)
	