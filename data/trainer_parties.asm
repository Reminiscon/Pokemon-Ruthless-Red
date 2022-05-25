TrainerDataPointers:
	dw YoungsterData
	dw BugCatcherData
	dw LassData
	dw SailorData
	dw JrTrainerMData
	dw JrTrainerFData
	dw PokemaniacData
	dw SuperNerdData
	dw HikerData
	dw BikerData
	dw BurglarData
	dw EngineerData
	dw Juggler1Data
	dw FisherData
	dw SwimmerData
	dw CueBallData
	dw GamblerData
	dw BeautyData
	dw PsychicData
	dw RockerData
	dw JugglerData
	dw TamerData
	dw BirdKeeperData
	dw BlackbeltData
	dw Green1Data
	dw ProfOakData
	dw ChiefData
	dw ScientistData
	dw GiovanniData
	dw RocketData
	dw CooltrainerMData
	dw CooltrainerFData
	dw BrunoData
	dw BrockData
	dw MistyData
	dw LtSurgeData
	dw ErikaData
	dw KogaData
	dw BlaineData
	dw SabrinaData
	dw GentlemanData
	dw Green2Data
	dw Green3Data
	dw LoreleiData
	dw ChannelerData
	dw AgathaData
	dw LanceData

; if first byte != FF, then
	; first byte is level (of all pokemon on this team)
	; all the next bytes are pokemon species
	; null-terminated
; if first byte == FF, then
	; first byte is FF (obviously)
	; every next two bytes are a level and species
	; null-terminated

YoungsterData:
; Route 3
	db 15,RATTATA,EKANS,0
	db 16,RATTATA,0												;Custom Moves Applied
; Mt. Moon 1F
	db 18,ZUBAT,GEODUDE,DROWZEE,0
; Route 24
	db 22,PIDGEOTTO,RATICATE,NIDORINO,0
; Route 25
	db 23,CUBONE,DROWZEE,0
	db 23,SLOWPOKE,0
	db 23,ABRA,SANDSHREW,0
; SS Anne 1F Rooms
	db 33,RHYHORN,0
; Route 11
	db 32,ARBOK,0
	db 31,SANDSLASH,GOLBAT,0
	db 31,RATICATE,RHYHORN,RAICHU,0
	db 32,NIDORINO,PONYTA,0
; Unused
	;db 17,SPEAROW,RATTATA,RATTATA,SPEAROW,0
BugCatcherData:
; Viridian Forest
	db 8,METAPOD,KAKUNA,0								
	db 10,VENONAT,BEEDRILL,BUTTERFREE,0					
	db 10,PINSIR,0												;Custom Moves Applied
; Route 3
	db 15,PARAS,PARAS,TANGELA,0									;Custom Moves Applied
	db 16,VENONAT,VENONAT,METAPOD,KAKUNA,METAPOD,KAKUNA,0		;Custom Moves Applied
	db 17,BUTTERFREE,BEEDRILL,0						
; Mt. Moon 1F
	db 18,BEEDRILL,BEEDRILL,0
	db 17,KAKUNA,BUTTERFREE,PINSIR,0
; Route 24
	db 23,SCYTHER,0												;Custom Moves Applied
; Route 6
	db 29,BUTTERFREE,BEEDRILL,PARASECT,0
	db 30,SCYTHER,0												;Custom Moves Applied
; Route 9
	db 36,METAPOD,KAKUNA,BUTTERFREE,BEEDRILL,0					;Custom Moves Applied
	db 37,VENOMOTH,PARASECT,PARASECT,0							;Custom Moves Applied
; Unused
;	db 18,METAPOD,CATERPIE,VENONAT,0
LassData:
; Route 3
	db 16,EKANS,SANDSHREW,0
	db 17,NIDORAN_M,NIDORINO,0
	db 18,JIGGLYPUFF,CLEFAIRY,0									;Custom Moves Applied
; Route 4
	db 18,PARAS,VENONAT,PARAS,VENONAT,PARAS,0
; Mt. Moon 1F
	db 19,ODDISH,BELLSPROUT,0
	db 20,CLEFAIRY,0											;Custom Moves Applied
; Route 24
	db 23,CLEFABLE,NIDOQUEEN,0									;Custom Moves Applied
	db 22,CLEFAIRY,CLEFAIRY,CLEFAIRY,0							;Custom Moves Applied
; Route 25
	db 24,NIDORINA,NIDORINO,0
	db 23,GLOOM,WEEPINBELL,0									;Custom Moves Applied
; SS Anne 1F Rooms
	db 33,FEAROW,CLEFABLE,0
; SS Anne 2F Rooms
	db 33,PIDGEOTTO,WIGGLYTUFF,0
; Route 8
	db 43,GLOOM,POLIWHIRL,NIDOQUEEN,0
	db 43,PERSIAN,PERSIAN,PERSIAN,0
	db 43,PIDGEOT,ARBOK,RAPIDASH,0
	db 45,CLEFABLE,0											;Custom Moves Applied
; Celadon Gym
	db 46,GLOOM,BEEDRILL,EXEGGCUTE,0							;Custom Moves Applied
	db 46,WEEPINBELL,BUTTERFREE,EXEGGCUTE,0						;Custom Moves Applied
