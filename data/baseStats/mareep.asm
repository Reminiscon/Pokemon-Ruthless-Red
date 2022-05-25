db DEX_MAREEP ; pokedex id
db 55 ; base hp
db 40 ; base attack
db 40 ; base defense
db 35 ; base speed
db 65 ; base special
db ELECTRIC ; species type 1
db ELECTRIC ; species type 2
db 235 ; catch rate
db 59 ; base exp yield
INCBIN MAREEP_FR,0,1 ; 77, sprite dimensions
dw MareepPicFront
dw MareepPicBack
; attacks known at lvl 0
db TACKLE
db GROWL
db THUNDERSHOCK
db 0
db 5 ; growth rate
; learnset
	tmlearn 6,8
	tmlearn 9,10
	tmlearn 24
	tmlearn 25,31,32
	tmlearn 33,39
	tmlearn 44,45
	tmlearn 50,55
db 0 ; padding
