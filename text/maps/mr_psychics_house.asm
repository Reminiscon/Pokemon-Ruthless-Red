_TM46PreReceiveText::
	text "...Wait! Don't"
	line "say a word!"

	para "You wanted this!"
	prompt

_ReceivedTM46Text::
	text "<PLAYER> received"
	line "@"
	TX_RAM wcf4b
	text "!@@"

_TM46ExplanationText::
	text "TM46 is PSYWAVE!"

	para "It does anywhere"
	line "from 1x-2x your"
	cont "level in damage!"
	
	para "Huh? What? You"
	line "actually wanted"
	cont "TM29 PSYCHIC?"
	
	para "..."
	
	para "Where do you"
	line "think we are,"
	cont "SAFFRON GYM?"
	
	para "SKIDADDLE!"
	done

_TM46NoRoomText::
	text "Where do you plan"
	line "to put this?"
	done
