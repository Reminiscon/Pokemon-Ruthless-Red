CeladonMansion4Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeladonMansion4TrainerHeader0
	ld de, CeladonMansion4ScriptPointers
	ld a, [wCeladonMansion4CurScript]
	call ExecuteCurMapScriptInTable
	ld [wCeladonMansion4CurScript], a
	ret
	
CeladonMansion4ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

CeladonMansion4TextPointers:
	dw CeladonMansion4Text1
	dw CeladonMansion4Text2
	dw CeladonMansion4Text3
	
CeladonMansion4TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_CELADON_MANSION_4_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_CELADON_MANSION_4_TRAINER_0
	dw CeladonMansion4BattleText1 ; TextBeforeBattle
	dw CeladonMansion4AfterBattleText1 ; TextAfterBattle
	dw CeladonMansion4EndBattleText1 ; TextEndBattle
	dw CeladonMansion4EndBattleText1 ; TextEndBattle
	
CeladonMansion4TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_CELADON_MANSION_4_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_CELADON_MANSION_4_TRAINER_1
	dw CeladonMansion4BattleText2 ; TextBeforeBattle
	dw CeladonMansion4AfterBattleText2 ; TextAfterBattle
	dw CeladonMansion4EndBattleText2 ; TextEndBattle
	dw CeladonMansion4EndBattleText2 ; TextEndBattle
	
	db $ff
	
CeladonMansion4Text1:
	TX_ASM
	ld hl, CeladonMansion4TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd
	
CeladonMansion4BattleText1:
	TX_FAR _CeladonMansion4BattleText1
	db "@"
	
CeladonMansion4EndBattleText1:
	TX_FAR _CeladonMansion4EndBattleText1
	db "@"
	
CeladonMansion4AfterBattleText1:
	TX_FAR _CeladonMansion4AfterBattleText1
	db "@"
	
CeladonMansion4Text2:
	TX_ASM
	ld hl, CeladonMansion4TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd
	
CeladonMansion4BattleText2:
	TX_FAR _CeladonMansion4BattleText2
	db "@"
	
CeladonMansion4EndBattleText2:
	TX_FAR _CeladonMansion4EndBattleText2
	db "@"
	
CeladonMansion4AfterBattleText2:
	TX_FAR _CeladonMansion4AfterBattleText2
	db "@"
	
CeladonMansion4Text3:
	TX_FAR _CeladonMansion4Text3
	db "@"
	
	