; Route 2
	db 6,NIDORAN_F,NIDORAN_M,DITTO,0							;NEW
SailorData:
; SS Anne Stern
	db 33,MACHOKE,CLOYSTER,0
	db 33,PRIMEAPE,TENTACRUEL,0
; SS Anne B1F Rooms
	db 36,TENTACRUEL,0											;Custom Moves Applied
	db 34,STARYU,MACHOKE,DEWGONG,0
	db 34,ELECTRODE,SEAKING,PRIMEAPE,0
	db 34,GRIMER,KINGLER,POLIWRATH,0
	db 36,MACHAMP,0												;Custom Moves Applied
; Vermilion Gym
	db 36,PERSIAN,ELECTRODE,STARMIE,0							;Custom Moves Applied
JrTrainerMData:
; Pewter Gym
	db 13,GEODUDE,DIGLETT,KABUTO,0								;Custom Moves Applied
; Route 24/Route 25
	db 24,EXEGGUTOR,0											;Custom Moves Applied
; Route 24
	db 24,TANGELA,0												;Custom Moves Applied
; Route 6
	db 30,WARTORTLE,FEAROW,0									;Custom Moves Applied
	db 31,MAROWAK,NIDOKING,0									;Custom Moves Applied
; Route 9
	db 38,NIDOKING,VICTREEBEL,0									;Custom Moves Applied
	db 37,ARBOK,SANDSLASH,RATICATE,DUGTRIO,0					;Custom Moves Applied
; Route 12
	db 29,NIDORAN_M,NIDORINO,0
; Unused
	;db 18,DIGLETT,DIGLETT,SANDSHREW,0
	
JrTrainerFData:
; Cerulean Gym
	db 27,SEEL,POLIWHIRL,DRATINI,0								;Custom Moves Applied
; Route 6
	db 29,STARYU,GLOOM,0										;Custom Moves Applied
	db 31,SANDSLASH,NIDOQUEEN,0									;Custom Moves Applied
; Route 9
	db 38,NIDOQUEEN,VILEPLUME,0									;Custom Moves Applied
	db 38,PERSIAN,CLEFABLE,0									;Custom Moves Applied
; Route 10
	db 38,PIDGEOT,RAICHU,0										;Custom Moves Applied
	db 41,RATICATE,PIDGEOT,0
; Rock Tunnel B1F
	db 39,POLIWHIRL,PERSIAN,ARBOK,0								;Custom Moves Applied
	db 40,DEWGONG,RAPIDASH,0									;Custom Moves Applied
; Celadon Gym
	db 46,TANGELA,TANGELA,TANGELA,0								;Custom Moves Applied
; Route 13
	db 24,PIDGEY,MEOWTH,RATTATA,PIKACHU,MEOWTH,0
	db 30,POLIWAG,POLIWAG,0
	db 27,PIDGEY,MEOWTH,PIDGEY,PIDGEOTTO,0
	db 28,GOLDEEN,POLIWAG,HORSEA,0
; Route 20
	db 31,GOLDEEN,SEAKING,0
	db 30,TENTACOOL,HORSEA,SEEL,0
; Rock Tunnel 1F
	db 40,CLEFABLE,VICTREEBEL,0									;Custom Moves Applied
	db 41,NIDOQUEEN,0											;Custom Moves Applied
	db 39,STARYU,WIGGLYTUFF,KADABRA,0							;Custom Moves Applied
; Route 15
	db 28,GLOOM,ODDISH,ODDISH,0
	db 29,PIKACHU,RAICHU,0
	db 33,CLEFAIRY,0
	db 29,BELLSPROUT,ODDISH,TANGELA,0
; Unused
	;db 22,BULBASAUR,0

PokemaniacData:
; Route 10
	db 39,GOLBAT,DRAGONAIR,TAUROS,0											;Custom Moves Applied
	db 42,MAROWAK,CLOYSTER,BEEDRILL,0										;Custom Moves Applied
; Rock Tunnel B1F
	db 40,CHARIZARD,DRAGONAIR,NIDOKING,0									;Custom Moves Applied
	db 40,VENUSAUR,NINETALES,PORYGON,0										;Custom Moves Applied
	db 40,DUGTRIO,WEEZING,HYPNO,0											;Custom Moves Applied
; Victory Road 2F
	db 40,CHARMELEON,LAPRAS,LICKITUNG,0
; Rock Tunnel 1F
	db 40,SLOWBRO,VILEPLUME,SANDSLASH,0										;Custom Moves Applied
; Route 3
	db 19,MEOWTH,SLOWPOKE,PONYTA,0											;NEW				;Custom Moves Applied
SuperNerdData:
; Mt. Moon 1F
	db 20,ABRA,MAGNEMITE,0													;Custom Moves Applied
; Mt. Moon B2F
	db 22,GRIMER,MR_MIME,MAGNEMITE,0										;Custom Moves Applied
; Route 8
	db 43,MR_MIME,ELECTRODE,VENOMOTH,SCYTHER,STARMIE,0						;Custom Moves Applied
	db 44,HYPNO,GOLDUCK,MAGMAR,ELECTABUZZ,0									;Custom Moves Applied
	db 45,ARBOK,RAPIDASH,SLOWBRO,0											;Custom Moves Applied
