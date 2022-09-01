Route5Script:
	jp EnableAutoTextBoxDrawing

Route5TextPointers:
	dw Route5Text1
	dw Route5Text2		;NEW

Route5Text1:
	TX_FAR _Route5Text1
	db "@"

Route5Text2:
	TX_FAR _Route5Text2
	db "@"
	
