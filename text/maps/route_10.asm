_Route10BattleText1::
	text "Wow, are you a"
	line "#MANIAC too?"
	cont "Want to see my"
	cont "collection?"
	done

_Route10EndBattleText1::
	text "Humph."
	line "I'm not angry!"
	prompt

_Route10AfterBattleText1::
	text "I have more rare"
	line "#MON at home!"
	done

_Route10BattleText2::
	text "Ha-hahah-ah-ha!"
	done

IF DEF(_GREEN)
_Route10EndBattleText2::
	text "Ha-haha!"
	line "Hahhhhh ...!"
	cont "Oh man..."
	cont "I ate some funny-"
	cont "tasting shrooms."
	prompt

_Route10AfterBattleText2::
	text "Haha-ha-haha!"
	line "Hahahahaha!"
	cont "...... ......"
	done
ELSE
_Route10EndBattleText2::
	text "Ha-haha!"
	line "Not laughing!"
	cont "Ha-hay fever!"
	cont "Haha-ha-choo!"
	prompt

_Route10AfterBattleText2::
	text "Haha-ha-choo!"
	line "Ha-choo!"
	cont "Snort! Snivel!"
	done
ENDC

_Route10BattleText3::
	text "Hi kid, want to"
	line "see my #MON?"
	done

_Route10EndBattleText3::
	text "Oh no!"
	line "My #MON!"
	prompt

_Route10AfterBattleText3::
	text "I don't like you"
	line "for beating me!"
	done

_Route10BattleText4::
	text "I've been to a"
	line "#MON GYM a few"
	cont "times. But, I"
	cont "lost each time."
	done

_Route10EndBattleText4::
	text "Ohh!"
	line "Blew it again!"
	prompt

_Route10AfterBattleText4::
	text "I noticed some"
	line "#MANIACs"
	cont "prowling around."
	done

_Route10BattleText5::
	text "I will crush you"
	line "beneath boulders!"
	done

_Route10EndBattleText5::
	text "Boulders,"
	line "not rocks!"
	prompt

_Route10AfterBattleText5::
	text "Ah, suppose I"
	line "should get my"
	cont "hands on an"
	cont "EARTHQUAKE TM!"
	done

_Route10BattleText6::
	text "I'm feeling a bit"
	line "faint from this"
	cont "tough hike."
	done

_Route10EndBattleText6::
	text "I'm"
	line "not up to it!"
	prompt

_Route10AfterBattleText6::
	text "The #MON here"
	line "are so chunky!"
	cont "There should be a"
	cont "pink one with a"
	cont "floral pattern!"
	done
	
_Route10BattleText7::
	text "I'm going to"
	line "retire soon."
	
	para "Couldn't care"
	line "less if this"
	cont "place blew up!"
	done

_Route10EndBattleText7::
	text "Try-"
	line "hard!"
	prompt

_Route10AfterBattleText7::
	text "I bet ZAPDOS"
	line "tastes like some"
	cont "real quality"
	cont "chicken!"
	
	para "On the other"
	line "hand, I ain't"
	cont "messin' with"
	cont "that bird!"
	
	para "What? You dealt"
	line "with it?"
	
	para "Great.. now I"
	line "lost my excuse"
	cont "to slack!"
	done
	
_Route10Text10::
_Route10Text9::
	text "ROCK TUNNEL"
	done

_Route10Text11::						;modified text
	text "POWER PLANT"
	
	para "WARNING"
	line "STEEP DECLINE"
	
	para "ENTRANCE UNSAFE"
	line "MUST EXIT OUT"
	cont "THE BACK"
	done
