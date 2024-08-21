VictoryRoad2Script:
	call VictoryRoad2Subscript1
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad2TrainerHeader0
	ld de, VictoryRoad2ScriptPointers
	ld a, [wVictoryRoad2CurScript]
	call ExecuteCurMapScriptInTable
	ld [wVictoryRoad2CurScript], a
	ret

VictoryRoad2Subscript1:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_VICTORY_ROAD_2_SWITCH_ON
	jp nz, .switchedon5
	;dylannote - coords that have stone as original block
	lb bc, 3, 12
	call VictoryRoad2Script_fulltree
	lb bc, 2, 18
	call VictoryRoad2Script_fulltree
	lb bc, 16, 1
	call VictoryRoad2Script_grass
	lb bc, 8, 8
	call VictoryRoad2Script_fulltree
	lb bc, 28, 10
	call VictoryRoad2Script_grass
	lb bc, 31, 14
	call VictoryRoad2Script_grass
	lb bc, 25, 16
	call VictoryRoad2Script_grass
	lb bc, 30, 1
	call VictoryRoad2Script_grass
	lb bc, 12, 18
	call VictoryRoad2Script_fulltree
	lb bc, 9, 4
	call VictoryRoad2Script_fulltree
	lb bc, 9, 5
	call VictoryRoad2Script_fulltree
	;dylannote - coords that have half trees as original block
	lb bc, 0, 7
	call VictoryRoad2Script_fulltree
	lb bc, 1, 7
	call VictoryRoad2Script_fulltree
	lb bc, 0, 3
	call VictoryRoad2Script_uppertree
	lb bc, 1, 3
	call VictoryRoad2Script_lowertree
	lb bc, 37, 4
	call VictoryRoad2Script_fulltree
	lb bc, 38, 4
	call VictoryRoad2Script_fulltree
	lb bc, 37, 5
	call VictoryRoad2Script_fulltree
	lb bc, 38, 5
	call VictoryRoad2Script_fulltree
	lb bc, 37, 6
	call VictoryRoad2Script_fulltree
	lb bc, 38, 6
	call VictoryRoad2Script_fulltree
	lb bc, 42, 10
	call VictoryRoad2Script_uppertree
	lb bc, 43, 10
	call VictoryRoad2Script_lowertree
	lb bc, 35, 15
	call VictoryRoad2Script_fulltree
	lb bc, 36, 15
	call VictoryRoad2Script_fulltree
	lb bc, 28, 17
	call VictoryRoad2Script_fulltree
	lb bc, 29, 17
	call VictoryRoad2Script_fulltree
	lb bc, 24, 2
	call VictoryRoad2Script_fulltree
	lb bc, 25, 2
	call VictoryRoad2Script_fulltree
	lb bc, 24, 3
	call VictoryRoad2Script_fulltree
	lb bc, 25, 3
	call VictoryRoad2Script_fulltree
	lb bc, 19, 2
	call VictoryRoad2Script_fulltree
	lb bc, 20, 2
	call VictoryRoad2Script_fulltree
	lb bc, 19, 3
	call VictoryRoad2Script_fulltree
	lb bc, 20, 3
	call VictoryRoad2Script_fulltree
	lb bc, 18, 12
	call VictoryRoad2Script_uppertree
	lb bc, 19, 12
	call VictoryRoad2Script_lowertree
	lb bc, 18, 14
	call VictoryRoad2Script_uppertree
	lb bc, 19, 14
	call VictoryRoad2Script_lowertree
	lb bc, 10, 11
	call VictoryRoad2Script_uppertree
	lb bc, 11, 11
	call VictoryRoad2Script_lowertree
	lb bc, 10, 12
	call VictoryRoad2Script_uppertree
	lb bc, 11, 12
	call VictoryRoad2Script_lowertree
	lb bc, 10, 13
	call VictoryRoad2Script_uppertree
	lb bc, 11, 13
	call VictoryRoad2Script_lowertree
	lb bc, 14, 9
	call VictoryRoad2Script_fulltree
	lb bc, 15, 9
	call VictoryRoad2Script_fulltree
	lb bc, 14, 8
	call VictoryRoad2Script_fulltree
	lb bc, 15, 8
	call VictoryRoad2Script_fulltree
	lb bc, 4, 9
	call VictoryRoad2Script_fulltree
	lb bc, 5, 9
	call VictoryRoad2Script_fulltree
	lb bc, 6, 17
	call VictoryRoad2Script_uppertree
	lb bc, 7, 17
	call VictoryRoad2Script_lowertree
	lb bc, 7, 13
	call VictoryRoad2Script_uppertree
	lb bc, 8, 13
	jp VictoryRoad2Script_lowertree
