db DEX_URSARING ; pokedex id
db 90 ; base hp
db 130 ; base attack
db 75 ; base defense
db 55 ; base speed
db 75 ; base special
db NORMAL ; species type 1
db NORMAL ; species type 2
db 60 ; catch rate
db 189 ; base exp yield
INCBIN URSARING_FR,0,1 ; 77, sprite dimensions
dw UrsaringPicFront
dw UrsaringPicBack
; attacks known at lvl 0
db SCRATCH
db LEER
db LICK
db FURY_SWIPES
db 0 ; growth rate
; learnset
	tmlearn 1,3,5,6,8
	tmlearn 9,10,15
	tmlearn 18,19
	tmlearn 26,28,31,32
	tmlearn 35,39
	tmlearn 44,48
	tmlearn 50,51,54
db 0 ; padding
