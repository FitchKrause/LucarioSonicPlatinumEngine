// Main
#macro PROYECTNAME "Sonic Platinum Engine"
#macro VERSION "Alpha 10"
#macro SAVEFILESETTINGS "enginesettings.data"
//#macro SAVEFILEKEYBOARD "keyboard.data"
//#macro SAVEFILEGAMEPAD "gamepad.data"
#macro MASTERKEY "LucarioTheAuraPokemon"
#macro MAX_SCORE 999999999
#macro MAX_RINGS 9999
#macro MAX_LIVES 9999
#macro CHANGE_SCORE 50000
#macro CHANGE_RINGS 100

// Music system state
#macro MUSSTATE_SILENCE 0
#macro MUSSTATE_LOOP 1
#macro MUSSTATE_SINGLE 2
#macro MUSSTATE_OVERLAY 3

// Music system flags
#macro MUSFLAG_NOSTOP 1 // Music continues on room changes
#macro MUSFLAG_NOFADE 2 // Music volume holds on trasitions
#macro MUSFLAG_NOCHANGE 4 // Music locked from changing, except for overlay
#macro MUSFLAG_NOCHANGEOVERLAY 8 // Overlay locked from changing, except for music
#macro MUSFLAG_LOCKED 16 // Music soft-lock

// Music playing flags
#macro MUSPLAYFLAG_NOFORCE 1 // Plays only if the specified music isn't playing
#macro MUSPLAYFLAG_FADING 2 // Fading out when starting playing

// Direction
#macro DIRECTION_LEFT -1
#macro DIRECTION_RIGHT 1
#macro DIRECTION_TOP -2
#macro DIRECTION_BOTTOM 2

// Input
#macro INPUT_UP 1
#macro INPUT_DOWN 2
#macro INPUT_LEFT 4
#macro INPUT_RIGHT 8
#macro INPUT_A 16
#macro INPUT_B 32
#macro INPUT_C 64
#macro INPUT_ACTION (INPUT_A|INPUT_B|INPUT_C)
#macro INPUT_X 128
#macro INPUT_Y 256
#macro INPUT_Z 512
#macro INPUT_ACTION2 (INPUT_X|INPUT_Y|INPUT_Z)
#macro INPUT_START 1024
#macro INPUT_SELECT 2048

// Characters (identifiers)
#macro CHARACTER_SONIC 1
#macro CHARACTER_TAILS 2
#macro CHARACTER_KNUCKLES 3

// Harmful
#macro HARMFUL_NORMAL 1
#macro HARMFUL_FIRE 2
#macro HARMFUL_ELETRIC 3 
#macro HARMFUL_PROJECTILE 4
#macro HARMFUL_WATER 5

// Shield
#macro SHIELD_NONE -1
#macro SHIELD_NORMAL 0
#macro SHIELD_LIGHTNING 1
#macro SHIELD_BUBBLE 2
#macro SHIELD_FIRE 3
#macro SHIELD_INSTASHIELD 99
#macro SHIELD_ROCK 4
#macro SHIELD_AIR 5
#macro SHIELD_GRAVITY 6
#macro SHIELD_ICE 7
#macro SHIELD_GLUE 8

// Monitors
#macro MONITOR_EXTRALIFE 0
#macro MONITOR_EGGMAN 1
#macro MONITOR_RINGBOX 2
#macro MONITOR_SUPERSNEAKERS 3
#macro MONITOR_SHIELDNORMAL 4
#macro MONITOR_SHIELDBUBBLE 5
#macro MONITOR_SHIELDLIGHTNING 6
#macro MONITOR_SHIELDFIRE 7
#macro MONITOR_INVINCIBILITY 8
#macro MONITOR_EXTRATIME 9
#macro MONITOR_SCOREBOX 10
#macro MONITOR_SUPERSCOREBOX 11
#macro MONITOR_RANDOM 12

// Gametypes
#macro GAMETYPE_SINGLEPLAYER 0
#macro GAMETYPE_COOPERATIVE 1
#macro GAMETYPE_COMPETITION 2