.switchedon5
	;dylannote - coords that have stone as original block
	lb bc, 3, 12
	call VictoryRoad2Script_grass
	lb bc, 2, 18
	call VictoryRoad2Script_grass
	lb bc, 16, 1
	call VictoryRoad2Script_fulltree
	lb bc, 8, 8
	call VictoryRoad2Script_grass
	lb bc, 28, 10
	call VictoryRoad2Script_fulltree
	lb bc, 31, 14
	call VictoryRoad2Script_fulltree
	lb bc, 25, 16
	call VictoryRoad2Script_fulltree
	lb bc, 30, 1
	call VictoryRoad2Script_fulltree
	lb bc, 12, 18
	call VictoryRoad2Script_grass
	lb bc, 9, 4
	call VictoryRoad2Script_grass
	lb bc, 9, 5
	call VictoryRoad2Script_grass
	;dylannote - coords that have half trees as original block
	lb bc, 0, 7
	call VictoryRoad2Script_uppertree
	lb bc, 1, 7
	call VictoryRoad2Script_lowertree
	lb bc, 0, 3
	call VictoryRoad2Script_fulltree
	lb bc, 1, 3
	call VictoryRoad2Script_fulltree
	lb bc, 37, 4
	call VictoryRoad2Script_uppertree
	lb bc, 38, 4
	call VictoryRoad2Script_lowertree
	lb bc, 37, 5
	call VictoryRoad2Script_uppertree
	lb bc, 38, 5
	call VictoryRoad2Script_lowertree
	lb bc, 37, 6
	call VictoryRoad2Script_uppertree
	lb bc, 38, 6
	call VictoryRoad2Script_lowertree
	lb bc, 42, 10
	call VictoryRoad2Script_fulltree
	lb bc, 43, 10
	call VictoryRoad2Script_fulltree
	lb bc, 35, 15
	call VictoryRoad2Script_uppertree
	lb bc, 36, 15
	call VictoryRoad2Script_lowertree
	lb bc, 28, 17
	call VictoryRoad2Script_uppertree
	lb bc, 29, 17
	call VictoryRoad2Script_lowertree
	lb bc, 24, 2
	call VictoryRoad2Script_uppertree
	lb bc, 25, 2
	call VictoryRoad2Script_lowertree
	lb bc, 24, 3
	call VictoryRoad2Script_uppertree
	lb bc, 25, 3
	call VictoryRoad2Script_lowertree
	lb bc, 19, 2
	call VictoryRoad2Script_uppertree
	lb bc, 20, 2
	call VictoryRoad2Script_lowertree
	lb bc, 19, 3
	call VictoryRoad2Script_uppertree
	lb bc, 20, 3
	call VictoryRoad2Script_lowertree
	lb bc, 18, 12
	call VictoryRoad2Script_fulltree
	lb bc, 19, 12
	call VictoryRoad2Script_fulltree
	lb bc, 18, 14
	call VictoryRoad2Script_fulltree
	lb bc, 19, 14
	call VictoryRoad2Script_fulltree
	lb bc, 10, 11
	call VictoryRoad2Script_fulltree
	lb bc, 11, 11
	call VictoryRoad2Script_fulltree
	lb bc, 10, 12
	call VictoryRoad2Script_fulltree
	lb bc, 11, 12
	call VictoryRoad2Script_fulltree
	lb bc, 10, 13
	call VictoryRoad2Script_fulltree
	lb bc, 11, 13
	call VictoryRoad2Script_fulltree
	lb bc, 14, 9
	call VictoryRoad2Script_uppertree
	lb bc, 15, 9
	call VictoryRoad2Script_lowertree
	lb bc, 14, 8
	call VictoryRoad2Script_uppertree
	lb bc, 15, 8
	call VictoryRoad2Script_lowertree
	lb bc, 4, 9
	call VictoryRoad2Script_uppertree
	lb bc, 5, 9
	call VictoryRoad2Script_lowertree
	lb bc, 6, 17
	call VictoryRoad2Script_fulltree
	lb bc, 7, 17
	call VictoryRoad2Script_fulltree
	lb bc, 7, 13
	call VictoryRoad2Script_fulltree
	lb bc, 8, 13
	jp VictoryRoad2Script_fulltree

VictoryRoad2Script_fulltree:
	ld a, $02
	ld [wNewTileBlockID], a
	jr VictoryRoad2ReplaceBlock
	
VictoryRoad2Script_uppertree:
	ld a, $14
	ld [wNewTileBlockID], a
	jr VictoryRoad2ReplaceBlock
	
VictoryRoad2Script_lowertree:
	ld a, $18
	ld [wNewTileBlockID], a
	jr VictoryRoad2ReplaceBlock

VictoryRoad2Script_grass:
	ld a, $2f
	ld [wNewTileBlockID], a
VictoryRoad2ReplaceBlock:
	predef ReplaceTileBlock
	ret

