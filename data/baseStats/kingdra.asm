db DEX_KINGDRA ; pokedex id
db 75 ; base hp
db 95 ; base attack
db 95 ; base defense
db 85 ; base speed
db 95 ; base special
db WATER ; species type 1
db DRAGON ; species type 2
db 23 ; catch rate
db 228 ; base exp yield
INCBIN KINGDRA_FR,0,1 ; 77, sprite dimensions
dw KingdraPicFront
dw KingdraPicBack
; attacks known at lvl 0
db BUBBLE
db SMOKESCREEN
db LEER
db WATER_GUN
db 0 ; growth rate
; learnset
	tmlearn 6
	tmlearn 9,10,11,12,13,14,15
	tmlearn 20,23
	tmlearn 31,32
	tmlearn 34,39,40
	tmlearn 44
	tmlearn 50,53
db 0 ; padding
