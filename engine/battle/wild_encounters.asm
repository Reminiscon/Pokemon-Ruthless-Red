; try to initiate a wild pokemon encounter
; returns success in Z
TryDoWildEncounter:
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, [wd736]
	and a
	ret nz
	callab IsPlayerStandingOnDoorTileOrWarpTile
	jr nc, .notStandingOnDoorOrWarpTile
.CantEncounter
	ld a, $1
	and a
	ret
.notStandingOnDoorOrWarpTile
	callab IsPlayerJustOutsideMap
	jr z, .CantEncounter
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .next
	dec a
	jp z, .lastRepelStep
	ld [wRepelRemainingSteps], a
.next
; determine if wild pokemon can appear in the half-block we're standing in
; is the bottom right tile (9,9) of the half-block we're standing in a grass/water tile?
	coord hl, 9, 9
	ld c, [hl]
	ld a, [wGrassTile]
	cp c
	ld a, [wGrassRate]
	jr z, .CanEncounter
	ld a, $14 ; in all tilesets with a water tile, this is its id
	cp c
	ld a, [wWaterRate]
	jr z, .CanEncounter
; even if not in grass/water, standing anywhere we can encounter pokemon
; so long as the map is "indoor" and has wild pokemon defined.
; ...as long as it's not Viridian Forest or Safari Zone.
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI	; dylannote - If Giovanni was beaten, no more wild mons at Silph
	jr z,.skipgiovannicheck
	ld a, [wCurMap]
	cp SILPH_CO_2F ;SILPH_CO_2F to SILPH_CO_8F remove wild pokemon if Giovanni was defeated
	jr c, .skipgiovannicheck
	cp MANSION_2
	jr c, .CantEncounter2
	cp SILPH_CO_9F	;SILPH_CO_9F to SILPH_CO_11F remove wild pokemon if Giovanni was defeated
	jr c, .skipgiovannicheck
	cp SILPH_CO_ELEVATOR
	jr c, .CantEncounter2
.skipgiovannicheck
	ld a, [wCurMap]
	cp REDS_HOUSE_1F ; is this an indoor map?
	jr c, .CantEncounter2
	ld a, [wCurMapTileset]
	cp FOREST ; Viridian Forest/Safari Zone
	jr z, .CantEncounter2
	ld a, [wGrassRate]
.CanEncounter
; compare encounter chance with a random number to determine if there will be an encounter
	ld b, a
	ld a, [hRandomAdd]
	cp b
	jr nc, .CantEncounter2
	ld a, [hRandomSub]
	ld b, a
	ld hl, WildMonEncounterSlotChances
.determineEncounterSlot
	ld a, [hli]
	cp b
	jr nc, .gotEncounterSlot
	inc hl
	jr .determineEncounterSlot
.gotEncounterSlot
; determine which wild pokemon (grass or water) can appear in the half-block we're standing in
	ld c, [hl]
	ld hl, wGrassMons
	aCoord 9, 9 ;joenote - change this to (9,9) to refer to bottom right tile instead of bottom left (8,9 as originally)
	cp $14 ; is the bottom right tile (9,9) of the half-block we're standing in a water tile?
	jr nz, .gotWildEncounterType ; if not, it's treated as a grass tile by default
	ld hl, wWaterMons
; since the bottom right tile of a "left shore" half-block used to be $14 but the bottom left tile was not,
; "left shore" half-blocks (such as the one in the east coast of Cinnabar) loaded grass encounters & gave missingno.
.gotWildEncounterType
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld [wCurEnemyLVL], a
	ld a, [hl]
	ld [wcf91], a
	ld [wEnemyMonSpecies2], a
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .willEncounter
	ld a, [wPartyMon1Level]
	ld b, a
	ld a, [wCurEnemyLVL]
	cp b
	jr c, .CantEncounter2 ; repel prevents encounters if the leading party mon's level is higher than the wild mon
	jr .willEncounter
.lastRepelStep
	ld [wRepelRemainingSteps], a
	ld a, TEXT_REPEL_WORE_OFF
	ld [hSpriteIndexOrTextID], a
	call EnableAutoTextBoxDrawing
	call DisplayTextID
.CantEncounter2
	ld a, $1
	and a
	ret
.willEncounter
	xor a
	ret

WildMonEncounterSlotChances:
; There are 10 slots for wild pokemon, and this is the table that defines how common each of
; those 10 slots is. A random number is generated and then the first byte of each pair in this
; table is compared against that random number. If the random number is less than or equal
; to the first byte, then that slot is chosen.  The second byte is double the slot number.
	db $32, $00 ; 51/256 = 19.9% chance of slot 0
	db $65, $02 ; 51/256 = 19.9% chance of slot 1
	db $8C, $04 ; 39/256 = 15.2% chance of slot 2
	db $B3, $06 ; 39/256 = 15.2% chance of slot 3
	db $CC, $08 ; 25/256 =  9.8% chance of slot 4
	db $E5, $0A ; 25/256 =  9.8% chance of slot 5
	db $EE, $0C ;  9/256 =  3.5% chance of slot 6
	db $F7, $0E ;  9/256 =  3.5% chance of slot 7
	db $FD, $10 ;  6/256 =  2.3% chance of slot 8
	db $FF, $12 ;  2/256 =  0.8% chance of slot 9
