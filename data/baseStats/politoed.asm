db DEX_POLITOED ; pokedex id
db 90 ; base hp
db 75 ; base attack
db 75 ; base defense
db 70 ; base speed
db 100 ; base special
db WATER ; species type 1
db WATER ; species type 2
db 22 ; catch rate
db 203 ; base exp yield
INCBIN POLITOED_FR,0,1 ; 77, sprite dimensions
dw PolitoedPicFront
dw PolitoedPicBack
; attacks known at lvl 0
db HYPNOSIS
db WATER_GUN
db DOUBLESLAP
db BODY_SLAM
db 3 ; growth rate
; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14,15
	tmlearn 17,18,19,20
	tmlearn 26,27,29,31,32
	tmlearn 34,35,40
	tmlearn 44,46
	tmlearn 50,53,54
db 0 ; padding
