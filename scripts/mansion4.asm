Mansion4Script:
	call Mansion4Subscript1
	call EnableAutoTextBoxDrawing
	ld hl, Mansion4TrainerHeader0
	ld de, Mansion4ScriptPointers
	ld a, [wMansion4CurScript]
	call ExecuteCurMapScriptInTable
	ld [wMansion4CurScript], a
	ret

Mansion4Subscript1:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	CheckEvent EVENT_MANSION_SWITCH_ON
	jp nz, .switchedon4
	lb bc, 12, 4
	call Mansion4Script_empty
	lb bc, 25, 7
	call Mansion4Script_horizontaldown
	lb bc, 14, 17
	call Mansion4Script_horizontaldown
	lb bc, 22, 24
	call Mansion4Script_horizontaldown
	lb bc, 24, 28
	call Mansion4Script_horizontalup
	lb bc, 12, 26
	call Mansion4Script_empty
	lb bc, 11, 24
	call Mansion4Script_vertical
	lb bc, 8, 29
	call Mansion4Script_vertical
	lb bc, 4, 30
	call Mansion4Script_horizontalup
	lb bc, 26, 25
	call Mansion4Script_empty
	lb bc, 9, 6
	call Mansion4Script_empty
	lb bc, 13, 7
	call Mansion4Script_horizontaldown
	lb bc, 13, 11
	call Mansion4Script_horizontaldown
	lb bc, 15, 10
	call Mansion4Script_empty
	lb bc, 17, 6
	call Mansion4Script_empty
	lb bc, 18, 7
	call Mansion4Script_empty
	lb bc, 21, 8
	call Mansion4Script_empty
	lb bc, 22, 20
	call Mansion4Script_empty
	lb bc, 22, 29
	call Mansion4Script_horizontaldown
	lb bc, 15, 23
	call Mansion4Script_horizontalup
	lb bc, 10, 19
	call Mansion4Script_empty
	lb bc, 10, 14
	call Mansion4Script_vertical
	lb bc, 5, 29
	call Mansion4Script_empty
	lb bc, 5, 25
	call Mansion4Script_vertical
	lb bc, 9, 30
	call Mansion4Script_empty
	lb bc, 10, 21
	call Mansion4Script_empty
	lb bc, 3, 24
	call Mansion4Script_horizontaldown
	lb bc, 2, 25
	call Mansion4Script_empty
	lb bc, 1, 14
	call Mansion4Script_empty
	lb bc, 2, 12
	call Mansion4Script_horizontaldown
	lb bc, 3, 9
	call Mansion4Script_empty
	lb bc, 3, 7
	call Mansion4Script_vertical
	lb bc, 8, 13
	call Mansion4Script_empty
	lb bc, 2, 6
	call Mansion4Script_empty
	lb bc, 2, 2
	call Mansion4Script_horizontaldown
	lb bc, 2, 20
	call Mansion4Script_horizontaldown
	lb bc, 1, 27
	call Mansion4Script_vertical
	lb bc, 12, 19
	call Mansion4Script_vertical
	lb bc, 12, 18
	call Mansion4Script_empty
	lb bc, 4, 2
	jp Mansion4Script_empty
.switchedon4
	lb bc, 12, 4
	call Mansion4Script_horizontaldown
	lb bc, 25, 7
	call Mansion4Script_empty
	lb bc, 14, 17
	call Mansion4Script_empty
	lb bc, 22, 24
	call Mansion4Script_empty
	lb bc, 24, 28
	call Mansion4Script_empty
	lb bc, 12, 26
	call Mansion4Script_horizontaldown
	lb bc, 11, 24
	call Mansion4Script_empty
	lb bc, 8, 29
	call Mansion4Script_empty
	lb bc, 4, 30
	call Mansion4Script_empty
	lb bc, 26, 25
	call Mansion4Script_horizontaldown
	lb bc, 9, 6
	call Mansion4Script_vertical
	lb bc, 13, 7
	call Mansion4Script_empty
	lb bc, 13, 11
	call Mansion4Script_empty
	lb bc, 15, 10
	call Mansion4Script_vertical
	lb bc, 17, 6
	call Mansion4Script_vertical
	lb bc, 18, 7
	call Mansion4Script_horizontalup
	lb bc, 21, 8
	call Mansion4Script_vertical
	lb bc, 22, 20
	call Mansion4Script_horizontaldown
	lb bc, 22, 29
	call Mansion4Script_empty
	lb bc, 15, 23
	call Mansion4Script_empty
	lb bc, 10, 19
	call Mansion4Script_vertical
	lb bc, 10, 14
	call Mansion4Script_empty
	lb bc, 5, 29
	call Mansion4Script_vertical
	lb bc, 5, 25
	call Mansion4Script_empty
	lb bc, 9, 30
	call Mansion4Script_horizontalup
	lb bc, 10, 21
	call Mansion4Script_vertical
	lb bc, 3, 24
	call Mansion4Script_empty
	lb bc, 2, 25
	call Mansion4Script_vertical
	lb bc, 1, 14
	call Mansion4Script_vertical
	lb bc, 2, 12
	call Mansion4Script_empty
	lb bc, 3, 9
	call Mansion4Script_vertical
	lb bc, 3, 7
	call Mansion4Script_empty
	lb bc, 8, 13
	call Mansion4Script_horizontaldown
	lb bc, 2, 6
	call Mansion4Script_horizontaldown
	lb bc, 2, 2
	call Mansion4Script_empty
	lb bc, 2, 20
	call Mansion4Script_empty
	lb bc, 1, 27
	call Mansion4Script_vertical
	lb bc, 12, 19
	call Mansion4Script_empty
	lb bc, 12, 18
	call Mansion4Script_vertical
	lb bc, 4, 2
	jp Mansion4Script_horizontalup

