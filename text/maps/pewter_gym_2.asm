_PewterGymText_5c4a3::
	text "There are all"
	line "kinds of trainers"
	cont "in the world!"

	para "You appear to be"
	line "very gifted as a"
	cont "#MON trainer!"

	para "Go to the GYM in"
	line "CERULEAN and test"
	cont "your abilities!"
	done

_TM34PreReceiveText::
	text "Wait! Take this"
	line "with you!"
	done

_ReceivedTM34Text::
	text "<PLAYER> received"
	line "TM34!@@"

_TM34ExplanationText::					;modified text
	db $0
	para "A TM contains a"
	line "technique that"
	cont "can be taught to"
	cont "#MON!"

	para "A TM can be"
	line "used as much as"
	cont "you want!"

	para "TM34 contains"
	line "BIDE!"

	para "Your #MON will"
	line "absorb damage in"
	cont "battle then pay"
	cont "it back double!"
	done

_TM34NoRoomText::
	text "You don't have"
	line "room for this!"
	done

_PewterGymText_5c4bc::
	text "I took"
	line "you for granted."

	para "As proof of your"
	line "victory, here's"
	cont "the BOULDERBADGE!"

	para "<PLAYER> received"
	line "the BOULDERBADGE!@@"

_PewterGymText_5c4c1::						;modified text
	db $0
	para "That's an official"
	line "#MON LEAGUE"
	cont "BADGE!"

	para "The BOULDERBADGE"
	line "makes all #MON"
	cont "up to L30 obey!"

	para "The technique"
	line "FLASH can now be"
	cont "used any time!"
	prompt

_PewterGymBattleText1::
	text "Stop right there,"
	line "kid!"

	para "You're still light"
	line "years from facing"
	cont "BROCK!"
	done

_PewterGymEndBattleText1::
	text "Darn!"

	para "Light years isn't"
	line "time! It measures"
	cont "distance!"
	prompt

_PewterGymAfterBattleText1::				;modified text
	text "BROCK does not"
	line "only use ROCK"
	cont "type #MON!"
	done

_PewterGymText_5c515::
	text "Hiya! I can tell"
	line "you have what it"
	cont "takes to become a"
	cont "#MON champ!"

	para "I'm no trainer,"
	line "but I can tell"
	cont "you how to win!"

	para "Let me take you"
	line "to the top!"
	done

_PewterGymText_5c51a::
	text "All right! Let's"
	line "get happening!"
	prompt

_PewterGymText_5c51f::							;modified text
	text "BROCK's strategy"
	line "will put the"
	cont "squeeze on you"
	cont "if not careful!"

	para "Douse him with"
	line "water and do it"
	cont "quick!"
	
	para "Else your defeat"
	line "will be slow"
	cont "and painful!"
	done

_PewterGymText_5c524::
	text "It's a free"
	line "service! Let's"
	cont "get happening!"
	prompt

_PewterGymText_5c529::
	text "Just as I thought!"
	line "You're #MON"
	cont "champ material!"
	done
