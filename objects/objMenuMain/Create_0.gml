/// @description  Initialize

depth = -200;
instance_create_depth(0, 0, 200, objTitleScreen);

// Music
music_play_loop(bgmMainMenu, 70623);

// Modifiers
menu_tick = 0; // More than 0 is inactive menu frames
menu_active = true;

// Effects
effect_started = false;
effect_reversed = false;
effect_alpha = 0;
effect_alpha2 = 0;
effect_line_offset = 0;
effect_line_move = 200;
effect_menu_move = 320;

// Menu
menu_state = 0;
/***************************************************
  menu_state:
  0 = Title.
  1 = Main Menu.
  2 = Options.
  3 = Character Select.
  4 = Level Select & Sound Test.
  5 = Update
****************************************************/

// Sub-menu
menu_substate = 0;
/***************************************************
  menu_substate:
    On menu_state 2: Settings
    0 = Main.
    1 = Customize controls, keyboard only.
    3 = Resolution changer.
    
    On menu_state 3: Character Select.
    0 = Main.
    1 = Gameplay settings.
****************************************************/

// Main Menu
main_item = 0;
main_menu[0] = "Start New Game";
main_menu[1] = "Level Selection";
main_menu[2] = "Settings";
main_menu[3] = "Quit to Windows";

// Character
character_item = 0;
character_select = 0;
character_options_item = 0;
character_anim_arrowup = 0;
character_anim_arrowdown = 0;

// Character menu options menu
character_options_menu[0] = "TIMELIMIT";
character_options_menu[1] = "SPEED CAP";
character_options_menu[2] = "AIR CAP";
character_options_menu[3] = "SPINDASH";
character_options_menu[4] = "SUPER PEEL OUT";
character_options_menu[5] = "SHIELD ABILITIES";
character_options_menu[6] = "SONIC ABILITIES";
character_options_menu[7] = "TAILS FLIGHT";

/* */
// Options
options_item = 0;

// Audio
options_menu[0][0] = "Music Volume";
options_menu[0][1] = string(objData.volume_music * 100);
options_menu[1][0] = "SoundFX Volume";
options_menu[1][1] = string(objData.volume_sfx * 100);
options_menu[2][0] = "On Level Restart";
options_menu[2][1] = select(objData.level_restart, "Reset Music", "Resume Music");
options_menu[3][0] = "On Level Finish";
options_menu[3][1] = select(objData.level_finish, "Stop Music", "Continue Music");

// Gameplay
options_menu[4][0] = "Genesis Rotation";
options_menu[4][1] = select(objData.classic_rotation, "Disabled", "Enabled");
options_menu[5][0] = "Extended Camera";
options_menu[5][1] = select(objData.cd_camera, "Disabled", "Enabled");
options_menu[6][0] = "Spindash Behaviour";
options_menu[6][1] = select(objData.spindash_mode, "Sonic 2", "Sonic CD");
options_menu[7][0] = "Falling Animations";
options_menu[7][1] = select(objData.falling_animations, "Disabled", "Enabled");

// Head-Up Display - HUD
options_menu[8][0] = "Show HUD";
options_menu[8][1] = select(objData.hud_visible, "No", "Yes");
options_menu[9][0] = "HUD Translucency";
options_menu[9][1] = string(objData.hud_translucency * 100);
options_menu[10][0] = "Power-up Display";
options_menu[10][1] = select(objData.powerup_display, "No", "Yes");
options_menu[11][0] = "Continues Display";
options_menu[11][1] = select(objData.continues_display, "On Continue Screen", "On Level Finish", "Always");
options_menu[12][0] = "Zeroes Display";
options_menu[12][1] = select(objData.zeroes_display, "No", "Yes");

// Video
options_menu[13][0] = "Display Resolution...";
options_menu[14][0] = "Fullscreen";
options_menu[14][1] = select(objData.fullscreen, "Disabled", "Enabled");
options_menu[15][0] = "Show FPS";
options_menu[15][1] = select(objData.show_fps, "No", "Yes");

// Input
options_menu[16][0] = "Customize controls...";
options_menu[17][0] = "Check Gamepad";

// Other
options_menu[18][0] = "Go Back";

/* */
/// Controls
controls_keyboard_item = 0;
controls_keyboard_offset = 0;
controls_keyboard_offset_target = 0;
controls_keyboard_state = 0;

// Controls menu
controls_keyboard[0] = "Up Key";
controls_keyboard[1] = "Down Key";
controls_keyboard[2] = "Left Key";
controls_keyboard[3] = "Right Key";

controls_keyboard[4] = "A Key";
controls_keyboard[5] = "B Key";
controls_keyboard[6] = "C Key";

controls_keyboard[7] = "X Key";
controls_keyboard[8] = "Y Key";
controls_keyboard[9] = "Z Key";

controls_keyboard[10] = "Start Key";
controls_keyboard[11] = "Select Key";

