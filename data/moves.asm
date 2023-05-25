Moves:
; Characteristics of each move.

move: macro
	db \1 ; animation (interchangeable with move id)
	db \2 ; effect
	db \3 ; power
	db \4 ; type
	db \5 percent ; accuracy
	db \6 ; pp
endm

	move POUND,        NO_ADDITIONAL_EFFECT,        40, NORMAL,   100, 35
MoveEnd:
	move KARATE_CHOP,  NO_ADDITIONAL_EFFECT,        50, FIGHTING, 100, 25		;4x Crit rate, Normal -> Fighting
	move DOUBLESLAP,   ATTACK_TWICE_EFFECT,         50, NORMAL,    85, 10		;Hits twice and 2x Crit rate, 50 POW
	move COMET_PUNCH,  TWO_TO_FIVE_ATTACKS_EFFECT,  18, BUG,       85, 15		;Normal -> Bug
	move MEGA_PUNCH,   FLINCH_SIDE_EFFECT2,        100, NORMAL,    85, 15		;30% chance to Flinch, 100 POW, 15 PP
	move PAY_DAY,      DRAIN_HP_EFFECT,             60, NORMAL,   100, 10		;Drain HP effect, 60 POW, 10 PP
	move FIRE_PUNCH,   BURN_SIDE_EFFECT1,           75, FIRE,     100, 15
	move ICE_PUNCH,    FREEZE_SIDE_EFFECT,          75, ICE,      100, 15
	move THUNDERPUNCH, PARALYZE_SIDE_EFFECT1,       75, ELECTRIC, 100, 15
	move SCRATCH,      NO_ADDITIONAL_EFFECT,        40, NORMAL,   100, 35
	move VICEGRIP,     FLINCH_SIDE_EFFECT2,         85, NORMAL,   100, 20		;30% chance to Flinch, 85 POW, 20 PP
	move GUILLOTINE,   OHKO_EFFECT,                  1, NORMAL,    30,  5
	move RAZOR_WIND,   NO_ADDITIONAL_EFFECT,        80, FLYING,    75, 10		;Strikes immediately and 4x Crit rate, Normal -> Flying
	move SWORDS_DANCE, ATTACK_UP2_EFFECT,            0, NORMAL,   100,  5		;5 PP
	move CUT,          FLINCH_SIDE_EFFECT2,         50, BUG,       95, 20		;30% chance to Flinch, Normal -> Bug, 20 PP
	move GUST,         NO_ADDITIONAL_EFFECT,        40, FLYING,   100, 35		;Normal -> Flying
	move WING_ATTACK,  NO_ADDITIONAL_EFFECT,        60, FLYING,   100, 35		;60 POW
	move WHIRLWIND,    SPEED_DOWN_SIDE_EFFECT,      55, FLYING,   100, 15		;33% chance to lower SPE, 55 POW, Normal -> Flying, 100 ACC, 15 PP
	move FLY,          CHARGE_EFFECT,        		70, FLYING,    95, 15		
	move BIND,         TRAPPING_EFFECT,             15, ROCK,      75, 20		;Normal -> Rock
	move SLAM,         NO_ADDITIONAL_EFFECT,        80, FIGHTING,  75, 20		;Normal -> Fighting
	move VINE_WHIP,    NO_ADDITIONAL_EFFECT,        35, GRASS,    100, 10		;2x Crit rate
	move STOMP,        FLINCH_SIDE_EFFECT2,         65, NORMAL,   100, 20
	move DOUBLE_KICK,  ATTACK_TWICE_EFFECT,         30, FIGHTING, 100, 30
	move MEGA_KICK,    NO_ADDITIONAL_EFFECT,       120, NORMAL,    85,  5		;85 ACC
	move JUMP_KICK,    JUMP_KICK_EFFECT,            70, FIGHTING,  95, 25
	move ROLLING_KICK, FLINCH_SIDE_EFFECT2,         60, FIGHTING,  85, 15
	move SAND_ATTACK,  ACCURACY_DOWN1_EFFECT,        0, GROUND,   100, 15		;Normal -> Ground
	move HEADBUTT,     FLINCH_SIDE_EFFECT2,         70, NORMAL,   100, 15
	move HORN_ATTACK,  POISON_SIDE_EFFECT1,         65, POISON,   100, 15		;30% chance to Poison, Normal -> Poison, 15 PP
	move FURY_ATTACK,  TWO_TO_FIVE_ATTACKS_EFFECT,  15, NORMAL,    85, 20
	move HORN_DRILL,   OHKO_EFFECT,                  1, NORMAL,    30,  5
	move TACKLE,       NO_ADDITIONAL_EFFECT,        35, NORMAL,    95, 35
	move BODY_SLAM,    PARALYZE_SIDE_EFFECT2,       85, NORMAL,   100, 15
	move WRAP,         TRAPPING_EFFECT,             15, NORMAL,    85, 20
	move TAKE_DOWN,    RECOIL_EFFECT,               90, GHOST,     85, 20		;Normal -> Ghost
	move THRASH,       THRASH_PETAL_DANCE_EFFECT,  120, NORMAL,   100, 10		;120 POW, 10 PP
	move DOUBLE_EDGE,  RECOIL_EFFECT,              120, NORMAL,   100, 15		;120 POW
	move TAIL_WHIP,    DEFENSE_DOWN1_EFFECT,         0, NORMAL,   100, 30
	move POISON_STING, POISON_SIDE_EFFECT1,         15, POISON,   100, 35		;30% chance to Poison
	move TWINEEDLE,    TWINEEDLE_EFFECT,            25, BUG,      100, 20		;2x Crit rate
	move PIN_MISSILE,  TWO_TO_FIVE_ATTACKS_EFFECT,  18, BUG,       85, 20		;18 POW
	move LEER,         DEFENSE_DOWN1_EFFECT,         0, NORMAL,   100, 30
	move BITE,         FLINCH_SIDE_EFFECT2,         60, GHOST,    100, 25		;30% chance to Flinch, Normal -> Ghost
	move GROWL,        ATTACK_DOWN1_EFFECT,          0, NORMAL,   100, 40
	move ROAR,         SPECIAL_DOWN_SIDE_EFFECT,    55, NORMAL,   100, 15		;33% chance to lower SPC, 55 POW, 15 PP
	move SING,         SLEEP_EFFECT,                 0, NORMAL,    55, 15
	move SUPERSONIC,   CONFUSION_EFFECT,             0, NORMAL,   100,  5		;100 ACC, 5 PP
	move SONICBOOM,    SPECIAL_DOWN1_EFFECT,         0, NORMAL,   100, 10		;Lowers SPC 1 stage, 100 ACC, 10 PP
	move DISABLE,      DISABLE_EFFECT,               0, NORMAL,   100, 10		;100 ACC, 10 PP
	move ACID,         BURN_SIDE_EFFECT2,           65, POISON,   100, 20		;30% chance to Burn, 65 POW, 20 PP
	move EMBER,        BURN_SIDE_EFFECT1,           40, FIRE,     100, 25
	move FLAMETHROWER, BURN_SIDE_EFFECT1,           95, FIRE,     100, 15
	move MIST,         MIST_EFFECT,                  0, ICE,      100,  5		;Protects against all non-damaging status moves in addition to non-damaging stat-down moves, 5 PP
	move WATER_GUN,    NO_ADDITIONAL_EFFECT,        40, WATER,    100, 25
	move HYDRO_PUMP,   NO_ADDITIONAL_EFFECT,       120, WATER,     80,  5
	move SURF,         NO_ADDITIONAL_EFFECT,        95, WATER,    100, 15
	move ICE_BEAM,     FREEZE_SIDE_EFFECT,          95, ICE,      100, 10
	move BLIZZARD,     FREEZE_SIDE_EFFECT,         120, ICE,       70,  5		;70 ACC
	move PSYBEAM,      CONFUSION_SIDE_EFFECT,       65, PSYCHIC,  100, 20
	move BUBBLEBEAM,   SPEED_DOWN_SIDE_EFFECT,      65, WATER,    100, 20
	move AURORA_BEAM,  ATTACK_DOWN_SIDE_EFFECT,     65, ICE,      100, 20
	move HYPER_BEAM,   HYPER_BEAM_EFFECT,          150, NORMAL,    90,  5
	move PECK,         NO_ADDITIONAL_EFFECT,        35, FLYING,   100, 35
	move DRILL_PECK,   NO_ADDITIONAL_EFFECT,        80, FLYING,   100, 20
	move SUBMISSION,   RECOIL_EFFECT,               80, FIGHTING, 100, 20		;100 ACC, 20 PP
	move LOW_KICK,     FLINCH_SIDE_EFFECT2,         50, FIGHTING,  90, 20
	move COUNTER,      NO_ADDITIONAL_EFFECT,         1, FIGHTING, 100, 20		;Counters all physical types instead of only Normal and Fighting types
	move SEISMIC_TOSS, BURN_SIDE_EFFECT2,           50, FIGHTING, 100, 15		;30% chance to Burn, 50 POW, 15 PP
	move STRENGTH,     NO_ADDITIONAL_EFFECT,       100, NORMAL,   100, 10		;100 POW, 10 PP
	move ABSORB,       DRAIN_HP_EFFECT,             40, GRASS,    100, 15		;40 POW, 15 PP
	move MEGA_DRAIN,   DRAIN_HP_EFFECT,             60, GRASS,    100, 10		;60 POW
	move LEECH_SEED,   LEECH_SEED_EFFECT,            0, GRASS,     90, 10		;Drains 1/8 HP instead of 1/16 HP
	move GROWTH,       SPECIAL_UP1_EFFECT,           0, NORMAL,   100, 20		;20 PP
	move RAZOR_LEAF,   NO_ADDITIONAL_EFFECT,        55, GRASS,     95, 25
	move SOLARBEAM,    NO_ADDITIONAL_EFFECT,       120, GRASS,     80,  5		;Strikes immediately, 80 ACC, 5 PP
	move POISONPOWDER, POISON_EFFECT,                0, POISON,    75, 35
	move STUN_SPORE,   PARALYZE_EFFECT,              0, GRASS,     75, 30
	move SLEEP_POWDER, SLEEP_EFFECT,                 0, GRASS,     75, 15
	move PETAL_DANCE,  THRASH_PETAL_DANCE_EFFECT,  120, GRASS,    100, 10		;120 POW, 10 PP
	move STRING_SHOT,  SPEED_DOWN1_EFFECT,           0, BUG,       95, 40
	move DRAGON_RAGE,  SWIFT_EFFECT,               100, DRAGON,   100,  5		;Swift effect and 2x Crit rate, 100 POW, 5 PP
	move FIRE_SPIN,    TRAPPING_EFFECT,             15, FIRE,      70, 15
	move THUNDERSHOCK, PARALYZE_SIDE_EFFECT1,       40, ELECTRIC, 100, 30
	move THUNDERBOLT,  PARALYZE_SIDE_EFFECT1,       95, ELECTRIC, 100, 15
	move THUNDER_WAVE, PARALYZE_EFFECT,              0, ELECTRIC, 100, 20
	move THUNDER,      PARALYZE_SIDE_EFFECT1,      120, ELECTRIC,  70, 10
	move ROCK_THROW,   NO_ADDITIONAL_EFFECT,        50, ROCK,      90, 15		;90 ACC
	move EARTHQUAKE,   NO_ADDITIONAL_EFFECT,       100, GROUND,   100, 10
	move FISSURE,      OHKO_EFFECT,                  1, GROUND,    30,  5
	move DIG,          CHARGE_EFFECT,              100, GROUND,   100, 10
	move TOXIC,        POISON_EFFECT,                0, POISON,    85, 10
	move CONFUSION,    CONFUSION_SIDE_EFFECT,       50, PSYCHIC,  100, 25
	move PSYCHIC_M,    SPECIAL_DOWN_SIDE_EFFECT,    90, PSYCHIC,  100, 10
	move HYPNOSIS,     SLEEP_EFFECT,                 0, PSYCHIC,   60, 20
	move MEDITATE,     ATTACK_UP2_EFFECT,            0, PSYCHIC,  100, 15		;Raises ATK 2 stages, 15 PP
	move AGILITY,      SPEED_UP2_EFFECT,             0, PSYCHIC,  100, 30
	move QUICK_ATTACK, NO_ADDITIONAL_EFFECT,        40, NORMAL,   100, 30
	move RAGE,         RAGE_EFFECT,                 65, NORMAL,   100, 10		;Now lasts for a random 2 to 5 turns instead of lasting indefinitely, 65 POW, 10 PP
	move TELEPORT,     SWITCH_AND_TELEPORT_EFFECT,   0, PSYCHIC,  100, 20
	move NIGHT_SHADE,  DRAIN_HP_EFFECT,             80, GHOST,    100,  5		;Drain HP effect and 2x Crit rate, 80 POW, 5 PP
	move MIMIC,        MIMIC_EFFECT,                 0, NORMAL,   100, 10
	move SCREECH,      DEFENSE_DOWN2_EFFECT,         0, NORMAL,    85, 40
	move DOUBLE_TEAM,  EVASION_UP1_EFFECT,           0, NORMAL,   100,  5		;5 PP
	move RECOVER,      HEAL_EFFECT,                  0, NORMAL,   100, 20
	move HARDEN,       DEFENSE_UP1_EFFECT,           0, NORMAL,   100, 30
	move MINIMIZE,     EVASION_UP1_EFFECT,           0, NORMAL,   100, 10		;10 PP
	move SMOKESCREEN,  ACCURACY_DOWN1_EFFECT,        0, NORMAL,   100, 20
	move CONFUSE_RAY,  CONFUSION_EFFECT,             0, GHOST,    100, 10
	move WITHDRAW,     DEFENSE_UP2_EFFECT,           0, WATER,    100, 15		;Raises DEF 2 stages, 15 PP
	move DEFENSE_CURL, DEFENSE_UP1_EFFECT,           0, NORMAL,   100, 40
	move BARRIER,      DEFENSE_UP2_EFFECT,           0, PSYCHIC,  100, 30
	move LIGHT_SCREEN, LIGHT_SCREEN_EFFECT,          0, PSYCHIC,  100, 30
	move HAZE,         HAZE_EFFECT,                  0, ICE,      100, 30
	move REFLECT,      REFLECT_EFFECT,               0, PSYCHIC,  100, 20
	move FOCUS_ENERGY, FOCUS_ENERGY_EFFECT,          0, NORMAL,   100,  5		;Fixed to 4x Crit Rate instead of 0.25x, 5 PP
	move BIDE,         BIDE_EFFECT,                  0, BIRD,     100, 10		;Now lasts for a guaranteed 2 turns instead of lasting from 2 to 3 turns
	move METRONOME,    METRONOME_EFFECT,             0, BIRD,     100, 10
	move MIRROR_MOVE,  MIRROR_MOVE_EFFECT,           0, FLYING,   100, 20
	move SELFDESTRUCT, EXPLODE_EFFECT,             130, NORMAL,   100,  5
	move EGG_BOMB,     BURN_SIDE_EFFECT2,          100, DRAGON,    75,  5		;30% chance to Burn, Normal -> Dragon, 5 PP
	move LICK,         PARALYZE_SIDE_EFFECT2,       65, GHOST,    100, 15		;65 POW, 15 PP
	move SMOG,         POISON_SIDE_EFFECT2,         65, POISON,    70, 10		;100% chance to Toxic Poison, 65 POW, 10 PP
	move SLUDGE,       POISON_SIDE_EFFECT1,         90, POISON,   100, 10		;30% chance to Poison, 90 POW, 10 PP
	move BONE_CLUB,    FLINCH_SIDE_EFFECT2,         65, GROUND,    85, 10		;30% chance to Flinch, 10 PP
	move FIRE_BLAST,   BURN_SIDE_EFFECT1,          120, FIRE,      85,  5		;10% chance to Burn
	move WATERFALL,    FLINCH_SIDE_EFFECT2,         80, WATER,    100, 15		;30% chance to Flinch
	move CLAMP,        TRAPPING_EFFECT,             35, WATER,     75, 10
	move SWIFT,        SWIFT_EFFECT,                60, NORMAL,   100, 20
	move SKULL_BASH,   CHARGE_EFFECT,              130, FIGHTING, 100, 10		;Raises DEF 1 stage on Charge, 130 POW, Normal -> Fighting, 10 PP
	move SPIKE_CANNON, TWO_TO_FIVE_ATTACKS_EFFECT,  20, ICE,      100, 15		;Normal -> Ice
	move CONSTRICT,    EVASION_DOWN1_EFFECT,         0, NORMAL,   100, 15		;Normal -> Grass, Lowers EVS 1 stage, 15 PP
	move AMNESIA,      SPECIAL_UP2_EFFECT,           0, PSYCHIC,  100,  5		;5 PP
	move KINESIS,      ACCURACY_DOWN2_EFFECT,        0, PSYCHIC,   80, 10		;Lowers ACC 2 stages, 10 PP
	move SOFTBOILED,   HEAL_EFFECT,                  0, NORMAL,   100, 10
	move HI_JUMP_KICK, JUMP_KICK_EFFECT,            85, FIGHTING,  90, 20
	move GLARE,        PARALYZE_EFFECT,              0, NORMAL,   100, 20		;100 ACC, 20 PP
	move DREAM_EATER,  DREAM_EATER_EFFECT,         100, PSYCHIC,  100, 15
	move POISON_GAS,   POISON_EFFECT,                0, POISON,   100, 15		;100 ACC, 15 PP
	move BARRAGE,      TWO_TO_FIVE_ATTACKS_EFFECT,  15, GRASS,     85, 20		;Normal -> Grass
	move LEECH_LIFE,   DRAIN_HP_EFFECT,             40, BUG,      100, 15		;40 POW
	move LOVELY_KISS,  SLEEP_EFFECT,                 0, NORMAL,    75, 10
	move SKY_ATTACK,   CHARGE_EFFECT,              140, FLYING,    90,  5		;30% chance to Flinch on Charge turn and 2x Crit rate
	move TRANSFORM,    TRANSFORM_EFFECT,             0, NORMAL,   100, 10
	move BUBBLE,       SPEED_DOWN1_EFFECT,           0, WATER,    100, 20		;Lowers SPE 1 stage, 20 PP
	move DIZZY_PUNCH,  CONFUSION_SIDE_EFFECT,       70, GHOST,    100, 10		;10% chance to Confuse, Normal -> Ghost
	move SPORE,        SLEEP_EFFECT,                 0, GRASS,    100, 15
	move FLASH,        ACCURACY_DOWN1_EFFECT,        0, NORMAL,   100, 10		;100 ACC, 10 PP
	move PSYWAVE,      SPECIAL_DAMAGE_EFFECT,        1, PSYCHIC,   80, 10		;Does damage equal to 1x to 2x the user's level, 10 PP
	move SPLASH,       SPLASH_EFFECT,                0, NORMAL,   100, 40
	move ACID_ARMOR,   DEFENSE_UP2_EFFECT,           0, POISON,   100, 40
	move CRABHAMMER,   NO_ADDITIONAL_EFFECT,        90, WATER,     85, 10
	move EXPLOSION,    EXPLODE_EFFECT,             170, NORMAL,   100,  5
	move FURY_SWIPES,  TWO_TO_FIVE_ATTACKS_EFFECT,  18, NORMAL,    80, 15
	move BONEMERANG,   ATTACK_TWICE_EFFECT,         50, GROUND,    90, 10		;2x Crit rate
	move REST,         HEAL_EFFECT,                  0, PSYCHIC,  100, 10
	move ROCK_SLIDE,   FLINCH_SIDE_EFFECT2,         75, ROCK,      90, 10		;30% chance to Flinch
	move HYPER_FANG,   FLINCH_SIDE_EFFECT1,         80, NORMAL,    90, 15
	move SHARPEN,      ACCURACY_UP1_EFFECT,          0, NORMAL,   100, 10		;Raises ACC 1 stage, 10 PP
	move CONVERSION,   CONVERSION_EFFECT,            0, NORMAL,   100, 30
	move TRI_ATTACK,   TRI_ATTACK_EFFECT,           80, NORMAL,   100, 10		;20% chance to Burn or Freeze or Paralyze
	move SUPER_FANG,   SUPER_FANG_EFFECT,            1, NORMAL,    90, 10
	move SLASH,        NO_ADDITIONAL_EFFECT,        70, NORMAL,   100, 20
	move SUBSTITUTE,   SUBSTITUTE_EFFECT,            0, NORMAL,   100, 10
	move SUPPRESS,     SPECIAL_DOWN2_EFFECT,		 0, PSYCHIC,  100, 10		;NEW (Unique to Arm.Mewtwo)
	move ROCKET_BEAM,  SWIFT_EFFECT,			   100, FIRE,     100, 10		;NEW (Unique to Arm.Mewtwo)
	move SHADOW_BALL,  SPECIAL_DOWN_SIDE_EFFECT,    80, GHOST,    100, 15		;NEW
	move AEROBLAST,    NO_ADDITIONAL_EFFECT,       100, FLYING,    95,  5		;NEW (Unique to Lugia)
	move SACRED_FIRE,  BURN_SIDE_EFFECT2,		   100, FIRE,      95,  5		;NEW (Unique to Ho-oh)
	move STRUGGLE,     RECOIL_EFFECT,               50, BIRD,     100, 10	;joenote - changed from normal to BIRD type (acts as typless)
	