; Cinnabar Gym
	db 36,VULPIX,VULPIX,NINETALES,0
	db 34,PONYTA,CHARMANDER,VULPIX,GROWLITHE,0
	db 41,RAPIDASH,0
	db 37,GROWLITHE,VULPIX,0
; Route 6
	db 32,ELECTRODE,KADABRA,HAUNTER,0										;NEW				;Custom Moves Applied
; Celadon Mart Roof
	db 47,MUK,MAGNETON,MR_MIME,PORYGON,0									;NEW				;Custom Moves Applied
	db 47,KADABRA,ELECTRODE,WEEZING,PORYGON,0								;NEW				;Custom Moves Applied
; Unused
	;db 22,KOFFING,MAGNEMITE,WEEZING,0
	;db 20,MAGNEMITE,MAGNEMITE,KOFFING,MAGNEMITE,0
	;db 24,MAGNEMITE,VOLTORB,0
HikerData:
; Mt. Moon 1F
	db 18,MACHOP,RHYHORN,MACHOP,0
; Route 25
	db 24,MACHOP,HITMONLEE,0
	db 23,ONIX,ONIX,ONIX,ONIX,0												;Custom Moves Applied
	db 25,GRAVELER,0														;Custom Moves Applied
; Route 9
	db 38,MACHOKE,ONIX,0													;Custom Moves Applied
	db 37,PRIMEAPE,GRAVELER,HITMONLEE,0										;Custom Moves Applied
; Route 10
	db 40,ONIX,ONIX,ONIX,0													;Custom Moves Applied
	db 42,RHYDON,0															;Custom Moves Applied
; Rock Tunnel B1F
	db 41,HITMONLEE,0														;Custom Moves Applied
	db 41,HITMONCHAN,0
; Route 9/Rock Tunnel B1F
	db 40,GOLEM,0															;Custom Moves Applied
; Rock Tunnel 1F
	db 38,GRAVELER,MACHOKE,GRAVELER,MACHOKE,0
	db 39,ONIX,ONIX,RHYHORN,0
	db 40,RHYHORN,MACHOKE,0
BikerData:
; Route 13
	db 28,KOFFING,KOFFING,KOFFING,0
; Route 14
	db 29,KOFFING,GRIMER,0
; Route 15
	db 25,KOFFING,KOFFING,WEEZING,KOFFING,GRIMER,0
	db 28,KOFFING,GRIMER,WEEZING,0											
; Route 16
	db 58,GRIMER,GRAVELER,MUK,0												;Custom Moves Applied
	db 60,WEEZING,0															;Custom Moves Applied
	db 58,GOLBAT,ELECTRODE,VICTREEBEL,0										;Custom Moves Applied
; Route 17
	db 28,WEEZING,KOFFING,WEEZING,0
	db 33,MUK,0
	db 29,VOLTORB,VOLTORB,0
	db 29,WEEZING,MUK,0
	db 25,KOFFING,WEEZING,KOFFING,KOFFING,WEEZING,0
; Route 14
	db 26,KOFFING,KOFFING,GRIMER,KOFFING,0
	db 28,GRIMER,GRIMER,KOFFING,0
	db 29,KOFFING,MUK,0
BurglarData:
; Cinnabar Gym
	db 36,GROWLITHE,VULPIX,NINETALES,0
	db 41,PONYTA,0
	db 37,VULPIX,GROWLITHE,0
; Mansion 2F
	db 34,CHARMANDER,CHARMELEON,0
; Mansion 3F
	db 38,NINETALES,0
; Mansion B1F
	db 34,GROWLITHE,PONYTA,0
; Pokemon Tower 6F
	db 56,MUK,MACHAMP,RAPIDASH,MAGMAR,0										;NEW	;Custom Moves Applied
	db 56,CHARIZARD,ARCANINE,WEEZING,PRIMEAPE,0								;NEW	;Custom Moves Applied
; Pokemon Tower 7F
	db 57,RATICATE,RAICHU,HITMONLEE,NINETALES,TAUROS,0						;NEW	;Custom Moves Applied
; Unused
;	db 29,GROWLITHE,VULPIX,0
;	db 33,GROWLITHE,0
;	db 28,VULPIX,CHARMANDER,PONYTA,0
EngineerData:
; Route 11
	db 38,MUK,0																;Custom Moves Applied
	db 34,GRIMER,MAGNETON,PORYGON,0											;Custom Moves Applied
; Unused
;	db 21,VOLTORB,MAGNEMITE,0
Juggler1Data:
; none
FisherData:
; SS Anne 2F Rooms
	db 34,SLOWPOKE,SEAKING,CLOYSTER,0										;Custom Moves Applied
; SS Anne B1F Rooms
	db 34,MAGIKARP,KRABBY,GYARADOS,0										;Custom Moves Applied
; Route 12
	db 22,GOLDEEN,POLIWAG,GOLDEEN,0
	db 24,TENTACOOL,GOLDEEN,0
	db 27,GOLDEEN,0
	db 21,POLIWAG,SHELLDER,GOLDEEN,HORSEA,0
