db DEX_BELLOSSOM ; pokedex id
db 75 ; base hp
db 80 ; base attack
db 85 ; base defense
db 50 ; base speed
db 100 ; base special
db GRASS ; species type 1
db GRASS ; species type 2
db 23 ; catch rate
db 202 ; base exp yield
INCBIN BELLOSSOM_FR,0,1 ; 77, sprite dimensions
dw BellossomPicFront
dw BellossomPicBack
; attacks known at lvl 0
db ABSORB
db STUN_SPORE
db PETAL_DANCE
db SOLARBEAM
db 3 ; growth rate
; learnset
	tmlearn 3,6
	tmlearn 9,10,15
	tmlearn 20,21,22
	tmlearn 31,32
	tmlearn 33,34
	tmlearn 44
	tmlearn 50,51,55
db 0 ; padding
