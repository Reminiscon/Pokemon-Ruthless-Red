SilphCo1Script:
	call EnableAutoTextBoxDrawing
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ret z
	CheckAndSetEvent EVENT_SILPH_CO_RECEPTIONIST_AT_DESK
	CheckAndSetEvent EVENT_SILPH_CO_GUARD_ON_FIRST_FLOOR			;NEW
	ret nz
	CheckEvent EVENT_SILPH_CO_RECEPTIONIST_AT_DESK
	jr nz, .jumptoguard
	ld a, HS_SILPH_CO_1F_RECEPTIONIST
	ld [wMissableObjectIndex], a
	predef_jump ShowObject
.jumptoguard
	ld a, HS_SILPH_CO_1F_GUARD										;NEW
	ld [wMissableObjectIndex], a
	predef_jump ShowObject

SilphCo1TextPointers:
	dw SilphCo1Text1
	dw SilphCo1Text2	;NEW
	dw SilphCo1Text3	;NEW

SilphCo1Text1:
	TX_FAR _SilphCo1Text1
	db "@"
	
SilphCo1Text2:		;NEW
	TX_FAR _SilphCo1Text2
	db "@"
	
SilphCo1Text3:		;NEW
	TX_FAR _SilphCo1Text3
	db "@"
	
