db DEX_MISDREAVUS ; pokedex id
db 60 ; base hp
db 60 ; base attack
db 60 ; base defense
db 85 ; base speed
db 85 ; base special
db GHOST ; species type 1
db GHOST ; species type 2
db 45 ; catch rate
db 147 ; base exp yield
INCBIN MISDREAVUS_FR,0,1 ; 77, sprite dimensions
dw MisdreavusPicFront
dw MisdreavusPicBack
; attacks known at lvl 0
db PSYWAVE
db GROWL
db 0
db 0
db 4 ; growth rate
; learnset
	tmlearn 6
	tmlearn 10
	tmlearn 24
	tmlearn 25,29,31,32
	tmlearn 39
	tmlearn 42,44,45
	tmlearn 50,55
db 0 ; padding