VictoryRoad2Script_Switches:
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ld [hJoyHeld], a
	ld a, $B
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

VictoryRoad2ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VictoryRoad2TextPointers:
	dw VictoryRoad2Text1
	dw VictoryRoad2Text2
	dw VictoryRoad2Text3
	dw VictoryRoad2Text4
	dw VictoryRoad2Text5
	dw PickUpItemText ;was MoltresText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw VictoryRoad2PuzzleText

VictoryRoad2TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_0
	dw VictoryRoad2BattleText1 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText1 ; TextAfterBattle
	dw VictoryRoad2EndBattleText1 ; TextEndBattle
	dw VictoryRoad2EndBattleText1 ; TextEndBattle

VictoryRoad2TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_1
	dw VictoryRoad2BattleText2 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText2 ; TextAfterBattle
	dw VictoryRoad2EndBattleText2 ; TextEndBattle
	dw VictoryRoad2EndBattleText2 ; TextEndBattle

VictoryRoad2TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_2
	dw VictoryRoad2BattleText3 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText3 ; TextAfterBattle
	dw VictoryRoad2EndBattleText3 ; TextEndBattle
	dw VictoryRoad2EndBattleText3 ; TextEndBattle

VictoryRoad2TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_3
	dw VictoryRoad2BattleText4 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText4 ; TextAfterBattle
	dw VictoryRoad2EndBattleText4 ; TextEndBattle
	dw VictoryRoad2EndBattleText4 ; TextEndBattle

VictoryRoad2TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_2_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_2_TRAINER_4
	dw VictoryRoad2BattleText5 ; TextBeforeBattle
	dw VictoryRoad2AfterBattleText5 ; TextAfterBattle
	dw VictoryRoad2EndBattleText5 ; TextEndBattle
	dw VictoryRoad2EndBattleText5 ; TextEndBattle

;MoltresTrainerHeader:
	;dbEventFlagBit EVENT_BEAT_MOLTRES
	;db ($0 << 4) ; trainer's view range
	;dwEventFlagAddress EVENT_BEAT_MOLTRES
	;dw MoltresBattleText ; TextBeforeBattle
	;dw MoltresBattleText ; TextAfterBattle
	;dw MoltresBattleText ; TextEndBattle
	;dw MoltresBattleText ; TextEndBattle

	db $ff

VictoryRoad2Text1:
	TX_ASM
	ld hl, VictoryRoad2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd
	
VictoryRoad2BattleText1:
	TX_FAR _VictoryRoad2BattleText1
	db "@"

VictoryRoad2EndBattleText1:
	TX_FAR _VictoryRoad2EndBattleText1
	db "@"

VictoryRoad2AfterBattleText1:
	TX_FAR _VictoryRoad2AfterBattleText1
	db "@"

VictoryRoad2Text2:
	TX_ASM
	ld hl, VictoryRoad2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd
	
VictoryRoad2BattleText2:
	TX_FAR _VictoryRoad2BattleText2
	db "@"

VictoryRoad2EndBattleText2:
	TX_FAR _VictoryRoad2EndBattleText2
	db "@"

VictoryRoad2AfterBattleText2:
	TX_FAR _VictoryRoad2AfterBattleText2
	db "@"

VictoryRoad2Text3:
	TX_ASM
	ld hl, VictoryRoad2TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd
	
VictoryRoad2BattleText3:
	TX_FAR _VictoryRoad2BattleText3
	db "@"

VictoryRoad2EndBattleText3:
	TX_FAR _VictoryRoad2EndBattleText3
	db "@"

VictoryRoad2AfterBattleText3:
	TX_FAR _VictoryRoad2AfterBattleText3
	db "@"

VictoryRoad2Text4:
	TX_ASM
	ld hl, VictoryRoad2TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd
	
VictoryRoad2BattleText4:
	TX_FAR _VictoryRoad2BattleText4
	db "@"

VictoryRoad2EndBattleText4:
	TX_FAR _VictoryRoad2EndBattleText4
	db "@"

VictoryRoad2AfterBattleText4:
	TX_FAR _VictoryRoad2AfterBattleText4
	db "@"

VictoryRoad2Text5:
	TX_ASM
	ld hl, VictoryRoad2TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd
	
VictoryRoad2BattleText5:
	TX_FAR _VictoryRoad2BattleText5
	db "@"

VictoryRoad2EndBattleText5:
	TX_FAR _VictoryRoad2EndBattleText5
	db "@"

VictoryRoad2AfterBattleText5:
	TX_FAR _VictoryRoad2AfterBattleText5
	db "@"
	
