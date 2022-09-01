MtMoon2Script:
	call EnableAutoTextBoxDrawing
	ld hl, MtMoon2TrainerHeader0
	ld de, MtMoon2ScriptPointers
	ld a, [wMtMoon2CurScript]
	call ExecuteCurMapScriptInTable
	ld [wMtMoon2CurScript], a
	ret

MtMoon2ScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

MtMoon2TextPointers:
	;dw MtMoon2Text1
	dw PickUpItemText	;NEW
	dw PickUpItemText	;NEW
	dw PickUpItemText	;NEW
	dw PickUpItemText	;NEW
	dw MtMoon2Text5		;NEW
	dw MtMoon2Text6		;NEW

MtMoon2TrainerHeader0:	;NEW
	dbEventFlagBit EVENT_BEAT_CHIEF_AT_MT_MOON
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_CHIEF_AT_MT_MOON
	dw MtMoon2BattleText5 ; TextBeforeBattle
	dw MtMoon2AfterBattleText5 ; TextAfterBattle
	dw MtMoon2EndBattleText5 ; TextEndBattle
	dw MtMoon2EndBattleText5 ; TextEndBattle

	db $ff

;MtMoon2Text1:
	;TX_FAR _MtMoon2Text1
	;db "@"

MtMoon2Text5:	;NEW
	TX_ASM
	ld hl, MtMoon2TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

MtMoon2BattleText5:
	TX_FAR _MtMoon2BattleText5
	db "@"

MtMoon2EndBattleText5:
	TX_FAR _MtMoon2EndBattleText5
	db "@"

MtMoon2AfterBattleText5:
	TX_FAR _MtMoon2AfterBattleText5
	db "@"

MtMoon2Text6:	;NEW
	TX_FAR _MtMoon2Text6
	db "@"
	
