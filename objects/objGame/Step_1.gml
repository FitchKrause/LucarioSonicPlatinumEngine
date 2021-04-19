/// @description Keys

if not audio_group_is_loaded(AudioSounds) { audio_group_load(AudioSounds); }

// Fullscreen toggling
if keyboard_check_pressed(vk_f1)
{
    if instance_exists(objData) and instance_exists(objScreen)
    {
        objData.fullscreen = not objData.fullscreen;
        window_set_fullscreen(objData.fullscreen);
        with objScreen { event_user(0); }
        save_settings();
        audio_play_normal(sndCheckpoint, false, 0);
    }
}

// Soft reset
if keyboard_check_pressed(vk_f2) { game_restart(); }

// GIF recording
if keyboard_check_pressed(vk_f3) and not gif_enabled
{
	gif_enabled = true;
	gif_tick = 0;
	gif_handle = gif_open(objScreen.width, objScreen.height);
	audio_play_normal(sndCheckpoint, false, 0);
}

// Reset key
/*if keyboard_check_pressed(vk_f4)
{
    controller[0].code_keyboard[0] = objData.default_keyboard_up[0];
    controller[0].code_keyboard[1] = objData.default_keyboard_down[0];
    controller[0].code_keyboard[2] = objData.default_keyboard_left[0];
    controller[0].code_keyboard[3] = objData.default_keyboard_right[0];
    controller[0].code_keyboard[4] = objData.default_keyboard_a[0];
    controller[0].code_keyboard[5] = objData.default_keyboard_b[0];
    controller[0].code_keyboard[6] = objData.default_keyboard_c[0];
    controller[0].code_keyboard[7] = objData.default_keyboard_x[0];
    controller[0].code_keyboard[8] = objData.default_keyboard_y[0];
    controller[0].code_keyboard[9] = objData.default_keyboard_z[0];
    controller[0].code_keyboard[10] = objData.default_keyboard_l[0];
    controller[0].code_keyboard[11] = objData.default_keyboard_r[0];
    controller[0].code_keyboard[12] = objData.default_keyboard_g[0];
    controller[0].code_keyboard[13] = objData.default_keyboard_start[0];
    controller[0].code_keyboard[14] = objData.default_keyboard_select[0];
    save_keyboard(0);
    load_keyboard(0);
    print("Keyboard controls reseted.");
    audio_play_normal(sndCheckpoint, false, 0);
}*/

// Screenshot
if keyboard_check_pressed(vk_f5)
{
    save_screenshot("LucarioSonicPlatinumEngine", "screenshots\\");
    audio_play_normal(sndCheckpoint, false, 0);
}

// Force pause
/*if keyboard_check_pressed(vk_f10)
{
    global.force_paused = not global.force_paused;
    engine_set_active(not global.force_paused);
}*/

// Debug flags
if global.debug_debugmode
{
    if keyboard_check_pressed(vk_numpad1) { global.debug_hitboxview = not global.debug_hitboxview; }
    if keyboard_check_pressed(vk_numpad2) { global.debug_anglesensorsview = not global.debug_anglesensorsview; }
    if keyboard_check_pressed(vk_numpad3) { global.debug_anglesview = not global.debug_anglesview; }
    if keyboard_check_pressed(vk_numpad4) { global.debug_positionlineview = not global.debug_positionlineview; }
    if keyboard_check_pressed(vk_numpad5) { global.debug_paletteview = not global.debug_paletteview; }
    if keyboard_check_pressed(vk_numpad6) { global.debug_maskview = not global.debug_maskview; }
    if keyboard_check_pressed(vk_numpad7) { global.debug_collidersview = not global.debug_collidersview; }
}