; Route 21
	db 28,SEAKING,GOLDEEN,SEAKING,SEAKING,0
	db 31,SHELLDER,CLOYSTER,0
	db 27,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,MAGIKARP,0
	db 33,SEAKING,GOLDEEN,0
; Route 12
	db 24,MAGIKARP,MAGIKARP,0
SwimmerData:
; Cerulean Gym
	db 26,HORSEA,SHELLDER,0													;Custom Moves Applied
; Route 19
	db 30,TENTACOOL,SHELLDER,0
	db 29,GOLDEEN,HORSEA,STARYU,0
	db 30,POLIWAG,POLIWHIRL,0
	db 27,HORSEA,TENTACOOL,TENTACOOL,GOLDEEN,0
	db 29,GOLDEEN,SHELLDER,SEAKING,0
	db 30,HORSEA,HORSEA,0
	db 27,TENTACOOL,TENTACOOL,STARYU,HORSEA,TENTACRUEL,0
; Route 20
	db 31,SHELLDER,CLOYSTER,0
	db 35,STARYU,0
	db 28,HORSEA,HORSEA,SEADRA,HORSEA,0
; Route 21
	db 33,SEADRA,TENTACRUEL,0
	db 37,STARMIE,0
	db 33,STARYU,WARTORTLE,0
	db 32,POLIWHIRL,TENTACOOL,SEADRA,0
CueBallData:
; Route 16
	db 58,MACHOKE,PRIMEAPE,WEEZING,0										;Custom Moves Applied
	db 59,ELECTRODE,ELECTRODE,0												;Custom Moves Applied
	db 58,WEEZING,PRIMEAPE,MACHOKE,0										;Custom Moves Applied
; Route 17
	db 29,MANKEY,PRIMEAPE,0
	db 29,MACHOP,MACHOKE,0
	db 33,MACHOKE,0
	db 26,MANKEY,MANKEY,MACHOKE,MACHOP,0
	db 29,PRIMEAPE,MACHOKE,0
; Route 21
	db 31,TENTACOOL,TENTACOOL,TENTACRUEL,0
GamblerData:
; Route 11
	db 33,POLIWHIRL,SEADRA,0												;Custom Moves Applied
	db 33,GLOOM,ELECTRODE,0													;Custom Moves Applied
	db 33,ELECTRODE,PARASECT,0												;Custom Moves Applied
	db 33,IVYSAUR,NINETALES,0												;Custom Moves Applied
; Route 8
	db 43,GRAVELER,WEEZING,ELECTRODE,0
	db 44,MAGNETON,TANGELA,SNORLAX,0										;Custom Moves Applied
; Route 16
	db 50,SNORLAX,0															;Custom Moves Applied
; Unused
	;db 22,ONIX,GEODUDE,GRAVELER,0
BeautyData:
; Celadon Gym
	db 46,VICTREEBEL,TENTACRUEL,PARASECT,0									;Custom Moves Applied
	db 46,VILEPLUME,WIGGLYTUFF,TANGELA,0									;Custom Moves Applied
	db 46,VENUSAUR,PINSIR,PARASECT,0										;Custom Moves Applied
; Route 13
	db 27,RATTATA,PIKACHU,RATTATA,0
	db 29,CLEFAIRY,MEOWTH,0
; Route 20
	db 35,SEAKING,0
	db 30,SHELLDER,SHELLDER,CLOYSTER,0
	db 31,POLIWAG,SEAKING,0
; Route 15
	db 29,PIDGEOTTO,WIGGLYTUFF,0
	db 29,BULBASAUR,IVYSAUR,0
; Route 19
	db 27,POLIWAG,GOLDEEN,SEAKING,GOLDEEN,POLIWAG,0
	db 30,GOLDEEN,SEAKING,0
	db 29,STARYU,STARYU,STARYU,0
; Route 20
	db 30,SEADRA,HORSEA,SEADRA,0
; Unused
	;db 33,WEEPINBELL,BELLSPROUT,WEEPINBELL,0
PsychicData:
; Saffron Gym
	db 31,KADABRA,SLOWPOKE,MR_MIME,KADABRA,0
	db 34,MR_MIME,KADABRA,0
	db 33,SLOWPOKE,SLOWPOKE,SLOWBRO,0
	db 38,SLOWBRO,0
RockerData:
; Vermilion Gym
	db 37,WEEZING,ELECTRODE,MAGNETON,0										;Custom Moves Applied
; Route 12
	db 29,VOLTORB,ELECTRODE,0
JugglerData:
; Silph Co. 5F
	db 29,KADABRA,MR_MIME,0
; Victory Road 2F
	db 41,DROWZEE,HYPNO,KADABRA,KADABRA,0
	db 48,MR_MIME,0
; Fuchsia Gym
	db 31,DROWZEE,DROWZEE,KADABRA,DROWZEE,0
	db 38,HYPNO,0
	db 34,DROWZEE,HYPNO,0
	db 34,DROWZEE,KADABRA,0
