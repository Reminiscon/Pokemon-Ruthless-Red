Mansion2Script:
	call Mansion2Subscript1
	call EnableAutoTextBoxDrawing
	ld hl, Mansion2TrainerHeader0
	ld de, Mansion2ScriptPointers
	ld a, [wMansion2CurScript]
	call ExecuteCurMapScriptInTable
	ld [wMansion2CurScript], a
	ret

Mansion2Subscript1:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_MANSION_SWITCH_ON
	jr nz, .switchedon2
	lb bc, 7, 2
	call Mansion2Script_empty
	lb bc, 11, 5
	call Mansion2Script_empty
	lb bc, 6, 12
	call Mansion2Script_empty
	lb bc, 4, 13
	call Mansion2Script_empty
	lb bc, 2, 7
	call Mansion2Script_vertical
	lb bc, 6, 9
	call Mansion2Script_horizontaldown
	lb bc, 5, 10
	call Mansion2Script_vertical
	lb bc, 12, 8
	call Mansion2Script_vertical
	lb bc, 12, 11
	call Mansion2Script_vertical
	lb bc, 2, 4
	jp Mansion2Script_empty
.switchedon2
	lb bc, 7, 2
	call Mansion2Script_horizontalup
	lb bc, 11, 5
	call Mansion2Script_vertical
	lb bc, 6, 12
	call Mansion2Script_horizontaldown
	lb bc, 4, 13
	call Mansion2Script_horizontalup
	lb bc, 2, 7
	call Mansion2Script_empty
	lb bc, 6, 9
	call Mansion2Script_empty
	lb bc, 5, 10
	call Mansion2Script_empty
	lb bc, 12, 8
	call Mansion2Script_empty
	lb bc, 12, 11
	call Mansion2Script_empty
	lb bc, 2, 4
	jp Mansion2Script_vertical

Mansion2Script_horizontalup:
	ld a, $54
	ld [wNewTileBlockID], a
	jr Mansion2ReplaceBlock
	
Mansion2Script_horizontaldown:
	ld a, $2d
	ld [wNewTileBlockID], a
	jr Mansion2ReplaceBlock
	
Mansion2Script_vertical:
	ld a, $5f
	ld [wNewTileBlockID], a
	jr Mansion2ReplaceBlock

Mansion2Script_empty:
	ld a, $e
	ld [wNewTileBlockID], a
Mansion2ReplaceBlock:
	predef ReplaceTileBlock
	ret
	
Mansion2Script_5202f:
	ld [wNewTileBlockID], a
	predef_jump ReplaceTileBlock

Mansion2Script_Switches:
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ld [hJoyHeld], a
	ld a, $5
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

Mansion2ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Mansion2TextPointers:
	dw Mansion2Text1
	dw PickUpItemText
	dw Mansion2Text3
	dw Mansion2Text4
	dw Mansion2Text5

Mansion2TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_MANSION_2_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MANSION_2_TRAINER_0
	dw Mansion2BattleText1 ; TextBeforeBattle
	dw Mansion2AfterBattleText1 ; TextAfterBattle
	dw Mansion2EndBattleText1 ; TextEndBattle
	dw Mansion2EndBattleText1 ; TextEndBattle

	db $ff

Mansion2Text1:
	TX_ASM
	ld hl, Mansion2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Mansion2BattleText1:
	TX_FAR _Mansion2BattleText1
	db "@"

Mansion2EndBattleText1:
	TX_FAR _Mansion2EndBattleText1
	db "@"

Mansion2AfterBattleText1:
	TX_FAR _Mansion2AfterBattleText1
	db "@"

Mansion2Text3:
	TX_FAR _Mansion2Text3
	db "@"

Mansion2Text4:
	TX_FAR _Mansion2Text4
	db "@"

Mansion3Text6:
Mansion2Text5:
	TX_ASM
	ld hl, Mansion2Text_520c2
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_520b9
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, wCurrentMapScriptFlags
	set 5, [hl]
	ld hl, Mansion2Text_520c7
	call PrintText
	ld a, SFX_GO_INSIDE
	call PlaySound
	CheckAndSetEvent EVENT_MANSION_SWITCH_ON
	jr z, .asm_520bf
	ResetEventReuseHL EVENT_MANSION_SWITCH_ON
	jr .asm_520bf
.asm_520b9
	ld hl, Mansion2Text_520cc
	call PrintText
.asm_520bf
	jp TextScriptEnd

Mansion2Text_520c2:
	TX_FAR _Mansion2Text_520c2
	db "@"

Mansion2Text_520c7:
	TX_FAR _Mansion2Text_520c7
	db "@"

Mansion2Text_520cc:
	TX_FAR _Mansion2Text_520cc
	db "@"
