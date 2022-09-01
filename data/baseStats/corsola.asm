db DEX_CORSOLA ; pokedex id
db 55 ; base hp
db 55 ; base attack
db 85 ; base defense
db 35 ; base speed
db 85 ; base special
db WATER ; species type 1
db ROCK ; species type 2
db 60 ; catch rate
db 113 ; base exp yield
INCBIN CORSOLA_FR,0,1 ; 77, sprite dimensions
dw CorsolaPicFront
dw CorsolaPicBack
; attacks known at lvl 0
db TACKLE
db RECOVER
db 0
db 0
db 4 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 10,11,13,14
	tmlearn 0
	tmlearn 26,28,29,31,32
	tmlearn 33,34,36
	tmlearn 44,47,48
	tmlearn 50,53,54
db 0 ; padding
