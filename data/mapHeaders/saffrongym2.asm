SaffronGym2_h:	;NEW MAP
	db FACILITY ; tileset
	db SAFFRON_GYM_2_HEIGHT, SAFFRON_GYM_2_WIDTH ; dimensions (y, x)
	dw SaffronGym2Blocks, SaffronGym2TextPointers, SaffronGym2Script ; blocks, texts, scripts
	db 0 ; connections
	dw SaffronGym2Object ; objects
