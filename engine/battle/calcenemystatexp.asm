

;dylannote - MOVED to Bank E to make space in Bank F for core.asm, and a Bank Switch is being applied

;joenote - this function puts statexp per enemy pkmn level into de
;requires a, b, de, and wCurEnemyLVL
CalcEnemyStatEXP_:
	;This loads X stat exp per level. Note that 648 in hex is the two-byte $0288
	;dylannote - adding a compare at levels 16, 31, 46, and 61, where the amount of stat EXP added per level
	;depends on the level of the Pokemon.
	ld a, [wCurEnemyLVL]
    ld b, a
    cp $3D	;61
    jr nc, .level61andabove
    cp $2E	;46
    jr nc, .level46to60
    cp $1F	;31
    jr nc, .level31to45
    cp $10	;16
    jr nc, .level16to30

    ; Below Lv.16			;162 stat exp per level
    ld a, $00				
    ld [H_MULTIPLICAND], a
    ld a, $A2
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation

.level16to30				;223 stat exp per level
    ld a, $00
    ld [H_MULTIPLICAND], a
    ld a, $DF
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation

.level31to45				;405 stat exp per level
    ld a, $01
    ld [H_MULTIPLICAND], a
    ld a, $95
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation

.level46to60				;588 stat exp per level
    ld a, $02
    ld [H_MULTIPLICAND], a
    ld a, $4C
    ld [H_MULTIPLICAND + 1], a
    jr .start_calculation

.level61andabove			;648 stat exp per level
    ld a, $02
    ld [H_MULTIPLICAND], a
    ld a, $88
    ld [H_MULTIPLICAND + 1], a
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
	
	
	