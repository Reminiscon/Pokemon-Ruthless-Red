db DEX_JUMPLUFF ; pokedex id
db 75 ; base hp
db 55 ; base attack
db 70 ; base defense
db 110 ; base speed
db 85 ; base special
db GRASS ; species type 1
db FLYING ; species type 2
db 45 ; catch rate
db 176 ; base exp yield
INCBIN JUMPLUFF_FR,0,1 ; 77, sprite dimensions
dw JumpluffPicFront
dw JumpluffPicBack
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
	tmlearn 44
	tmlearn 50,55
db 0 ; padding
