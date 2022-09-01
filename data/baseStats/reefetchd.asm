db DEX_REEFETCHD ; pokedex id
db 62 ; base hp
db 82 ; base attack
db 65 ; base defense
db 135 ; base speed
db 95 ; base special
db NORMAL ; species type 1
db FLYING ; species type 2
db 23 ; catch rate
db 195 ; base exp yield
INCBIN REEFETCHD_FR,0,1 ; 77, sprite dimensions
dw ReefetchdPicFront
dw ReefetchdPicBack
; attacks known at lvl 0
db PECK
db 0
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 2,3,4,6,8
	tmlearn 9,10
	tmlearn 20
	tmlearn 31,32
	tmlearn 33,34,39,40
	tmlearn 43,44
	tmlearn 50,51,52
db 0 ; padding