// Chaos emeralds
#macro CHAOSEMERALD_GREEN 1
#macro CHAOSEMERALD_PINK 2
#macro CHAOSEMERALD_BLUE 4
#macro CHAOSEMERALD_CYAN 8
#macro CHAOSEMERALD_ORANGE 16
#macro CHAOSEMERALD_RED 32
#macro CHAOSEMERALD_GRAY 64

// Extra
#macro AURACRYSTAL 1024

// player ability
#macro PLABILITY_NONE 0
#macro PLABILITY_FLY 1
#macro PLABILITY_SWIM 2
#macro PLABILITY_GILDE 3
#macro PLABILITY_CLIMB 4
#macro PLABILITY_HORMING_ATTACK 5
#macro PLABILITY_PLANE 6
#macro PLABILITY_STOMP 7
#macro PLABILITY_HAMMER 8
#macro PLABILITY_PUNCH 9
#macro PLABILITY_DOUBLE_JUMP 10
#macro PLABILITY_CLIMB_N_GILDE 97
#macro PLABILITY_FLY_N_SWIM 98
#macro PLABILITY_SHIELDS 99
#macro PLABILITY_TRANSFORM 100

// player deny flags
#macro PLAYERSTATE_NOINPUT 1
#macro PLAYERSTATE_NOJUMPACTION 2
#macro PLAYERSTATE_NOROTATE 4
#macro PLAYERSTATE_NOSTATE 8
#macro PLAYERSTATE_NOANIMATE 16
#macro PLAYERSTATE_NOUPDATEVISIBLE 32
#macro PLAYERSTATE_NOSPINDASH 64
#macro PLAYERSTATE_NOPEELOUT 128
#macro PLAYERSTATE_NOROLLING 256
#macro PLAYERSTATE_NOJUMPING 512
#macro PLAYERSTATE_NOCROUCHING 1024
#macro PLAYERSTATE_NOLOOKING 2048
#macro PLAYERSTATE_NOUNCURL 4096
#macro PLAYERSTATE_NORECURL 8192

// player state flags
#macro PLSTATE_SPINNING 1
#macro PLSTATE_JUMPIMG 2
#macro PLSTATE_JUMP_ACTION 4
#macro PLSTATE_DROPDASH_ACTION 8
#macro PLSTATE_SPINDASHING 16
#macro PLSTATE_PEELOUTING 32
#macro PLSTATE_DROPDASHING 64
#macro PLSTATE_UNDERWATER 128
#macro PLSTATE_NO_AIR 256
#macro PLSTATE_FLOATING 512
#macro PLSTATE_SUPERFORM 1024
#macro PLSTATE_VULNERABILITY 2048
#macro PLSTATE_REVERSED_INPUT 4096

// level flags
#macro LEVELFLAG_INFINITETIME 1
#macro LEVELFLAG_NOACT 2
#macro LEVELFLAG_NOZONE 4
#macro LEVELFLAG_SKIPTITLECARD 8
#macro LEVELFLAG_SKIPSCORECARD 16
#macro LEVELFLAG_NOBONUES 32
#macro LEVELFLAG_NORELOAD 64
#macro LEVELFLAG_REVERSETIMER 128
#macro LEVELFLAG_INFINITELIVES 256
#macro LEVELFLAG_SPECIALSTAGE 2048

// style type
#macro STYLETYPE_ENGINE 0
#macro STYLETYPE_SONIC1 1
#macro STYLETYPE_SONIC2 2
#macro STYLETYPE_SONIC3 3
#macro STYLETYPE_SONICCD 4

// surface angle flags
#macro ANGLEFLAG_COLLISION 1
#macro ANGLEFLAG_LAUNCH 2
#macro ANGLEFLAG_ROTATE 4
#macro ANGLEFLAG_ALL (ANGLEFLAG_COLLISION|ANGLEFLAG_LAUNCH|ANGLEFLAG_ROTATE)

// angle sensor flags
#macro ANGLEDIR_BOTTOM 2
#macro ANGLEDIR_RIGHT 4
#macro ANGLEDIR_TOP 8
#macro ANGLEDIR_LEFT 16