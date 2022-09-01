db DEX_FLAREON ; pokedex id
db 65 ; base hp
db 130 ; base attack
db 60 ; base defense
db 65 ; base speed
db 110 ; base special
db FIRE ; species type 1
db FIRE ; species type 2
db 45 ; catch rate
db 198 ; base exp yield
INCBIN FLAREON_FR,0,1 ; 66, sprite dimensions
dw FlareonPicFront
dw FlareonPicBack
; attacks known at lvl 0
db TACKLE
db SAND_ATTACK
db QUICK_ATTACK
db EMBER
db 3 ; growth rate, changed from 0 to 3 to slow down early game level-ups
; learnset
	tmlearn 6,8
	tmlearn 9,10,15
	tmlearn 20
	tmlearn 28,31,32
	tmlearn 33,34,38,39,40
	tmlearn 44
	tmlearn 50,54
db 0 ; padding
