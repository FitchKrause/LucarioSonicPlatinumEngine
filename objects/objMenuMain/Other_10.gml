/// @description Update values

options_menu[0][1] = string(round(objData.volume_music * 100));
options_menu[1][1] = string(round(objData.volume_sfx * 100));
options_menu[2][1] = select(objData.level_restart, "Reset Music", "Resume Music");
options_menu[3][1] = select(objData.level_finish, "Stop Music", "Continue Music");
options_menu[4][1] = select(objData.classic_rotation, "Disabled", "Enabled");
options_menu[5][1] = select(objData.cd_camera, "Disabled", "Enabled");
options_menu[6][1] = select(objData.spindash_mode, "Sonic 2", "Sonic CD");
options_menu[7][1] = select(objData.falling_animations, "Disabled", "Enabled");
options_menu[8][1] = select(objData.hud_visible, "No", "Yes");
options_menu[9][1] = string(round(objData.hud_translucency * 100));
options_menu[10][1] = select(objData.powerup_display, "No", "Yes");
options_menu[11][1] = select(objData.continues_display, "On Continue Screen", "On Level Finish", "Always");
options_menu[12][1] = select(objData.zeroes_display, "No", "Yes");
options_menu[14][1] = select(objData.fullscreen, "Disabled", "Enabled");
options_menu[15][1] = select(objData.show_fps, "No", "Yes");