db DEX_PARAS ; pokedex id
db 35 ; base hp
db 70 ; base attack
db 55 ; base defense
db 25 ; base speed
db 55 ; base special
db BUG ; species type 1
db GRASS ; species type 2
db 190 ; catch rate
db 70 ; base exp yield
INCBIN PARAS_FR,0,1 ; 55, sprite dimensions
dw ParasPicFront
dw ParasPicBack
; attacks known at lvl 0
db SCRATCH
db LEECH_LIFE
db ABSORB
db 0
db 3 ; growth rate, changed from 0 to 3 to slow down early game level-ups
; learnset
	tmlearn 3,6,8
	tmlearn 9,10
	tmlearn 18,20,21,22
	tmlearn 28,31,32
	tmlearn 33,34,40
	tmlearn 42,44
	tmlearn 50,51
db 0 ; padding
