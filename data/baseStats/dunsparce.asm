db DEX_DUNSPARCE ; pokedex id
db 100 ; base hp
db 70 ; base attack
db 70 ; base defense
db 45 ; base speed
db 65 ; base special
db NORMAL ; species type 1
db NORMAL ; species type 2
db 190 ; catch rate
db 75 ; base exp yield
INCBIN DUNSPARCE_FR,0,1 ; 77, sprite dimensions
dw DunsparcePicFront
dw DunsparcePicBack
; attacks known at lvl 0
db RAGE
db 0
db 0
db 0
db 0 ; growth rate
; learnset
	tmlearn 6,7,8
	tmlearn 9,10,13,14
	tmlearn 18,20,22,24
	tmlearn 25,26,28,31,32
	tmlearn 34,38
	tmlearn 42,44,45,48
	tmlearn 50,54
db 0 ; padding
