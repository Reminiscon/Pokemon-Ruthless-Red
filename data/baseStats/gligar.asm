db DEX_GLIGAR ; pokedex id
db 65 ; base hp
db 75 ; base attack
db 105 ; base defense
db 85 ; base speed
db 65 ; base special
db GROUND ; species type 1
db FLYING ; species type 2
db 60 ; catch rate
db 108 ; base exp yield
INCBIN GLIGAR_FR,0,1 ; 77, sprite dimensions
dw GligarPicFront
dw GligarPicBack
; attacks known at lvl 0
db POISON_STING
db 0
db 0
db 0
db 3 ; growth rate
; learnset
	tmlearn 3,6
	tmlearn 10
	tmlearn 18
	tmlearn 26,28,31,32
	tmlearn 39
	tmlearn 42,44,48
	tmlearn 50,51,54
db 0 ; padding
