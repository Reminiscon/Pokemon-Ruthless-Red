Route2Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route2TrainerHeader0
	ld de, Route2ScriptPointers
	ld a, [wRoute2CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute2CurScript], a
	ret
	
Route2ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route2TextPointers:
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw Route2Text1
	dw Route2Text2
	dw Route2Text3
	dw Route2Text4
	
Route2TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_2_TRAINER_0
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_2_TRAINER_0
	dw Route2BattleText1 ; TextBeforeBattle
	dw Route2AfterBattleText1 ; TextAfterBattle
	dw Route2EndBattleText1 ; TextEndBattle
	dw Route2EndBattleText1 ; TextEndBattle
	
Route2TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_2_TRAINER_1
	db ($5 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_2_TRAINER_1
	dw Route2BattleText2 ; TextBeforeBattle
	dw Route2AfterBattleText2 ; TextAfterBattle
	dw Route2EndBattleText2 ; TextEndBattle
	dw Route2EndBattleText2 ; TextEndBattle
	
	db $ff
	
Route2Text1:										;NEW
	TX_ASM
	ld hl, Route2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route2BattleText1:
	TX_FAR _Route2BattleText1
	db "@"

Route2EndBattleText1:
	TX_FAR _Route2EndBattleText1
	db "@"

Route2AfterBattleText1:
	TX_FAR _Route2AfterBattleText1
	db "@"
	
Route2Text2:										;NEW
	TX_ASM
	ld hl, Route2TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route2BattleText2:
	TX_FAR _Route2BattleText2
	db "@"

Route2EndBattleText2:
	TX_FAR _Route2EndBattleText2
	db "@"

Route2AfterBattleText2:
	TX_FAR _Route2AfterBattleText2
	db "@"

Route2Text3:
	TX_FAR _Route2Text3
	db "@"

Route2Text4:
	TX_FAR _Route2Text4
	db "@"


