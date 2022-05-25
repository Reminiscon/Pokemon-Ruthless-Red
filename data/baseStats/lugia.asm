db DEX_LUGIA ; pokedex id
db 106 ; base hp
db 90 ; base attack
db 130 ; base defense
db 110 ; base speed
db 154 ; base special
db PSYCHIC ; species type 1
db FLYING ; species type 2
db 3 ; catch rate
db 220 ; base exp yield
INCBIN LUGIA_FR,0,1 ; 77, sprite dimensions
dw LugiaPicFront
dw LugiaPicBack
; attacks known at lvl 0
db AEROBLAST
db 0
db 0
db 0
db 5 ; growth rate
; learnset
	tmlearn 4,6,8
	tmlearn 10,13,14,15
	tmlearn 24
	tmlearn 25,26,29,31,32
	tmlearn 33,39
	tmlearn 42,43,44,45
	tmlearn 50,52,53,54,55
db 0 ; padding
