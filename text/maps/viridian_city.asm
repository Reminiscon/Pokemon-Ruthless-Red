_ViridianCityText1::
	text "VIRIDIAN FOREST"
	line "is a terrifying"
	cont "place!"

	para "One of my friends"
	line "in the city knows"
	cont "all about it!"
	done

_ViridianCityText_19122::
	text "This #MON GYM"
	line "is always closed."

	para "I wonder who the"
	line "LEADER is?"
	done

_ViridianCityText_19127::
	text "VIRIDIAN GYM's"
	line "LEADER returned!"
	done

_ViridianCityText_1914d::
	text "You want to know"
	line "about the 2 kinds"
	cont "of caterpillar"
	cont "#MON?"
	done

_ViridianCityText_19152::
	text "Oh, OK then!"
	done

_ViridianCityText_19157::
	text "CATERPIE has no"
	line "poison, but"
	cont "WEEDLE does."

	para "Watch out for its"
	line "POISON STING!"
	
	para "Careful though,"
	line "both of them"
	cont "have COUNTER!"
	done
	
IF DEF(_GREEN)
_ViridianCityText_19175::
	text "Oh Grandpa! Don't"
	line "pass out here!"
	cont "My goodness..."
	cont "Sorry, but we'll"
	cont "have to wait till"
	cont "he sobers up."
	done
ELSE
_ViridianCityText_19175::
	text "Oh Grandpa! Don't"
	line "be so mean!"
	cont "He hasn't had his"
	cont "coffee yet."
	done
ENDC

_ViridianCityText_1917a::
	text "When I go shop in"
	line "PEWTER CITY, I"
	cont "have to take the"
	cont "winding trail in"
	cont "VIRIDIAN FOREST."
	done

IF DEF (_GREEN)
_ViridianCityText_19191::
	text "Urgh! Hic..."
	line "hold on there!"
	cont "C'mere an lissen"
	cont "to what I hafta"
	cont "say!"

	para "...Hey!"
	line "I said don't go!"
	done
ELSE
_ViridianCityText_19191::
	text "You can't go"
	line "through here!"

	para "This is private"
	line "property!"
	done
ENDC

_ViridianCityText_191ca::
	text "Yawn!"
	line "I must have dozed"
	cont "off in the sun."

	para "I had this dream"
	line "about a DROWZEE"
	cont "eating my dream."
	cont "What's this?"
	cont "Where did this TM"
	cont "come from?"

	para "This is spooky!"
	line "Here, you can"
	cont "have this TM."
	prompt

_ReceivedTM42Text::
	text "<PLAYER> received"
	line "TM42!@@"

_TM42Explanation::
	text "TM42 contains"
	line "DREAM EATER..."
	cont "...Snore..."
	done

_TM42NoRoomText::
	text "You have too much"
	line "stuff already."
	done
IF DEF(_GREEN)
_ViridianCityText_1920a::
	text "Mmm......"
	line "Seems like I was"
	cont "pretty drunk!"

	para "My head hurts..."

	para "Are you in a"
	line "hurry?"
	done
ELSE
_ViridianCityText_1920a::
	text "Ahh, I've had my"
	line "coffee now and I"
	cont "feel great!"

	para "Sure you can go"
	line "through!"

	para "Are you in a"
	line "hurry?"
	done
ENDC

_ViridianCityText_1920f::
	text "I see you're using"
	line "a #DEX."

	para "When you catch a"
	line "#MON, #DEX"
	cont "is automatically"
	cont "updated."

	para "What? Don't you"
	line "know how to catch"
	cont "#MON?"

	para "I'll show you"
	line "how to then."
	done

_ViridianCityText_19214::
	text "Time is money..."
	line "Go along then."
	done

_ViridianCityText_19219::
	text "First, you need"
	line "to weaken the"
	cont "target #MON."
	done

_ViridianCityText8::
	text "VIRIDIAN CITY "
	line "The Eternally"
	cont "Green Paradise"
	done

_ViridianCityText9::						;modified text
	text "TRAINER TIPS"

	para "A lot of"
	line "trainers use"
	cont "TM and HM moves."

	para "Some trainers"
	line "are tougher than"
	cont "others!"
	done

_ViridianCityText10::						;modified text
	text "TRAINER TIPS"

	para "It's always"
	line "a good idea to"
	cont "read signs."

	para "Also, talk to"
	line "people for tips"
	cont "and hints!"
	done

_ViridianCityText13::
	text "VIRIDIAN CITY"
	line "#MON GYM"
	done

_ViridianCityText14::
	text "The GYM's doors"
	line "are locked..."
	done
