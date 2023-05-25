; creates a set of moves that may be used and returns its address in hl
; unused slots are filled with 0, all used slots may be chosen with equal probability
AIEnemyTrainerChooseMoves:
	ld a, $a
	ld hl, wBuffer ; init temporary move selection array. Only the moves with the lowest numbers are chosen in the end
	ld [hli], a   ; move 1
	ld [hli], a   ; move 2
	ld [hli], a   ; move 3
	ld [hl], a    ; move 4

;joenote - make a backup buffer
	push hl
	ld a, $ff
	inc hl
	ld [hli], a	;backup 1
	ld [hli], a	;backup 2
	ld [hli], a	;backup 3
	ld [hl], a	;backup 4
	pop hl
	
	;joenote - backup the power of the last moved used
	ld a, [wEnemyMovePower]
	ld [wAILastMovePower], a
	
	ld a, [wEnemyDisabledMove] ; forbid disabled move (if any)
	swap a
	and $f
	jr z, .noMoveDisabled
	ld hl, wBuffer
	dec a
	ld c, a
	ld b, $0
	add hl, bc    ; advance pointer to forbidden move
	ld [hl], $50  ; forbid (highly discourage) disabled move
.noMoveDisabled
	ld hl, TrainerClassMoveChoiceModifications
	ld a, [wTrainerClass]
	ld b, a
.loopTrainerClasses
	dec b
	jr z, .readTrainerClassData
.loopTrainerClassData
	ld a, [hli]
	and a
	jr nz, .loopTrainerClassData
	jr .loopTrainerClasses
.readTrainerClassData
	ld a, [hl]
	and a
	jp z, .useOriginalMoveSet
	push hl
.nextMoveChoiceModification
	pop hl
	ld a, [hli]
	and a
	jr z, .loopFindMinimumEntries_bakupfirst
	push hl
	ld hl, AIMoveChoiceModificationFunctionPointers
	dec a
	add a
	ld c, a
	ld b, 0
	add hl, bc    ; skip to pointer
	ld a, [hli]   ; read pointer into hl
	ld h, [hl]
	ld l, a
	ld de, .nextMoveChoiceModification  ; set return address
	push de
	jp hl         ; execute modification function
.loopFindMinimumEntries_bakupfirst	;joenote - make a backup of the scores
	ld hl, wBuffer  ; temp move selection array
	ld de, wBuffer + NUM_MOVES  ;backup buffer
	ld bc, NUM_MOVES
	call CopyData
.loopFindMinimumEntries ; all entries will be decremented sequentially until one of them is zero
	ld hl, wBuffer  ; temp move selection array
	ld de, wEnemyMonMoves  ; enemy moves
	ld c, NUM_MOVES
.loopDecrementEntries
	ld a, [de]
	inc de
	and a
	jr z, .loopFindMinimumEntries
	dec [hl]
	jr z, .minimumEntriesFound
	inc hl
	dec c
	jr z, .loopFindMinimumEntries
	jr .loopDecrementEntries
.minimumEntriesFound
	ld a, c
.loopUndoPartialIteration ; undo last (partial) loop iteration
	inc [hl]
	dec hl
	inc a
	cp NUM_MOVES + 1
	jr nz, .loopUndoPartialIteration
	ld hl, wBuffer  ; temp move selection array
	ld de, wEnemyMonMoves  ; enemy moves
	ld c, NUM_MOVES
.filterMinimalEntries ; all minimal entries now have value 1. All other slots will be disabled (move set to 0)
	ld a, [de]
	and a
	jr nz, .moveExisting
	ld [hl], a
.moveExisting
	ld a, [hl]
	dec a
	jr z, .slotWithMinimalValue
	xor a
	ld [hli], a     ; disable move slot
	jr .next
.slotWithMinimalValue
	ld a, [de]
	ld [hli], a     ; enable move slot
.next
	inc de
	dec c
	jr nz, .filterMinimalEntries
	ld hl, wBuffer    ; use created temporary array as move set
	ret
.useOriginalMoveSet
	ld hl, wEnemyMonMoves    ; use original move set
	ret

AIMoveChoiceModificationFunctionPointers:
	dw AIMoveChoiceModification1
	dw AIMoveChoiceModification2 ; dylannote - edited to only cover stat raising or lowering moves, and moves that only work once
	dw AIMoveChoiceModification3
	dw AIMoveChoiceModification4 ; ;joenote - repurposed unused routine for trainer switching
	dw AIMoveChoiceModification5 ; dylannote - added to work like routine #2, but with status effects and no turn limit
	dw AIMoveChoiceModification6 ; dylannote - added for advanced strategies involving a few select moves

