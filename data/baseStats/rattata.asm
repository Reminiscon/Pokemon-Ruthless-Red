db DEX_RATTATA ; pokedex id
db 30 ; base hp
db 56 ; base attack
db 35 ; base defense
db 72 ; base speed
db 35 ; base special
db NORMAL ; species type 1
db NORMAL ; species type 2
db 255 ; catch rate
db 57 ; base exp yield
INCBIN RATTATA_FR,0,1 ; 55, sprite dimensions
dw RattataPicFront
dw RattataPicBack
; attacks known at lvl 0
db TACKLE
db TAIL_WHIP
db RAGE
db 0
db 3 ; growth rate, changed from 0 to 3 to slow down early game level-ups
; learnset
	tmlearn 6,8
	tmlearn 9,10,11,12,14
	tmlearn 20,24
	tmlearn 25,28,31,32
	tmlearn 34,39,40
	tmlearn 44
	tmlearn 50,51
db 0 ; padding
