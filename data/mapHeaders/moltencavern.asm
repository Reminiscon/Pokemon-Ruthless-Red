MoltenCavern_h:
	db CAVERN ; tileset
	db MOLTEN_CAVERN_HEIGHT, MOLTEN_CAVERN_WIDTH ; dimensions (y, x)
	dw MoltenCavernBlocks, MoltenCavernTextPointers, MoltenCavernScript ; blocks, texts, scripts
	db 0 ; connections
	dw MoltenCavernObject ; objects
