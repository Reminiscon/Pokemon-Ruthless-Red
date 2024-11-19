IndigoPlateauLobbyObject:
	db $0 ; border block

	db 4 ; warps
	warp  7, 11, 0, INDIGO_PLATEAU
	warp  8, 11, 1, INDIGO_PLATEAU
	warp  8,  0, 0, LORELEIS_ROOM
	warp 14,  0, 1, ROUTE_22

	db 0 ; signs

	db 8 ; objects
	object SPRITE_NURSE, 7, 5, STAY, DOWN, 1 ; person
	object SPRITE_GYM_HELPER,  2,  9, STAY, RIGHT, 2 ; person
	object SPRITE_LASS,  7,  1, STAY, DOWN, 3 ; person
	object SPRITE_MART_GUY, 0, 5, STAY, RIGHT, 4 ; person
	object SPRITE_CABLE_CLUB_WOMAN, 13, 6, STAY, DOWN, 5 ; person
	object SPRITE_BUG_MASTER, 4, 7, STAY, DOWN, 6 ; person
	object SPRITE_CHIEF, 9, 7, STAY, DOWN, 7 ; person
	object SPRITE_BLACK_HAIR_BOY_2, 13, 1, STAY, DOWN, 8 ; person

	; warp-to
	warp_to  7, 11, INDIGO_PLATEAU_LOBBY_WIDTH
	warp_to  8, 11, INDIGO_PLATEAU_LOBBY_WIDTH
	warp_to  8, 0, INDIGO_PLATEAU_LOBBY_WIDTH ; LORELEIS_ROOM
	warp_to  7, 9, INDIGO_PLATEAU_LOBBY_WIDTH ; INDIGO_PLATEAU_LOBBY
	warp_to 14, 0, INDIGO_PLATEAU_LOBBY_WIDTH ; ROUTE_22
