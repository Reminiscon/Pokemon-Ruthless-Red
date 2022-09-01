db DEX_ARM_MEWTWO ; pokedex id
db 154 ; base hp			;+48 HP
db 90 ; base attack			;-20 ATK
db 134 ; base defense		;+44 DEF
db 106 ; base speed			;-24 SPE
db 106 ; base special		;-48 SPC
db PSYCHIC ; species type 1
db ARMOR ; species type 2
db 3 ; catch rate
db 220 ; base exp yield
INCBIN ARM_MEWTWO_FR,0,1 ; 77, sprite dimensions
dw ArmMewtwoPicFront
dw ArmMewtwoPicBack
; attacks known at lvl 0
db CONFUSION
db DISABLE
db SWIFT
db PSYCHIC_M
db 5 ; growth rate
; learnset
	tmlearn 1,5,6,8
	tmlearn 9,10,11,12,13,14,15,16
	tmlearn 17,18,19,20,22,24
	tmlearn 25,29,30,31,32
	tmlearn 33,34,35,36,38,39,40
	tmlearn 44,45,46
	tmlearn 49,50,54,55
db 0 ; padding
