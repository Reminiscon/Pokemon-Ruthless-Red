db DEX_SNEASEL ; pokedex id
db 55 ; base hp
db 95 ; base attack
db 55 ; base defense
db 115 ; base speed
db 75 ; base special
db ICE ; species type 1
db DEMON ; species type 2
db 60 ; catch rate
db 132 ; base exp yield
INCBIN SNEASEL_FR,0,1 ; 77, sprite dimensions
dw SneaselPicFront
dw SneaselPicBack
; attacks known at lvl 0
db SCRATCH
db LEER
db REFLECT
db 0
db 3 ; growth rate
; learnset
	tmlearn 3,6
	tmlearn 10,13,14
	tmlearn 18
	tmlearn 28,31,32
	tmlearn 33,39
	tmlearn 42,44
	tmlearn 50,51,53,54
db 0 ; padding