controls_keyboard[12] = "Reset Keybinds";
controls_keyboard[13] = "Go Back";

// Controls (keyboard) code
controls_keyboard_code[0] = objGame.controller[0].code_keyboard[0];
controls_keyboard_code[1] = objGame.controller[0].code_keyboard[1];
controls_keyboard_code[2] = objGame.controller[0].code_keyboard[2];
controls_keyboard_code[3] = objGame.controller[0].code_keyboard[3];

controls_keyboard_code[4] = objGame.controller[0].code_keyboard[4];
controls_keyboard_code[5] = objGame.controller[0].code_keyboard[5];
controls_keyboard_code[6] = objGame.controller[0].code_keyboard[6];

controls_keyboard_code[7] = objGame.controller[0].code_keyboard[7];
controls_keyboard_code[8] = objGame.controller[0].code_keyboard[8];
controls_keyboard_code[9] = objGame.controller[0].code_keyboard[9];

controls_keyboard_code[10] = objGame.controller[0].code_keyboard[10];
controls_keyboard_code[11] = objGame.controller[0].code_keyboard[11];

/* */
/// Resolution

resolution_item = 17;
resolution_menu[0] = string(objScreen.width * 6) + "x" + string(objScreen.height * 6) + " (x" + string(6) + ")";
resolution_menu[1] = string(objScreen.width * 5.75) + "x" + string(objScreen.height * 5.75) + " (x" + string(5.75) + ")";
resolution_menu[2] = string(objScreen.width * 5.5) + "x" + string(objScreen.height * 5.5) + " (x" + string(5.5) + ")";
resolution_menu[3] = string(objScreen.width * 5.25) + "x" + string(objScreen.height * 5.25) + " (x" + string(5.25) + ")";
resolution_menu[4] = string(objScreen.width * 5) + "x" + string(objScreen.height * 5) + " (x" + string(5) + ")";
resolution_menu[5] = string(objScreen.width * 4.75) + "x" + string(objScreen.height * 4.75) + " (x" + string(4.75) + ")";
resolution_menu[6] = string(objScreen.width * 4.5) + "x" + string(objScreen.height * 4.5) + " (x" + string(4.5) + ")";
resolution_menu[7] = string(objScreen.width * 4.25) + "x" + string(objScreen.height * 4.25) + " (x" + string(4.25) + ")";
resolution_menu[8] = string(objScreen.width * 4) + "x" + string(objScreen.height * 4) + " (x" + string(4) + ")";
resolution_menu[9] = string(objScreen.width * 3.75) + "x" + string(objScreen.height * 3.75) + " (x" + string(3.75) + ")";
resolution_menu[10] = string(objScreen.width * 3.5) + "x" + string(objScreen.height * 3.5) + " (x" + string(3.5) + ")";
resolution_menu[11] = string(objScreen.width * 3.25) + "x" + string(objScreen.height * 3.25) + " (x" + string(3.25) + ")";
resolution_menu[12] = string(objScreen.width * 3) + "x" + string(objScreen.height * 3) + " (x" + string(3) + ")";
resolution_menu[13] = string(objScreen.width * 2.75) + "x" + string(objScreen.height * 2.75) + " (x" + string(2.75) + ")";
resolution_menu[14] = string(objScreen.width * 2.5) + "x" + string(objScreen.height * 2.5) + " (x" + string(2.5) + ")";
resolution_menu[15] = string(objScreen.width * 2.25) + "x" + string(objScreen.height * 2.25) + " (x" + string(2.25) + ")";
resolution_menu[16] = string(objScreen.width * 2) + "x" + string(objScreen.height * 2) + " (x" + string(2) + ")";
resolution_menu[17] = "Go Back";

/// Level select
level_zone = 0;
level_act = 1;

// Sound test state
sound_index = 0;
sound_max = 99;
reserved_sound = -1;
music_count = music_get_music_count();

// Sounds
var sound_position = 0
var sound_read = 0;
while audio_exists(sound_read)
{
    var name = audio_get_name(sound_read);
    if is_undefined(name) { continue; }
    if string_starts_with(name, "snd") { sound_entry[sound_position] = asset_get_index(name); sound_position += 1; }
    sound_read += 1;
    continue;
}

// Level select menu
zones[0, 0] = "ENGINE TESTING ZONE";
zones[0, 1] = 1;
zones[0, 2] = zoneTest;

zones[1, 0] = "EMERALD HILL ZONE";
zones[1, 1] = 2;
zones[1, 2] = zoneEmeraldHillAct1;
zones[1, 3] = zoneEmeraldHillAct2;

/*******************************************************
  zone[0, 0] = "EMERALD HILL ZONE"; // Zone name
  zone[0, 1] = 2; // Zone acts
  zone[0, 2] = zoneEmeraldHillAct1; // Zone room name
  zone[0, 3] = zoneEmeraldHillAct2; // Zone room name 2
********************************************************/