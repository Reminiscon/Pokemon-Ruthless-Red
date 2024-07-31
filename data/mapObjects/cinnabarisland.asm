CinnabarIslandObject:
	db $43 ; border block

	db 6 ; warps
	warp 6, 3, 1, MANSION_1
	warp 18, 11, 0, CINNABAR_GYM
	warp  1, 21, 0, CINNABAR_LAB_1
	warp  3, 11, 0, CINNABAR_POKECENTER
	warp  9, 11, 0, CINNABAR_MART
	warp 12,  2, 6, MANSION_1

	db 5 ; signs
	sign  5,  5, 3 ; CinnabarIslandText3
	sign 10, 11, 4 ; MartSignText
	sign  4, 11, 5 ; PokeCenterSignText
	sign  2, 21, 6 ; CinnabarIslandText6
	sign 13, 11, 7 ; CinnabarIslandText7

	db 2 ; objects
	object SPRITE_GIRL, 13,  6, STAY, NONE, 1 ; person
	object SPRITE_GAMBLER, 17,  5, STAY, NONE, 2 ; person

	; warp-to
	warp_to 6, 3, CINNABAR_ISLAND_WIDTH ; MANSION_1
	warp_to 18, 11, CINNABAR_ISLAND_WIDTH ; CINNABAR_GYM
	warp_to  1, 21, CINNABAR_ISLAND_WIDTH ; CINNABAR_LAB_1
	warp_to  3, 11, CINNABAR_ISLAND_WIDTH ; CINNABAR_POKECENTER
	warp_to  9, 11, CINNABAR_ISLAND_WIDTH ; CINNABAR_MART
	warp_to 15,  7, CINNABAR_ISLAND_WIDTH ; CINNABAR_GYM (ONE-WAY WARP)
	warp_to 12,  2, CINNABAR_ISLAND_WIDTH ; MANSION_1
