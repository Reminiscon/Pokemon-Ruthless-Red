VictoryRoad4_h:
	db FACILITY ; tileset
	db VICTORY_ROAD_4_HEIGHT, VICTORY_ROAD_4_WIDTH ; dimensions (y, x)
	dw VictoryRoad4Blocks, VictoryRoad4TextPointers, VictoryRoad4Script ; blocks, texts, scripts
	db 0 ; connections
	dw VictoryRoad4Object ; objects
	