; discourages moves that cause no damage but only a status ailment if player's mon already has one
; joenote - reworked so that it now discourages doing things that are generally useless
AIMoveChoiceModification1:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - kick out if no-attack bit is set
	ld a, [wUnusedC000]
	bit 2, a
	ret nz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld a, [wBattleMonStatus]
	and a
	;joenote - don't return yet. going to check for dream eater. will do this later
	;ret z ; return if no status ailment on player's mon
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - do not use effects that end battle because this is a trainer battle and they do not work
	ld a, [wEnemyMoveEffect]	;load the move effect
	cp SWITCH_AND_TELEPORT_EFFECT	;see if it is a battle-ending effect
	jp z, .heavydiscourage	;heavily discourage if so
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;dylannote - do not use Hyper Beam when the enemy has a physical attack disadvantage, or when 
;the player has an active Substitute or active Reflect, or when the player Mon HP is full
	ld a, [wEnemyMoveNum]	;load the specific move being used
	cp HYPER_BEAM	;see if it is hyper beam
	jr nz, .skiphyperbeamdiscourage	;skip out if move is not hyper beam
	ld a, [wPlayerBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a
	jp nz, .heavydiscourage
	ld a, [wPlayerBattleStatus3]
	bit HAS_REFLECT_UP, a
	jp nz, .heavydiscourage
	ld a, [wPlayerMonDefenseMod]
	ld b, a
	ld a, [wEnemyMonAttackMod]
	cp b	;compare the attack modifier of the A.I. and the defense modifier of the player
	jp c, .heavydiscourage	;heavily discourage using hyper beam if A.I. attack modifier is lesser
	ld a, [wPlayerMonDefenseMod]
	add a, 1
	ld b, a
	ld a, [wEnemyMonAttackMod]
	cp b	;compare the attack modifier of the A.I. and the defense modifier + 1 of the player
	jr nc, .skiphyperbeamdiscourage	;do not discourage Hyper Beam if A.I. attack modifier is equal or greater
	ld a, $1
	call PlayerCheckIfHPBelowFraction	;check if Player Mon's health is full
	jp nc, .heavydiscourage	;heavily discourage if Player Mon's health is full
.skiphyperbeamdiscourage
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - do not use dream eater if enemy not asleep, otherwise encourage it
	ld a, [wEnemyMoveEffect]	;load the move effect
	cp DREAM_EATER_EFFECT	;see if it is dream eater
	jr nz, .notdreameater	;skip out if move is not dream eater
	ld a, [wBattleMonStatus]	;load the player pkmn non-volatile status
	and $7	;check bits 0 to 2 for sleeping turns
	jp z, .heavydiscourage	;heavily discourage using dream eater on non-sleeping pkmn
	dec [hl]	;else slightly encourage dream eater's use on a sleeping pkmn
	jp .nextMove
.notdreameater	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - do not use counter against a non-applicable move
	ld a, [wEnemyMoveNum]	
	cp COUNTER
	jr nz, .countercheck_end	;if this move is not counter then jump out
	ld a, [wPlayerMovePower]
	and a
	jp z, .heavydiscourage	;heavily discourage counter if enemy is using zero-power move
	ld a, [wPlayerMoveType]
	cp $14
	jr c, .countercheck_end	; continue on if countering STRUGGLE or other typeless move
	jp .heavydiscourage	;else heavily discourage since the player move type is not applicable to counter
.countercheck_end
	ld a, $6
	call AICheckIfHPBelowFraction
	jp c, .heavydiscourage	;dylannote - adding this to heavily discourage counter below 1/6 HP
	ld a, $2
	call AICheckIfHPBelowFraction
	jp nc, .givepref		;dylannote - adding this to lightly encourage counter above 1/2 HP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - do not use moves that are ineffective against substitute if a substitute is up
	ld a, [wPlayerBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a	;check for substitute bit
	jr z, .noSubImm	;if the substitute bit is not set, then skip out of this block
	ld a, [wEnemyMoveEffect]	;get the move effect into a
	push hl
	push de
	push bc
	ld hl, SubstituteImmuneEffects
	ld de, $0001
	call IsInArray	;see if a is found in the hl array (carry flag set if true)
	pop bc
	pop de
	pop hl
	jp c, .heavydiscourage	;carry flag means the move effect is blocked by substitute
	;else continue onward
.noSubImm	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Exploding has a slight preference over healing because overall this hurts the player more than the AI
	ld a, [wEnemyMoveEffect]	;load the move effect
	cp HEAL_EFFECT	;see if it is a healing move
	jr z, .heal_explode	;skip out if move is not
	cp EXPLODE_EFFECT	;what about an explosion effect?
	jr nz, .not_heal_explode	;skip out if move is not
	dec [hl]	;otherwise give a slight edge to exploding
	
	;since this is an explosion effect, it would be good to heavily discourage if
	;the opponent is in fly/dig state and the exploder is for-sure faster than the opponent
	ld a, [wPlayerBattleStatus1]
	bit 6, a
	jr z, .heal_explode	;proceed as normal if player is not in fly/dig
	call StrCmpSpeed	;do a speed compare
	jp c, .heavydiscourage	;a set carry bit means the ai 'mon is faster, so heavily discourage
	
.heal_explode
	ld a, 1	;
	call AICheckIfHPBelowFraction
	jp nc, .heavydiscourage	;heavy discourage if hp at max (heal +5 & explode +4)
	inc [hl]	;1/2 hp to max hp - slight discourage (heal +1 & explode 0)
	ld a, 2	;
	call AICheckIfHPBelowFraction
	jp nc, .nextMove	;if hp is 1/2 or more, get next move
	dec [hl]	;else 1/3 to 1/2 hp - neutral (heal 0 & explode -1)
	ld a, 3	;
	call AICheckIfHPBelowFraction
	jp nc, .nextMove	;if hp is 1/3 or more, get next move
	dec [hl]	;else 0 to 1/3 hp - slight preference (heal -1 & explode -2)
	jp .nextMove	;get next move
.not_heal_explode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Randomly discourage 2-turn moves if confused or paralyzed
	;check for 2-turn move
	ld a, [wEnemyMoveEffect]
	cp FLY_EFFECT
	jr z, .twoturncheck_par
	cp CHARGE_EFFECT
	jr nz, .twoturndone
	
.twoturncheck_par
	;handle paralysis
	ld a, [wEnemyMonStatus]
	bit PAR, a
	jr z, .twoturncheck_confused
	call Random
	cp $70
	jr nc, .twoturncheck_confused
	inc [hl]	;random chance to discourage if paralyzed
	inc [hl]
	
.twoturncheck_confused
	;handle confusion
	ld a, [wEnemyBattleStatus1]
	bit 7, a ;check confusion bit
	jr z, .twoturndone
	call Random
	cp $C0
	jr nc, .twoturndone
	inc [hl]	;random chance to discourage if confused
	inc [hl]
	
.twoturndone
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld a, [wEnemyMovePower]
	and a
	jp nz, .nextMove	;go to next move if the current move is not zero-power
;At this line onward all moves are assumed to be zero power
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - do not use haze if user has no status or neutral stat mods
	ld a, [wEnemyMoveEffect]	;load the move effect
	cp HAZE_EFFECT	;see if it is haze
	jp nz, .hazekickout	;move on if not haze
;using haze at this point
	ld a, [wEnemyMonStatus]	;get status
	and a
	jp z, .heavydiscourage	;discourage if status is clear
	push hl
	push bc
	xor a
	ld b, 6
	ld hl, wEnemyMonStatMods
.hazeloop
	add [hl]
	inc hl
	dec b
	jr nz, .hazeloop
	pop bc
	pop hl
	cp 42
	jp nc, .heavydiscourage	;discourage if summed stat mods are same or more than 42 (7 per mod is neutral)
.hazekickout
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - do not use disable on a pkmn that is already disabled
	ld a, [wEnemyMoveEffect]	;load the move effect
	cp DISABLE_EFFECT
	jr nz, .notdisable
	ld a, [wPlayerDisabledMove]	
	and a
	jp nz, .heavydiscourage	
.notdisable
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - do not use substitute if not enough hp
	ld a, [wEnemyMoveEffect]
	cp SUBSTITUTE_EFFECT
	jr nz, .notsubstitute
	ld a, 4	;
	call AICheckIfHPBelowFraction
	jp c, .heavydiscourage
.notsubstitute
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - do not use moves that are blocked by mist
	ld a, [wPlayerBattleStatus2]
	bit PROTECTED_BY_MIST, a	;check for mist bit
	jr z, .noMistImm	;if the mist bit is not set, then skip out of this block
	ld a, [wEnemyMoveEffect]	;get the move effect into a
	push hl
	push de
	push bc
	ld hl, MistBlockEffects
	ld de, $0001
	call IsInArray	;see if a is found in the hl array (carry flag set if true)
	pop bc
	pop de
	pop hl
	jp c, .heavydiscourage	;carry flag means the move effect is blocked by mist
	;else continue onward
.noMistImm	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - do not use defense-up moves if opponent is special attacking
	ld a, [wEnemyMoveEffect]	;get the move effect
	cp DEFENSE_UP1_EFFECT	
	jr z, .do_def_check
	cp DEFENSE_UP2_EFFECT
	jr nz, .nodefupmove
.do_def_check
	ld a, [wPlayerMoveEffect]
	cp SPECIAL_DAMAGE_EFFECT
	jp z, .heavydiscourage	;don't bother boosting def against static damage attacks
	cp OHKO_EFFECT
	jp z, .heavydiscourage	;don't bother boosting def against OHKO attacks
	ld a, [wPlayerMovePower]	;all regular damage moves have a power of at least 10
	cp 10
	jr c, .nodefupmove
	ld a, [wPlayerMoveType]	;physical move types are numbers $00 to $08 while special is $14 to $1A
	cp $14
	jp nc, .heavydiscourage	;at this point, heavy discourage defense-boosting because player is using a special move of 10+ power
.nodefupmove
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;dylannote - lightly discourage lowering the accuracy of the Player below -2 or raising the evasion
; of A.I. above +2
	ld a, [wEnemyMoveEffect]
	cp ACCURACY_DOWN1_EFFECT
	jr z, .accuracylightdiscouragecheck
	cp ACCURACY_DOWN2_EFFECT
	jr z, .accuracylightdiscouragecheck
	cp EVASION_UP1_EFFECT
	jr z, .evasionlightdiscouragecheck
	cp EVASION_UP2_EFFECT
	jr z, .evasionlightdiscouragecheck
.accuracylightdiscouragecheck
	ld a, [wPlayerMonAccuracyMod]
	cp 4	;-3
	jp z, .lightdiscourage
	cp 3	;-4
	jp z, .lightdiscourage
	cp 2	;-5
	jp z, .lightdiscourage
	cp 1	;-6
	jr z, .movetoheavydiscouragecheck
.evasionlightdiscouragecheck
	ld a, [wEnemyMonEvasionMod]
	cp 10	;+3
	jp z, .lightdiscourage
	cp 11	;+4
	jp z, .lightdiscourage
	cp 12	;+5
	jp z, .lightdiscourage
	cp 13	;+6
;dylannote - fallthrough
;joenote - heavily discourage stat modifying moves if it would hit the mod limit and be ineffective
	;check for stat down effects
.movetoheavydiscouragecheck
	ld a, [wEnemyMoveEffect]	;get the move effect
	cp ATTACK_DOWN1_EFFECT	
	jr c, .nostatdownmod	;if value is < the ATTACK_DOWN1_EFFECT value, jump out
	cp EVASION_DOWN2_EFFECT	+ $1
	jr nc, .nostatdownmod	;if value >= EVASION_DOWN2_EFFECT value + $1, jump out
	cp EVASION_DOWN1_EFFECT	+ $1
	jr c, .statdownmod	;if value < EVASION_DOWN1_EFFECT value + $1, there is a stat down move
	cp ATTACK_DOWN2_EFFECT	
	jr nc, .statdownmod	;if value is >= the ATTACK_DOWN2_EFFECT value, there is a stat down move
	jr .nostatdownmod; else the effect is something else in-between the target values
.statdownmod
	sub ATTACK_DOWN1_EFFECT	;normalize the effects from 0 to 5 to get an offset
	cp EVASION_DOWN1_EFFECT + $1 - ATTACK_DOWN1_EFFECT ; covers all -1 effects
	jr c, .statdowncheck
	sub ATTACK_DOWN2_EFFECT - ATTACK_DOWN1_EFFECT ; map -2 effects to corresponding -1 effect
.statdowncheck	
	push hl
	push bc
	ld hl, wPlayerMonStatMods	;load the player's stat mods
	ld c, a
	ld b, $0
	add hl, bc	;use offset to shift to the correct stat mod
	ld b, [hl]
	dec b ; decrement corresponding stat mod
	pop bc
	pop hl
	jr nz, .endstatmod ; if stat mod was > 1 before decrementing, then it's fine to lower
	;else can't be lowered anymore
	jp .heavydiscourage
.nostatdownmod
	;check for stat up effects
	ld a, [wEnemyMoveEffect]	;get the move effect
	cp ATTACK_UP1_EFFECT
	jr c, .endstatmod	;if value is < the ATTACK_UP1_EFFECT value, jump out
	cp EVASION_UP2_EFFECT + $1
	jr nc, .endstatmod	;if value >= EVASION_UP2_EFFECT value + $1, jump out
	cp EVASION_UP1_EFFECT + $1
	jr c, .statupmod	;if value < EVASION_UP1_EFFECT value + $1, there is a stat up move
	cp ATTACK_UP2_EFFECT	
	jr nc, .statupmod	;if value is >= the ATTACK_UP2_EFFECT value, there is a stat up move
	jr .endstatmod; else the effect is something else in-between the target values
.statupmod
	sub ATTACK_UP1_EFFECT	;normalize the effects from 0 to 5 to get an offset
	cp EVASION_UP1_EFFECT + $1 - ATTACK_UP1_EFFECT ; covers all +1 effects
	jr c, .statupcheck
	sub ATTACK_UP2_EFFECT - ATTACK_UP1_EFFECT ; map +2 effects to corresponding +1 effect
.statupcheck	
	push hl
	push bc
	ld hl, wEnemyMonStatMods	;load the enemy's stat mods
	ld c, a
	ld b, $0
	add hl, bc	;use offset to shift to the correct stat mod
	ld b, [hl]
	inc b ; increment corresponding stat mod
	ld a, $0d
	cp b ; can't raise stat past +6 ($0d or 13)
	pop bc
	pop hl
	jr nc, .endstatmod ; if stat mod was < $0d before incrementing, then it's fine to raise
	;else can't be raised anymore
	jp .heavydiscourage
.endstatmod
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - heavily discourage moves that do not stack
	;check each of the stackable effects one by one and jump to the corresponding section
	ld a, [wEnemyMoveEffect]
	cp FOCUS_ENERGY_EFFECT
	jr z, .checkfocus
	cp LIGHT_SCREEN_EFFECT
	jr z, .checkscreen
	cp REFLECT_EFFECT
	jr z, .checkreflect
	cp SUBSTITUTE_EFFECT
	jr z, .checksub
	cp MIST_EFFECT
	jr z, .checkmist
	cp LEECH_SEED_EFFECT
	jr z, .checkseed
	jr .endstacking
.checkfocus	;check status, and heavily discourage if bit is set
	ld a, [wEnemyBattleStatus2]
	bit GETTING_PUMPED, a
	jp nz, .heavydiscourage
	jr .endstacking
.checkscreen ;check status, and heavily discourage if bit is set
	ld a, [wEnemyBattleStatus3]
	bit HAS_LIGHT_SCREEN_UP, a
	jp nz, .heavydiscourage
	jr .endstacking
.checkreflect	;check status, and heavily discourage if bit is set
	ld a, [wEnemyBattleStatus3]
	bit HAS_REFLECT_UP, a
	jp nz, .heavydiscourage
	jr .endstacking
.checkmist	;check status, and heavily discourage if bit is set
	ld a, [wEnemyBattleStatus2]
	bit PROTECTED_BY_MIST, a
	jp nz, .heavydiscourage
	jr .endstacking
.checksub	;check status, and heavily discourage if bit is set
	ld a, [wEnemyBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a
	jp nz, .heavydiscourage
	jr .endstacking
.checkseed
	;first check to make sure leech seed isn't used on a grass pokemon
	push bc
	push hl
	ld hl, wBattleMonType
	ld b, [hl]                 ; b = type 1 of player's pokemon
	inc hl
	ld c, [hl]                 ; c = type 2 of player's pokemon
	ld a, b		;load type 1 into a
	cp GRASS	;is type 1 grass?
	jr z, .seedgrasstest	;skip ahead if type1 is grass
	ld a, c		;load type 2 into a
.seedgrasstest
	pop hl
	pop bc
	cp GRASS	;a is either type 1 grass or it is type 2 yet to be confirmed
	jp z, .heavydiscourage	;heavily discourage if either of the types are grass
	;else, not to make sure it isn't already used
	;check status, and heavily discourage if bit is set
	ld a, [wPlayerBattleStatus2]
	bit SEEDED, a
	jp nz, .heavydiscourage
.endstacking
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - discourage using confuse-only moves on confused pkmn
	ld a, [wEnemyMoveEffect]
	cp CONFUSION_EFFECT	;see if the move has a confusion effect
	jr nz, .notconfuse	;skip out if move is not a zero-power confusion move
	ld a, [wPlayerBattleStatus1]	;load the player pkmn volatile status
	and $80	;check bit 7 for confusion bit
	jp nz, .heavydiscourage	;heavily discourage using zero-power confusion moves on confused pkmn
.notconfuse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;don't use a status move against a status'd target
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, StatusAilmentMoveEffects
	ld de, $0001
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .nostatusconflict
	ld a, [wBattleMonStatus]
	and a
	jr nz, .heavydiscourage
.nostatusconflict
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote: fix spamming of buff/debuff moves
	;See if the move has an effect that should not be dissuaded
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, EffectsToNotDissuade
	ld de, $0001
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .spamprotection	;If not found on list, run anti-spam on it

;let's try to blind the AI a bit so that it won't just status the player immediately after using
;a restorative item or switching
	;effect found on list of spam-exempt moves, is this a status move?
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, StatusAilmentMoveEffects
	ld de, $0001
	call IsInArray
	pop bc
	pop de
	pop hl
	jr nc, .skipoutspam	;skip if not in the list of status effects
	
	;effect is a status move, did the player use an item or switch?
	ld a, [wActionResultOrTookBattleTurn]
	and a
	jr z, .skipoutspam	;skip if player did not use an item or switch
	
	;50% chance that the AI predicts the player would switch or use an item
	call Random
	rla
	jr c, .skipoutspam	;if carry set, then proceed as normal
	;else run spam protection on the status move
	
.spamprotection
;heavily discourage 0 BP moves if health is below 1/3 max
	ld a, 3
	call AICheckIfHPBelowFraction
	jp c, .heavydiscourage
;heavily discourage 0 BP moves if one was used just previously
	ld a, [wAILastMovePower]
	and a
	jp z, .heavydiscourage
;else apply a random bias to the 0 bp move we are on
	call Random	
;outcome desired: 	50% chance to heavily discourage and would rather do damage
;					12.5% chance to slightly encourage
;					else neither encourage nor discourage
	cp 128	;don't set carry flag if number is >= this value
	jp nc, .heavydiscourage	
	cp 32
	jp c, .givepref	;if not discouraged, then there is a chance to slightly encourage to spice things up
	;else neither encourage nor discourage
.skipoutspam
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - end of this AI layer
	jp .nextMove
.lightdiscourage	;dylannote - adding a .lightdiscourage version for more options
	ld a, [hl]
	add $1 ; lightly discourage move
	ld [hl], a
	jp .nextMove
.heavydiscourage
	ld a, [hl]
	add $5 ; heavily discourage move
	ld [hl], a
	jp .nextMove
.givepref	;joenote - added marker
	dec [hl] ; slightly encourage this move
	jp .nextMove

EffectsToNotDissuade:
	db CONFUSION_EFFECT
	db LEECH_SEED_EFFECT
	db DISABLE_EFFECT
	db HEAL_EFFECT
	db FOCUS_ENERGY_EFFECT
	db SUBSTITUTE_EFFECT
	db REFLECT_EFFECT
	db LIGHT_SCREEN_EFFECT
	db SUBSTITUTE_EFFECT
	db MIST_EFFECT
	db ACCURACY_DOWN1_EFFECT
	db ACCURACY_DOWN2_EFFECT
	db EVASION_UP1_EFFECT
	db EVASION_UP2_EFFECT
	;fall through
StatusAilmentMoveEffects:
	db $01 ; unused sleep effect
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db $FF

SubstituteImmuneEffects:	;joenote - added this table to track for substitute immunities
	db $01 ; unused sleep effect
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db CONFUSION_EFFECT
	db ATTACK_DOWN1_EFFECT
	db DEFENSE_DOWN1_EFFECT
	db SPEED_DOWN1_EFFECT
	db SPECIAL_DOWN1_EFFECT
	db ACCURACY_DOWN1_EFFECT
	db EVASION_DOWN1_EFFECT
	db ATTACK_DOWN2_EFFECT
	db DEFENSE_DOWN2_EFFECT
	db SPEED_DOWN2_EFFECT
	db SPECIAL_DOWN2_EFFECT
	db ACCURACY_DOWN2_EFFECT
	db EVASION_DOWN2_EFFECT
	db LEECH_SEED_EFFECT
	db DRAIN_HP_EFFECT
	db LEECH_SEED_EFFECT
	db DREAM_EATER_EFFECT
	db $FF

MistBlockEffects:	;joenote - added this table to track for things blocked by mist
	db $01 ; unused sleep effect
	db SLEEP_EFFECT
	db POISON_EFFECT
	db PARALYZE_EFFECT
	db CONFUSION_EFFECT
	db ATTACK_DOWN1_EFFECT
	db DEFENSE_DOWN1_EFFECT
	db SPEED_DOWN1_EFFECT
	db SPECIAL_DOWN1_EFFECT
	db ACCURACY_DOWN1_EFFECT
	db EVASION_DOWN1_EFFECT
	db ATTACK_DOWN2_EFFECT
	db DEFENSE_DOWN2_EFFECT
	db SPEED_DOWN2_EFFECT
	db SPECIAL_DOWN2_EFFECT
	db ACCURACY_DOWN2_EFFECT
	db EVASION_DOWN2_EFFECT
	db LEECH_SEED_EFFECT
	db $FF

SpecialZeroBPMoves:	;joenote - added this table to tracks 0 bp moves that should not be treated as buffs
	db BIDE
	db METRONOME
	db THUNDER_WAVE
	db $FF
	
OtherZeroBPEffects:	;joenote - added to keep track of some outliers
	db LEECH_SEED_EFFECT
	db DISABLE_EFFECT
	db CONFUSION_EFFECT
	db $FF
	
; slightly encourage moves with specific effects on the first turn from sendout only
; in particular, stat-modifying moves and moves that are only useful once per sendout
AIMoveChoiceModification2:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;kick out if no-attack bit is set
	ld a, [wUnusedC000]
	bit 2, a
	ret nz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld a, [wAILayer2Encouragement]
	and a ;cp $1	;AI layer 2 should activate on 1st turn instead of 2nd turn after sendout
	ret nz
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp ATTACK_UP1_EFFECT
	jr c, .nextMove
	cp EVASION_UP1_EFFECT + 1
	jr c, .preferMove
	cp ATTACK_DOWN1_EFFECT
	jr c, .nextMove
	cp BIDE_EFFECT + 1			
	jr c, .preferMove			;also includes Conversion, Haze, and Bide
	cp MIST_EFFECT
	jr c, .nextMove
	cp FOCUS_ENERGY_EFFECT + 1
	jr c, .preferMove			;includes Mist and Focus Energy
	cp ATTACK_UP2_EFFECT
	jr c, .nextMove
	cp EVASION_UP2_EFFECT + 1
	jr c, .preferMove
	cp ATTACK_DOWN2_EFFECT
	jr c, .nextMove
	cp REFLECT_EFFECT + 1
	jr c, .preferMove			;includes light screen and reflect
	jr .nextMove
.preferMove
	dec [hl] ; slightly encourage this move
	jr .nextMove

; encourages moves that are effective against the player's mon (even if non-damaging).
; discourage damaging moves that are ineffective or not very effective against the player's mon,
; unless there's no damaging move that deals at least neutral damage
; joenote - updated to also do some more advanced battle strategies
AIMoveChoiceModification3:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - kick out if no-attack bit is set
	ld a, [wUnusedC000]
	bit 2, a
	ret nz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;don't use poison-effect moves on poison-type pokemon
	ld a, [wEnemyMoveEffect]
	cp POISON_EFFECT
	jr nz, .notpoisoneffect
	ld a, [wBattleMonType]
	cp POISON
	jp z, .heavydiscourage2
	ld a, [wBattleMonType + 1]
	cp POISON
	jp z, .heavydiscourage2
.notpoisoneffect
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;slightly discourage using most offensive moves against fly/dig opponent if faster than opponent
	ld a, [wPlayerBattleStatus1]
	bit 6, a
	jr z, .endflydigcheck	;proceed as normal if player is not in fly/dig
	
	call StrCmpSpeed	;do a speed compare
	jr c, .flydigcheck_faster	;a set carry bit means the ai 'mon is faster
	ld a, [wEnemyMoveNum]
	cp QUICK_ATTACK
	jr z, .flydigcheck_faster

.flydigcheck_notfaster
	jr .endflydigcheck

.flydigcheck_faster
	;slightly discourage stuff that will just miss
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, MistBlockEffects
	ld de, $0001
	call IsInArray
	pop bc
	pop de
	pop hl
	jr c, .flydigcheck_discourage

	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, StatusAilmentMoveEffects
	ld de, $0001
	call IsInArray
	pop bc
	pop de
	pop hl

	jr c, .flydigcheck_discourage
	ld a, [wEnemyMoveEffect]
	push hl
	push de
	push bc
	ld hl, OtherZeroBPEffects
	ld de, $0001
	call IsInArray
	pop bc
	pop de
	pop hl
	jr c, .flydigcheck_discourage

	ld a, [wEnemyMovePower]
	and a
	jr z, .endflydigcheck

	ld a, [wEnemyMoveEffect]
	cp FLY_EFFECT
	jr z, .endflydigcheck
	cp CHARGE_EFFECT
	jr z, .endflydigcheck
	
.flydigcheck_discourage
	inc [hl]
.endflydigcheck
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;check on certain moves with zero bp but are handled differently
	ld a, [wEnemyMoveNum]
	push hl
	push de
	push bc
	ld hl, SpecialZeroBPMoves
	ld de, $0001
	call IsInArray	;see if a is found in the hl array (carry flag set if true)
	pop bc
	pop de
	pop hl
	jp c, .specialBPend	;If found on list, treat it as if it were a damaging move

	;otherwise only handle moves that deal damage from here on out
	ld a, [wEnemyMovePower]
	and a
	jp z, .nextMove	;go to next move if the current move is zero-power
.specialBPend
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - heavily discourage attack moves that have no effect due to typing
	push hl
	push bc
	push de
	;reset type-effectiveness bit before calling function
	ld a, [wUnusedC000]
	res 3, a 
	ld [wUnusedC000], a
	callab AIGetTypeEffectiveness
	pop de
	pop bc
	pop hl

	ld a, [wTypeEffectiveness]	;get the effectiveness
	and a 	;check if it's zero
	jr nz, .skipout2	;skip if it's not immune
.heavydiscourage2	;at this line the move has no effect due to immunity or other circumstance
	ld a, [hl]	
	add $5 ; heavily discourage move
	ld [hl], a
	jp .nextMove
.skipout2
	;if thunder wave is being used against a non-immune target, neither encourage nor discourage it
	ld a, [wEnemyMoveNum]
	cp THUNDER_WAVE
	jp z, .nextMove
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - do not use ohko moves on faster opponents, since they will auto-miss
	ld a, [wEnemyMoveEffect]	;load the move effect
	cp OHKO_EFFECT	;see if it is ohko move
	jr nz, .skipout3	;skip ahead if not ohko move
	call StrCmpSpeed	;do a speed compare
	jp c, .nextMove	;ai is fast enough so ohko move viable
	;else ai is slower so don't bother
	jp .heavydiscourage2
.skipout3	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote: static damage value moves should not be accounted for typing
;at the same time, randomly bump their preference to spice things up
	ld a, [wEnemyMovePower]	;get the base power of the enemy's attack
	cp $1	;check if it is 1. special damage moves assumed to have 1 base power
	jr nz, .skipout4	;skip down if it's not a special damage move
	call Random	;else get a random number between 0 and 255
	cp $40	
	jp c, .givepref	;(25% chance) slightly encourage
	jp .nextMove	;else neither encourage nor discourage
.skipout4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;jump if the move is not very effective
	ld a, [wTypeEffectiveness]
	cp $0A
	jr c, .notEffectiveMove
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;if the type effectiveness is neutral, randomly apply slight preference if there is STAB
	jr nz, .notneutraleffective
	
	;25% chance to check for and prefer a stab move
	call Random
	cp 192
	jp c, .nextMove
	
	push bc
	ld a, [wEnemyMoveType]
	ld b, a
	ld a, [wEnemyMonType1]
	cp b
	pop bc
	jp z, .givepref
	push bc
	ld a, [wEnemyMoveType]
	ld b, a
	ld a, [wEnemyMonType2]
	cp b
	pop bc
	jp z, .givepref
	jp .nextMove
.notneutraleffective
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;at this line, move is super effective
.givepref	;joenote - added marker
	dec [hl] ; slightly encourage this move
	jp .nextMove
.notEffectiveMove ; discourages non-effective moves if better moves are available 
	push hl
	push de
	push bc
	ld a, [wEnemyMoveType]
	ld d, a
	ld hl, wEnemyMonMoves  ; enemy moves
	ld b, NUM_MOVES + 1
	ld c, $0
.loopMoves
	dec b
	jr z, .done
	ld a, [hli]
	and a
	jr z, .done
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp SUPER_FANG_EFFECT
	jr z, .betterMoveFound ; Super Fang is considered to be a better move
	cp SPECIAL_DAMAGE_EFFECT
	jr z, .betterMoveFound ; any special damage moves are considered to be better moves
	cp FLY_EFFECT
	jr z, .betterMoveFound ; Fly is considered to be a better move
	ld a, [wEnemyMoveType]
	cp d
	jr z, .loopMoves
	ld a, [wEnemyMovePower]
	and a
	jr nz, .betterMoveFound ; damaging moves of a different type are considered to be better moves
	jr .loopMoves
.betterMoveFound
	ld c, a
.done
	ld a, c
	pop bc
	pop de
	pop hl
	and a
	jp z, .nextMove
	inc [hl] ; slightly discourage this move
	jp .nextMove
	
AIMoveChoiceModification4:	;this unused routine now handles intelligent trainer switching
	ld a, [wUnusedC000]
	set 5, a ; sets the bit that signifies trainer has intelligent switching
	ld [wUnusedC000], a
	push hl
	push bc
	callab ScoreAIParty	;carry is cleared if current mon score >= highest score of remaining roster; don't switch
	pop bc
	pop hl
	jp nc, .skipSwitchEnd	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;better chance to switch if afflicted with toxic-style poison
	ld a, [wEnemyBattleStatus3]
	bit 0, a	;check a for the toxic bit (sets or clears zero flag)
	jr z, .skipSwitchToxicEnd	;not badly poisoned if zero flag set
	call Random	;put a random number in 'a' between 0 and 255
	cp $55	;set carry if rand num < $55
	jp c, .setSwitch	;34% chance to switch
.skipSwitchToxicEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;chance to switch if stuck in a trapping move
	ld a, [wPlayerBattleStatus1]
	bit 5, a	;check a for trapping move bit (sets or clears zero flag)
	jr z, .skipSwitchTrapEnd	;not trapped if zero flag set
	call Random	;put a random number in 'a' between 0 and 255
	cp $40	;set carry if rand num < $40
	jp c, .setSwitch	;25% chance to switch
.skipSwitchTrapEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;chance to switch if afflicted with confusion
	ld a, [wEnemyBattleStatus1]
	bit 7, a	;check a for the confusion bit (sets or clears zero flag)
	jr z, .skipSwitchConfuseEnd	;not confused if zero flag set
	call Random	;put a random number in 'a' between 0 and 255
	cp $40	;set carry if rand num < $40
	jp c, .setSwitch	;25% chance to switch
.skipSwitchConfuseEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;12.5% chance to switch if afflicted with sleep counter > 3
	ld a, [wEnemyMonStatus]
	and %00000111	;check for sleep counter
	jr z, .skipSwitchNVSLEEPstatEnd	;no NV status if zero flag set
	push bc
	srl a
	srl a
	ld b, a
	call Random
	and %00000111
	cp b
	pop bc
	jp c, .setSwitch
.skipSwitchNVSLEEPstatEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;slight chance to switch if afflicted with leech seed
	ld a, [wEnemyBattleStatus2]
	bit 7, a	;check a for the leech seed bit (sets or clears zero flag)
	jr z, .skipSwitchSeedEnd	;not seeded if zero flag set
	call Random	;put a random number in 'a' between 0 and 255
	cp $20	;set carry if rand num < $20
	jp c, .setSwitch	;12.5% chance to switch
.skipSwitchSeedEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;slight chance to switch if move disabled
	ld a, [wEnemyDisabledMove] ; get disabled move (if any)
	swap a
	and $f
	jr z, .skipSwitchDisableEnd	;no disabled moves if zero flag set
	call Random	;put a random number in 'a' between 0 and 255
	cp $20	;set carry if rand num < $20
	jp c, .setSwitch	;12.5% chance to switch
.skipSwitchDisableEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;chance to switch if stat mods are too low
	push bc
	;use b for storage and a for loading
	ld a, [wEnemyMonAttackMod]	
	ld b, a 
	ld a, [wEnemyMonDefenseMod]
	cp b
	call c, CondLDBA	;if a < b, then load a into b
	ld a, [wEnemyMonSpeedMod]
	cp b
	call c, CondLDBA	;if a < b, then load a into b
	ld a, [wEnemyMonSpecialMod]
	cp b
	call c, CondLDBA	;if a < b, then load a into b
	ld a, [wEnemyMonAccuracyMod]
	cp b
	call c, CondLDBA	;if a < b, then load a into b
	ld a, [wEnemyMonEvasionMod]
	cp b
	call c, CondLDBA	;if a < b, then load a into b
	ld a, b	;but b back into a
	pop bc
	cp $07	;is the lowest stat mod the normal vale of 7?
	jr nc, .skipSwitchModEnd	;lowest stat mod is not negative (value below 7)
	push bc
	ld b, a	;put the lowest mod into b
	ld a, $07	; put 7 into a
	sub b	;a = 7 - b, so a becomes 6 (-6 stages) to 1 (-1 stage)
	ld b, a	;put a back into b
	call Random	;put a random number in 'a' between 0 and 255
	and $07	;use only bits 0 to 2 for a random number of 0 to 7
	cp b
	pop bc
	jp c, .setSwitch	;switch if random number < mod 1 (-1 stage) to 6 (-6 stages)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;switch if supereffective move is being used against enemy
.skipSwitchModEnd
	ld a, [wPlayerMovePower]	;get the power of the player's move
	cp $2	;regular damaging moves have power > 1
	jr c, .skipSwitchEffectiveEnd	;skip out if the move is not a normal damaging move
	push hl
	push bc
	push de
	;set type-effectiveness bit before calling function
	ld a, [wUnusedC000]
	set 3, a 
	ld [wUnusedC000], a
	callab AIGetTypeEffectiveness
	pop de
	pop bc
	pop hl
	ld a, [wTypeEffectiveness]	;get the multiplier effectiveness for the player's move
	cp $14	;is it < 20?
	jr c, .skipSwitchEffectiveEnd	;if so, skip to end of this block
	push bc
	ld a, [wPlayerMovePower]	;get the power of the player's move into a
	srl a	;halve the power
	srl a	;quarter the power
	ld b, a	;put quarter power into b
	ld a, [wPlayerMovePower]	;get the power of the player's move into a
	srl a	;halve the power
	add b	;add b to get 3/4ths power into a
	ld b, a
	call Random	;put a random number in 'a' 
	cp b; see if a < b and set carry if true
	pop bc
	jr nc, .skipSwitchEffectiveEnd	;if carry flag is set, switch pkmn
	;Before switching, flag the mon being switched out.
	;It will be used as a penalty in scoring since there
	;is clearly something disfavorable about it.
	push bc
	push hl
	push de
	ld de, wEnemyMonPartyPos
	callba SetAISwitched
	pop de
	pop bc
	pop hl
	jp .setSwitchKeepFlagged	
.skipSwitchEffectiveEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;do not switch if this pkmn was flagged
	push hl
	push bc
	push de
	ld de, wEnemyMonPartyPos
	callba CheckAISwitched
	pop de
	pop bc
	pop hl
	jp nz, .skipSwitchEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;switch if HP is low. 
;but don't switch based on low HP if enemy outspeeds player mon
	ld a, 3	;
	call AICheckIfHPBelowFraction
	jr nc, .skipSwitchHPend	;if hp not below 1/3 then skip to the end of this block
	call Random	;put a random number in 'a' between 0 and 255
	cp $40	;set carry if rand num < $40	/	;25% chance to switch
	jr nc, .skipSwitchHPend
	ld a, [wBattleMonSpeed]
	push bc
	ld b, a	;store hi byte of player speed in b
	ld a, [wEnemyMonSpeed]	;store hi byte of enemy speed in a
	cp b
	pop bc
	jr nz, .next1	;if bytes are not equal, then rely on carry bit to see which is greater
	;else check the lo bytes
	ld a, [wBattleMonSpeed + 1]
	push bc
	ld b, a	;store lo byte of player speed in b
	ld a, [wEnemyMonSpeed + 1]	;store lo byte of enemy speed in a
	cp b
	pop bc
.next1
	jp c, .setSwitch	;if carry is set, then enemy mon has less speed --> switch out
.skipSwitchHPend
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;chance to switch if afflicted with non-volatile status (except sleep)
	ld a, [wEnemyMonStatus]
	and %11111000	;check for any non-volatile status except sleep
	jr z, .skipSwitchNVstatEnd	;no NV status if zero flag set
	call Random	;put a random number in 'a' between 0 and 255
	cp $40	;set carry if rand num < $40
	jp c, .setSwitch	;25% chance to switch
.skipSwitchNVstatEnd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	jr .skipSwitchEnd	;jump to the end and get out of this line is reached.
.setSwitch	;this line will only be reached if a switch is confirmed.
	push bc
	push hl
	push de
	ld de, wEnemyMonPartyPos
	callba ClearAISwitched	;clear any switch flags on the mon being switched out
	pop de
	pop bc
	pop hl
.setSwitchKeepFlagged
	call SetSwitchBit
.skipSwitchEnd
	ret

; NEW layer.
; slightly encourage moves with specific effects.
; in particular, non-damaging status moves.
AIMoveChoiceModification5:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;kick out if no-attack bit is set
	ld a, [wUnusedC000]
	bit 2, a
	ret nz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	call Random
	cp $AA	;~66.6% chance of activation
	jr c, .Layer5Activation
	ret
.Layer5Activation
	ld a, [wAILayer5Encouragement]
	and a ;cp $1 ;ret nz	;AI layer 5 is activated regardless of the turn count
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp SLEEP_EFFECT
	jr z, .preferMove
	cp CONFUSION_EFFECT
	jr z, .preferMove
	cp POISON_EFFECT
	jr z, .preferMove
	cp PARALYZE_EFFECT
	jr z, .preferMove
	cp LEECH_SEED_EFFECT
	jr z, .preferMove
	jr .nextMove
.preferMove
	dec [hl] ; slightly encourage this move
	jr .nextMove
	
; NEW layer.
; encourage certain moves under certain situations (advanced battle strategies).
AIMoveChoiceModification6:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;kick out if no-attack bit is set
	ld a, [wUnusedC000]
	bit 2, a
	ret nz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;do a speed compare, and kick out if the ai 'mon is slower
	call StrCmpSpeed
	ret nc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld a, [wPlayerMovePower]	;all regular damage moves have a power of at least 10
	cp 10
	jr nc, .jumptolightscreencheck	;skip preferring substitute or mist if the player is using a move that is 10 power or above
	ld a, [wAILayer6Encouragement]
	and a ;cp $1 ;ret nz	;AI layer 6 is activated regardless of the turn count
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp MIST_EFFECT
	jr z, .preferMove
	cp SUBSTITUTE_EFFECT
	jr z, .preferMove
	cp ACCURACY_DOWN1_EFFECT
	jr z, .preferMove
	cp ACCURACY_DOWN2_EFFECT
	jr z, .preferMove
	cp EVASION_UP1_EFFECT
	jr z, .preferMove
	cp EVASION_UP2_EFFECT
	jr z, .preferMove
	jr .nextMove
.preferMove
	dec [hl] ; slightly encourage this move
	jr .nextMove
.jumptolightscreencheck
	ld a, [wPlayerMoveType]		;physical move types are numbers $00 to $08 while special is $14 to $1A
	cp $14
	jr c, .reflectencouragement	;if player not using special attacks, jump to reflect
.lightscreenencouragement
	ld a, [wAILayer6Encouragement]
	and a ;cp $1 ;ret nz	;AI layer 6 is activated regardless of the turn count
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove2
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp LIGHT_SCREEN_EFFECT
	jr z, .preferMove2
	cp SPECIAL_DOWN1_EFFECT
	jr z, .preferMove2
	cp SPECIAL_DOWN2_EFFECT
	jr z, .preferMove2
	cp SPECIAL_UP1_EFFECT
	jr z, .preferMove2
	cp SPECIAL_UP2_EFFECT
	jr z, .preferMove2
	jr .nextMove2
.preferMove2
	dec [hl] ; slightly encourage this move
	jr .nextMove2
.reflectencouragement
	ld a, [wAILayer6Encouragement]
	and a ;cp $1 ;ret nz	;AI layer 6 is activated regardless of the turn count
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove3
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp REFLECT_EFFECT
	jr z, .preferMove3
	cp ATTACK_DOWN1_EFFECT
	jr z, .preferMove3
	cp ATTACK_DOWN2_EFFECT
	jr z, .preferMove3
	cp DEFENSE_UP1_EFFECT
	jr z, .preferMove3
	cp DEFENSE_UP2_EFFECT
	jr z, .preferMove3
	jr .nextMove3
.preferMove3
	dec [hl] ; slightly encourage this move
	jr .nextMove3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;joenote - function for loading A into B so it can be called conditionally
CondLDBA:
	ld b, a
	ret
	
ReadMove:
	push hl
	push de
	push bc
	dec a
	ld hl, Moves
	ld bc, MoveEnd - Moves
	call AddNTimes
	ld de, wEnemyMoveNum
	call CopyData
	pop bc
	pop de
	pop hl
	ret

;joenote - takes move in d, returns its power in d and type in e
ReadMoveForAIscoring:
	dec d
	ld a, d
	ld hl, Moves
	ld bc, MoveEnd - Moves
	call AddNTimes
	inc hl	
	inc hl ;point to move power
	ld a, [hli]
	ld d, a	;store power in d
	ld a, [hl]
	ld e, a ;store type in e
	ret

; move choice modification methods that are applied for each trainer class
; 0 is sentinel value
;1 - Do not use a move that only statuses (e.g., Thunder Wave) if the player's Pokémon already has a status.
;2 - On the first turn only the Pokémon is out, prefer a move that heals/buffs/debuffs
;3 - Try to do type-matching when selecting attacks
;4 - switch if active pkmn is in trouble
TrainerClassMoveChoiceModifications:
	db 0      ; YOUNGSTER
	db 1,0    ; BUG CATCHER
	db 1,0    ; LASS					;Subtracted 3,4
	db 1,3,0  ; SAILOR
	db 1,3,0    ; JR_TRAINER_M			;Subtracted 4
	db 1,3,0    ; JR_TRAINER_F			;Subtracted 4
	db 1,2,3,4,0; POKEMANIAC
	db 1,3,4,5,0  ; SUPER_NERD			;Added 5, Subtracted 2
	db 1,3,0    ; HIKER					;Subtracted 4
	db 1,0    ; BIKER
	db 1,2,3,4,0  ; BURGLAR				;Added 2
	db 1,2,3,4,0    ; ENGINEER			;Added 2
	db 1,3,4,6,0  ; JUGGLER_X			;Added 3,6
	db 1,3,0  ; FISHER
	db 1,3,0  ; SWIMMER
	db 0      ; CUE_BALL
	db 1,3,0    ; GAMBLER				;Added 3
	db 1,3,4,0  ; BEAUTY
	db 1,2,3,0  ; PSYCHIC_TR			;Added 3, Subtracted 4
	db 1,3,0  ; ROCKER					;Subtracted 4
	db 1,3,4,0    ; JUGGLER				;Added 3,4
	db 1,3,4,0    ; TAMER				;Added 3
	db 1,3,0    ; BIRD_KEEPER			;Added 3, Subtracted 4
	db 1,3,0    ; BLACKBELT				;Added 3
	db 1,4,0    ; SONY1					;Added 4
	db 1,2,3,4,0  ; PROF_OAK			;Added 2
	db 1,2,3,4,0  ; CHIEF				
	db 1,2,3,4,0  ; SCIENTIST			;Added 3,4
	db 1,2,3,4,0  ; GIOVANNI			;Added 2
	db 1,3,4,0    ; ROCKET				;Added 3,4
	db 1,3,4,0  ; COOLTRAINER_M
	db 1,3,4,0  ; COOLTRAINER_F
	db 1,3,4,0    ; BRUNO
	db 1,3,4,0    ; BROCK
	db 1,2,3,4,0  ; MISTY				;Added 2
	db 1,3,4,0  ; LT_SURGE
	db 1,3,4,5,0  ; ERIKA				;Added 5
	db 1,2,3,4,0  ; KOGA				;Added 2
	db 1,3,4,0  ; BLAINE
	db 1,3,4,0  ; SABRINA
	db 1,3,4,0  ; GENTLEMAN				;Subtracted 2
	db 1,3,4,0  ; SONY2
	db 1,3,4,0  ; SONY3
	db 1,2,3,4,0; LORELEI
	db 1,2,3,0    ; CHANNELER			;Added 2,3
	db 1,3,4,0    ; AGATHA
	db 1,3,4,0  ; LANCE
	db 1,3,6,0  ; BUG_MASTER	;NEW	;Given 1,3,6

INCLUDE "engine/battle/trainer_pic_money_pointers.asm"

INCLUDE "text/trainer_names.asm"

INCLUDE "engine/battle/bank_e_misc.asm"

;joenote - moving all this to bank $2D to free up space for trainer AI in bank $E
;		- This only gets called from a bank switch in core.asm anyway
;INCLUDE "engine/battle/read_trainer_party.asm"

;INCLUDE "data/trainer_moves.asm"

;INCLUDE "data/trainer_parties.asm"

TrainerAI:
	and a
	ld a, [wIsInBattle]
	dec a
	ret z ; if not a trainer, we're done here
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - AI should not use actions if in a move that prevents such a thing
	ld a, [wEnemyBattleStatus2]
	and %01100000
	ret nz
	ld a, [wEnemyBattleStatus1]
	and %01110011
	ret nz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - switch if the switch bit is set	
	call CheckandResetSwitchBit
	jp nz, AISwitchIfEnoughMonsWithSwitchCancelChecks	;switch if bit was initially set ;dylannote - cancel checks added
	;jp AISwitchIfEnoughMons	;joedebug - use this to make trainer ai constantly switch
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
	ld a, [wTrainerClass] ; what trainer class is this?
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerAIPointers
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, [wAICount]
	and a
	ret z ; if no AI uses left, we're done here
	inc hl
	inc a
	jr nz, .getpointer
	dec hl
	ld a, [hli]
	ld [wAICount], a
	xor a
	ld [wAICount2], a	;dylannote - separate counter that restricts an item to 1 use only
	xor a
	ld [wAICount3], a	;dylannote - additional counter that restricts another item to 1 use only
.getpointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Random
	jp hl

TrainerAIPointers:
; one entry per trainer class
; first byte, number of times (per Pokémon) it can occur
; next two bytes, pointer to AI subroutine for trainer class
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 1,SailorAI	; sailor					B-
	dbw 1,JrtrainerMAI	; jrtrainerm			B
	dbw 1,JrtrainerFAI	; jrtrainerf			B
	dbw 3,PokemaniacAI	; pokemaniac			A
	dbw 3,SupernerdAI	; supernerd				A
	dbw 1,HikerAI	; hiker						B-
	dbw 3,GenericAI
	dbw 3,BurglarAI ; burglar					A
	dbw 1,EngineerAI	; engineer				B
	dbw 4,JugglerXAI ; juggler_x	;NEW		S-
	dbw 1,FisherAI	; fisher					B-
	dbw 1,SwimmerAI	; swimmer					B-
	dbw 3,GenericAI
	dbw 3,GenericAI
	dbw 2,BeautyAI ; beauty						B+
	dbw 1,PsychicTRAI	; psychicTR				B
	dbw 1,RockerAI	; rocker					B
	dbw 2,JugglerAI ; juggler					A-
	dbw 2,TamerAI ; tamer						B+
	dbw 1,BirdkeeperAI	; birdkeeper			B-
	dbw 2,BlackbeltAI ; blackbelt				B+
	dbw 2,Sony1AI ; sony1						B+
	dbw 3,GenericAI
	dbw 4,ChiefAI ; chief			;NEW		S-
	dbw 3,ScientistAI	; scientist				A
	dbw 4,GiovanniAI ; giovanni					S
	dbw 2,RocketAI ; rocket						A-
	dbw 3,CooltrainerMAI ; cooltrainerm			A
	dbw 3,CooltrainerFAI ; cooltrainerf			A
	dbw 4,BrunoAI ; bruno						S
	dbw 3,BrockAI ; brock						A
	dbw 3,MistyAI ; misty						A
	dbw 3,LtSurgeAI ; surge						A+
	dbw 3,ErikaAI ; erika						A+
	dbw 4,KogaAI ; koga							S-
	dbw 4,BlaineAI ; blaine						S
	dbw 4,SabrinaAI ; sabrina					S-
	dbw 2,GentlemanAI ; gentleman				A-
	dbw 3,Sony2AI ; sony2						A+
	dbw 5,Sony3AI ; sony3						S+
	dbw 4,LoreleiAI ; lorelei					S
	dbw 2,ChannelerAI ; channeler				B+
	dbw 4,AgathaAI ; agatha						S
	dbw 5,LanceAI ; lance						S+
	dbw 4,BugMasterAI ; bug_master	;NEW		S-

;joenote - reorganizing these AI routines to jump on carry instead of returning on not-carry
;also adding recognition of a switch-pkmn bit

;Dylannote - A.I. items that restore HP are generally used as follows, unless treated as a special case
;Tier S trainers (37.5% or $60 below 1/2 HP, 50% or $80 below 1/3 HP, 62.5% or $A0 below 1/6 HP) OR (50% or $80 below 1/2 HP; more % is proportional to the fraction)
;Tier A trainers (12.5% or $20 below 1/2 HP, 25% or $40 below 1/3 HP, 37.5% or $60 below 1/6 HP) OR (25% or $40 below 1/2 HP; more %/2 is proportional to the fraction)
;Tier B trainers (6.25% or $10 below 1/2 HP, 12.5% or $20 below 1/3 HP, 18.75% or $30 below 1/6 HP) OR (12.5% or $20 below 1/2 HP; more %/4 is proportional to the fraction)
;"Special Case" items are considered to be Full Heal, X Items, Dire Hit, Guard Spec,
;or any healing items which do not follow the above guideline.
;The total probability limit for special case items is unlimited for Tier S, 37.5% or $60 for Tier A,
;and 12.5% or $20 for Tier B.

;Dylannote - Item tiers. The above probabilities only apply to an item that matches the tier. If a trainer
;uses an item outside their tier, it is acceptable to add or subtract 12.5% per tier from the general or
;special case limit.
;Tier S Items: Full Restore
;Tier A Items: Max Potion, Hyper Potion, Full Heal, X Items
;Tier B Items: Lemonade, Soda Pop, Fresh Water, Super Potion, Potion

;Tier S+ has absolutely no limitations and can access extremely specialized A.I.
;Tier A+ can access items from tier S without penalties.
;Tier B+ can access items from tier A without penalties.

;Every GYM LEADER in tier A receives a "Gym Leader" unique pool, which serves as a separate special case
;pool, with a total probability limit of 37.5%.

;Dylannote - If an item is restricted to 1 use only, add 12.5% to the general or special case limits.
;If giving up general usage healing items, add 12.5% to the special case limit for each layer omitted.

SailorAI:	;NEW
	cp $10	;6.25%
	jr nc, .sailornext1
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFreshWater
.sailornext1
	call Random
	cp $20	;12.5%
	jr nc, .sailornext2
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFreshWater
.sailornext2
	call Random
	cp $30	;18.75%
	jr nc, .sailornext3
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFreshWater
.sailornext3
	and a
	ret

JrtrainerMAI:	;NEW
	cp $10	;6.25%
	jr nc, .jrtrainermnext1
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseSuperPotion
.jrtrainermnext1
	call Random
	cp $20	;12.5%
	jr nc, .jrtrainermnext2
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseSuperPotion
.jrtrainermnext2
	call Random
	cp $30	;18.75%
	jr nc, .jrtrainermnext3
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseSuperPotion
.jrtrainermnext3
	and a
	ret

JrtrainerFAI:	;NEW
	cp $10	;6.25%
	jr nc, .jrtrainerfnext1
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseSuperPotion
.jrtrainerfnext1
	call Random
	cp $20	;12.5%
	jr nc, .jrtrainerfnext2
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseSuperPotion
.jrtrainerfnext2
	call Random
	cp $30	;18.75%
	jr nc, .jrtrainerfnext3
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseSuperPotion
.jrtrainerfnext3
	and a
	ret

PokemaniacAI:	;NEW
	cp $20	;12.5%
	jr nc, .pokemaniacnext0
	jp c, AISwitchIfEnoughMons	;SPECIAL CASE 1
.pokemaniacnext0
	call Random
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .pokemaniacnext1
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .pokemaniacnext3
.pokemaniacnext1
	call Random
	cp $80	;50%
	jr nc, .pokemaniacnext2
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseHyperPotion
.pokemaniacnext2
	call Random
	cp $40	;25%
	jr nc, .pokemaniacnext3
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseMaxPotion	;SPECIAL CASE 2
.pokemaniacnext3
	and a
	ret

SupernerdAI:	;NEW
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .supernerdnext0
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .supernerdnext3
.supernerdnext0
	call Random
	cp $20	;12.5%
	jr nc, .supernerdnext1
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseMaxPotion
.supernerdnext1
	call Random
	cp $40	;25%
	jr nc, .supernerdnext2
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseMaxPotion
.supernerdnext2
	call Random
	cp $60	;37.5%
	jr nc, .supernerdnext3
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseMaxPotion
.supernerdnext3
	call Random
	cp $80	;50%
	jr nc, .supernerdnext4
	ld a, $2	;above fraction
	call AICheckIfHPBelowFraction
	jr c, .supernerdnext4
	ld a, [wEnemyMonStatus]
	and a
	jp nz, AIFHeaRestricted2	;SPECIAL CASE 1
.supernerdnext4
	and a
	ret 
	
HikerAI:	;NEW
	cp $20	;12.5%
	jr nc, .hikernext1
	ld a, $2	;above fraction 
    call AICheckIfHPBelowFraction
	jp nc, AIXDefRestricted2	;SPECIAL CASE 1
.hikernext1
	call Random
	cp $20	;12.5%
	jr nc, .hikernext2
	ld a, $8	;below fraction
	call AICheckIfHPBelowFraction	
	jp c, AIHPotRestricted3		;SPECIAL CASE 2
.hikernext2
	and a
	ret

BurglarAI:	;NEW
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .burglarnext0
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .burglarnext3
.burglarnext0
	call Random
	cp $20	;12.5%
	jr nc, .burglarnext1
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseMaxPotion
.burglarnext1
	call Random
	cp $40	;25%
	jr nc, .burglarnext2
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseMaxPotion
.burglarnext2
	call Random
	cp $60	;37.5%
	jr nc, .burglarnext3
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseMaxPotion
.burglarnext3
	call Random
    cp $30	;18.75%
	jr nc, .burglarnext4
    ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
    jp nc, AIXSpeRestricted2	;SPECIAL CASE 1
.burglarnext4
	call Random
	cp $30	;18.75%
	jr nc, .burglarnext5
	ld a, $2	;above fraction
	call AICheckIfHPBelowFraction
	jp nc, AIDHitRestricted3	;SPECIAL CASE 2
.burglarnext5
	and a
    ret
	
EngineerAI:	;NEW
	cp $20	;12.5%
	jr nc, .engineernext1
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseLemonade
.engineernext1
	call Random
	cp $20	;12.5%
	jr nc, .engineernext2
	ld a, $6	;below fraction
	call AICheckIfHPBelowFraction
	jp c, AIHPotRestricted2		;SPECIAL CASE 1
.engineernext2
	and a
	ret
	
JugglerXAI:	;NEW
	cp $20	;12.5%
	jr nc, .jugglerXnext00
	jp c, AISwitchIfEnoughMonsWithSwitchCancelChecks	;SPECIAL CASE 1
.jugglerXnext00
	call Random
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .jugglerXnext0
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .jugglerXnext1
.jugglerXnext0
	call Random
	cp $AA	;66.6%
	jr nc, .jugglerXnext1
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.jugglerXnext1
	call Random
	cp $AA	;66.6%
	jr nc, .jugglerXnext2
	ld a, $3	;above fraction
	call AICheckIfHPBelowFraction
	jr c, .jugglerXnext2
	jp AIUseFullRestoreSLPFRZPAR		;SPECIAL CASE 2
.jugglerXnext2
	and a
    ret

FisherAI:	;NEW
	cp $20	;12.5%
	jr nc, .fishernext1
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseLemonade
.fishernext1
	call Random
	cp $20	;12.5%
	jr nc, .fishernext2
	ld a, $8	;below fraction
	call AICheckIfHPBelowFraction
	jp c, AIHPotRestricted2		;SPECIAL CASE 1
.fishernext2
	and a
	ret

SwimmerAI:	;NEW
	cp $20	;12.5%
	jr nc, .swimmernext1
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIHPotRestricted2
.swimmernext1
	call Random
	cp $20	;12.5%
	jr nc, .swimmernext2
	ld a, $2	;above fraction
	call AICheckIfHPBelowFraction
	jp nc, AIXSpcRestricted3	;SPECIAL CASE 1
.swimmernext2
	and a
	ret
	
BeautyAI:	;NEW
	cp $20	;12.5%
	jr nc, .beautynext1
	ld a, $2	;below fraction
	call AICheckIfHPBelowFraction
	jp c, AIUseHyperPotion
.beautynext1
	call Random
	cp $40	;25%
	jr nc, .beautynext2
	ld a, $2	;above fraction
	call AICheckIfHPBelowFraction
	jr c, .beautynext2
	ld a, [wEnemyMonStatus]
	and a
	jp nz, AIFHeaRestricted2	;SPECIAL CASE 1
.beautynext2
	and a
	ret
	
PsychicTRAI:	;NEW
	cp $20	;12.5%
	jr nc, .psychictrnext1
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIHPotRestricted2
.psychictrnext1
	call Random
	cp $20	;12.5%
	jr nc, .psychictrnext2
	ld a, $2	;above fraction
	call AICheckIfHPBelowFraction
	jp nc, AIXSpcRestricted3	;SPECIAL CASE 1
.psychictrnext2
	and a
	ret

RockerAI:	;NEW
	cp $10	;6.25%
	jr nc, .rockernext1
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseSodaPop
.rockernext1
	call Random
	cp $20	;12.5%
	jr nc, .rockernext2
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseSodaPop
.rockernext2
	call Random
	cp $30	;18.75%
	jr nc, .rockernext3
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseSodaPop
.rockernext3
	and a
	ret

JugglerAI:	;NEW
	cp $20	;12.5%
	jr nc, .jugglernext0
	jp c, AISwitchIfEnoughMons	;SPECIAL CASE 1
.jugglernext0
	call Random
	cp $40	;25%
	jr nc, .jugglernext1
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseHyperPotion
.jugglernext1
	call Random
	cp $40	;25%
	jr nc, .jugglernext2
	ld a, $2	;above fraction
	call AICheckIfHPBelowFraction
	jr c, .jugglernext2
	ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal	;SPECIAL CASE 2
.jugglernext2
	and a
    ret
	
TamerAI:	;NEW
	cp $20	;12.5%
	jr nc, .tamernext1
    ld a, $2	;below fraction
    call AICheckIfHPBelowFraction
    jp c, AIUseHyperPotion
.tamernext1
	call Random
    cp $40	;25%
	jr nc, .tamernext2
    ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
    jp nc, AIXAccRestricted2	;SPECIAL CASE 1
.tamernext2
	and a
    ret
	
BirdkeeperAI:	;NEW
	cp $20	;12.5%
	jr nc, .birdkeepernext1
	ld a, $2	;above fraction 
    call AICheckIfHPBelowFraction
	jp nc, AIXSpeRestricted2	;SPECIAL CASE 1
.birdkeepernext1
	call Random
	cp $20	;12.5%
	jr nc, .birdkeepernext2
	ld a, $2	;below fraction
	call AICheckIfHPBelowFraction
	jp c, AIHPotRestricted3
.birdkeepernext2
	and a
	ret

BlackbeltAI:
	cp $40	;25%
	jr nc, .blackbeltnext1
    ld a, $2	;below fraction
    call AICheckIfHPBelowFraction
    jp c, AIHPotRestricted2
.blackbeltnext1
	call Random
    cp $40	;25%
	jr nc, .blackbeltnext2
    ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
    jp nc, AIXAttRestricted3	;SPECIAL CASE 1
.blackbeltnext2
	and a
    ret
	
Sony1AI:	;NEW
	cp $40 ;25%
	jr nc, .sony1next1
	ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .sony1next1
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIFHeaRestricted2	;SPECIAL CASE 1
.sony1next1
	cp $10	;6.25%
	jr nc, .sony1next2
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseSuperPotion
.sony1next2
	call Random
	cp $20	;12.5%
	jr nc, .sony1next3
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseSuperPotion
.sony1next3
	call Random
	cp $30	;18.75%
	jr nc, .sony1next4
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseSuperPotion
.sony1next4
	and a
    ret
	
ChiefAI:		;NEW
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .chiefnext0
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .chiefnext3
.chiefnext0
	call Random
	cp $60	;37.5%
	jr nc, .chiefnext1
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.chiefnext1
	call Random
	cp $80	;50%
	jr nc, .chiefnext2
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.chiefnext2
	call Random
	cp $A0	;62.5%
	jr nc, .chiefnext3
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.chiefnext3
	call Random
    cp $80 ;50%
	jr nc, .chiefnext4
	ld a, $2	;below fraction
    call AICheckIfHPBelowFraction
	jr nc, .chiefnext4
    jp AIUseFullRestoreSLPFRZPAR		;SPECIAL CASE 1
.chiefnext4
	call Random
    cp $80 ;50%
	jr nc, .chiefnext5
	ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .chiefnext5
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal				;SPECIAL CASE 2
.chiefnext5
	call Random
    cp $20 ;12.5%
	jr nc, .chiefnext6
	call StrCmpSpeed	;only use X_SPEED if currently slower than player
	jr c, .chiefnext6
	ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .chiefnext6
    ld a, [wEnemyMonStatus]
	and a
	jp z, AIUseXSpeed					;SPECIAL CASE 3
.chiefnext6
	and a
	ret
	
ScientistAI:	;NEW
	cp $60	;12.5%
	jr nc, .scientistnext0
    ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
    jp nc, AIXSpcRestricted2	;SPECIAL CASE 1
.scientistnext0
	call Random
	cp $20	;25%
	jr nc, .scientistnext1
	ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .scientistnext1
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal		;SPECIAL CASE 2
.scientistnext1
	call Random
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .scientistnext2
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .scientistnext4
.scientistnext2
	call Random
    cp $20	;12.5%
	jr nc, .scientistnext3
    ld a, $3	;below fraction
    call AICheckIfHPBelowFraction
    jp c, AIUseFullRestore
.scientistnext3
	call Random
    cp $40	;25%
	jr nc, .scientistnext4
    ld a, $6	;below fraction
    call AICheckIfHPBelowFraction
    jp c, AIUseFullRestore
.scientistnext4
	and a
    ret
	
GiovanniAI:
	cp $20	;12.5%
	jr nc, .giovanninext0
	ld a, $2	;above fraction
	call AICheckIfHPBelowFraction
	jr c, .giovanninext0
	ld a, [wPlayerMovePower]
	cp 65
	jr c, .usedirehitinstead
	ld a, [wPlayerMoveType]
	cp $14
	jr c, .useXdefendinstead
	ld a, [wEnemyBattleStatus3]	;If Guard Spec was already used, then attempt to use Dire Hit instead
	bit HAS_LIGHT_SCREEN_UP, a
	jr nz, .usedirehitinstead
	jp AIUseGuardSpec		;GIOVANNI UNIQUE POOL
.useXdefendinstead
	ld a, [wEnemyMonDefenseMod]
	cp 9	;+2
	jr nc, .usedirehitinstead
	jp AIUseXDefend			;GIOVANNI UNIQUE POOL
.usedirehitinstead
	call StrCmpSpeed
	jr nc, .giovanninext0
	ld a, [wEnemyBattleStatus2]	;If Dire Hit was already used, skip
	bit GETTING_PUMPED, a
	jr nz, .giovanninext0
	jp AIUseDireHit			;GIOVANNI UNIQUE POOL
; Activates when Giovanni's Mon has at least 1/2 health. When being targeted by a special attack 
; of 65 power or greater, 12.5% chance to use Guard Spec, or if it is a physical attack instead,
; 12.5% chance to use X Defend (up to +2 DEF). If being targeted by a weaker attack, or if Giovanni
; has already used Guard Spec once or X Defend twice, and his Mon is faster, 12.5% chance to 
; use Dire Hit.
.giovanninext0
	call Random
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .giovanninext1
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .giovanninext4
.giovanninext1
	call Random
    cp $60	;37.5%
	jr nc, .giovanninext2
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.giovanninext2
	call Random
	cp $80	;50%
	jr nc, .giovanninext3
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.giovanninext3
	call Random
	cp $A0	;62.5%
	jr nc, .giovanninext4
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.giovanninext4
	call Random
    cp $80 ;50%
	jr nc, .giovanninext5
	ld a, $1	;below fraction
    call AICheckIfHPBelowFraction
	jr nc, .giovanninext5
    jp AIUseFullRestoreSLPFRZPAR		;SPECIAL CASE 1
.giovanninext5
	call Random
    cp $E0 ;87.5%
	jr nc, .giovanninext6
	ld a, $1	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .giovanninext6
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal				;SPECIAL CASE 2
.giovanninext6
	and a
	ret

RocketAI:    ;NEW
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .rocketnext0
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .rocketnext3
.rocketnext0
	call Random
    cp $20	;12.5%
	jr nc, .rocketnext1
	ld a, $2	;below fraction
    call AICheckIfHPBelowFraction
	jp c, AIUseHyperPotion
.rocketnext1
	call Random
	cp $40	;25%
	jr nc, .rocketnext2
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseHyperPotion
.rocketnext2
	call Random
	cp $60	;37.5%
	jr nc, .rocketnext3
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseHyperPotion
.rocketnext3
	call Random
    cp $20	;12.5%
	jr nc, .rocketnext4
    ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
    jp nc, AIXSpeRestricted2	;SPECIAL CASE 1
.rocketnext4
	and a
    ret

CooltrainerMAI:
	cp $40 ;25%
	jr nc, .cooltrainermnext1
    ld a, $2	;below fraction
    call AICheckIfHPBelowFraction
    jp c, AIUseMaxPotion
.cooltrainermnext1
	call Random
    cp $60 ;37.5%
	jr nc, .cooltrainermnext2
	ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .cooltrainermnext2
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal	;SPECIAL CASE 1
.cooltrainermnext2
	and a
    ret
	
CooltrainerFAI:
	cp $40 ;25%
	jr nc, .cooltrainerfnext1
    ld a, $2	;below fraction
    call AICheckIfHPBelowFraction
    jp c, AIUseMaxPotion
.cooltrainerfnext1
	call Random
    cp $60 ;37.5%
	jr nc, .cooltrainerfnext2
	ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .cooltrainerfnext2
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal	;SPECIAL CASE 1
.cooltrainerfnext2
	and a
    ret
	
BrockAI:
	ld a, [wEnemyMonType1]
	cp ROCK
	jr nz, .brocknext00
	ld a, [wEnemyMonType2]
	cp GROUND
	jr nz, .brocknext00
	ld a, [wPlayerMoveType]
	cp WATER
	jr c, .brocknext00	;every type with a lower id than WATER
	cp ELECTRIC
	jr nc, .brocknext00	;every type with a higher id than GRASS
	jp AISwitchIfEnoughMonsL1
; At the start of battle, Brock is likely to switch out Geodude if Geodude is targeted by a WATER or
; GRASS type attack
.brocknext00
	call Random
	cp $60 ;37.5%
	jr nc, .brocknext0
	ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .brocknext0
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal		;SPECIAL CASE 1
.brocknext0
	call Random
	cp $60	;37.5%
	jr nc, .brocknext1
    ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
    jp nc, AIGSpeRestricted2	;GYM LEADER UNIQUE POOL
.brocknext1
	call Random
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .brocknext2
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .brocknext5
.brocknext2
	call Random
	cp $40	;25%
	jr nc, .brocknext3
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIMPotRestricted3
.brocknext3
	call Random
	cp $40	;25%
	jr nc, .brocknext4
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseMaxPotion
.brocknext4
	call Random
	cp $60	;37.5%
	jr nc, .brocknext5
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseMaxPotion
.brocknext5
	and a
	ret

MistyAI:
	cp $60 ;37.5%
	jr nc, .mistynext0
	ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .mistynext0
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal		;SPECIAL CASE 1
.mistynext0
	call Random
	cp $60	;37.5%
	jr nc, .mistynext1
    ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
    jp nc, AIXSpcRestricted2	;GYM LEADER UNIQUE POOL
.mistynext1
	call Random
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .mistynext2
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .mistynext5
.mistynext2
	call Random
	cp $40	;25%
	jr nc, .mistynext3
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIMPotRestricted3
.mistynext3
	call Random
	cp $40	;25%
	jr nc, .mistynext4
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseMaxPotion
.mistynext4
	call Random
	cp $60	;37.5%
	jr nc, .mistynext5
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseMaxPotion
.mistynext5
	and a
	ret
	
LtSurgeAI:
	cp $60 ;37.5%
	jr nc, .ltsurgenext0
	ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .ltsurgenext0
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal		;SPECIAL CASE 1
.ltsurgenext0
	call Random
	cp $60	;37.5%
	jr nc, .ltsurgenext1
    ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
    jp nc, AIDHitRestricted2	;GYM LEADER UNIQUE POOL
.ltsurgenext1
	call Random
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .ltsurgenext2
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .ltsurgenext5
.ltsurgenext2
	call Random
	cp $40	;25%
	jr nc, .ltsurgenext3
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIFResRestricted3
.ltsurgenext3
	call Random
	cp $40	;25%
	jr nc, .ltsurgenext4
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.ltsurgenext4
	call Random
	cp $60	;37.5%
	jr nc, .ltsurgenext5
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.ltsurgenext5
	and a
	ret
	
ErikaAI:
    cp $60 ;37.5%
	jr nc, .erikanext0
	ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .erikanext0
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal		;SPECIAL CASE 1
.erikanext0
	call Random
	cp $60	;37.5%
	jr nc, .erikanext1
    ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
    jp nc, AIXAccRestricted2	;GYM LEADER UNIQUE POOL
.erikanext1
	call Random
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .erikanext2
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .erikanext5
.erikanext2
	call Random
	cp $40	;25%
	jr nc, .erikanext3
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIFResRestricted3
.erikanext3
	call Random
	cp $40	;25%
	jr nc, .erikanext4
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.erikanext4
	call Random
	cp $60	;37.5%
	jr nc, .erikanext5
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.erikanext5
	and a
	ret

KogaAI:
	cp $60	;37.5%
	jr nc, .koganext0
	ld a, $2	;above fraction
	call AICheckIfHPBelowFraction
	jr c, .koganext0
	ld a, [wEnemyMonEvasionMod]
	cp 9	;+2
	jr c, .koganext0
	ld a, [wEnemyMonAttackMod]
	cp 9	;+2
	jr nc, .useXspeedinstead
	call StrCmpSpeed
	jr nc, .useXspeedinstead
	jp AIUseXAttack			;GYM LEADER UNIQUE POOL
.useXspeedinstead
	ld a, [wEnemyMonSpeedMod]
	cp 9	;+2
	jr nc, .koganext0
	call StrCmpSpeed
	jr c, .koganext0
	jp AIUseXSpeed			;GYM LEADER UNIQUE POOL
; when Koga's Mon has at least 1/2 health, and +2 Evasion or greater, 37.5% chance to use X Attack
; if Koga's mon is currently faster, else 37.5% chance to use X Speed. This is limited to +2 each.
.koganext0
	call Random
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .koganext1
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .koganext4
.koganext1
	call Random
	cp $60	;37.5%
	jr nc, .koganext2
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.koganext2
	call Random
	cp $80	;50%
	jr nc, .koganext3
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.koganext3
	call Random
	cp $A0	;62.5%
	jr nc, .koganext4
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.koganext4
	call Random
    cp $80 ;50%
	jr nc, .koganext5
	ld a, $2	;below fraction
    call AICheckIfHPBelowFraction
	jr nc, .koganext5
    jp AIUseFullRestoreSLPFRZPAR		;SPECIAL CASE 1
.koganext5
	call Random
    cp $80 ;50%
	jr nc, .koganext6
	ld a, $1	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .koganext6
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal				;SPECIAL CASE 2
.koganext6
	and a
	ret
	
BlaineAI:	;blaine needs to check HP. this was an oversight	
	cp $40
	jr nc, .blainereturn
	ld a, $2
	call AICheckIfHPBelowFraction	
	jp c, AIUseFullRestore				
.blainereturn
	ret

SabrinaAI:
	cp $60	;37.5%
	jr nc, .sabrinanext0
	ld a, $2	;above fraction
	call AICheckIfHPBelowFraction
	jr c, .useXdefendinstead
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .attemptXspecialanyway
	ld a, [wPlayerMoveType]
	cp $14
	jr c, .useXdefendinstead
.attemptXspecialanyway
	call StrCmpSpecial
	jr c, .useXdefendinstead
	jp AIUseXSpecial			;GYM LEADER UNIQUE POOL
.useXdefendinstead
	ld a, $6	;below fraction
	call AICheckIfHPBelowFraction
	jr c, .sabrinanext0
	ld a, $2	;above fraction
	call AICheckIfHPBelowFraction
	jr nc, .sabrinanext0
	call StrCmpSpeed
	jr c, .sabrinanext0
	ld a, [wPlayerMoveType]
	cp $14
	jr nc, .sabrinanext0
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .sabrinanext0
	jp AIUseXDefend				;GYM LEADER UNIQUE POOL
; when Sabrina's Mon has at least 1/2 health, and the player uses a special attack OR non-damaging move, 
; while the player has a higher special stat than Sabrina's Mon, 37.5% chance to use X Special. 
; Otherwise, 37.5% chance to use X Defend if Sabrina's Mon is between 1/6 and 1/2 health, and the 
; player is using a physical attack and is faster.
.sabrinanext0
	call Random
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .sabrinanext1
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .sabrinanext4
.sabrinanext1
	call Random
	cp $60	;37.5%
	jr nc, .sabrinanext2
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.sabrinanext2
	call Random
	cp $80	;50%
	jr nc, .sabrinanext3
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.sabrinanext3
	call Random
	cp $A0	;62.5%
	jr nc, .sabrinanext4
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.sabrinanext4
	call Random
    cp $80 ;50%
	jr nc, .sabrinanext5
	ld a, $2	;below fraction
    call AICheckIfHPBelowFraction
	jr nc, .sabrinanext5
	jp AIUseFullRestoreSLPFRZPAR		;SPECIAL CASE 1
.sabrinanext5
	call Random
    cp $80 ;50%
	jr nc, .sabrinanext6
	ld a, $1	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .sabrinanext6
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal				;SPECIAL CASE 2
.sabrinanext6
	and a		
	ret

GentlemanAI:	;NEW
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal	;SPECIAL CASE 1, UNIQUE TO GENTLEMAN (I.E. TIER A- 100% PROBABILITY TO USE
    ret						;FULL HEAL WHEN UNDER STATUS)

Sony2AI:
    cp $60 ;37.5%
	jr nc, .sony2next0
	ld a, $1	;below fraction
    call AICheckIfHPBelowFraction
	jr nc, .sony2next0
	ld a, $2	;above fraction
	call AICheckIfHPBelowFraction
	jr c, .sony2next0
	jp AIUseFullRestoreSLPFRZPAR		;SPECIAL CASE 1
.sony2next0
	call Random
	cp $20 ;12.5% chance that A.I. will initiate standard healing protocol even if player is not attacking
	jr c, .sony2next1
	ld a, [wPlayerMovePower]
	cp 10
	jr c, .sony2next4
.sony2next1
	call Random
	cp $30	;12.5%
	jr nc, .sony2next2
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.sony2next2
	call Random
	cp $40	;25%
	jr nc, .sony2next3
	ld a, $3	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.sony2next3
	call Random
	cp $60	;37.5%
	jr nc, .sony2next4
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.sony2next4
	and a
	ret

Sony3AI:
	cp $20
	jr nc, .rival3return
	ld a, 5
	call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
.rival3return
	ret

LoreleiAI:
	cp $80
	jr nc, .loreleireturn
	ld a, $2
	call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore				
.loreleireturn
	ret

ChannelerAI:	;NEW
	cp $8 ;3.125%
	jr nc, .channelernext1
	ld a, $1	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIFResRestricted2	;SPECIAL CASE 1, UNIQUE TO CHANNELER (I.E. TIER B+ USING FULL RESTORE)
.channelernext1
	call Random
    cp $10	;6.25%
	jr nc, .channelernext2
    ld a, $2	;below fraction
    call AICheckIfHPBelowFraction
    jp c, AIUseHyperPotion
.channelernext2
	call Random
	cp $20	;12.5%
	jr nc, .channelernext3
	ld a, $3	;below fraction
	call AICheckIfHPBelowFraction
	jp c, AIUseHyperPotion
.channelernext3
	call Random
	cp $30	;18.75%
	jr nc, .channelernext4
	ld a, $6	;below fraction
	call AICheckIfHPBelowFraction
	jp c, AIUseHyperPotion
.channelernext4
	and a
    ret

BrunoAI:
	cp $20	;12.5% chance to use
	jp c, AIUseXAttack					
	ld a, [wEnemyMonStatus]
    and a
    jp nz, AIUseFullHeal            
    ret 

AgathaAI:
;	cp $14
;	jp c, AISwitchIfEnoughMons
	cp $C0	;75% chance to heal
	jr nc, .agathareturn
	ld a, $2
	call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore				
.agathareturn
	ret

LanceAI:
	cp $E0	;87.5% chance to heal
	jr nc, .lancereturn
	ld a, $2
	call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore				
.lancereturn
	ret
	
BugMasterAI:
	cp $20	;12.5%
	jr nc, .bugmasternext0
	jp c, AISwitchIfEnoughMonsL1
	ret
; Bug Master has a 12.5% chance to switch once during a battle.
.bugmasternext0
	ld a, $6	;below fraction 
    call AICheckIfHPBelowFraction
	jp c, AIUseFullRestore
	call Random
    cp $80 ;50%
	jr nc, .bugmasternext1
	ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .bugmasternext1
    ld a, [wEnemyMonStatus]
	and a
	jp nz, AIUseFullHeal		;SPECIAL CASE 1
.bugmasternext1
	call Random
    cp $20 ;12.5%
	jr nc, .bugmasternext2
	ld a, $2	;above fraction
    call AICheckIfHPBelowFraction
	jr c, .bugmasternext2
    ld a, [wEnemyMonStatus]
	and a
	jp z, AIXAttRestricted2		;SPECIAL CASE 2
.bugmasternext2
	and a
	ret

GenericAI:
	and a ; clear carry
	ret

; end of individual trainer AI routines

;joenote - added these functions to check if the ai switching bit is set
;need to have 'a' accumulator and flag register freed up to use this function
CheckandResetSwitchBit:	
	ld a, [wUnusedC000]
	bit 0, a	;check a for switch pkmn bit (sets or clears zero flag)
	res 0, a ; resets the switch pkmn bit (does not affect flags)
	ld [wUnusedC000], a
	ret
SetSwitchBit:	
	ld a, [wUnusedC000]
	set 0, a ; sets the switch pkmn bit
	ld [wUnusedC000], a
	ret

DecrementAICount:
	call UndoEnemySelectionPPDecrement	;joenote - undo the pp decrement of already-selected move if applicable
	ld hl, wAICount
	dec [hl]
	scf
	ret

AIPlayRestoringSFX:
	ld a, SFX_HEAL_AILMENT
	jp PlaySoundWaitForCurrent

AIUseFullRestoreSLPFRZPAR:
    ld a, [wEnemyMonStatus]
	bit PSN, a
	jr nz, .returntotrainerAI
	bit BRN, a
	jr nz, .returntotrainerAI
	cp 0
	jr nz, .proceedtoheal
.returntotrainerAI
	and a
	ret
; condition added so that A.I. only uses Full Restore when Asleep, Paralyzed, or Frozen
.proceedtoheal
	call AICureStatus
	ld a, FULL_RESTORE
	ld [wAIItem], a
	ld de, wHPBarOldHP
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, wEnemyMonMaxHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld [wHPBarMaxHP], a
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld [de], a
	ld [wHPBarMaxHP+1], a
	ld [wEnemyMonHP], a
	jp AIPrintItemUseAndUpdateHPBar

AIUseFullRestore:
	call AICureStatus
	ld a, FULL_RESTORE
	ld [wAIItem], a
	ld de, wHPBarOldHP
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, wEnemyMonMaxHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld [wHPBarMaxHP], a
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld [de], a
	ld [wHPBarMaxHP+1], a
	ld [wEnemyMonHP], a
	jp AIPrintItemUseAndUpdateHPBar

AIUsePotion:
; enemy trainer heals his monster with a potion
	ld a, POTION
	ld b, 20
	jr AIRecoverHP

AIUseSuperPotion:
; enemy trainer heals his monster with a super potion
	ld a, SUPER_POTION
	ld b, 50
	jr AIRecoverHP
	
AIUseFreshWater:
; enemy trainer heals his monster with a fresh water
	ld a, FRESH_WATER
	ld b, 50
	jr AIRecoverHP
	
AIUseSodaPop:
; enemy trainer heals his monster with a soda pop
	ld a, SODA_POP
	ld b, 60
	jr AIRecoverHP
	
AIUseLemonade:	;NEW
; enemy trainer heals his monster with a lemonade
	ld a, LEMONADE
	ld b, 80
	jr AIRecoverHP

AIUseHyperPotion:
; enemy trainer heals his monster with a hyper potion
	ld a, HYPER_POTION
	ld b, 200
	jr AIRecoverHP
	
AIUseMaxPotion:
; enemy trainer heals his monster with a max potion
	ld a, MAX_POTION
	ld [wAIItem], a
	ld de, wHPBarOldHP
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, wEnemyMonMaxHP + 1
	ld a, [hld]
	ld [de], a
	inc de
	ld [wHPBarMaxHP], a
	ld [wEnemyMonHP + 1], a
	ld a, [hl]
	ld [de], a
	ld [wHPBarMaxHP+1], a
	ld [wEnemyMonHP], a
	jr AIPrintItemUseAndUpdateHPBar
	; fallthrough

AIRecoverHP:
; heal b HP and print "trainer used $(a) on pokemon!"
	ld [wAIItem], a
	ld hl, wEnemyMonHP + 1
	ld a, [hl]
	ld [wHPBarOldHP], a
	add b
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [hl]
	ld [wHPBarOldHP+1], a
	ld [wHPBarNewHP+1], a
	jr nc, .next
	inc a
	ld [hl], a
	ld [wHPBarNewHP+1], a
.next
	inc hl
	ld a, [hld]
	ld b, a
	ld de, wEnemyMonMaxHP + 1
	ld a, [de]
	dec de
	ld [wHPBarMaxHP], a
	sub b
	ld a, [hli]
	ld b, a
	ld a, [de]
	ld [wHPBarMaxHP+1], a
	sbc b
	jr nc, AIPrintItemUseAndUpdateHPBar
	inc de
	ld a, [de]
	dec de
	ld [hld], a
	ld [wHPBarNewHP], a
	ld a, [de]
	ld [hl], a
	ld [wHPBarNewHP+1], a
	; fallthrough

AIPrintItemUseAndUpdateHPBar:
	call AIPrintItemUse_
	coord hl, 2, 2
	xor a
	ld [wHPBarType], a
	predef UpdateHPBar2
	jp DecrementAICount

AISwitchIfEnoughMonsWithSwitchCancelChecks:
;dylannote - The first pre-check to skip all cancel switch tests if the A.I. mon is at critically low health and is slower
	ld a, $8
	call AICheckIfHPBelowFraction
	jr nc, .continueprecheck
	call StrCmpSpeed
	jr c, .continueprecheck
	jp .continueswitching
.continueprecheck
;dylannote - Pre-check to skip all cancel switch tests if the A.I. mon's Accuracy modifier is -4 or lower 
	ld a, [wEnemyMonAccuracyMod]
	cp 4	;testing for lower than -3
	jp c, .continueswitching
;else fallthrough
;dylannote - More pre-checks to prevent abuse of the cancel switch tests. If the A.I. is currently confused or seeded, 
;skip all the cancel tests and switch as normal
	ld a, [wEnemyBattleStatus1]
	bit CONFUSED, a
	jp nz, .continueswitching
	ld a, [wEnemyBattleStatus2]
	bit SEEDED, a
	jp nz, .continueswitching
;else fallthrough
;dylannote - More pre-checks to prevent player abuse of my glorious A.I., skip to the stat modifier checks if the player is 
;boosting their stats
	ld a, [wPlayerMoveEffect]
	cp ATTACK_UP1_EFFECT
	jr c, .continuesubstitutecheck
	cp EVASION_UP1_EFFECT + 1
	jp c, .continuephysicaloffensivestatmodifierscheck
	cp ATTACK_UP2_EFFECT
	jr c, .continuesubstitutecheck
	cp EVASION_UP2_EFFECT + 1
	jp c, .continuephysicaloffensivestatmodifierscheck
;dylannote - fallthrough if all pre-checks have failed and the player is not using a stat-boosting move
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.continuesubstitutecheck
;dylannote - Significantly discourage switching if the A.I. has an active Substitute
	ld a, [wEnemyBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a
	jr z, .continuereflectcheck	
	call Random
	cp $E0	;~87.5% chance to outright cancel the switch
	jp c, .cancelswitching
;else fallthrough
.continuereflectcheck
;dylannote - Discourage switching if the A.I. has an active reflect and the player uses a physical attack
	ld a, [wEnemyBattleStatus3]
	bit HAS_REFLECT_UP, a
	jr z, .continuelightscreencheck
	ld a, [wPlayerMovePower]
	and a
	jr z, .continuelightscreencheck
	ld a, [wPlayerMoveType]
	cp $14
	jr nc, .continuelightscreencheck
	call Random
	cp $A0	;~62.5% chance to outright cancel the switch
	jp c, .cancelswitching
;else fallthrough
.continuelightscreencheck
;dylannote - Discourage switching if the A.I. has an active light screen or guard spec has been used and the player uses a special attack
	ld a, [wEnemyBattleStatus3]
	bit HAS_LIGHT_SCREEN_UP, a
	jr z, .continuefocusenergyanddirehitcheck
	ld a, [wPlayerMovePower]
	and a
	jr z, .continuefocusenergyanddirehitcheck	
	ld a, [wPlayerMoveType]
	cp $14
	jr c, .continuefocusenergyanddirehitcheck	
	call Random
	cp $A0	;~62.5% chance to outright cancel the switch
	jp c, .cancelswitching
;else fallthrough
.continuefocusenergyanddirehitcheck
;dylannote - Discourage switching if the A.I. has an active focus energy or dire hit has been used and the
;A.I. mon is faster, while the player's HP is below 1/2
	ld a, [wEnemyBattleStatus2]
	bit GETTING_PUMPED, a
	jr z, .continuemistcheck
	call StrCmpSpeed	
	jr nc, .continuemistcheck	
	ld a, $2	;below fraction 
    call PlayerCheckIfHPBelowFraction
	jr nc, .continuemistcheck	
	call Random
	cp $A0	;~62.5% chance to outright cancel the switch
	jp c, .cancelswitching
;else fallthrough
.continuemistcheck
;dylannote - Significantly discourage switching if the A.I. has an active mist and the player uses a non-damaging attack
	ld a, [wEnemyBattleStatus2]
	bit PROTECTED_BY_MIST, a
	jr z, .continueXaccuracycheck
	ld a, [wPlayerMovePower]
	and a
	jr nz, .continueXaccuracycheck
	call Random
	cp $E0	;~87.5% chance to outright cancel the switch
	jp c, .cancelswitching
;else fallthrough
.continueXaccuracycheck
;dylannote - Somewhat discourage switching if the A.I. has used X accuracy and health is 1/2 or greater
	ld a, [wEnemyBattleStatus2]
	bit USING_X_ACCURACY, a
	jr z, .continuetrappingcheck	
	ld a, $2	;below fraction 
    call AICheckIfHPBelowFraction
	jr c, .continuetrappingcheck
	call Random
	cp $60	;~37.5% chance to outright cancel the switch
	jp c, .cancelswitching
;else fallthrough
.continuetrappingcheck
;dylannote - Significantly discourage switching if the A.I. is currently using a trapping move unless status'd
	ld a, [wEnemyBattleStatus1]
	bit USING_TRAPPING_MOVE, a
	jr z, .finishedpreliminarycheck
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .finishedpreliminarycheck
	call Random
	cp $E0	;~87.5% chance to outright cancel the switch
	jp c, .cancelswitching
;dylannote - fallthrough if all preliminary switch cancel checks have failed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;dylannote - this section covers Evasion
.finishedpreliminarycheck
;dylannote - Skip the Evasion switch cancel check if the player has an active X accuracy or is using a move with a SWIFT effect
	ld a, [wPlayerBattleStatus2]
	bit USING_X_ACCURACY, a
	jp nz, .continuephysicaloffensivestatmodifierscheck
	ld a, [wPlayerMoveEffect]
	cp SWIFT_EFFECT
	jp z, .continuephysicaloffensivestatmodifierscheck
;else fallthrough
;dylannote - Discourage switching if the A.I. has Evasion boosts, with the cancel chance being roughly equivalent to the boost in Evasion
;divided by 2 (the probability being divided by 2 occurs from jumping to .halfcancelswitching instead of .cancelswitching)
	ld a, [wEnemyMonEvasionMod]		;load the A.I.'s Evasion modifier
	cp 13	;+6
	jr c, .plus5evasionswitchcancelchance
	call Random
	cp $C0	;~37.5% chance to cancel the switch
	jp c, .halfcancelswitching
	jr .continuephysicaloffensivestatmodifierscheck
.plus5evasionswitchcancelchance
	cp 12	;+5
	jr c, .plus4evasionswitchcancelchance
	call Random
	cp $B8	;~36% chance to cancel the switch
	jp c, .halfcancelswitching
	jr .continuephysicaloffensivestatmodifierscheck
.plus4evasionswitchcancelchance
	cp 11	;+4
	jr c, .plus3evasionswitchcancelchance
	call Random
	cp $AA	;~33.33% chance to cancel the switch
	jp c, .halfcancelswitching
	jr .continuephysicaloffensivestatmodifierscheck
.plus3evasionswitchcancelchance
	cp 10	;+3
	jr c, .plus2evasionswitchcancelchance
	call Random
	cp $99	;~30% chance to cancel the switch
	jp c, .halfcancelswitching
	jr .continuephysicaloffensivestatmodifierscheck
.plus2evasionswitchcancelchance
	cp 9	;+2
	jr c, .plus1evasionswitchcancelchance
	call Random
	cp $80	;~25% chance to cancel the switch
	jp c, .halfcancelswitching
	jr .continuephysicaloffensivestatmodifierscheck
.plus1evasionswitchcancelchance
	cp 8	;+1
	jr c, .continuephysicaloffensivestatmodifierscheck
	call Random
	cp $55	;~16.66% chance to cancel the switch
	jp c, .halfcancelswitching
;dylannote - fallthrough if Evasion switch cancel check failed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;dylannote - this is the final section where checks are run by comparing the stats of the player and the A.I., and the A.I. will cancel
;from switching if the conditions are deemed in its favour
.continuephysicaloffensivestatmodifierscheck	
	ld a, [wPlayerBattleStatus3]	;first, check if the player has an active reflect, and skip to physical defensive check if they do
	bit HAS_REFLECT_UP, a
	jr nz, .continuephysicaldefensivestatmodifierscheck
	ld a, [wEnemyMonStatus]	;second, check the A.I. for status, and skip to physical defensive check if the A.I. mon is status'd
	and a
	jr nz, .continuephysicaldefensivestatmodifierscheck
	call StrCmpSpeed	;third, do a speed compare, and skip to physical defensive check if the A.I. mon is slower
	jr nc, .continuephysicaldefensivestatmodifierscheck
	ld a, [wPlayerMonDefenseMod]
	add a, 4
	ld b, a
	ld a, [wEnemyMonAttackMod]
	cp b	;compare the attack modifier of the A.I. and the defense modifier + 4 of the player
	jr c, .checkifplus2physicaloffensiveadvantage	;if the A.I. has an insufficient advantage, check for a smaller advantage
	jp .cancelswitching
.checkifplus2physicaloffensiveadvantage
	ld a, [wPlayerMonDefenseMod]
	add a, 2
	ld b, a
	ld a, [wEnemyMonAttackMod]
	cp b	;compare the attack modifier of the A.I. and the defense modifier + 2 of the player
	jr c, .continuespecialoffensivestatmodifierscheck	;if the A.I. has an insufficient advantage, check the special side of attack instead
	jp .halfcancelswitching
	
.continuephysicaldefensivestatmodifierscheck
	ld a, [wPlayerMovePower]	;if the player is using a non-damaging move, then just switch at this point
	and a
	jr z, .continueswitching
	ld a, [wPlayerMoveType]		;if the player is using a special attack, skip to special defensive check
	cp $14
	jr nc, .continuespecialdefensivestatmodifierscheck
	ld a, [wPlayerMonAttackMod]
	add a, 4
	ld b, a
	ld a, [wEnemyMonDefenseMod]
	cp b	;compare the defense modifier of the A.I. and the attack modifier + 4 of the player
	jr c, .checkifplus2physicaldefensiveadvantage	;if the A.I. has an insufficient advantage, check for a smaller advantage
	jp .cancelswitching
.checkifplus2physicaldefensiveadvantage
	ld a, [wPlayerMonAttackMod]
	add a, 2
	ld b, a
	ld a, [wEnemyMonDefenseMod]
	cp b	;compare the defense modifier of the A.I. and the attack modifier + 2 of the player
	jr c, .continuespecialdefensivestatmodifierscheck	;if the A.I. has an insufficient advantage, check the special side of defense instead
	jp .halfcancelswitching
	
.continuespecialdefensivestatmodifierscheck
	ld a, [wPlayerMonSpecialMod]
	add a, 4
	ld b, a
	ld a, [wEnemyMonSpecialMod]
	cp b	;compare the special modifier of the A.I. and the special modifier + 4 of the player
	jr c, .checkifplus2specialdefensiveadvantage	;if the A.I. has an insufficient advantage, check for a smaller advantage
	jp .cancelswitching
.checkifplus2specialdefensiveadvantage
	ld a, [wPlayerMonSpecialMod]
	add a, 2
	ld b, a
	ld a, [wEnemyMonSpecialMod]
	cp b	;compare the special modifier of the A.I. and the special modifier + 2 of the player
	jr c, .continueswitching	;if the A.I. has an insufficient advantage, proceed with switching
	jp .halfcancelswitching

.continuespecialoffensivestatmodifierscheck
	ld a, [wPlayerBattleStatus3]	;check if the player has an active light screen, and skip to switching if they do
	bit HAS_LIGHT_SCREEN_UP, a
	jr nz, .continueswitching
	ld a, [wPlayerMonSpecialMod]
	add a, 4
	ld b, a
	ld a, [wEnemyMonSpecialMod]
	cp b	;compare the special modifier of the A.I. and the special modifier + 4 of the player
	jr c, .checkifplus2specialoffensiveadvantage	;if the A.I. has an insufficient advantage, check for a smaller advantage
	jp .cancelswitching
.checkifplus2specialoffensiveadvantage
	ld a, [wPlayerMonSpecialMod]
	add a, 2
	ld b, a
	ld a, [wEnemyMonSpecialMod]
	cp b	;compare the special modifier of the A.I. and the special modifier + 2 of the player
	jr c, .continueswitching	;if the A.I. has an insufficient advantage, proceed with switching at this point
;dylannote - fallthrough
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.halfcancelswitching
;dylannote - at this point, there is a 50% chance that the switch will be cancelled unless a jump to .continueswitching occured earlier
	call Random
	cp $80	;~50% chance to cancel switch
	jr nc, .continueswitching
	and a
	ret
.cancelswitching	
;dylannote - at this point, the switch is getting cancelled
	and a
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;dylannote - at this point, every switch cancel test has failed or been skipped, so AISwitchIfEnoughMons now initiates as normal
.continueswitching
;enemy trainer switches if there are 2 or more unfainted mons in party
	ld a, [wEnemyPartyCount]
	ld c, a
	ld hl, wEnemyMon1HP

	ld d, 0 ; keep count of unfainted monsters

	; count how many monsters haven't fainted yet
.loop
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr z, .Fainted ; has monster fainted?
	inc d
.Fainted
	push bc
	ld bc, wEnemyMon2 - wEnemyMon1
	add hl, bc
	pop bc
	dec c
	jr nz, .loop

	ld a, d ; how many available monsters are there?
	cp 2 ; don't bother if only 1
	
	push af
	call nc, UndoEnemySelectionPPDecrement	;joenote - undo the pp decrement of already-selected move if applicable
	pop af
	
	jp nc, SwitchEnemyMon
	and a
	ret

AISwitchIfEnoughMons:
;dylannote - This is the original routine without switch cancel checks
;enemy trainer switches if there are 2 or more unfainted mons in party
	ld a, [wEnemyPartyCount]
	ld c, a
	ld hl, wEnemyMon1HP

	ld d, 0 ; keep count of unfainted monsters

	; count how many monsters haven't fainted yet
.loop
	ld a, [hli]
	ld b, a
	ld a, [hld]
	or b
	jr z, .Fainted ; has monster fainted?
	inc d
.Fainted
	push bc
	ld bc, wEnemyMon2 - wEnemyMon1
	add hl, bc
	pop bc
	dec c
	jr nz, .loop

	ld a, d ; how many available monsters are there?
	cp 2 ; don't bother if only 1
	
	push af
	call nc, UndoEnemySelectionPPDecrement	;joenote - undo the pp decrement of already-selected move if applicable
	pop af
	
	jp nc, SwitchEnemyMon
	and a
	ret

SwitchEnemyMon:
;joenote - if player using trapping move, then end their move
	;ld a, [wPlayerBattleStatus1]
	;bit USING_TRAPPING_MOVE, a
	;jr z, .preparewithdraw
	;ld hl, wPlayerBattleStatus1
	;res USING_TRAPPING_MOVE, [hl] 
	;xor a
	;ld [wPlayerNumAttacksLeft], a
	;ld a, $FF
	;ld [wPlayerSelectedMove], a
;.preparewithdraw					;dylannote - removing this piece of code to re-buff trapping moves
; prepare to withdraw the active monster:

	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1HP
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wEnemyMonHP
	ld bc, 4
	call CopyData	 ;copy hp, number, and status of the active pokemon to its roster position
	
	;joenote - don't copy PP information if transformed
	ld a, [wEnemyBattleStatus3]
	bit 3, a 	;check the state of the enemy transformed bit
	jr nz, .skiptransformed	;skip ahead if bit is set
	
	;joenote - copy PP information
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1PP
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wEnemyMonPP
	ld bc, 4
	call CopyData
	
.skiptransformed
	ld hl, AIBattleWithdrawText
	call PrintText

	; This wFirstMonsNotOutYet variable is abused to prevent the player from
	; switching in a new mon in response to this switch.
	ld a, 1
	ld [wFirstMonsNotOutYet], a
	callab EnemySendOut
	xor a
	ld [wFirstMonsNotOutYet], a
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z
	;joenote - the act of switching clears H_WHOSETURN, so it needs to be set back to 1
	ld a, $1					;FIXED TAKING POISON DAMAGE ON SLOWER POKEMON WHEN A.I. SWITCHES
	ld [H_WHOSETURN], a
	scf
	ret

AIBattleWithdrawText:
	TX_FAR _AIBattleWithdrawText
	db "@"

AIUseFullHealPSNBRN:
	ld a, [wEnemyMonStatus]
	bit SLP, a
	jr nz, .returntotrainerAI2
	bit FRZ, a
	jr nz, .returntotrainerAI2
	bit PAR, a
	jr nz, .returntotrainerAI2
	cp 0
	jr nz, .proceedtoheal2
.returntotrainerAI2
	and a
	ret
; condition added so that A.I. only uses Full Heal when Poisoned or Burned
.proceedtoheal2
	call AIPlayRestoringSFX
	call AICureStatus
	ld a, FULL_HEAL
	jp AIPrintItemUse
	
AIUseFullHeal:
	call AIPlayRestoringSFX
	call AICureStatus
	ld a, FULL_HEAL
	jp AIPrintItemUse

AICureStatus:	;joenote - modified to be more robust and also undo stat changes of brn/par
; cures the status of enemy's active pokemon
	ld a, [wEnemyMonPartyPos]
	ld hl, wEnemyMon1Status
	ld bc, wEnemyMon2 - wEnemyMon1
	call AddNTimes
	xor a
	ld [hl], a ; clear status in enemy team roster
	ld a, [H_WHOSETURN]
	push af
	ld a, $01 	;forcibly set it to the AI's turn
	ld [H_WHOSETURN], a
	callab UndoBurnParStats	;undo brn/par stat changes
	pop af
	ld [H_WHOSETURN], a
	xor a
	ld [wEnemyMonStatus], a ; clear status in active enemy data
	ld [wEnemyToxicCounter], a	;clear toxic counter
	ld hl, wEnemyBattleStatus3
	res BADLY_POISONED, [hl]	;clear toxic bit
	ret

AIUseXAccuracy: 
	call AIPlayRestoringSFX
	ld hl, wEnemyBattleStatus2
	set 0, [hl]
	ld a, X_ACCURACY
	jp AIPrintItemUse

AIUseGuardSpec:
	call AIPlayRestoringSFX
	ld hl, wEnemyBattleStatus3	;dylannote - was wEnemyBattleStatus2
	set 1, [hl]
	ld a, GUARD_SPEC
	jp AIPrintItemUse

AIUseDireHit: 
	call AIPlayRestoringSFX
	ld hl, wEnemyBattleStatus2
	set 2, [hl]
	ld a, DIRE_HIT
	jp AIPrintItemUse

AICheckIfHPBelowFraction:
; return carry if enemy trainer's current HP is below 1 / a of the maximum
;joenote - first preserve stuff onto the stack
	push hl
	push bc
	push de
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - handle an 'a' value of 1
	cp 1
	jr nz, .not_one
	ld a, [wEnemyMonMaxHP]
	ld b, a
	ld a, [wEnemyMonHP]
	cp b	;a = HP MSB an b = MAXHP MSB so do a - b and set carry if negative
	jr c, .return
	ld a, [wEnemyMonMaxHP + 1]
	ld b, a
	ld a, [wEnemyMonHP + 1]
	cp b	;a = HP LSB an b = MAXHP LSB so do a - b and set carry if negative
	jr .return
.not_one
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld [H_DIVISOR], a
	ld hl, wEnemyMonMaxHP
	ld a, [hli]
	ld [H_DIVIDEND], a
	ld a, [hl]
	ld [H_DIVIDEND + 1], a
	ld b, 2
	call Divide
	ld a, [H_QUOTIENT + 3]
	ld c, a
	ld a, [H_QUOTIENT + 2]
	ld b, a
	ld hl, wEnemyMonHP + 1
	ld a, [hld]
	ld e, a
	ld a, [hl]
	ld d, a
	ld a, d
	sub b
	jr nz, .return
	ld a, e
	sub c
.return	;joenote - consolidating returns with the stack
	pop de
	pop bc
	pop hl
	ret
	
PlayerCheckIfHPBelowFraction:
; return carry if player trainer's current HP is below 1 / a of the maximum
;dylannote - first preserve stuff onto the stack
	push hl
	push bc
	push de
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;joenote - handle an 'a' value of 1
	cp 1
	jr nz, .not_one
	ld a, [wBattleMonMaxHP]
	ld b, a
	ld a, [wBattleMonHP]
	cp b	;a = HP MSB an b = MAXHP MSB so do a - b and set carry if negative
	jr c, .return
	ld a, [wBattleMonMaxHP + 1]
	ld b, a
	ld a, [wBattleMonHP + 1]
	cp b	;a = HP LSB an b = MAXHP LSB so do a - b and set carry if negative
	jr .return
.not_one
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	ld [H_DIVISOR], a
	ld hl, wBattleMonMaxHP
	ld a, [hli]
	ld [H_DIVIDEND], a
	ld a, [hl]
	ld [H_DIVIDEND + 1], a
	ld b, 2
	call Divide
	ld a, [H_QUOTIENT + 3]
	ld c, a
	ld a, [H_QUOTIENT + 2]
	ld b, a
	ld hl, wBattleMonHP + 1
	ld a, [hld]
	ld e, a
	ld a, [hl]
	ld d, a
	ld a, d
	sub b
	jr nz, .return
	ld a, e
	sub c
.return	;joenote - consolidating returns with the stack
	pop de
	pop bc
	pop hl
	ret


AIUseXAttack:
	ld b, $A
	ld a, X_ATTACK
	jr AIIncreaseStat

AIUseXDefend:
	ld b, $B
	ld a, X_DEFEND
	jr AIIncreaseStat

AIUseXSpeed:
	ld b, $C
	ld a, X_SPEED
	jr AIIncreaseStat

AIUseXSpecial:
	ld b, $D
	ld a, X_SPECIAL
	; fallthrough

AIIncreaseStat:
	ld [wAIItem], a
	push bc
	call AIPrintItemUse_
	pop bc
	ld hl, wEnemyMoveEffect
	ld a, [hld]
	push af
	ld a, [hl]
	push af
	push hl
	ld a, ANIM_AF
	ld [hli], a
	ld [hl], b
	callab StatModifierUpEffect
	pop hl
	pop af
	ld [hli], a
	pop af
	ld [hl], a
	jp DecrementAICount

AIPrintItemUse:
	ld [wAIItem], a
	call AIPrintItemUse_
	jp DecrementAICount

AIPrintItemUse_:
; print "x used [wAIItem] on z!"
	ld a, [wAIItem]
	ld [wd11e], a
	call GetItemName
	ld hl, AIBattleUseItemText
	jp PrintText

AIBattleUseItemText:
	TX_FAR _AIBattleUseItemText
	db "@"

StrCmpSpeed:	;joenote - function for AI to compare pkmn speeds
	push bc
	push de
	push hl
	ld de, wBattleMonSpeed ; player speed value
	ld hl, wEnemyMonSpeed ; enemy speed value
	ld c, $2	;bytes to copy
.spdcmploop	
	ld a, [de]	
	cp [hl]
	jr nz, .return
	inc de
	inc hl
	dec c
	jr nz, .spdcmploop
	;At this point:
	;zero flag set means speeds equal
	;carry flag not set means player pkmn faster
	;carry flag set means ai pkmn faster
.return
	pop hl
	pop de
	pop bc
	ret
	
StrCmpSpecial:	;dylannote - function for AI to compare pkmn specials
	push bc
	push de
	push hl
	ld de, wBattleMonSpecial ; player special value
	ld hl, wEnemyMonSpecial ; enemy special value
	ld c, $2	;bytes to copy
.spccmploop	
	ld a, [de]	
	cp [hl]
	jr nz, .return
	inc de
	inc hl
	dec c
	jr nz, .spccmploop
	;At this point:
	;zero flag set means specials equal
	;carry flag not set means player pkmn has higher special
	;carry flag set means ai pkmn has higher special
.return
	pop hl
	pop de
	pop bc
	ret

;joenote - get the enemy move that has already been selected
;if it is found in the move list, increment the pp that was deducted when selecting the move
UndoEnemySelectionPPDecrement:
	push hl
	push bc
	push de
	ld a, [wEnemySelectedMove]
	and a
	jr z, .return	;return if the selected move is 00
	cp NUM_ATTACKS + 1
	jr nc, .return	;return if the selected move is invalid (> max number of moves)
	ld d, a
	ld e, NUM_MOVES
	ld bc, wEnemyMonPP - wEnemyMonMoves
	ld hl, wEnemyMonMoves
.loop
	ld a, [hl]
	and a
	jr z, .return
	cp d
	jr z, .found
	inc hl
	dec e
	jr z, .return
	jr .loop
.found
	add hl, bc
	inc [hl]
.return
	pop de
	pop bc
	pop hl
	ret
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; wAICount2 ; NEW - Restricts a specific item to 1 use only.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AIFResRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseFullRestore
	
AIPotRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUsePotion
	
AISPotRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseSuperPotion
	
AIFresRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseFreshWater
	
AISodaRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseSodaPop
	
AILemoRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseLemonade
	
AIHPotRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseHyperPotion
	
AIMPotRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseMaxPotion

AIFHeaRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseFullHeal

AIXAccRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseXAccuracy
	
AIGSpeRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseGuardSpec
	
AIDHitRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseDireHit
	
AIXAttRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseXAttack
	
AIXDefRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseXDefend
	
AIXSpeRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseXSpeed
	
AIXSpcRestricted2:
	ld a, [wAICount2]
	cp 1
	ret nc
	inc a
	ld [wAICount2], a
	jp AIUseXSpecial
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; wAICount3 ; NEW - Restricts an additional specific item to 1 use only.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AIFResRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseFullRestore
	
AIPotRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUsePotion
	
AISPotRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseSuperPotion
	
AIFresRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseFreshWater
	
AISodaRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseSodaPop
	
AILemoRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseLemonade
	
AIHPotRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseHyperPotion
	
AIMPotRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseMaxPotion

AIFHeaRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseFullHeal

AIXAccRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseXAccuracy
	
AIGSpeRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseGuardSpec
	
AIDHitRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseDireHit
	
AIXAttRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseXAttack
	
AIXDefRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseXDefend
	
AIXSpeRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseXSpeed
	
AIXSpcRestricted3:
	ld a, [wAICount3]
	cp 1
	ret nc
	inc a
	ld [wAICount3], a
	jp AIUseXSpecial
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; wAISwitchLimiter ; NEW - Restricts the execution of AISwitchIfEnoughMons
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AISwitchIfEnoughMonsL1:
	ld a, [wAISwitchLimiter]
	cp 1
	ret nc
	inc a
	ld [wAISwitchLimiter], a
	jp AISwitchIfEnoughMons
	
AISwitchIfEnoughMonsL3:
	ld a, [wAISwitchLimiter]
	cp 3
	ret nc
	inc a
	ld [wAISwitchLimiter], a
	jp AISwitchIfEnoughMons
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; TrickyXItem Routines ; NEW - A.I. will use X items, Dire Hit, or Guard Spec.
; if the player attempts to use a Sleep, Poison, or Paralysis status move when 
; the A.I. Mon is already status'd and has at least 1/2 HP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

AITrickyUseXAccuracy:
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .checkplayer
	ret
.checkplayer
	ld a, [wPlayerMoveEffect]
	cp SLEEP_EFFECT
	jr z, .useitem
	cp POISON_EFFECT
	jr z, .useitem
	cp PARALYZE_EFFECT
	jr z, .useitem
	ret
.useitem
	jp AIUseXAccuracy

AITrickyUseGuardSpec:
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .checkplayer
	ret
.checkplayer
	ld a, [wPlayerMoveEffect]
	cp SLEEP_EFFECT
	jr z, .useitem
	cp POISON_EFFECT
	jr z, .useitem
	cp PARALYZE_EFFECT
	jr z, .useitem
	ret
.useitem
	jp AIUseGuardSpec

AITrickyUseDireHit:
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .checkplayer
	ret
.checkplayer
	ld a, [wPlayerMoveEffect]
	cp SLEEP_EFFECT
	jr z, .useitem
	cp POISON_EFFECT
	jr z, .useitem
	cp PARALYZE_EFFECT
	jr z, .useitem
	ret
.useitem
	jp AIUseDireHit

AITrickyUseXAttack:
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .checkplayer
	ret
.checkplayer
	ld a, [wPlayerMoveEffect]
	cp SLEEP_EFFECT
	jr z, .useitem
	cp POISON_EFFECT
	jr z, .useitem
	cp PARALYZE_EFFECT
	jr z, .useitem
	ret
.useitem
	jp AIUseXAttack

AITrickyUseXDefend:
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .checkplayer
	ret
.checkplayer
	ld a, [wPlayerMoveEffect]
	cp SLEEP_EFFECT
	jr z, .useitem
	cp POISON_EFFECT
	jr z, .useitem
	cp PARALYZE_EFFECT
	jr z, .useitem
	ret
.useitem
	jp AIUseXDefend

AITrickyUseXSpeed:
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .checkplayer
	ret
.checkplayer
	ld a, [wPlayerMoveEffect]
	cp SLEEP_EFFECT
	jr z, .useitem
	cp POISON_EFFECT
	jr z, .useitem
	cp PARALYZE_EFFECT
	jr z, .useitem
	ret
.useitem
	jp AIUseXSpeed

AITrickyUseXSpecial:
	ld a, [wEnemyMonStatus]
	and a
	jr nz, .checkplayer
	ret
.checkplayer
	ld a, [wPlayerMoveEffect]
	cp SLEEP_EFFECT
	jr z, .useitem
	cp POISON_EFFECT
	jr z, .useitem
	cp PARALYZE_EFFECT
	jr z, .useitem
	ret
.useitem
	jp AIUseXSpecial


