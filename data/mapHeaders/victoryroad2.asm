VictoryRoad2_h:
	db FOREST ; tileset
	db VICTORY_ROAD_2_HEIGHT, VICTORY_ROAD_2_WIDTH ; dimensions (y, x)
	dw VictoryRoad2Blocks, VictoryRoad2TextPointers, VictoryRoad2Script ; blocks, texts, scripts
	db 0 ; connections
	dw VictoryRoad2Object ; objects
