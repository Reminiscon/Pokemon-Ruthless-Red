LavenderPokecenterScript:
	call EnableAutoTextBoxDrawing
	ld hl, LavenderPokecenterTrainerHeader0
	ld de, LavenderPokecenterScriptPointers
	ld a, [wLavenderPokecenterCurScript]
	call ExecuteCurMapScriptInTable
	ld [wLavenderPokecenterCurScript], a
	ret
	
LavenderPokecenterScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

LavenderPokecenterTextPointers:
	dw LavenderHealNurseText
	dw LavenderPokecenterText2
	dw LavenderPokecenterText3
	dw LavenderTradeNurseText
	dw LavenderPokecenterText5
	
LavenderPokecenterTrainerHeader0:
	dbEventFlagBit EVENT_BEAT_LAVENDER_POKE_CENTER_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_LAVENDER_POKE_CENTER_TRAINER_0
	dw LavenderPokecenterBattleText5 ; TextBeforeBattle
	dw LavenderPokecenterAfterBattleText5 ; TextAfterBattle
	dw LavenderPokecenterEndBattleText5 ; TextEndBattle
	dw LavenderPokecenterEndBattleText5 ; TextEndBattle
	
	db $ff

LavenderTradeNurseText:
	TX_CABLE_CLUB_RECEPTIONIST

LavenderHealNurseText:
	TX_POKECENTER_NURSE

LavenderPokecenterText2:
	TX_FAR _LavenderPokecenterText2
	db "@"

LavenderPokecenterText3:
	TX_FAR _LavenderPokecenterText3
	db "@"
	
LavenderPokecenterText5:										;NEW
	TX_ASM
	ld hl, LavenderPokecenterTrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

LavenderPokecenterBattleText5:
	TX_FAR _LavenderPokecenterBattleText5
	db "@"

LavenderPokecenterEndBattleText5:
	TX_FAR _LavenderPokecenterEndBattleText5
	db "@"

LavenderPokecenterAfterBattleText5:
	TX_FAR _LavenderPokecenterAfterBattleText5
	db "@"