; Rocket Hideout B4F
	db 50,HYPNO,MR_MIME,GRAVELER,ELECTABUZZ,0								;NEW	;Custom Moves Applied
	db 50,MACHOKE,PRIMEAPE,JYNX,MAGMAR,0									;NEW	;Custom Moves Applied
; Pokemon Tower 7F
	db 57,ELECTRODE,GOLEM,ELECTRODE,0										;NEW	;Custom Moves Applied
	db 57,ONIX,HYPNO,ONIX,0													;NEW	;Custom Moves Applied
; Unused
	;db 33,HYPNO,0
TamerData:
; Fuchsia Gym
	db 34,SANDSLASH,ARBOK,0
	db 33,ARBOK,SANDSLASH,ARBOK,0
; Viridian Gym
	db 43,RHYHORN,0
	db 39,ARBOK,TAUROS,0
; Victory Road 2F
	db 44,PERSIAN,GOLDUCK,0
; Unused
	;db 42,RHYHORN,PRIMEAPE,ARBOK,TAUROS,0
BirdKeeperData:
; Route 13
	db 29,PIDGEY,PIDGEOTTO,0
	db 25,SPEAROW,PIDGEY,PIDGEY,SPEAROW,SPEAROW,0
	db 26,PIDGEY,PIDGEOTTO,SPEAROW,FEAROW,0
; Route 14
	db 33,FARFETCHD,0
	db 29,SPEAROW,FEAROW,0
; Route 15
	db 26,PIDGEOTTO,FARFETCHD,DODUO,PIDGEY,0
	db 28,DODRIO,DODUO,DODUO,0
; Route 18
	db 29,SPEAROW,FEAROW,0
	db 34,DODRIO,0
	db 26,SPEAROW,SPEAROW,FEAROW,SPEAROW,0
; Route 20
	db 30,FEAROW,FEAROW,PIDGEOTTO,0
; Route 14
	db 28,PIDGEY,DODUO,PIDGEOTTO,0
	db 26,PIDGEY,SPEAROW,PIDGEY,FEAROW,0
	db 29,PIDGEOTTO,FEAROW,0
	db 28,SPEAROW,DODUO,FEAROW,0
; Unused
	;db 39,PIDGEOTTO,PIDGEOTTO,PIDGEY,PIDGEOTTO,0
	;db 42,FARFETCHD,FEAROW,0
BlackbeltData:
; Fighting Dojo
	db 37,HITMONLEE,HITMONCHAN,0
	db 31,MANKEY,MANKEY,PRIMEAPE,0
	db 32,MACHOP,MACHOKE,0
	db 36,PRIMEAPE,0
	db 31,MACHOP,MANKEY,PRIMEAPE,0
; Viridian Gym
	db 40,MACHOP,MACHOKE,0
	db 43,MACHOKE,0
	db 38,MACHOKE,MACHOP,MACHOKE,0
; Victory Road 2F
	db 43,MACHOKE,MACHOP,MACHOKE,0
; Route 4
	db 20,HITMONCHAN,0														;NEW				;Custom Moves Applied
Green1Data:
	db 5,SQUIRTLE,0
	db 5,BULBASAUR,0
	db 5,CHARMANDER,0
; Route 22
	db $FF,8,DROWZEE,8,RHYHORN,9,EEVEE,9,SQUIRTLE,0								;Custom Moves Applied
	db $FF,8,DROWZEE,8,RHYHORN,9,EEVEE,9,BULBASAUR,0							;Custom Moves Applied
	db $FF,8,DROWZEE,8,RHYHORN,9,EEVEE,9,CHARMANDER,0							;Custom Moves Applied
; Cerulean City
	db $FF,22,RHYHORN,22,DROWZEE,23,FEAROW,23,EEVEE,24,WARTORTLE,0				;Custom Moves Applied
	db $FF,22,RHYHORN,22,DROWZEE,23,FEAROW,23,EEVEE,24,IVYSAUR,0				;Custom Moves Applied
	db $FF,22,RHYHORN,22,DROWZEE,23,FEAROW,23,EEVEE,24,CHARMELEON,0				;Custom Moves Applied
ProfOakData:
; Unused
	db $FF,66,TAUROS,67,EXEGGUTOR,68,ARCANINE,69,BLASTOISE,70,GYARADOS,0
	db $FF,66,TAUROS,67,EXEGGUTOR,68,ARCANINE,69,VENUSAUR,70,GYARADOS,0
	db $FF,66,TAUROS,67,EXEGGUTOR,68,ARCANINE,69,CHARIZARD,70,GYARADOS,0
ChiefData:
	db 52,DRAGONAIR,RAICHU,RAPIDASH,SLOWBRO,CHANSEY,AERODACTYL,0			;NEW				;Custom Moves Applied
	db 58,NIDOKING,RAPIDASH,DUGTRIO,LAPRAS,PINSIR,DRAGONITE,0				;NEW				;Custom Moves Applied
ScientistData:
; Silph Co. 2F
	db 26,GRIMER,WEEZING,KOFFING,WEEZING,0
	db 28,MAGNEMITE,VOLTORB,MAGNETON,0
; Silph Co. 3F
	db 29,ELECTRODE,WEEZING,0
; Silph Co. 4F
	db 33,ELECTRODE,0
