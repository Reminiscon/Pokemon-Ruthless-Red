ViridianForestObject:
	db $3 ; border block

	db 6 ; warps
	warp 15,  0, 2, VIRIDIAN_FOREST_EXIT
	warp 16,  0, 3, VIRIDIAN_FOREST_EXIT
	warp 15, 47, 1, VIRIDIAN_FOREST_ENTRANCE
	warp 16, 47, 1, VIRIDIAN_FOREST_ENTRANCE
	warp 17, 47, 1, VIRIDIAN_FOREST_ENTRANCE
	warp 18, 47, 1, VIRIDIAN_FOREST_ENTRANCE

	db 6 ; signs
	sign 10, 18, 11 ; ViridianForestText11
	sign 16, 34, 12 ; ViridianForestText12
	sign 29,  9, 13 ; ViridianForestText13
	sign 16, 14, 14 ; ViridianForestText14
	sign 18, 45, 15 ; ViridianForestText15
	sign 16,  1, 16 ; ViridianForestText16

	db 10 ; objects
	object SPRITE_BUG_CATCHER, 18, 42, STAY, NONE, 1 ; person
	object SPRITE_BUG_CATCHER,  5, 34, STAY, LEFT, 2, OPP_BUG_CATCHER, 1
	object SPRITE_BUG_CATCHER,  8, 13, STAY, LEFT, 3, OPP_BUG_CATCHER, 2
	object SPRITE_BUG_CATCHER, 16,  5, STAY, DOWN, 4, OPP_BUG_CATCHER, 3
	object SPRITE_BUG_MASTER, 32,  7, STAY, LEFT, 5, OPP_BUG_MASTER, 1
	object SPRITE_BALL,  6, 15, STAY, NONE, 6, ANTIDOTE
	object SPRITE_BALL, 20, 12, STAY, NONE, 7, SUPER_POTION
	object SPRITE_BALL, 11, 15, STAY, NONE, 8, POKE_BALL
	object SPRITE_BALL, 32,  9, STAY, NONE, 9, EXP_ALL
	object SPRITE_BUG_CATCHER, 15, 42, STAY, NONE, 10 ; person

	; warp-to
	warp_to 15,  0, VIRIDIAN_FOREST_WIDTH ; VIRIDIAN_FOREST_EXIT
	warp_to 16,  0, VIRIDIAN_FOREST_WIDTH ; VIRIDIAN_FOREST_EXIT
	warp_to 15, 47, VIRIDIAN_FOREST_WIDTH ; VIRIDIAN_FOREST_ENTRANCE
	warp_to 16, 47, VIRIDIAN_FOREST_WIDTH ; VIRIDIAN_FOREST_ENTRANCE
	warp_to 17, 47, VIRIDIAN_FOREST_WIDTH ; VIRIDIAN_FOREST_ENTRANCE
	warp_to 18, 47, VIRIDIAN_FOREST_WIDTH ; VIRIDIAN_FOREST_ENTRANCE
