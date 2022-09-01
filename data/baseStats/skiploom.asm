db DEX_SKIPLOOM ; pokedex id
db 55 ; base hp
db 45 ; base attack
db 50 ; base defense
db 80 ; base speed
db 65 ; base special
db GRASS ; species type 1
db FLYING ; species type 2
db 120 ; catch rate
db 136 ; base exp yield
INCBIN SKIPLOOM_FR,0,1 ; 77, sprite dimensions
dw SkiploomPicFront
dw SkiploomPicBack
; attacks known at lvl 0
db SPLASH
db TAIL_WHIP
db TACKLE
db 0
db 0 ; growth rate, reduced from 3 to 0 for balancing purposes
; learnset
	tmlearn 3,6
	tmlearn 10
	tmlearn 21,22
	tmlearn 31,32
	tmlearn 33
	tmlearn 42,44
	tmlearn 50,55
db 0 ; padding
