VictoryRoad4Script:
	call EnableAutoTextBoxDrawing
	ld hl, VictoryRoad4TrainerHeader0
	ld de, VictoryRoad4ScriptPointers
	ld a, [wVictoryRoad4CurScript]
	call ExecuteCurMapScriptInTable
	ld [wVictoryRoad4CurScript], a
	ret

VictoryRoad4ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

VictoryRoad4TextPointers:
	dw VictoryRoad4Text1
	dw VictoryRoad4Text2
	dw VictoryRoad4Text3
	dw VictoryRoad4Text4

VictoryRoad4TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_4_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_4_TRAINER_0
	dw VictoryRoad4BattleText2 ; TextBeforeBattle
	dw VictoryRoad4AfterBattleText2 ; TextAfterBattle
	dw VictoryRoad4EndBattleText2 ; TextEndBattle
	dw VictoryRoad4EndBattleText2 ; TextEndBattle

VictoryRoad4TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_4_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_4_TRAINER_1
	dw VictoryRoad4BattleText3 ; TextBeforeBattle
	dw VictoryRoad4AfterBattleText3 ; TextAfterBattle
	dw VictoryRoad4EndBattleText3 ; TextEndBattle
	dw VictoryRoad4EndBattleText3 ; TextEndBattle

VictoryRoad4TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_VICTORY_ROAD_4_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_VICTORY_ROAD_4_TRAINER_2
	dw VictoryRoad4BattleText4 ; TextBeforeBattle
	dw VictoryRoad4AfterBattleText4 ; TextAfterBattle
	dw VictoryRoad4EndBattleText4 ; TextEndBattle
	dw VictoryRoad4EndBattleText4 ; TextEndBattle
	
	db $ff
	
VictoryRoad4Text1:
	TX_ASM
	ld hl, VictoryRoad4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad4Text2:
	TX_ASM
	ld hl, VictoryRoad4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad4Text3:
	TX_ASM
	ld hl, VictoryRoad4TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

VictoryRoad4BattleText2:
	TX_FAR _VictoryRoad4BattleText2
	db "@"

VictoryRoad4EndBattleText2:
	TX_FAR _VictoryRoad4EndBattleText2
	db "@"

VictoryRoad4AfterBattleText2:
	TX_FAR _VictoryRoad4AfterBattleText2
	db "@"

VictoryRoad4BattleText3:
	TX_FAR _VictoryRoad4BattleText3
	db "@"

VictoryRoad4EndBattleText3:
	TX_FAR _VictoryRoad4EndBattleText3
	db "@"

VictoryRoad4AfterBattleText3:
	TX_FAR _VictoryRoad4AfterBattleText3
	db "@"

VictoryRoad4BattleText4:
	TX_FAR _VictoryRoad4BattleText4
	db "@"

VictoryRoad4EndBattleText4:
	TX_FAR _VictoryRoad4EndBattleText4
	db "@"

VictoryRoad4AfterBattleText4:
	TX_FAR _VictoryRoad4AfterBattleText4
	db "@"
	
VictoryRoad4Text4:		;NEW
	TX_FAR _VictoryRoad4Text4
	db "@"
	