VictoryRoad2PuzzleText:
	TX_ASM
	ld hl, VictoryRoad2SwitchText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_4438d
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ld hl, VictoryRoad2SwitchPressedText
	call PrintText
	ld a, SFX_GO_INSIDE
	call PlaySound
	CheckAndSetEvent EVENT_VICTORY_ROAD_2_SWITCH_ON
	jr z, .asm_44393
	ResetEventReuseHL EVENT_VICTORY_ROAD_2_SWITCH_ON
	jr .asm_44393
.asm_4438d
	ld hl, VictoryRoad2SwitchNotPressedText
	call PrintText
.asm_44393
	jp TextScriptEnd

VictoryRoad2SwitchText:
	TX_FAR _VictoryRoad2SwitchText
	db "@"

VictoryRoad2SwitchPressedText:
	TX_FAR _VictoryRoad2SwitchPressedText
	db "@"

VictoryRoad2SwitchNotPressedText:
	TX_FAR _VictoryRoad2SwitchNotPressedText
	db "@"

;MoltresText:
	;TX_ASM
	;ld hl, MoltresTrainerHeader
	;call TalkToTrainer
	;jp TextScriptEnd

;MoltresBattleText:
	;TX_FAR _MoltresBattleText
	;TX_ASM
	;ld a, MOLTRES
	;call PlayCry
	;call WaitForSoundToFinish
	;jp TextScriptEnd

;dylannote - This script is being replaced for a different puzzle
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; wispnote - Due to various evidence I suspect that the puzzle
; wasn't ment to be reset and this instruction was left for debugging purposes.
	; ld hl, wCurrentMapScriptFlags
	; bit 6, [hl]
	; res 6, [hl]
	; call nz, VictoryRoad2Script_517c4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	ld hl, wCurrentMapScriptFlags
;	bit 5, [hl]
;	res 5, [hl]
;	call nz, VictoryRoad2Script_517c9
;	call EnableAutoTextBoxDrawing
;	ld hl, VictoryRoad2TrainerHeader0
;	ld de, VictoryRoad2ScriptPointers
;	ld a, [wVictoryRoad2CurScript]
;	call ExecuteCurMapScriptInTable
;	ld [wVictoryRoad2CurScript], a
;	ret

;VictoryRoad2Script_517c4:
;	ResetEvent EVENT_VICTORY_ROAD_1_BOULDER_ON_SWITCH

;VictoryRoad2Script_517c9:
;	CheckEvent EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
;	jr z, .asm_517da
;	push af
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; wispnote - If the 1st switch is activated place the boulder in switch's coordinates.
; Sprite11 indexes the 1st boulder, and ($01, $10) are the 1st swtich's coordinates.
;	ld hl, Sprite11MapY
;	ld a, $10
;	add 4; wispnote - We need to offset coordinates by 4
;	ld [hl], a
;	ld hl, Sprite11MapX
;	ld a, $01
;	add 4; wispnote - We need to offset coordinates by 4
;	ld [hl], a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	ld a, $15
;	lb bc, 4, 3
;	call VictoryRoad2Script_517e2
;	pop af
;.asm_517da
;	bit 7, a
;	ret z
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; wispnote - If the 2nd switch is activated place the boulder in switch's coordinates.
; Sprite13 indexes the 2nd boulder, and ($09, $10) are the 2nd swtich's coordinates.
; Not it should be impossible for a boulder to arrive there if Sprite13 is hidden;
; therefore, there is no need to check.
;	ld hl, Sprite13MapY
;	ld a, $10
;	add 4; wispnote - We need to offset coordinates by 4
;	ld [hl], a
;	ld hl, Sprite13MapX
;	ld a, $09
;	add 4; wispnote - We need to offset coordinates by 4
;	ld [hl], a
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;	ld a, $1d
;	lb bc, 7, 11

;VictoryRoad2Script_517e2:
;	ld [wNewTileBlockID], a
;	predef ReplaceTileBlock
;	ret

;VictoryRoad2ScriptPointers:
;	dw VictoryRoad2Script0
;	dw DisplayEnemyTrainerTextAndStartBattle
;	dw EndTrainerBattle

;VictoryRoad2Script0:
;	ld hl, CoordsData_51816
;	call CheckBoulderCoords
;	jp nc, CheckFightingMapTrainers
;	EventFlagAddress hl, EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
;	ld a, [wCoordIndex]
;	cp $2
;	jr z, .asm_5180b; wispnote - Jump if the boulder is on the second coordinates.
;	CheckEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
;	SetEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
;	ret nz
;	jr .asm_51810
;.asm_5180b
;	CheckEventAfterBranchReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2, EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH1
;	SetEventReuseHL EVENT_VICTORY_ROAD_2_BOULDER_ON_SWITCH2
;	ret nz
;.asm_51810
;	ld hl, wCurrentMapScriptFlags
;	set 5, [hl]
;	ret

;CoordsData_51816:
;	db $10,$01
;	db $10,$09
;	db $FF
