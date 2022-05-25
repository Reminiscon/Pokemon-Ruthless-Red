db DEX_SUDOWOODO ; pokedex id
db 70 ; base hp
db 100 ; base attack
db 115 ; base defense
db 30 ; base speed
db 65 ; base special
db ROCK ; species type 1
db ROCK ; species type 2
db 65 ; catch rate
db 135 ; base exp yield
INCBIN SUDOWOODO_FR,0,1 ; 77, sprite dimensions
dw SudowoodoPicFront
dw SudowoodoPicBack
; attacks known at lvl 0
db ROCK_THROW
db MIMIC
db COUNTER
db 0
db 0 ; growth rate
; learnset
	tmlearn 1,5,6,8
	tmlearn 10
	tmlearn 18,19
	tmlearn 26,28,31,32
	tmlearn 36
	tmlearn 44,48
	tmlearn 50,54
db 0 ; padding
