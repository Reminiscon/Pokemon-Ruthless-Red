db DEX_HO_OH ; pokedex id
db 106 ; base hp
db 130 ; base attack
db 90 ; base defense
db 90 ; base speed
db 154 ; base special
db FIRE ; species type 1
db FLYING ; species type 2
db 3 ; catch rate
db 220 ; base exp yield
INCBIN HO_OH_FR,0,1 ; 77, sprite dimensions
dw HoohPicFront
dw HoohPicBack
; attacks known at lvl 0
db SACRED_FIRE
db 0
db 0
db 0
db 5 ; growth rate
; learnset
	tmlearn 4,6
	tmlearn 10,15
	tmlearn 21,22,24
	tmlearn 25,26,29,31,32
	tmlearn 33,38,39
	tmlearn 42,43,44,45
	tmlearn 50,52,54,55
db 0 ; padding
