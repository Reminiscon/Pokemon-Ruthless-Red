db DEX_SCIZOR ; pokedex id
db 70 ; base hp
db 130 ; base attack
db 100 ; base defense
db 65 ; base speed
db 80 ; base special
db BUG ; species type 1
db BUG ; species type 2
db 13 ; catch rate
db 220 ; base exp yield
INCBIN SCIZOR_FR,0,1 ; 77, sprite dimensions
dw ScizorPicFront
dw ScizorPicBack
; attacks known at lvl 0
db QUICK_ATTACK
db LEER
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 2,3,6
	tmlearn 9,10,15
	tmlearn 18,20
	tmlearn 31,32
	tmlearn 34,39,40
	tmlearn 44
	tmlearn 50,51,54
db 0 ; padding
