db DEX_LICKILICKI ; pokedex id
db 110 ; base hp
db 85 ; base attack
db 95 ; base defense
db 50 ; base speed
db 95 ; base special
db NORMAL ; species type 1
db NORMAL ; species type 2
db 15 ; catch rate
db 198 ; base exp yield
INCBIN LICKILICKI_FR,0,1 ; 77, sprite dimensions
dw LickilickiPicFront
dw LickilickiPicBack
; attacks known at lvl 0
db WRAP
db SUPERSONIC
db LICK
db 0
db 0 ; growth rate
; learnset
	tmlearn 1,3,5,6,8
	tmlearn 9,10,11,12,13,14,15
	tmlearn 17,18,19,20,24
	tmlearn 25,26,27,31,32
	tmlearn 34,38,40
	tmlearn 44
	tmlearn 50,51,53,54
db 0 ; padding
