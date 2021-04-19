/// @description  Game data
image_speed = 0;

// player values
for (i = 0; i < (array_length(objGame.player_id) - 1); i += 1)
{
    player_character_id[i] = 0;
    player_lives[i] = 3;
    player_score[i] = 0;
    player_rings[i] = 0;
    player_cpu[i] = false;
}

// data values
chaos_emerald = 0;
continues = 0;

// Default gameplay settings
//default_game_timelimit = 1;
//default_game_speedcap = 0;
//default_game_aircap = 0;
//default_game_spindash = 1;
//default_game_superpeelout = 2;
//default_game_shieldabilities = 2;
//default_game_sonicabilities = 3;
//default_game_tailsflight = 2;
//default_game_timelimit = 1;

// Default settings
// Audio
default_volume_music = 1;
default_volume_sfx = 1;
default_level_restart = 0;
default_level_finish = 0;

// Gameplay
default_classic_rotation = false;
default_cd_camera = false;
default_spindash_mode = 0;
default_falling_animations = 0;

// HUD
default_hud_visible = true;
default_hud_translucency = 1;
default_powerup_display = false;
default_continues_display = 1;
default_zeroes_display = false;

// Display
default_resolution = 2;
default_fullscreen = false;
default_show_fps = false;


// Default Controls
// Player 1
default_keyboard_up[0] = vk_up;
default_keyboard_down[0] = vk_down;
default_keyboard_left[0] = vk_left;
default_keyboard_right[0] = vk_right;
default_keyboard_a[0] = ord("A");
default_keyboard_b[0] = ord("S");
default_keyboard_c[0] = ord("D");
default_keyboard_x[0] = ord("Z");
default_keyboard_y[0] = ord("X");
default_keyboard_z[0] = ord("C");
default_keyboard_start[0] = vk_enter;
default_keyboard_select[0] = vk_backspace;

// Player 2
default_keyboard_up[1] = vk_numpad8;
default_keyboard_down[1] = vk_numpad5;
default_keyboard_left[1] = vk_numpad4;
default_keyboard_right[1] = vk_numpad6;
default_keyboard_a[1] = ord("H");
default_keyboard_b[1] = ord("J");
default_keyboard_c[1] = ord("K");
default_keyboard_x[1] = ord("B");
default_keyboard_y[1] = ord("N");
default_keyboard_z[1] = ord("M");
default_keyboard_start[1] = vk_add;
default_keyboard_select[1] = vk_subtract;

// Player 1 gamepad
default_gamepad_up[0] = gp_padu;
default_gamepad_down[0] = gp_padd;
default_gamepad_left[0] = gp_padl;
default_gamepad_right[0] = gp_padr;
default_gamepad_a[0] = gp_face1;
default_gamepad_b[0] = gp_face2;
default_gamepad_c[0] = gp_face3;
default_gamepad_x[0] = gp_shoulderr;
default_gamepad_y[0] = gp_shoulderl;
default_gamepad_z[0] = gp_face4;
default_gamepad_start[0] = gp_start;
default_gamepad_select[0] = gp_select;

// load saved data
load_settings();
load_keyboard(0);
if (objGame.controller[1] > -1) { load_keyboard(1); }

// create saved data
if not file_exists(working_directory + "\\" + SAVEFILESETTINGS) { save_settings(); }
if not file_exists(working_directory + "\\keyboard.ini")
{
    save_keyboard(0);
    if (objGame.controller[1] > -1) {  save_keyboard(1); }
}
if not file_exists(working_directory + "\\gamepad.ini") { save_gamepad(0); }
window_set_fullscreen(fullscreen);