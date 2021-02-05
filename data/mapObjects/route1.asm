Route1Object:
	db $b ; border block

	db 0 ; warps

	db 1 ; signs
	sign 11, 31, 3 ; Route1Text3

	db 2 ; objects
	object SPRITE_BUG_CATCHER,  5, 29, STAY, 1, 1 ; person
	object SPRITE_BUG_CATCHER,  5,  4, STAY, 2, 2 ; person

	; warp-to (unused)
	warp_to  2,  7, 4