Mansion4Script_horizontalup:
	ld a, $54
	ld [wNewTileBlockID], a
	jr Mansion4ReplaceBlock
	
Mansion4Script_horizontaldown:
	ld a, $2d
	ld [wNewTileBlockID], a
	jr Mansion4ReplaceBlock
	
Mansion4Script_vertical:
	ld a, $5f
	ld [wNewTileBlockID], a
	jr Mansion4ReplaceBlock

Mansion4Script_empty:
	ld a, $e
	ld [wNewTileBlockID], a
Mansion4ReplaceBlock:
	predef ReplaceTileBlock
	ret

Mansion4Script_Switches:
	ld a, [wSpriteStateData1 + 9]
	cp SPRITE_FACING_UP
	ret nz
	xor a
	ld [hJoyHeld], a
	ld a, $A
	ld [hSpriteIndexOrTextID], a
	jp DisplayTextID

Mansion4ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Mansion4TextPointers:
	dw Mansion4Text1
	dw Mansion4Text2
	dw Mansion4Text3	;NEW
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw Mansion4Text6 ;PickUpItemText replaced
	dw Mansion4Text7
	dw PickUpItemText
	dw Mansion3Text6

Mansion4TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_MANSION_4_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MANSION_4_TRAINER_0
	dw Mansion4BattleText1 ; TextBeforeBattle
	dw Mansion4AfterBattleText1 ; TextAfterBattle
	dw Mansion4EndBattleText1 ; TextEndBattle
	dw Mansion4EndBattleText1 ; TextEndBattle

Mansion4TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_MANSION_4_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MANSION_4_TRAINER_1
	dw Mansion4BattleText2 ; TextBeforeBattle
	dw Mansion4AfterBattleText2 ; TextAfterBattle
	dw Mansion4EndBattleText2 ; TextEndBattle
	dw Mansion4EndBattleText2 ; TextEndBattle

Mansion4TrainerHeader2:									;NEW
	dbEventFlagBit EVENT_BEAT_MANSION_4_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MANSION_4_TRAINER_2
	dw Mansion4BattleText3 ; TextBeforeBattle
	dw Mansion4AfterBattleText3 ; TextAfterBattle
	dw Mansion4EndBattleText3 ; TextEndBattle
	dw Mansion4EndBattleText3 ; TextEndBattle
	
	db $ff

Mansion4Text1:
	TX_ASM
	ld hl, Mansion4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Mansion4Text2:
	TX_ASM
	ld hl, Mansion4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd
	
Mansion4Text3:
	TX_ASM
	ld hl, Mansion4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Mansion4BattleText1:
	TX_FAR _Mansion4BattleText1
	db "@"

Mansion4EndBattleText1:
	TX_FAR _Mansion4EndBattleText1
	db "@"

Mansion4AfterBattleText1:
	TX_FAR _Mansion4AfterBattleText1
	db "@"

Mansion4BattleText2:
	TX_FAR _Mansion4BattleText2
	db "@"

Mansion4EndBattleText2:
	TX_FAR _Mansion4EndBattleText2
	db "@"

Mansion4AfterBattleText2:
	TX_FAR _Mansion4AfterBattleText2
	db "@"

Mansion4BattleText3:
	TX_FAR _Mansion4BattleText3
	db "@"

Mansion4EndBattleText3:
	TX_FAR _Mansion4EndBattleText3
	db "@"

Mansion4AfterBattleText3:
	TX_FAR _Mansion4AfterBattleText3
	db "@"
	
Mansion4Text6:
	TX_FAR _Mansion4Text6
	db "@"
	
Mansion4Text7:
	TX_FAR _Mansion4Text7
	db "@"
