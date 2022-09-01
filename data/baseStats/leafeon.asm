db DEX_LEAFEON ; pokedex id
db 65 ; base hp
db 110 ; base attack
db 130 ; base defense
db 95 ; base speed
db 60 ; base special
db GRASS ; species type 1
db GRASS ; species type 2
db 45 ; catch rate
db 199 ; base exp yield
INCBIN LEAFEON_FR,0,1 ; 77, sprite dimensions
dw LeafeonPicFront
dw LeafeonPicBack
; attacks known at lvl 0
db TACKLE
db TAIL_WHIP
db RAZOR_LEAF
db 0
db 3 ; growth rate, changed from 0 to 3 to slow down early game level-ups
; learnset
	tmlearn 6,8
	tmlearn 9,10,15
	tmlearn 20,22
	tmlearn 28,31,32
	tmlearn 33,34,39,40
	tmlearn 42,44
	tmlearn 50,54
db 0 ; padding
