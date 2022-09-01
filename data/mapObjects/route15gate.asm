Route15GateObject:
	db $a ; border block

	db 8 ; warps
	warp  0,  4, 0, -1
	warp  0,  5, 1, -1
	warp  7,  4, 2, -1
	warp  7,  5, 3, -1
	warp  7,  1, 4, ROUTE_15
	warp  2,  0, 5, ROUTE_15
	warp  3,  0, 6, ROUTE_15
	warp 6, 8, 0, ROUTE_15_GATE_2F

	db 0 ; signs

	db 1 ; objects
	object SPRITE_GUARD,  4,  3, STAY, NONE, 1 ; person

	; warp-to
	warp_to  0,  4, ROUTE_15_GATE_1F_WIDTH
	warp_to  0,  5, ROUTE_15_GATE_1F_WIDTH
	warp_to  7,  4, ROUTE_15_GATE_1F_WIDTH
	warp_to  7,  5, ROUTE_15_GATE_1F_WIDTH
	warp_to  7,  1, ROUTE_15_GATE_1F_WIDTH
	warp_to  2,  0, ROUTE_15_GATE_1F_WIDTH
	warp_to  3,  0, ROUTE_15_GATE_1F_WIDTH
	warp_to 6, 8, ROUTE_15_GATE_1F_WIDTH ; ROUTE_15_GATE_2F
