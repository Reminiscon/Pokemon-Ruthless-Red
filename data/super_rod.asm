; super rod data
; format: map, pointer to fishing group
SuperRodData:
	dbw PALLET_TOWN, FishingGroup1
	dbw VIRIDIAN_CITY, FishingGroup1
	dbw CERULEAN_CITY, FishingGroup11	;FishingGroup3
	dbw VERMILION_CITY, FishingGroup4
	dbw CELADON_CITY, FishingGroup5
	dbw FUCHSIA_CITY, FishingGroup10
	dbw CINNABAR_ISLAND, FishingGroup8
	dbw ROUTE_4, FishingGroup3
	dbw ROUTE_6, FishingGroup4
	dbw ROUTE_10, FishingGroup5
	dbw ROUTE_11, FishingGroup4
	dbw ROUTE_12, FishingGroup7
	dbw ROUTE_13, FishingGroup7
	dbw ROUTE_17, FishingGroup7
	dbw ROUTE_18, FishingGroup7
	dbw ROUTE_19, FishingGroup8
	dbw ROUTE_20, FishingGroup8
	dbw ROUTE_21, FishingGroup8
	dbw ROUTE_22, FishingGroup2
	dbw ROUTE_23, FishingGroup9
	dbw ROUTE_24, FishingGroup3
	dbw ROUTE_25, FishingGroup3
	dbw CERULEAN_GYM, FishingGroup3
	dbw VERMILION_DOCK, FishingGroup4
	dbw SEAFOAM_ISLANDS_4, FishingGroup8
	dbw SEAFOAM_ISLANDS_5, FishingGroup8
	dbw SAFARI_ZONE_EAST, FishingGroup6
	dbw SAFARI_ZONE_NORTH, FishingGroup6
	dbw SAFARI_ZONE_WEST, FishingGroup6
	dbw SAFARI_ZONE_CENTER, FishingGroup6
	dbw UNKNOWN_DUNGEON_2, FishingGroup9
	dbw UNKNOWN_DUNGEON_3, FishingGroup9	;FishingGroup2
	dbw UNKNOWN_DUNGEON_1, FishingGroup9	
	db $FF

; fishing groups
; number of monsters, followed by level/monster pairs
FishingGroup1:
	db 4
	db 65,MR_MIME
	db 65,MAGIKARP
	db 65,POLIWAG
	db 65,PSYDUCK

FishingGroup2:
	db 2
	db 65,GOLDEEN
	db 65,POLIWAG

FishingGroup3:
	db 3
	db 65,PSYDUCK
	db 65,GOLDEEN
	db 65,KRABBY

FishingGroup4:
	db 4
	db 65,QWILFISH
	db 65,SHELLDER
	db 65,SEEL
	db 65,KRABBY

FishingGroup5:
	db 2
	db 73,QWILFISH
	db 65,TENTACOOL

FishingGroup6:
	db 4
	db 55,DRATINI
	db 55,CORSOLA
	db 55,QWILFISH
	db 55,WOOPER

FishingGroup7:
	db 4
	db 55,TENTACOOL
	db 65,KRABBY
	db 65,SEEL
	db 65,MAGIKARP

FishingGroup8:
	db 4
	db 65,STARYU
	db 65,PSYDUCK
	db 65,SEEL
	db 65,SLOWPOKE

FishingGroup9:
	db 4
	db 100,DRAGONAIR
	db 100,KINGLER
	db 100,SLOWBRO
	db 100,GYARADOS

FishingGroup10:
	db 4
	db 63,CLOYSTER
	db 55,SHELLDER
	db 55,GOLDEEN
	db 55,MAGIKARP
	
FishingGroup11:		;NEW
	db 4
	db 5,DRATINI
	db 5,DRATINI
	db 5,DRATINI
	db 5,DRATINI
