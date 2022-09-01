db DEX_QUAGSIRE ; pokedex id
db 95 ; base hp
db 85 ; base attack
db 85 ; base defense
db 35 ; base speed
db 65 ; base special
db WATER ; species type 1
db GROUND ; species type 2
db 90 ; catch rate
db 137 ; base exp yield
INCBIN QUAGSIRE_FR,0,1 ; 77, sprite dimensions
dw QuagsirePicFront
dw QuagsirePicBack
; attacks known at lvl 0
db WATER_GUN
db TAIL_WHIP
db 0
db 0
db 3 ; growth rate, changed from 0 to 3 to slow down early game level-ups
; learnset
	tmlearn 1,5,6,8
	tmlearn 10,13,14,15
	tmlearn 18,19
	tmlearn 26,28,31,32
	tmlearn 0
	tmlearn 44,48
	tmlearn 50,53,55
db 0 ; padding
