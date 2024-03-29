Route4Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route4TrainerHeader0
	ld de, Route4ScriptPointers
	ld a, [wRoute4CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute4CurScript], a
	ret

Route4ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

Route4TextPointers:
	dw Route4Text1
	dw Route4Text2
	dw PickUpItemText
	dw PokeCenterSignText
	dw Route4Text5
	dw Route4Text6
	dw Route4Text7	;NEW
	dw Route4Text8	;NEW
	dw Route4Text9	;NEW

Route4TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_4_TRAINER_0
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_4_TRAINER_0
	dw Route4BattleText1 ; TextBeforeBattle
	dw Route4AfterBattleText1 ; TextAfterBattle
	dw Route4EndBattleText1 ; TextEndBattle
	dw Route4EndBattleText1 ; TextEndBattle
	
Route4TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_4_TRAINER_1
	db ($5 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_4_TRAINER_1
	dw Route4BattleText2 ; TextBeforeBattle
	dw Route4AfterBattleText2 ; TextAfterBattle
	dw Route4EndBattleText2 ; TextEndBattle
	dw Route4EndBattleText2 ; TextEndBattle

	db $ff

Route4Text1:
	TX_FAR _Route4Text1
	db "@"

Route4Text2:
	TX_ASM
	ld hl, Route4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route4BattleText1:
	TX_FAR _Route4BattleText1
	db "@"

Route4EndBattleText1:
	TX_FAR _Route4EndBattleText1
	db "@"

Route4AfterBattleText1:
	TX_FAR _Route4AfterBattleText1
	db "@"

Route4Text5:
	TX_FAR _Route4Text5
	db "@"

Route4Text6:
	TX_FAR _Route4Text6
	db "@"
	
Route4Text7:												;NEW
	TX_ASM
	ld hl, Route4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route4BattleText2:
	TX_FAR _Route4BattleText2
	db "@"

Route4EndBattleText2:
	TX_FAR _Route4EndBattleText2
	db "@"

Route4AfterBattleText2:
	TX_FAR _Route4AfterBattleText2
	db "@"
	
Route4Text8:												;NEW
	TX_FAR _Route4Text8
	db "@"
	
Route4Text9:												;NEW
	TX_FAR _Route4Text9
	db "@"

