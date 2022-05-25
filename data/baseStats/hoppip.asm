db DEX_HOPPIP ; pokedex id
db 35 ; base hp
db 35 ; base attack
db 40 ; base defense
db 50 ; base speed
db 55 ; base special
db GRASS ; species type 1
db FLYING ; species type 2
db 255 ; catch rate
db 74 ; base exp yield
INCBIN HOPPIP_FR,0,1 ; 77, sprite dimensions
dw HoppipPicFront
dw HoppipPicBack
; attacks known at lvl 0
db SPLASH
db 0
db 0
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
