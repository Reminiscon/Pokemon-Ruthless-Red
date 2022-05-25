db DEX_SANDSHREW ; pokedex id
db 50 ; base hp
db 75 ; base attack
db 85 ; base defense
db 40 ; base speed
db 30 ; base special
db GROUND ; species type 1
db GROUND ; species type 2
db 255 ; catch rate
db 93 ; base exp yield
INCBIN SANDSHREW_FR,0,1 ; 55, sprite dimensions
dw SandshrewPicFront
dw SandshrewPicBack
; attacks known at lvl 0
db SCRATCH
db BIDE
db SEISMIC_TOSS
db 0
db 3 ; growth rate, changed from 0 to 3 to slow down early game level-ups
; learnset
	tmlearn 3,6,8
	tmlearn 9,10
	tmlearn 17,18,19,20
	tmlearn 26,27,28,31,32
	tmlearn 34,39,40
	tmlearn 44,48
	tmlearn 50,51,54
db 0 ; padding
