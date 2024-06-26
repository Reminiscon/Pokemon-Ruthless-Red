SeafoamIslands5Object:
	db $7d ; border block

	db 4 ; warps
	warp  3, 57, 0, ROUTE_20
	warp 23, 77, 1, ROUTE_20
	warp 28, 51, 7, SEAFOAM_ISLANDS_4 ; ONE-WAY WARP
	warp 33, 77, 8, SEAFOAM_ISLANDS_4

	db 2 ; signs
	sign 25, 73, 16 ; SeafoamIslands5Text4
	sign 35, 79, 17 ; SeafoamIslands5Text5

	db 15 ; objects
	object SPRITE_BIRD, 30,  1, STAY, DOWN, 1, ARTICUNO, 85
	object SPRITE_BOULDER, 25, 68, STAY, BOULDER_MOVEMENT_BYTE_2, 2 ; person
	object SPRITE_BOULDER, 23, 64, STAY, BOULDER_MOVEMENT_BYTE_2, 3 ; person
	object SPRITE_BOULDER, 16, 11, STAY, BOULDER_MOVEMENT_BYTE_2, 4 ; person
	object SPRITE_BOULDER, 17, 37, STAY, BOULDER_MOVEMENT_BYTE_2, 5 ; person
	object SPRITE_BOULDER, 33, 16, STAY, BOULDER_MOVEMENT_BYTE_2, 6 ; person
	object SPRITE_BOULDER, 21, 68, STAY, BOULDER_MOVEMENT_BYTE_2, 7 ; person
	object SPRITE_BOULDER,  9, 73, STAY, BOULDER_MOVEMENT_BYTE_2, 8 ; person
	object SPRITE_BOULDER, 25, 16, STAY, BOULDER_MOVEMENT_BYTE_2, 9 ; person
	object SPRITE_BOULDER, 16, 33, STAY, BOULDER_MOVEMENT_BYTE_2, 10 ; person
	object SPRITE_BOULDER, 23, 56, STAY, BOULDER_MOVEMENT_BYTE_2, 11 ; person
	object SPRITE_BOULDER, 16, 51, STAY, BOULDER_MOVEMENT_BYTE_2, 12 ; person
	object SPRITE_BOULDER, 11,  2, STAY, BOULDER_MOVEMENT_BYTE_2, 13 ; person
	object SPRITE_BOULDER, 19, 20, STAY, BOULDER_MOVEMENT_BYTE_2, 14 ; person
	object SPRITE_BOULDER, 23, 33, STAY, BOULDER_MOVEMENT_BYTE_2, 15 ; person

	; warp-to
	warp_to  3, 57, SEAFOAM_ISLANDS_5_WIDTH ; ROUTE_20
	warp_to 23, 77, SEAFOAM_ISLANDS_5_WIDTH ; ROUTE_20
	warp_to 33, 77, SEAFOAM_ISLANDS_5_WIDTH ; SEAFOAM_ISLANDS_4
	