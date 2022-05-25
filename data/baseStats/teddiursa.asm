db DEX_TEDDIURSA ; pokedex id
db 60 ; base hp
db 80 ; base attack
db 50 ; base defense
db 40 ; base speed
db 50 ; base special
db NORMAL ; species type 1
db NORMAL ; species type 2
db 120 ; catch rate
db 124 ; base exp yield
INCBIN TEDDIURSA_FR,0,1 ; 77, sprite dimensions
dw TeddiursaPicFront
dw TeddiursaPicBack
; attacks known at lvl 0
db SCRATCH
db LEER
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 1,3,5,6,8
	tmlearn 9,10
	tmlearn 18,19
	tmlearn 26,28,31,32
	tmlearn 35,39
	tmlearn 44,48
	tmlearn 50,51,54
db 0 ; padding
