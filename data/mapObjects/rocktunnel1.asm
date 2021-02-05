RockTunnel1Object:
	db $3 ; border block

	db 8 ; warps
	warp 15, 3, 1, -1
	warp 15, 0, 1, -1
	warp 33, 33, 2, -1
	warp 33, 35, 2, -1
	warp 37, 13, 0, ROCK_TUNNEL_2
	warp 11,  5, 1, ROCK_TUNNEL_2
	warp 17, 11, 2, ROCK_TUNNEL_2
	warp  2, 33, 3, ROCK_TUNNEL_2

	db 1 ; signs
	sign 33, 29, 8 ; RockTunnel1Text8

	db 7 ; objects
	object SPRITE_HIKER,  7,  5, STAY, RIGHT, 1, OPP_HIKER, 12
	object SPRITE_HIKER, 11,  8, STAY, UP, 2, OPP_HIKER, 13
	object SPRITE_HIKER,  5, 16, STAY, UP, 3, OPP_HIKER, 14
	object SPRITE_BLACK_HAIR_BOY_2, 17, 17, STAY, DOWN, 4, OPP_POKEMANIAC, 7
	object SPRITE_LASS, 34, 31, STAY, LEFT, 5, OPP_JR_TRAINER_F, 17
	object SPRITE_LASS, 19, 33, STAY, UP, 6, OPP_JR_TRAINER_F, 18
	object SPRITE_LASS,  3, 30, STAY, DOWN, 7, OPP_JR_TRAINER_F, 19

	; warp-to
	warp_to 15,  3, ROCK_TUNNEL_1_WIDTH
	warp_to 15, 0, ROCK_TUNNEL_1_WIDTH
	warp_to 33, 33, ROCK_TUNNEL_1_WIDTH
	warp_to 33, 35, ROCK_TUNNEL_1_WIDTH
	warp_to 37, 13, ROCK_TUNNEL_1_WIDTH ; ROCK_TUNNEL_2
	warp_to 11,  5, ROCK_TUNNEL_1_WIDTH ; ROCK_TUNNEL_2
	warp_to 17, 11, ROCK_TUNNEL_1_WIDTH ; ROCK_TUNNEL_2
	warp_to  2, 33, ROCK_TUNNEL_1_WIDTH ; ROCK_TUNNEL_2