; Silph Co. 5F
	db 26,MAGNETON,KOFFING,WEEZING,MAGNEMITE,0
; Silph Co. 6F
	db 25,VOLTORB,KOFFING,MAGNETON,MAGNEMITE,KOFFING,0
; Silph Co. 7F
	db 29,ELECTRODE,MUK,0
; Silph Co. 8F
	db 29,GRIMER,ELECTRODE,0
; Silph Co. 9F
	db 28,VOLTORB,KOFFING,MAGNETON,0
; Silph Co. 10F
	db 29,MAGNEMITE,KOFFING,0
; Mansion 3F
	db 33,MAGNEMITE,MAGNETON,VOLTORB,0
; Mansion B1F
	db 34,MAGNEMITE,ELECTRODE,0
; Unused/joenote - restored and put in Mansion 1F
	db 34,KOFFING,VOLTORB,0
; Rocket Hideout B2F
	db 50,KADABRA,MAGNETON,TANGELA,ARBOK,0					;NEW				;Custom Moves Applied
; Rocket Hideout B3F
	db 51,DUGTRIO,DODRIO,MAGNETON,0							;NEW				;Custom Moves Applied
GiovanniData:
; Rocket Hideout B4F
	db $FF,53,KINGLER,53,GOLEM,54,MACHAMP,54,RHYDON,55,CLOYSTER,55,PERSIAN,0	;Custom Moves Applied
; Silph Co. 11F
	db $FF,37,NIDORINO,35,KANGASKHAN,37,RHYHORN,41,NIDOQUEEN,0
; Viridian Gym
	db $FF,60,ARM_MEWTWO,0														;Custom Moves Applied
RocketData:
; Mt. Moon B2F
	db 21,EKANS,KOFFING,ZUBAT,0													;Custom Moves Applied
	db 18,DROWZEE,KOFFING,GRIMER,0
	db 19,VOLTORB,GRIMER,0														;Custom Moves Applied
	db 20,RATICATE,0															;Custom Moves Applied
; Cerulean City
	db 30,MACHOKE,HYPNO,0														;Custom Moves Applied
; Route 24
	db 24,GEODUDE,GASTLY,MACHOP,ABRA,0											;Custom Moves Applied
; Game Corner
	db 20,RATICATE,ZUBAT,0
; Rocket Hideout B1F
	db 48,HYPNO,MACHOKE,MACHOKE,HYPNO,0											;Custom Moves Applied
	db 48,BEEDRILL,RATICATE,RATICATE,BEEDRILL,0									;Custom Moves Applied
	db 51,WEEZING,0																;Custom Moves Applied
	db 51,MUK,0																	;Custom Moves Applied
	db 49,ELECTRODE,ELECTRODE,ELECTRODE,0										;Custom Moves Applied
; Rocket Hideout B2F
	db 48,DROWZEE,GOLBAT,MACHOKE,KADABRA,ARBOK,0								;Custom Moves Applied
; Rocket Hideout B3F
	db 51,MR_MIME,POLIWRATH,ARBOK,0												;Custom Moves Applied
	db 51,GOLBAT,GOLBAT,GOLBAT,0												;Custom Moves Applied
; Rocket Hideout B4F
	db 51,ELECTRODE,GRAVELER,WEEZING,0											;Custom Moves Applied
	db 51,MUK,EXEGGCUTE,ELECTRODE,0												;Custom Moves Applied
	db 50,PRIMEAPE,TENTACRUEL,LICKITUNG,MAROWAK,0								;Custom Moves Applied
; Pokémon Tower 7F
	db 57,CLOYSTER,SANDSLASH,GOLBAT,HYPNO,0										;Custom Moves Applied
	db 57,MR_MIME,RATICATE,RATICATE,MR_MIME,0									;Custom Moves Applied
	db 57,ARBOK,HAUNTER,MACHOKE,SNORLAX,0										;Custom Moves Applied
; Silph Co. 2F
	db 29,CUBONE,ZUBAT,0
	db 25,GOLBAT,ZUBAT,ZUBAT,RATICATE,ZUBAT,0
; Silph Co. 3F
	db 28,RATICATE,HYPNO,RATICATE,0
; Silph Co. 4F
	db 29,MACHOP,DROWZEE,0
	db 28,EKANS,ZUBAT,CUBONE,0
; Silph Co. 5F
	db 33,ARBOK,0
	db 33,HYPNO,0
; Silph Co. 6F
	db 29,MACHOP,MACHOKE,0
	db 28,ZUBAT,ZUBAT,GOLBAT,0
; Silph Co. 7F
	db 26,RATICATE,ARBOK,KOFFING,GOLBAT,0
	db 29,CUBONE,CUBONE,0
	db 29,SANDSHREW,SANDSLASH,0
; Silph Co. 8F
	db 26,RATICATE,ZUBAT,GOLBAT,RATTATA,0
	db 28,WEEZING,GOLBAT,KOFFING,0
; Silph Co. 9F
	db 28,DROWZEE,GRIMER,MACHOP,0
	db 28,GOLBAT,DROWZEE,HYPNO,0
; Silph Co. 10F
	db 33,MACHOKE,0
