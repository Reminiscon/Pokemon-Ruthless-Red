db DEX_SWINUB ; pokedex id
db 50 ; base hp
db 50 ; base attack
db 40 ; base defense
db 50 ; base speed
db 30 ; base special
db ICE ; species type 1
db GROUND ; species type 2
db 225 ; catch rate
db 78 ; base exp yield
INCBIN SWINUB_FR,0,1 ; 77, sprite dimensions
dw SwinubPicFront
dw SwinubPicBack
; attacks known at lvl 0
db TACKLE
db 0
db 0
db 0
db 5 ; growth rate
; learnset
	tmlearn 4,6,8
	tmlearn 9,10,13,14
	tmlearn 0
	tmlearn 26,27,28,31,32
	tmlearn 33
	tmlearn 44,48
	tmlearn 50,54
db 0 ; padding
