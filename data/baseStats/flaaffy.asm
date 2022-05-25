db DEX_FLAAFFY ; pokedex id
db 70 ; base hp
db 55 ; base attack
db 55 ; base defense
db 45 ; base speed
db 80 ; base special
db ELECTRIC ; species type 1
db ELECTRIC ; species type 2
db 120 ; catch rate
db 117 ; base exp yield
INCBIN FLAAFFY_FR,0,1 ; 77, sprite dimensions
dw FlaaffyPicFront
dw FlaaffyPicBack
; attacks known at lvl 0
db TACKLE
db GROWL
db 0
db 0
db 5 ; growth rate
; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10
	tmlearn 18,19,24
	tmlearn 25,31,32
	tmlearn 33,39
	tmlearn 44,45
	tmlearn 50,54,55
db 0 ; padding