; Silph Co. 11F
	db 25,RATTATA,RATTATA,ZUBAT,RATTATA,EKANS,0
	db 32,CUBONE,DROWZEE,MAROWAK,0
; Lavender Pokecenter
	db 42,GOLBAT,HAUNTER,CLOYSTER,0							;NEW
; Unused
	;db 26,DROWZEE,KOFFING,0
CooltrainerMData:
; Viridian Gym
	db 39,NIDORINO,NIDOKING,0
; Victory Road 3F
	db 43,EXEGGUTOR,CLOYSTER,ARCANINE,0
	db 43,KINGLER,TENTACRUEL,BLASTOISE,0
; Victory Road 1F
	db 42,IVYSAUR,WARTORTLE,CHARMELEON,CHARIZARD,0
; Viridian Gym
	db 39,SANDSLASH,DUGTRIO,0
	db 43,RHYHORN,0
; Route 11
	db 40,SANDSHREW,0																	;Custom Moves Applied
; Celadon Mansion 4F
	db 48,VAPOREON,FLAREON,JOLTEON,NIDOKING,0				;NEW						;Custom Moves Applied
; Unused
	;db 45,KINGLER,STARMIE,0
	;db 44,IVYSAUR,WARTORTLE,CHARMELEON,0
	;db 49,NIDOKING,0
	;db 44,KINGLER,CLOYSTER,0
CooltrainerFData:
; Celadon Gym
	db 47,PARASECT,VICTREEBEL,FARFETCHD,TANGELA,0										;Custom Moves Applied
; Victory Road 3F
	db 43,BELLSPROUT,WEEPINBELL,VICTREEBEL,0
	db 43,PARASECT,DEWGONG,CHANSEY,0
; Victory Road 1F
	db 44,PERSIAN,NINETALES,0
;Route 2
	db 12,CHANSEY,0											;NEW						;Custom Moves Applied
; Celadon Mansion 4F
	db 48,DITTO,WIGGLYTUFF,CLEFABLE,NIDOQUEEN,0				;NEW						;Custom Moves Applied
; Unused
	;db 45,IVYSAUR,VENUSAUR,0
	;db 45,NIDORINA,NIDOQUEEN,0
	;db 43,PERSIAN,NINETALES,RAICHU,0

BrunoData:
	db $FF,53,ONIX,55,HITMONCHAN,55,HITMONLEE,56,ONIX,58,MACHAMP,0
BrockData:
	db $FF,13,GEODUDE,13,SUDOWOODO,14,ZUBAT,14,TANGELA,15,ONIX,15,DIMONIX,0				;Custom Moves Applied
MistyData:
	db $FF,28,STARYU,28,PSYDUCK,29,GYARADOS,30,DRAGONAIR,30,STARMIE,0					;Custom Moves Applied
LtSurgeData:
	db $FF,38,MAGNETON,38,ELECTABUZZ,39,TAUROS,40,JOLTEON,40,RAICHU,0					;Custom Moves Applied
ErikaData:
	db $FF,48,VENUSAUR,48,VICTREEBEL,49,CLEFABLE,49,GENGAR,50,EXEGGUTOR,50,VILEPLUME,0	;Custom Moves Applied
KogaData:
	db $FF,37,KOFFING,39,MUK,37,KOFFING,43,WEEZING,0
BlaineData:
	db $FF,42,GROWLITHE,40,PONYTA,42,RAPIDASH,47,ARCANINE,0
SabrinaData:
	db $FF,38,KADABRA,37,MR_MIME,38,VENOMOTH,43,ALAKAZAM,0
GentlemanData:
; SS Anne 1F Rooms
	db 35,DRAGONAIR,LICKITUNG,ARCANINE,0												;Custom Moves Applied
	db 35,NINETALES,HITMONLEE,SNORLAX,0													;Custom Moves Applied
; SS Anne 2F Rooms/Vermilion Gym
	db 35,EEVEE,TANGELA,HAUNTER,0														;Custom Moves Applied
; SS Anne 2F Rooms
	db 35,KADABRA,RATICATE,STARMIE,0													;Custom Moves Applied
; Route 11
	db 34,BEEDRILL,EXEGGUTOR,DUGTRIO,0													;Custom Moves Applied
; Unused
	;db 48,PRIMEAPE,0
Green2Data:
; SS Anne 2F
	db $FF,36,RHYHORN,36,HYPNO,37,FEAROW,37,EEVEE,38,BLASTOISE,0						;Custom Moves Applied
	db $FF,36,RHYHORN,36,HYPNO,37,FEAROW,37,EEVEE,38,VENUSAUR,0							;Custom Moves Applied
	db $FF,36,RHYHORN,36,HYPNO,37,FEAROW,37,EEVEE,38,CHARIZARD,0						;Custom Moves Applied
; Pokémon Tower 2F
	db $FF,53,RHYDON,53,HYPNO,54,GYARADOS,54,NIDOKING,55,FLAREON,55,BLASTOISE,0			;Custom Moves Applied
	db $FF,53,RHYDON,53,HYPNO,54,GYARADOS,54,NIDOKING,55,VAPOREON,55,VENUSAUR,0			;Custom Moves Applied
	db $FF,53,RHYDON,53,HYPNO,54,GYARADOS,54,NIDOKING,55,JOLTEON,55,CHARIZARD,0			;Custom Moves Applied
