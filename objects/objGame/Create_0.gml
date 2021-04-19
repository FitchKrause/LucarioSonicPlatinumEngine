/// @description  Game operations

depth = -4096;
audio_listener_orientation(0, 0, 100, 0, -1, 0);
retro_palette_initialize(shdPalleteSwapper);
show_debug_overlay(true);

// Particles
particles = part_system_create();

// Gamemodes
mode = GAMETYPE_SINGLEPLAYER;
/***************************************************************************
   Gamemode states:
   - 1 = Singleplayer
   - 2 = Competition (2 player splitscreen) (Disabled)
   - 3 = Time Attack (Unused)
***************************************************************************/

// States
paused = false; // Game paused
can_pause = false; // If the player can pause
lost_focus = false; // Lost focus window (Never used)

// GIF states
gif_enabled = false;
gif_tick = 0;
gif_handle = -1;

// Global states
global.is_demomode = false; // If the game is on gameplay demostration mode (Unused)
global.is_levelselect = false; // If we're using Level Select
global.shaders_active = true;
global.ring_side = false;
global.error = false;
global.error_message = "";
global.force_paused = false;
global.tempo_base = 1;
global.tempo = global.tempo_base;
global.players = 256;
for (i = 0; i < (global.players - 1); i += 1) { player_id[i] = noone; }

/********************************************************************
  noone = the player don't exists and it's a free slot
  GM ID = slot is cccupied, don't put 2 players in the same slot
  
  =====================[ SLOTS ]======================
  slot 0: used for singleplayer main player
  slot 1: used for tails parther (WIP)
  slots 2 to 255: unused, maybe for some future
********************************************************************/

// Debug flags
global.debug_debugmode = true; // Debug mode
global.debug_hitboxview = false; // Collision box rendering
global.debug_anglesensorsview = false; // Angle sensors rendering
global.debug_anglesview = false; // Angles rendering
global.debug_positionlineview = false; // Position line rendering
global.debug_paletteview = false; // Palette debug rendering
global.debug_maskview = false; // Tile collision mask rendering
global.debug_collidersview = false; // Knuckles climb debug rendering
global.debug_cameratools = false; // Camera debug tools

// Stages data
stage_id = -1;
stage_index = -1;
stage_list = ds_list_create();

// Spawn data
spawn_id = objPlayerSpawn;
spawn_time = 36000; // 10 minutes
temp_spawn_id = noone;
temp_spawn_time = -1;
temp_spawn_priority = -1;

// Crash Fail-Safe
/*exception_unhandled_handler(function(message)
{
	//audio_stop_all();
	//engine_set_active(false);
	//show_message(message.longMessage + "\n" + message.script + "\n" + message.stacktrace);
	/return -65535;
})*