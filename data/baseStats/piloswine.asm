db DEX_PILOSWINE ; pokedex id
db 100 ; base hp
db 100 ; base attack
db 80 ; base defense
db 50 ; base speed
db 60 ; base special
db ICE ; species type 1
db GROUND ; species type 2
db 75 ; catch rate
db 160 ; base exp yield
INCBIN PILOSWINE_FR,0,1 ; 77, sprite dimensions
dw PiloswinePicFront
dw PiloswinePicBack
; attacks known at lvl 0
db FURY_ATTACK
db 0
db 0
db 0
db 5 ; growth rate
; learnset
	tmlearn 4,6,8
	tmlearn 9,10,13,14,15
	tmlearn 
	tmlearn 26,27,28,31,32
	tmlearn 33
	tmlearn 44,48
	tmlearn 50,54
db 0 ; padding