; Route 18 (NEW)
	db $FF,53,RHYDON,53,HYPNO,54,GYARADOS,54,NIDOKING,55,FLAREON,55,BLASTOISE,0			;Custom Moves Applied
	db $FF,53,RHYDON,53,HYPNO,54,GYARADOS,54,NIDOKING,55,VAPOREON,55,VENUSAUR,0			;Custom Moves Applied
	db $FF,53,RHYDON,53,HYPNO,54,GYARADOS,54,NIDOKING,55,JOLTEON,55,CHARIZARD,0			;Custom Moves Applied
; Silph Co. 7F
	db $FF,37,PIDGEOT,38,GROWLITHE,35,EXEGGCUTE,35,ALAKAZAM,40,BLASTOISE,0
	db $FF,37,PIDGEOT,38,GYARADOS,35,GROWLITHE,35,ALAKAZAM,40,VENUSAUR,0
	db $FF,37,PIDGEOT,38,EXEGGCUTE,35,GYARADOS,35,ALAKAZAM,40,CHARIZARD,0
; Route 22
	db $FF,47,PIDGEOT,45,RHYHORN,45,GROWLITHE,47,EXEGGCUTE,50,ALAKAZAM,53,BLASTOISE,0
	db $FF,47,PIDGEOT,45,RHYHORN,45,GYARADOS,47,GROWLITHE,50,ALAKAZAM,53,VENUSAUR,0
	db $FF,47,PIDGEOT,45,RHYHORN,45,EXEGGCUTE,47,GYARADOS,50,ALAKAZAM,53,CHARIZARD,0
Green3Data:
	db $FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,ARCANINE,63,EXEGGUTOR,65,BLASTOISE,0
	db $FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,GYARADOS,63,ARCANINE,65,VENUSAUR,0
	db $FF,61,PIDGEOT,59,ALAKAZAM,61,RHYDON,61,EXEGGUTOR,63,GYARADOS,65,CHARIZARD,0
LoreleiData:
	db $FF,54,DEWGONG,53,CLOYSTER,54,SLOWBRO,56,JYNX,56,LAPRAS,0
ChannelerData:
; Pokémon Tower 3F
	db 53,HAUNTER,KABUTOPS,HAUNTER,0													;Custom Moves Applied
	db 54,HAUNTER,HAUNTER,0																;Custom Moves Applied
	db 53,GASTLY,HAUNTER,GASTLY,0														;Custom Moves Applied
; Pokémon Tower 4F
	db 53,SANDSLASH,GASTLY,CLEFABLE,HAUNTER,0											;Custom Moves Applied
	db 56,GENGAR,0																		;Custom Moves Applied
	db 53,WIGGLYTUFF,HAUNTER,MAROWAK,GASTLY,0											;Custom Moves Applied
; Pokémon Tower 5F
	db 55,KINGLER,HAUNTER,RATICATE,0													;Custom Moves Applied
	db 54,CLEFABLE,HYPNO,HAUNTER,GASTLY,0												;Custom Moves Applied
	db 53,GASTLY,GASTLY,SCYTHER,GASTLY,GASTLY,0											;Custom Moves Applied
	db 56,PERSIAN,GENGAR,0																;Custom Moves Applied
; Pokémon Tower 6F
	db 55,LICKITUNG,GASTLY,DITTO,GENGAR,0												;Custom Moves Applied
	db 56,KADABRA,GENGAR,VILEPLUME,0													;Custom Moves Applied
	db 56,HAUNTER,EXEGGUTOR,HAUNTER,0													;Custom Moves Applied
; Saffron Gym
	db 34,GASTLY,HAUNTER,0
	db 38,HAUNTER,0
	db 33,GASTLY,GASTLY,HAUNTER,0
; Pokemon Tower 3F (Additional)
	db 52,GASTLY,MAROWAK,EXEGGUTOR,GASTLY,0												;Custom Moves Applied
	db 53,KADABRA,VILEPLUME,HAUNTER,0													;Custom Moves Applied
	db 53,KABUTOPS,VICTREEBEL,HYPNO,0													;Custom Moves Applied
; Pokemon Tower 1F (Additional)
	db 50,GASTLY,MR_MIME,VENUSAUR,OMASTAR,LICKITUNG,HAUNTER,0		;NEW				;Custom Moves Applied
; Pokemon Tower 7F (Additional)
; Unused
	;db 22,GASTLY,0
	;db 24,GASTLY,0
	;db 23,GASTLY,GASTLY,0
	;db 24,GASTLY,0
	;db 24,HAUNTER,0
	;db 24,GASTLY,0
	;db 24,GASTLY,0
	;db 24,GASTLY,0
AgathaData:
	db $FF,56,GENGAR,56,GOLBAT,55,HAUNTER,58,ARBOK,60,GENGAR,0
LanceData:
	db $FF,58,GYARADOS,56,DRAGONAIR,56,DRAGONAIR,60,AERODACTYL,62,DRAGONITE,0
