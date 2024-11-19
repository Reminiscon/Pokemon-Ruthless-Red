

;dylannote - MOVED to Bank E to make space in Bank F for core.asm, and a Bank Switch is being applied

;joenote - this function puts statexp per enemy pkmn level into de
;requires a, b, de, and wCurEnemyLVL
CalcEnemyStatEXP_:
	;This loads X stat exp per level. Note that 648 in hex is the two-byte $0288
	;dylannote - adding a compare at levels 13, 28, 38, 48, 63, 73, 83, 93, and 100, 
	;where the amount of stat EXP added per level
	;depends on the level of the Pokemon.
	ld a, [wCurEnemyLVL]
    ld b, a
    cp $64	;100
    jr nc, .level100
    cp $5D	;93
    jr nc, .level93to99
    cp $53	;83
    jr nc, .level83to92
    cp $49	;73
    jr nc, .level73to82
    cp $3F	;63
    jr nc, .level63to72
    cp $30	;48
    jr nc, .level48to62
    cp $26	;38
    jr nc, .level38to47
    cp $1C	;28
    jr nc, .level28to37
    cp $0D	;13
    jr nc, .level13to27

; Below Lv.13				;0 stat exp per level
    ld a, $00				
    ld [H_MULTIPLICAND], a
    ld a, $00
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation

.level13to27				;150 stat exp per level
    ld a, $00
    ld [H_MULTIPLICAND], a
    ld a, $96
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation

.level28to37				;200 stat exp per level
    ld a, $00
    ld [H_MULTIPLICAND], a
    ld a, $C8
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation

.level38to47				;250 stat exp per level
    ld a, $00
    ld [H_MULTIPLICAND], a
    ld a, $FA
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation

.level48to62				;400 stat exp per level
    ld a, $01
    ld [H_MULTIPLICAND], a
    ld a, $90
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation
	
.level63to72				;450 stat exp per level
    ld a, $01
    ld [H_MULTIPLICAND], a
    ld a, $C2
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation
	
.level73to82				;500 stat exp per level
    ld a, $01
    ld [H_MULTIPLICAND], a
    ld a, $F4
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation
	
.level83to92				;550 stat exp per level
    ld a, $02
    ld [H_MULTIPLICAND], a
    ld a, $26
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation
	
.level93to99				;600 stat exp per level
    ld a, $02
    ld [H_MULTIPLICAND], a
    ld a, $58
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation
	
.level100					;650 stat exp per level
    ld a, $02
    ld [H_MULTIPLICAND], a
    ld a, $8A
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation
    ; fallthrough
	
.start_calculation
    xor a
    ld [H_MULTIPLICAND + 2], a
    ld a, b
    ld [H_MULTIPLIER], a
    call Multiply
    ld a, [H_MULTIPLICAND]
    ld d, a
    ld a, [H_MULTIPLICAND + 1]
    ld e, a
    ret
	
	
	