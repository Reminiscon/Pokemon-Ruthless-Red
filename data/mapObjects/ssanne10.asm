SSAnne10Object:
	db $c ; border block

	db 10 ; warps
	warp 2, 5, 4, SS_ANNE_4
	warp 3, 5, 4, SS_ANNE_4
	warp 12, 5, 3, SS_ANNE_4
	warp 13, 5, 3, SS_ANNE_4
	warp 22, 5, 2, SS_ANNE_4
	warp 23, 5, 2, SS_ANNE_4
	warp 2, 15, 1, SS_ANNE_4
	warp 3, 15, 1, SS_ANNE_4
	warp 12, 15, 0, SS_ANNE_4
	warp 13, 15, 0, SS_ANNE_4

	db 0 ; signs

	db 11 ; objects
	object SPRITE_SAILOR,  1, 15, STAY, RIGHT, 1, OPP_SAILOR, 3
	object SPRITE_SAILOR, 10, 13, STAY, RIGHT, 2, OPP_SAILOR, 4
	object SPRITE_SAILOR, 12,  1, STAY, DOWN, 3, OPP_SAILOR, 5
	object SPRITE_SAILOR, 10,  3, STAY, RIGHT, 4, OPP_SAILOR, 6
	object SPRITE_SAILOR, 22,  1, STAY, DOWN, 5, OPP_SAILOR, 7
	object SPRITE_FISHER2, 20,  3, STAY, RIGHT, 6, OPP_FISHER, 2
	object SPRITE_BLACK_HAIR_BOY_2, 20, 13, STAY, RIGHT, 7 ; person
	object SPRITE_SLOWBRO, 22, 11, STAY, NONE, 8 ; person
	object SPRITE_BALL, 10,  2, STAY, NONE, 9, LEAF_STONE
	object SPRITE_BALL, 20,  2, STAY, NONE, 10, TM_44
	object SPRITE_BALL, 12, 11, STAY, NONE, 11, GUARD_SPEC

	; warp-to
	warp_to 2, 5, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to 3, 5, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to 12, 5, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to 13, 5, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to 22, 5, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to 23, 5, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to 2, 15, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to 3, 15, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to 12, 15, SS_ANNE_10_WIDTH ; SS_ANNE_4
	warp_to 13, 15, SS_ANNE_10_WIDTH ; SS_ANNE_4
