db DEX_SPEAROW ; pokedex id
db 40 ; base hp
db 60 ; base attack
db 30 ; base defense
db 70 ; base speed
db 31 ; base special
db NORMAL ; species type 1
db FLYING ; species type 2
db 255 ; catch rate
db 58 ; base exp yield
INCBIN SPEAROW_FR,0,1 ; 55, sprite dimensions
dw SpearowPicFront
dw SpearowPicBack
; attacks known at lvl 0
db PECK
db GROWL
db RAGE
db 0
db 3 ; growth rate, changed from 0 to 3 to slow down early game level-ups
; learnset
	tmlearn 2,4,6
	tmlearn 9,10
	tmlearn 20
	tmlearn 31,32
	tmlearn 34,39
	tmlearn 43,44
	tmlearn 49,50,52
db 0 ; padding
