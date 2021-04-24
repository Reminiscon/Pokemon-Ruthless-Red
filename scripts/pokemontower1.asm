PokemonTower1Script:
	call EnableAutoTextBoxDrawing
	ld hl, PokemonTower1TrainerHeader0
	ld de, PokemonTower1ScriptPointers
	ld a, [wPokemonTower1CurScript]
	call ExecuteCurMapScriptInTable
	ld [wPokemonTower1CurScript], a
	ret

PokemonTower1ScriptPointers:
	dw PokemonTower1Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	
PokemonTower1Script0:
	ld hl, CoordsData_60995
	call ArePlayerCoordsInArray
	jr c, .asm_60960
	ld hl, wd72e
	res 4, [hl]
	ResetEvent EVENT_IN_PURIFIED_ZONE3
	jp CheckFightingMapTrainers
.asm_60960
	CheckAndSetEvent EVENT_IN_PURIFIED_ZONE3
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
	ld a, $7
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wJoyIgnore], a
	ret

CoordsData_60995:
	db $06,$0A
	db $06,$0B
	db $07,$0A
	db $07,$0B
	db $FF

PokemonTower1TextPointers:
	dw PokemonTower1Text1
	dw PokemonTower1Text2
	dw PokemonTower1Text3
	dw PokemonTower1Text4
	dw PokemonTower1Text5
	dw PokemonTower1Text6
	dw PokemonTower1Text7

PokemonTower1TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_POKEMONTOWER_1_TRAINER_0
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_POKEMONTOWER_1_TRAINER_0
	dw PokemonTower1BattleText1 ; TextBeforeBattle
	dw PokemonTower1AfterBattleText1 ; TextAfterBattle
	dw PokemonTower1EndBattleText1 ; TextEndBattle
	dw PokemonTower1EndBattleText1 ; TextEndBattle

PokemonTower1Text1:
	TX_FAR _PokemonTower1Text1
	db "@"

PokemonTower1Text2:
	TX_FAR _PokemonTower1Text2
	db "@"

PokemonTower1Text3:
	TX_FAR _PokemonTower1Text3
	db "@"

PokemonTower1Text4:
	TX_FAR _PokemonTower1Text4
	db "@"

PokemonTower1Text5:
	TX_FAR _PokemonTower1Text5
	db "@"
	
PokemonTower1Text6:
	TX_ASM
	ld hl, PokemonTower1TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd
	
PokemonTower1BattleText1:
	TX_FAR _PokemonTower1BattleText1
	db "@"

PokemonTower1EndBattleText1:
	TX_FAR _PokemonTower1EndBattleText1
	db "@"

PokemonTower1AfterBattleText1:
	TX_FAR _PokemonTower1AfterBattleText1
	db "@"
	
PokemonTower1Text7:
	TX_FAR _PokemonTower1Text7
	db "@"
	
