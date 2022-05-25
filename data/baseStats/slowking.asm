db DEX_SLOWKING ; pokedex id
db 95 ; base hp
db 75 ; base attack
db 80 ; base defense
db 30 ; base speed
db 110 ; base special
db WATER ; species type 1
db PSYCHIC ; species type 2
db 35 ; catch rate
db 182 ; base exp yield
INCBIN SLOWKING_FR,0,1 ; 77, sprite dimensions
dw SlowkingPicFront
dw SlowkingPicBack
; attacks known at lvl 0
db CONFUSION
db DISABLE
db HEADBUTT
db 0
db 3 ; growth rate, changed from 0 to 3 to slow down early game level-ups
; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14,15,16
	tmlearn 17,18,19,20
	tmlearn 26,27,28,29,30,31,32
	tmlearn 33,34,38,39,40
	tmlearn 44,45,46
	tmlearn 49,50,53,54,55
db 0 ; padding
