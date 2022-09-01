;MoltresDenScript:
	;ld a, ROUTE_24
	;ld [wLastMap], a
	;jp EnableAutoTextBoxDrawing
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;dylannote - above is old script from Diglett's Cave Entrance (Route 2), commented out
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MoltenCavernScript:
	call EnableAutoTextBoxDrawing
	ld hl, MoltresTrainerHeader
	ld de, MoltenCavernScriptPointers
	ld a, [wMoltenCavernCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMoltenCavernCurScript], a
	ret

MoltenCavernScriptPointers:
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

MoltenCavernTextPointers:
	dw MoltresText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	dw PickUpItemText
	
MoltresTrainerHeader:
	dbEventFlagBit EVENT_BEAT_MOLTRES
	db ($0 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_MOLTRES
	dw MoltresBattleText ; TextBeforeBattle
	dw MoltresBattleText ; TextAfterBattle
	dw MoltresBattleText ; TextEndBattle
	dw MoltresBattleText ; TextEndBattle

	db $ff
	
MoltresText:
	TX_ASM
	ld hl, MoltresTrainerHeader
	call TalkToTrainer
	ld a, $4
	ld [wMoltenCavernCurScript], a
	jp TextScriptEnd

MoltresBattleText:
	TX_FAR _MoltresBattleText
	TX_ASM
	ld a, MOLTRES
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

	