VictoryRoad3_h:
	db GYM ; tileset
	db VICTORY_ROAD_3_HEIGHT, VICTORY_ROAD_3_WIDTH ; dimensions (y, x)
	dw VictoryRoad3Blocks, VictoryRoad3TextPointers, VictoryRoad3Script ; blocks, texts, scripts
	db 0 ; connections
	dw VictoryRoad3Object ; objects
