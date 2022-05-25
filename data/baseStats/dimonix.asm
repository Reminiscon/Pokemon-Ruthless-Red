db DEX_DIMONIX ; pokedex id
db 35 ; base hp				;HP decreased from 75 to 35 for balancing purposes
db 85 ; base attack
db 200 ; base defense
db 70 ; base speed			;Speed increased from 30 to 70 for balancing purposes
db 65 ; base special
db GROUND ; species type 1
db GROUND ; species type 2
db 13 ; catch rate
db 216 ; base exp yield
INCBIN DIMONIX_FR,0,1 ; 77, sprite dimensions
dw DimonixPicFront
dw DimonixPicBack
; attacks known at lvl 0
db TACKLE
db SCREECH
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 9,10
	tmlearn 20,23
	tmlearn 26,27,28,31,32
	tmlearn 34,36,40
	tmlearn 44,47,48
	tmlearn 50,51,54
db 0 ; padding
