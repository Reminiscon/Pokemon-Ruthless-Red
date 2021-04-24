PokemonTower7Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower7TrainerHeader0
	ld de, PokemonTower7ScriptPointers
	ld a, [wPokemonTower7CurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower7CurScript], a
	ret

PokemonTower7Script_60d18:
	xor a
	ld [wJoyIgnore], a
	ld [wPokemonTower7CurScript], a
	ld [wCurMapScript], a
	ret

PokemonTower7ScriptPointers:
	dw PokemonTower7Script5
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	
PokemonTower7Script5:
	ld hl, CoordsData_60996
	call ArePlayerCoordsInArray
	jr c, .asm_60960
	ld hl, wd72e
	res 4, [hl]
	ResetEvent EVENT_IN_PURIFIED_ZONE4
	jp CheckFightingMapTrainers
.asm_60960
	CheckAndSetEvent EVENT_IN_PURIFIED_ZONE4
	ret nz
	xor a
	ld [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld hl, wd72e
	set 4, [hl]
	predef HealParty
	call GBFadeOutToWhite
	call Delay3
	call Delay3
	call GBFadeInFromWhite
	ld a, $9
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ret

CoordsData_60996:
	db $04,$06
	db $04,$07
	db $05,$06
	db $05,$07
	db $FF

PokemonTower7TextPointers:
	dw PokemonTower7Text1
	dw PokemonTower7Text2
	dw PokemonTower7Text3
	dw PokemonTower7Text4
	dw PokemonTower7Text5
	dw PokemonTower7Text6
	dw PokemonTower7Text7
	dw PokemonTower7FujiText
	dw PokemonTower7Text8

PokemonTower7TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_7_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_7_TRAINER_0
	dw PokemonTower7BattleText1 ; TextBeforeBattle
	dw PokemonTower7AfterBattleText1 ; TextAfterBattle
	dw PokemonTower7EndBattleText1 ; TextEndBattle
	dw PokemonTower7EndBattleText1 ; TextEndBattle

PokemonTower7TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_7_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_7_TRAINER_1
	dw PokemonTower7BattleText2 ; TextBeforeBattle
	dw PokemonTower7AfterBattleText2 ; TextAfterBattle
	dw PokemonTower7EndBattleText2 ; TextEndBattle
	dw PokemonTower7EndBattleText2 ; TextEndBattle

PokemonTower7TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_7_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_7_TRAINER_2
	dw PokemonTower7BattleText3 ; TextBeforeBattle
	dw PokemonTower7AfterBattleText3 ; TextAfterBattle
	dw PokemonTower7EndBattleText3 ; TextEndBattle
	dw PokemonTower7EndBattleText3 ; TextEndBattle
	
PokemonTower7TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_7_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_7_TRAINER_3
	dw PokemonTower7BattleText4 ; TextBeforeBattle
	dw PokemonTower7AfterBattleText4 ; TextAfterBattle
	dw PokemonTower7EndBattleText4 ; TextEndBattle
	dw PokemonTower7EndBattleText4 ; TextEndBattle
	
PokemonTower7TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_7_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_7_TRAINER_4
	dw PokemonTower7BattleText5 ; TextBeforeBattle
	dw PokemonTower7AfterBattleText5 ; TextAfterBattle
	dw PokemonTower7EndBattleText5 ; TextEndBattle
	dw PokemonTower7EndBattleText5 ; TextEndBattle
	
PokemonTower7TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_7_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_7_TRAINER_5
	dw PokemonTower7BattleText6 ; TextBeforeBattle
	dw PokemonTower7AfterBattleText6 ; TextAfterBattle
	dw PokemonTower7EndBattleText6 ; TextEndBattle
	dw PokemonTower7EndBattleText6 ; TextEndBattle
	
PokemonTower7TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_7_TRAINER_6
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_7_TRAINER_6
	dw PokemonTower7BattleText7 ; TextBeforeBattle
	dw PokemonTower7AfterBattleText7 ; TextAfterBattle
	dw PokemonTower7EndBattleText7 ; TextEndBattle
	dw PokemonTower7EndBattleText7 ; TextEndBattle

	db $ff

PokemonTower7Text1:
	TX_ASM
	ld hl, PokemonTower7TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7Text2:
	TX_ASM
	ld hl, PokemonTower7TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7Text3:
	TX_ASM
	ld hl, PokemonTower7TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd
	
PokemonTower7Text4:
	TX_ASM
	ld hl, PokemonTower7TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd
	
PokemonTower7Text5:
	TX_ASM
	ld hl, PokemonTower7TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd
	
PokemonTower7Text6:
	TX_ASM
	ld hl, PokemonTower7TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd
	
PokemonTower7Text7:
	TX_ASM
	ld hl, PokemonTower7TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower7FujiText:
	TX_ASM
	ld hl, TowerRescueFujiText
	call PrintText
	SetEvent EVENT_RESCUED_MR_FUJI
	SetEvent EVENT_RESCUED_MR_FUJI_2
	ld a, HS_LAVENDER_HOUSE_1_MR_FUJI
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_SAFFRON_CITY_E
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_SAFFRON_CITY_F
	ld [wMissableObjectIndex], a
	predef ShowObject
	jp TextScriptEnd

TowerRescueFujiText:
	TX_FAR _TowerRescueFujiText
	db "@"

PokemonTower7BattleText1:
	TX_FAR _PokemonTower7BattleText1
	db "@"

PokemonTower7EndBattleText1:
	TX_FAR _PokemonTower7EndBattleText1
	db "@"

PokemonTower7AfterBattleText1:
	TX_FAR _PokemonTower7AfterBattleText1
	db "@"

PokemonTower7BattleText2:
	TX_FAR _PokemonTower7BattleText2
	db "@"

PokemonTower7EndBattleText2:
	TX_FAR _PokemonTower7EndBattleText2
	db "@"

PokemonTower7AfterBattleText2:
	TX_FAR _PokemonTower7AfterBattleText2
	db "@"

PokemonTower7BattleText3:
	TX_FAR _PokemonTower7BattleText3
	db "@"

PokemonTower7EndBattleText3:
	TX_FAR _PokemonTower7EndBattleText3
	db "@"

PokemonTower7AfterBattleText3:
	TX_FAR _PokemonTower7AfterBattleText3
	db "@"
	
PokemonTower7BattleText4:
	TX_FAR _PokemonTower7BattleText4
	db "@"

PokemonTower7EndBattleText4:
	TX_FAR _PokemonTower7EndBattleText4
	db "@"

PokemonTower7AfterBattleText4:
	TX_FAR _PokemonTower7AfterBattleText4
	db "@"
	
PokemonTower7BattleText5:
	TX_FAR _PokemonTower7BattleText5
	db "@"

PokemonTower7EndBattleText5:
	TX_FAR _PokemonTower7EndBattleText5
	db "@"

PokemonTower7AfterBattleText5:
	TX_FAR _PokemonTower7AfterBattleText5
	db "@"
	
PokemonTower7BattleText6:
	TX_FAR _PokemonTower7BattleText6
	db "@"

PokemonTower7EndBattleText6:
	TX_FAR _PokemonTower7EndBattleText6
	db "@"

PokemonTower7AfterBattleText6:
	TX_FAR _PokemonTower7AfterBattleText6
	db "@"
	
PokemonTower7BattleText7:
	TX_FAR _PokemonTower7BattleText7
	db "@"

PokemonTower7EndBattleText7:
	TX_FAR _PokemonTower7EndBattleText7
	db "@"

PokemonTower7AfterBattleText7:
	TX_FAR _PokemonTower7AfterBattleText7
	db "@"

PokemonTower7Text8:
	TX_FAR _PokemonTower7Text8
	db "@"
