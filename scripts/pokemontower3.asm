PokemonTower3Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower3TrainerHeader0
	ld de, PokemonTower3ScriptPointers
	ld a, [wPokemonTower3CurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower3CurScript], a
	ret

PokemonTower3ScriptPointers:
	dw PokemonTower3Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	
PokemonTower3Script0:
	ld hl, CoordsData_60993
	call ArePlayerCoordsInArray
	jr c, .asm_60960
	ld hl, wd72e
	res 4, [hl]
	ResetEvent EVENT_IN_PURIFIED_ZONE2
	jp CheckFightingMapTrainers
.asm_60960
	CheckAndSetEvent EVENT_IN_PURIFIED_ZONE2
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
	ld a, $8
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ret

CoordsData_60993:
	db $02,$0C
	db $02,$0D
	db $03,$0C
	db $03,$0D
	db $FF

PokemonTower3TextPointers:
	dw PokemonTower3Text1
	dw PokemonTower3Text2
	dw PokemonTower3Text3
	dw PokemonTower3Text4
	dw PokemonTower3Text5
	dw PokemonTower3Text6
	dw PickUpItemText
	dw PokemonTower3Text7

PokemonTower3TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_3_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_3_TRAINER_0
	dw PokemonTower3BattleText1 ; TextBeforeBattle
	dw PokemonTower3AfterBattleText1 ; TextAfterBattle
	dw PokemonTower3EndBattleText1 ; TextEndBattle
	dw PokemonTower3EndBattleText1 ; TextEndBattle

PokemonTower3TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_3_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_3_TRAINER_1
	dw PokemonTower3BattleText2 ; TextBeforeBattle
	dw PokemonTower3AfterBattleText2 ; TextAfterBattle
	dw PokemonTower3EndBattleText2 ; TextEndBattle
	dw PokemonTower3EndBattleText2 ; TextEndBattle

PokemonTower3TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_3_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_3_TRAINER_2
	dw PokemonTower3BattleText3 ; TextBeforeBattle
	dw PokemonTower3AfterBattleText3 ; TextAfterBattle
	dw PokemonTower3EndBattleText3 ; TextEndBattle
	dw PokemonTower3EndBattleText3 ; TextEndBattle

PokemonTower3TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_3_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_3_TRAINER_3
	dw PokemonTower3BattleText4 ; TextBeforeBattle
	dw PokemonTower3AfterBattleText4 ; TextAfterBattle
	dw PokemonTower3EndBattleText4 ; TextEndBattle
	dw PokemonTower3EndBattleText4 ; TextEndBattle
	
PokemonTower3TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_3_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_3_TRAINER_4
	dw PokemonTower3BattleText5 ; TextBeforeBattle
	dw PokemonTower3AfterBattleText5 ; TextAfterBattle
	dw PokemonTower3EndBattleText5 ; TextEndBattle
	dw PokemonTower3EndBattleText5 ; TextEndBattle

PokemonTower3TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_3_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_3_TRAINER_5
	dw PokemonTower3BattleText6 ; TextBeforeBattle
	dw PokemonTower3AfterBattleText6 ; TextAfterBattle
	dw PokemonTower3EndBattleText6 ; TextEndBattle
	dw PokemonTower3EndBattleText6 ; TextEndBattle
	
	db $ff

PokemonTower3Text1:
	TX_ASM
	ld hl, PokemonTower3TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3Text2:
	TX_ASM
	ld hl, PokemonTower3TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3Text3:
	TX_ASM
	ld hl, PokemonTower3TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd
	
PokemonTower3Text4:
	TX_ASM
	ld hl, PokemonTower3TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

PokemonTower3Text5:
	TX_ASM
	ld hl, PokemonTower3TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd
	
PokemonTower3Text6:
	TX_ASM
	ld hl, PokemonTower3TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd
	
PokemonTower3BattleText1:
	TX_FAR _PokemonTower3BattleText1
	db "@"

PokemonTower3EndBattleText1:
	TX_FAR _PokemonTower3EndBattleText1
	db "@"

PokemonTower3AfterBattleText1:
	TX_FAR _PokemonTower3AfterBattleText1
	db "@"

PokemonTower3BattleText2:
	TX_FAR _PokemonTower3BattleText2
	db "@"

PokemonTower3EndBattleText2:
	TX_FAR _PokemonTower3EndBattleText2
	db "@"

PokemonTower3AfterBattleText2:
	TX_FAR _PokemonTower3AfterBattleText2
	db "@"

PokemonTower3BattleText3:
	TX_FAR _PokemonTower3BattleText3
	db "@"

PokemonTower3EndBattleText3:
	TX_FAR _PokemonTower3EndBattleText3
	db "@"

PokemonTower3AfterBattleText3:
	TX_FAR _PokemonTower3AfterBattleText3
	db "@"
	
PokemonTower3BattleText4:
	TX_FAR _PokemonTower3BattleText4
	db "@"

PokemonTower3EndBattleText4:
	TX_FAR _PokemonTower3EndBattleText4
	db "@"

PokemonTower3AfterBattleText4:
	TX_FAR _PokemonTower3AfterBattleText4
	db "@"
	
PokemonTower3BattleText5:
	TX_FAR _PokemonTower3BattleText5
	db "@"

PokemonTower3EndBattleText5:
	TX_FAR _PokemonTower3EndBattleText5
	db "@"

PokemonTower3AfterBattleText5:
	TX_FAR _PokemonTower3AfterBattleText5
	db "@"
	
PokemonTower3BattleText6:
	TX_FAR _PokemonTower3BattleText6
	db "@"

PokemonTower3EndBattleText6:
	TX_FAR _PokemonTower3EndBattleText6
	db "@"

PokemonTower3AfterBattleText6:
	TX_FAR _PokemonTower3AfterBattleText6
	db "@"
	
PokemonTower3Text7:
	TX_FAR _PokemonTower3Text7
	db "@"
	
