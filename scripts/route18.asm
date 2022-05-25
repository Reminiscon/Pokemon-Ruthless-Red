Route18Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route18TrainerHeader0
	ld de, Route18ScriptPointers
	ld a, [wRoute18CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute18CurScript], a
	ret
	
Route18Script_604fe:		;NEW
	xor a
	ld [wJoyIgnore], a
	ld [wRoute18CurScript], a
	ld [wCurMapScript], a
	ret

Route18ScriptPointers:
	dw Route18Script0		;NEW
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw Route18Script3		;NEW
	dw Route18Script4		;NEW
	
Route18Script0:
	CheckEvent EVENT_BEAT_ROUTE_18_RIVAL	;Ensure that this is in event constants
	jp nz, CheckFightingMapTrainers			;
	ld hl, CoordsData_309ab					;
	call ArePlayerCoordsInArray				;
	jp nc, CheckFightingMapTrainers			;Use this so that Route18Script0 handles the CheckFightingMapTrainers logic
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ResetEvent EVENT_ROUTE_18_RIVAL_ON_RIGHT	;Ensure that this is in event constants
	ld a, [wCoordIndex]
	cp $1
	ld a, PLAYER_DIR_RIGHT
	ld b, SPRITE_FACING_LEFT
	jr nz, .asm_60544
	SetEvent EVENT_ROUTE_18_RIVAL_ON_RIGHT		;Ensure that this is in event constants
	ld a, PLAYER_DIR_RIGHT
	ld b, SPRITE_FACING_LEFT
.asm_60544
	ld [wPlayerMovingDirection], a
	ld a, $4								;This value is based on the position of the Sprite in MapObjects
	ld [H_SPRITEINDEX], a
	ld a, b
	ld [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay
	ld a, $4								;This value is based on the text pointer
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [hJoyHeld], a
	ld [hJoyPressed], a
	ret

CoordsData_309ab:
	db $0B,$1A								;This coordinate activates the event if EVENT_ROUTE_18_RIVAL_ON_RIGHT is not set
	db $0B,$1C								;This coordinate activates the event if EVENT_ROUTE_18_RIVAL_ON_RIGHT is set
	db $FF									;This used to end in $F0 but now correctly ends in $FF

Route18Script3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route18Script_604fe
	ld a, $f0								;I think this value handles music
	ld [wJoyIgnore], a
	SetEvent EVENT_BEAT_ROUTE_18_RIVAL
	ld a, $4								;This value is based on the text pointer
	ld [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld de, MovementData_309b3
	CheckEvent EVENT_ROUTE_18_RIVAL_ON_RIGHT
	jr nz, .asm_60589
	ld de, MovementData_309a3
.asm_60589
	ld a, $4								;This value is based on the position of the Sprite in MapObjects
	ld [H_SPRITEINDEX], a
	call MoveSprite
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySound
	callba Music_RivalAlternateStart
	ld a, $4								;This value specifies the pointer for which script loads
	ld [wRoute18CurScript], a
	ld [wCurMapScript], a
	ret

MovementData_309a3:
	db $FF

MovementData_309b3:
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db $FF

Route18Script4:
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_ROUTE_18_RIVAL					;Ensure that this is in hide show constants
	ld [wMissableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic
	ld a, $0								;This value specifies the pointer for which script loads
	ld [wRoute18CurScript], a
	ld [wCurMapScript], a
	ret

Route18TextPointers:
	dw Route18Text1
	dw Route18Text2
	dw Route18Text3
	dw Route18Text4
	dw Route18Text5
	dw Route18Text6 ;NEW

Route18TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_18_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_18_TRAINER_0
	dw Route18BattleText1 ; TextBeforeBattle
	dw Route18AfterBattleText1 ; TextAfterBattle
	dw Route18EndBattleText1 ; TextEndBattle
	dw Route18EndBattleText1 ; TextEndBattle

Route18TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_18_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_18_TRAINER_1
	dw Route18BattleText2 ; TextBeforeBattle
	dw Route18AfterBattleText2 ; TextAfterBattle
	dw Route18EndBattleText2 ; TextEndBattle
	dw Route18EndBattleText2 ; TextEndBattle

Route18TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_18_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_18_TRAINER_2
	dw Route18BattleText3 ; TextBeforeBattle
	dw Route18AfterBattleText3 ; TextAfterBattle
	dw Route18EndBattleText3 ; TextEndBattle
	dw Route18EndBattleText3 ; TextEndBattle

	db $ff

Route18Text1:
	TX_ASM
	ld hl, Route18TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText1:
	TX_FAR _Route18BattleText1
	db "@"

Route18EndBattleText1:
	TX_FAR _Route18EndBattleText1
	db "@"

Route18AfterBattleText1:
	TX_FAR _Route18AfterBattleText1
	db "@"

Route18Text2:
	TX_ASM
	ld hl, Route18TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText2:
	TX_FAR _Route18BattleText2
	db "@"

Route18EndBattleText2:
	TX_FAR _Route18EndBattleText2
	db "@"

Route18AfterBattleText2:
	TX_FAR _Route18AfterBattleText2
	db "@"

Route18Text3:
	TX_ASM
	ld hl, Route18TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route18BattleText3:
	TX_FAR _Route18BattleText3
	db "@"

Route18EndBattleText3:
	TX_FAR _Route18EndBattleText3
	db "@"

Route18AfterBattleText3:
	TX_FAR _Route18AfterBattleText3
	db "@"
	
Route18Text4:
	TX_ASM
	CheckEvent EVENT_BEAT_ROUTE_18_RIVAL		;Ensure that this is in event constants
	jr z, .asm_16f24
	ld hl, Route18Text_6063c					;Loads the fourth text
	call PrintText
	jr .asm_41852
.asm_16f24
	ld hl, Route18Text_6062d					;Loads the first text
	call PrintText
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, Route18Text_60632					;Loads the second text
	ld de, Route18Text_60637					;Loads the third text
	call SaveEndBattleTextPointers
	ld a, OPP_SONY2
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .NotSquirtle
	ld a, $4
	jr .done
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander
	ld a, $5
	jr .done
.Charmander
	ld a, $6
.done
	ld [wTrainerNo], a

	ld a, $3
	ld [wRoute18CurScript], a
	ld [wCurMapScript], a
.asm_41852
	jp TextScriptEnd
	
Route18Text_6062d:
	TX_FAR _Route18Text_6062d
	db "@"

Route18Text_60632:
	TX_FAR _Route18Text_60632
	db "@"

Route18Text_60637:
	TX_FAR _Route18Text_60637
	db "@"

Route18Text_6063c:
	TX_FAR _Route18Text_6063c
	db "@"

Route18Text5:
	TX_FAR _Route18Text5
	db "@"

Route18Text6:
	TX_FAR _Route18Text6
	db "@"
	