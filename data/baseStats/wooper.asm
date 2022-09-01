db DEX_WOOPER ; pokedex id
db 55 ; base hp
db 45 ; base attack
db 45 ; base defense
db 15 ; base speed
db 25 ; base special
db WATER ; species type 1
db GROUND ; species type 2
db 255 ; catch rate
db 52 ; base exp yield
INCBIN WOOPER_FR,0,1 ; 77, sprite dimensions
dw WooperPicFront
dw WooperPicBack
; attacks known at lvl 0
db WATER_GUN
db TAIL_WHIP
db BODY_SLAM
db 0
db 3 ; growth rate, changed from 0 to 3 to slow down early game level-ups
; learnset
	tmlearn 6,8
	tmlearn 10,13,14
	tmlearn 18
	tmlearn 26,28,31,32
	tmlearn 0
	tmlearn 44
	tmlearn 50,53,55
db 0 ; padding
