/// @description  Menu logic

if not menu_active or menu_tick exit;

// Items
switch menu_state
{
	case 0: // Title
	{
		if input_check_pressed(0, INPUT_A) or input_check_pressed(0, INPUT_START)
		{
			//menu_state = 1;
			//music_play_loop(bgmMainMenuFull, 70623, audio_sound_get_track_position(objMusic.music_playing) * objMusic.sample_rate);
			menu_active = false;
			effect_started = true;
			effect_reversed = false;
		}
		break;
	}
	
    // Main Menu
    case 1:
    {
        if input_check_pressed(0, INPUT_UP)
        {
            audio_play_normal(sndBeep, false, 0);
            if (main_item == 0) { main_item = (array_length(main_menu) - 1); } else { main_item -= 1; }
        }
        
        if input_check_pressed(0, INPUT_DOWN)
        {
            audio_play_normal(sndBeep, false, 0);
            if (main_item == (array_length(main_menu) - 1)) { main_item = 0; } else { main_item += 1; }
        }
		
		if input_check_pressed(0, INPUT_B)
		{
			//menu_state = 0;
			//music_play_loop(bgmMainMenu, 70623, audio_sound_get_track_position(objMusic.music_playing) * objMusic.sample_rate);
			menu_active = false;
			effect_started = true;
			effect_reversed = true;
		}
		
        if input_check_pressed(0, INPUT_A) or input_check_pressed(0, INPUT_START)
        {
            switch main_item
            {
                case 0:
                {
					menu_state = 3;
                    global.is_levelselect = false;
                    audio_play_normal(sndCheckpoint, false, 0);
                    break;
                }
                
                case 1:
                {
                    menu_state = 4;
                    music_reset_pitch();
                    break;
                }
                
                case 2:
                {
                    menu_state = 2;
                    audio_play_normal(sndCheckpoint, false, 0);
                    break;
                }
                case 3:
                {
                    audio_play_normal(sndCheckpoint, false, 0);
                    game_end();
                    break;
                }
            }
        }
        break;
    }
    
    // Settings
    case 2:
    {
        if input_check_pressed(0, INPUT_UP) 
        {
            switch menu_substate
            {
                // Main
                case 0:
                {
                    audio_play_normal(sndBeep, false, 0);
                    if (options_item == 0) { options_item = (array_length(options_menu) - 1); } else { options_item -= 1; }
                    break;
                }
                
                // Keyboard
                case 1:
                {
                    if (controls_keyboard_state > 0) { break; }
					audio_play_normal(sndBeep, false, 0);
                    if (controls_keyboard_item == 0) { controls_keyboard_item = (array_length(controls_keyboard) - 1); } else { controls_keyboard_item -= 1; }
                    break;
                }
                
                // Resolution
                case 3:
                {
                    audio_play_normal(sndBeep, false, 0);
					if (resolution_item == 0) { resolution_item = (array_length(resolution_menu) - 1); } else { resolution_item -= 1; }
                    break;
                }
            }
        }
        
        if input_check_pressed(0, INPUT_DOWN) 
        {
            switch menu_substate
            {
                // Main
                case 0:
                {
                    audio_play_normal(sndBeep, false, 0);
                    if (options_item == (array_length(options_menu) - 1)) { options_item = 0; } else { options_item += 1; }
                    break;
                }
                
                // Keyboard
                case 1:
                {
                    if (controls_keyboard_state > 0) { break; }
                    audio_play_normal(sndBeep, false, 0);
                    if (controls_keyboard_item == (array_length(controls_keyboard) - 1)) { controls_keyboard_item = 0; } else { controls_keyboard_item += 1; }
                    break;
                }
                
                // Resolution
                case 3:
                {
                    audio_play_normal(sndBeep, false, 0);
					if (resolution_item == (array_length(resolution_menu) - 1)) { resolution_item = 0; } else { resolution_item += 1; }
                    break;
                }
            }
        }
    
        if input_check_pressed(0, INPUT_LEFT) 
        {
            switch menu_substate
            {
                case 0:
                {
                    switch options_item
                    {
                        case 0:
                        {
                            objData.volume_music -= 0.05;
                            if (objData.volume_music < 0) { objData.volume_music = 1; }
                            
                            save_settings();                    
                            music_play_loop(objMusic.music_current_id, objMusic.music_current_looppoint, audio_sound_get_track_position(objMusic.music_playing) * objMusic.sample_rate);
                            audio_play_normal(sndBeep, false, 0);
                            break;
                        }
                        
                        case 1:
                        {
                            objData.volume_sfx -= 0.05;
                            if (objData.volume_sfx < 0) { objData.volume_sfx = 1; }
                           
                            save_settings();
                            audio_play_normal(sndBeep, false, 0);
                            break;
                        }
                        
                        case 2:
                        {
                             objData.level_restart = not objData.level_restart;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 3:
                        {
                             objData.level_finish = not objData.level_finish;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 4:
                        {
                             objData.classic_rotation = not objData.classic_rotation;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 5:
                        {
                             objData.cd_camera = not objData.cd_camera;
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 6:
                        {
                             objData.spindash_mode = not objData.spindash_mode;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 7:
                        {
                             objData.falling_animations = not objData.falling_animations;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 8:
                        {
                             objData.hud_visible = not objData.hud_visible;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 9:
                        {
                            objData.hud_translucency -= 0.05;
                            if (objData.hud_translucency < 0) { objData.hud_translucency = 1; }
                            
                            save_settings();
                            audio_play_normal(sndBeep, false, 0);
                            break;
                        }
                        
                        case 10:
                        {
                             objData.powerup_display = not objData.powerup_display;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 11:
                        {
                             objData.continues_display -= 1;
                             if (objData.continues_display < 0) { objData.continues_display = 2; }
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 12:
                        {
                             objData.zeroes_display = not objData.zeroes_display;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 14:
                        {
                            objData.fullscreen = not objData.fullscreen;
                            window_set_fullscreen(objData.fullscreen);
                            with objScreen { event_user(0); }
                            
                            save_settings();
                            audio_play_normal(sndBeep, false, 0);
                            break;
                        }
                        
                        case 15:
                        {
                            objData.show_fps = not objData.show_fps;
                            save_settings();
                            audio_play_normal(sndBeep, false, 0);
                            break;
                        }
                    }
                    break;
                }
                
                case 3:
                {
                    if (resolution_item == 21) { break; }
                    audio_play_normal(sndBeep, false, 0);
                    
                    if (resolution_item < 3) { resolution_item = 18 + resolution_item; } else if (resolution_item < 9) { resolution_item = 20; } else if (resolution_item > 8) { resolution_item -= 9; }
                    break;
                }
            }
			event_user(0);
        }
        
        if input_check_pressed(0, INPUT_RIGHT) 
        {
            switch menu_substate
            {
                case 0:
                {
                    switch options_item
                    {
                        case 0:
                        {
                            objData.volume_music += 0.05;
                            if (objData.volume_music > 1) { objData.volume_music = 0; }
                           
                            save_settings();
							music_play_loop(objMusic.music_current_id, objMusic.music_current_looppoint, audio_sound_get_track_position(objMusic.music_playing) * objMusic.sample_rate);
                            audio_play_normal(sndBeep, false, 0);
                            break;
                        }
                        
                        case 1:
                        {
                            objData.volume_sfx += 0.05;
                            if (objData.volume_sfx > 1) { objData.volume_sfx = 0; }
                            
                            save_settings();
                            audio_play_normal(sndBeep, false, 0);
                            break;
                        }
                        
                        case 2:
                        {
                             objData.level_restart = not objData.level_restart;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 3:
                        {
                             objData.level_finish = not objData.level_finish;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 4:
                        {
                             objData.classic_rotation = not objData.classic_rotation;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 5:
                        {
                             objData.cd_camera = not objData.cd_camera;
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 6:
                        {
                             objData.spindash_mode = not objData.spindash_mode;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 7:
                        {
                             objData.falling_animations = not objData.falling_animations;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 8:
                        {
                             objData.hud_visible = not objData.hud_visible;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 9:
                        {
                            objData.hud_translucency += 0.05;
                            if (objData.hud_translucency > 1) { objData.hud_translucency = 0; }
                            
                            save_settings();
                            audio_play_normal(sndBeep, false, 0);
                            break;
                        }
                        
                        case 10:
                        {
                             objData.powerup_display = not objData.powerup_display;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 11:
                        {
                             objData.continues_display += 1;
                             if (objData.continues_display > 2) { objData.continues_display = 0; }
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 12:
                        {
                             objData.zeroes_display = not objData.zeroes_display;
                             
                             save_settings();
                             audio_play_normal(sndBeep, false, 0);
                             break;
                        }
                        
                        case 14:
                        {
                            objData.fullscreen = not objData.fullscreen;
                            window_set_fullscreen(objData.fullscreen);
                            with objScreen { event_user(0); }
                            
                            save_settings();
                            audio_play_normal(sndBeep, false, 0);
                            break;
                        }
                        
                        case 15:
                        {
                            objData.show_fps = not objData.show_fps;
                            save_settings();
                            audio_play_normal(sndBeep, false, 0);
                            break;
                        }
                    }
                    break;
                }
                
                case 3:
                {
                    if (resolution_item == 21) { break; }
                    audio_play_normal(sndBeep, false, 0);
                    
                    if (resolution_item < 9) { resolution_item += 9; }
                    else if (resolution_item < 18) and not (resolution_item > 11) { resolution_item += 9; }
                    else if (resolution_item > 11) and not (resolution_item > 17) { resolution_item = 20; }
                    else if (resolution_item > 17) { resolution_item = (resolution_item mod 9); }
                    break;
                }
            }
			event_user(0);
        }
                
        if input_check_pressed(0, INPUT_B)
        {
            switch menu_substate
            {
                case 0:
                {
                    menu_state = 1;
                    audio_play_normal(sndCheckpointReverse, false, 0);
                    break;
                }
                
                case 1:
                {
                    if (controls_keyboard_state > 0) { break; }
                    
                    for (i = 0; i < array_length(objGame.controller[0].code_keyboard) - 1; i += 1) { objGame.controller[0].code_keyboard[i] = controls_keyboard_code[i]; }
                    save_keyboard(0);
                    load_keyboard(0);
                    
                    menu_substate = 0;
                    audio_play_normal(sndCheckpointReverse, false, 0);
                    break;
                }
                
                case 3:
                {
                    menu_substate = 0;
                    audio_play_normal(sndCheckpointReverse, false, 0);
                    break;
                }
            }
        }
        
        if input_check_pressed(0, INPUT_A) or input_check_pressed(0, INPUT_START)
        {
            switch menu_substate
            {
                case 0: // Main
                {
                    switch options_item
                    {
                        case 13:
                        {
                            menu_substate = 3;
							audio_play_normal(sndBeep, false, 0);
                            break;
                        }
                        
                        case 17:
                        {
                            with objGame.controller[0]
                            {
                                gamepad_enabled = gamepad_is_connected(device_id);
                                audio_stop_sound(gamepad_enabled ? sndCheckpoint : sndFatalError);
                                audio_play_normal(gamepad_enabled ? sndCheckpoint : sndFatalError, false, 0);
                            }
                            break;
                        }
						
						case 18:
						{
							menu_state = 1;
							audio_play_normal(sndCheckpointReverse, false, 0);
							break;
						}
                    }
                    break;
                }
				
                case 1: // Customize controls (keyboard)
                {
                    if (controls_keyboard_state == 0)
                    {
                        switch controls_keyboard_item
                        {
                            case 0:
                            case 1:
                            case 2:
                            case 3:
                            case 4:
                            case 5:
                            case 6:
                            case 7:
                            case 8:
                            case 9:
                            case 10:
                            case 11:
                            { 
                                controls_keyboard_state = controls_keyboard_item + 1;
                                keyboard_lastkey = -1;
                                audio_play_normal(sndBeep, false, 0);
                                break;
                            }
                            
                            case 12:
                            {
                                controls_keyboard_code[0] = objData.default_keyboard_up[0];
                                controls_keyboard_code[1] = objData.default_keyboard_down[0];
                                controls_keyboard_code[2] = objData.default_keyboard_left[0];
                                controls_keyboard_code[3] = objData.default_keyboard_right[0];
                                controls_keyboard_code[4] = objData.default_keyboard_a[0];
                                controls_keyboard_code[5] = objData.default_keyboard_b[0];
                                controls_keyboard_code[6] = objData.default_keyboard_c[0];
                                controls_keyboard_code[7] = objData.default_keyboard_x[0];
                                controls_keyboard_code[8] = objData.default_keyboard_y[0];
                                controls_keyboard_code[9] = objData.default_keyboard_z[0];
                                controls_keyboard_code[10] = objData.default_keyboard_start[0];
                                controls_keyboard_code[11] = objData.default_keyboard_select[0];
                                
                                for (i = 0; i < array_length(objGame.controller[0].code_keyboard) - 1; i += 1) { objGame.controller[0].code_keyboard[i] = controls_keyboard_code[i]; }
                                save_keyboard(0);
                                load_keyboard(0);
                                audio_play_normal(sndBeep, false, 0);
                                break;
                            }
                            
                            case 13:
                            {
                                for (i = 0; i < array_length(objGame.controller[0].code_keyboard) - 1; i += 1) { objGame.controller[0].code_keyboard[i] = controls_keyboard_code[i]; }
                                save_keyboard(0);
                                load_keyboard(0);
                                
                                menu_substate = 0;
                                audio_play_normal(sndCheckpointReverse, false, 0);
                                break;
                            }
                        }
                    }
                    break;
                }
                
                case 3: // Resolution
                {
                    switch resolution_item
                    {
                        case 0: { engine_set_resolution(6); break; }
                        case 1: { engine_set_resolution(5.75); break; }
                        case 2: { engine_set_resolution(5.5); break; }
                        case 3: { engine_set_resolution(5.25); break; }
                        case 4: { engine_set_resolution(5); break; }
                        case 5: { engine_set_resolution(4.75); break; }
                        case 6: { engine_set_resolution(4.5); break; }
                        case 7: { engine_set_resolution(4.25); break; }
                        case 8: { engine_set_resolution(4); break; }
                        case 9: { engine_set_resolution(3.75); break; }
                        case 10: { engine_set_resolution(3.5); break; }
                        case 11: { engine_set_resolution(3.25); break; }
                        case 12: { engine_set_resolution(3); break; }
                        case 13: { engine_set_resolution(2.75); break; }
                        case 14: { engine_set_resolution(2.5); break; }
                        case 15: { engine_set_resolution(2.25); break; }
                        case 16: { engine_set_resolution(2); break; }
                        case 17: { menu_substate = 0; audio_play_normal(sndCheckpointReverse, false, 0); break; }
                    }
                    break;
                }
            }
        }
        
        if (menu_substate == 1) and (controls_keyboard_state > 0)
        {
            if (keyboard_lastkey <> -1)
            {
                if keyboard_check_pressed(vk_escape)
                {
                    controls_keyboard_state = 0;
                    audio_play_normal(sndCheckpointReverse, false, 0);
                    break;
                }
                
                var fail = false;
                for (i = 0; i <= (array_length(controls_keyboard_code) - 1); i += 1) { if (controls_keyboard_code[i] == keyboard_lastkey) and not (i == (controls_keyboard_state - 1)) { fail = true; break; } }
                if fail { keyboard_lastkey = -1; audio_play_normal(sndFatalError, false, 0); break; }
                
                controls_keyboard_code[controls_keyboard_state - 1] = keyboard_lastkey;
                controls_keyboard_state = 0;
                keyboard_lastkey = -1;
                audio_play_normal(sndCheckpoint, false, 0);
            }
        }
        break;
    }
    
    case 3: // Character Select
    {
        switch menu_substate
        {
            case 0:
            {
                if input_check_pressed(0, INPUT_DOWN)
                {
                    audio_play_normal(sndBeep, false, 0);
                    if (character_item == 0) { character_item = 2; } else { character_item -= 1; }
					character_anim_arrowdown = 20;
                }
                
                if input_check_pressed(0, INPUT_UP) 
                {
                    audio_play_normal(sndBeep, false, 0);
					if (character_item == 2) { character_item = 0; } else { character_item += 1; }
					character_anim_arrowup = 20;
                }
                
                if input_check_pressed(0, INPUT_B)
                {
					audio_play_normal(sndCheckpointReverse, false, 0);
                    if not global.is_levelselect { menu_state = 1;  } else { menu_state = 4; }
                }
                
                if input_check_pressed(0, INPUT_A) or input_check_pressed(0, INPUT_START)
                {
                    switch character_item
                    {   
                        case 0:
                        case 1:
                        case 2:
                        {
                            menu_active = false;
							engine_reset_data(false);
							if global.is_levelselect { transition_to(zones[level_zone, level_act + 1], objTitleCard, 24); } else { stage_goto(0, objTitleCard, 24); }
                            objData.player_character_id[0] = character_item + 1;
                            break;
                        }
                    }
                }
                break;
            }
            
            case 1:
            {
                if input_check_pressed(0, INPUT_UP)
                {
                    if (character_options_item == 0) { character_options_item = (array_length(character_options_menu) - 1); } else { character_options_item -= 1; }
                }
                
                if input_check_pressed(0, INPUT_DOWN)
                {
                    if (character_options_item == (array_length(character_options_menu) - 1)) { character_options_item = 0; } else { character_options_item += 1; }
                }
                    
                if input_check_pressed(0, INPUT_B) { menu_substate = 0; }
                break;
            }
        }
        break;
    }
    
    case 4: // Level Select
    {
        if input_check_pressed(0, INPUT_UP)
        {
            if (level_zone > 0) or (level_act > 1)
            {
                if (level_act > 1) { level_act -= 1; }
                else
                {
                    level_zone -= 1;
                    level_act = zones[level_zone, 1];
                }
            }
            else
            {
                level_zone = array_length(zones);
                level_act = 1;
            }
        }
        
        if input_check_pressed(0, INPUT_DOWN)
        {
            if (level_zone <= (array_length(zones) - 1))
            {
                if (level_act < zones[level_zone, 1]) { level_act += 1; }
                else
                {
                    level_zone += 1;
                    level_act = 1;
                }
            }
            else
            {
                level_zone = 0;
                level_act = 1;
            }
        }
        
        if input_check_pressed(0, INPUT_LEFT)
        {
            if (level_zone == array_length(zones))
            {
                sound_index -= 1;
                if (sound_index < 0) { sound_index = sound_max; }
            }
        }
        
        if input_check_pressed(0, INPUT_RIGHT)
        {
            if (level_zone == array_length(zones))
            {
                sound_index += 1;
                if (sound_index > sound_max) { sound_index = 0; }
            }
        }
        
        if input_check_pressed(0, INPUT_B)
        {
            menu_state = 1;
            global.is_levelselect = false;
            
            music_reset_pitch();
            music_play_loop(bgmMainMenuFull, 70623, 0, MUSPLAYFLAG_NOFORCE);
			music_set_pitch(1);
        }
        
        if input_check_pressed(0, INPUT_A) or input_check_pressed(0, INPUT_START)
        {
            if (level_zone == array_length(zones))
            {   
                switch sound_index
                {
                    case 1: { music_play_loop(bgmMainMenu, 70623); break; }
					case 2: { music_play_loop(bgmMainMenuFull, 70623); break; }
                    case 3: { music_play_overlay(bgmExtraLife); break; }
                    case 4: { music_play_single(bgmLevelClear); break; }
                    case 5: { music_play_single(bgmDrowning); break; }
                    case 6: { music_play_single(bgmGameOver); break; }
                    case 7: { music_play_single(bgmContinueScreen); break; }
                    case 8: { music_play_loop(bgmInvincibility, 39513); break; }
                    case 9: { music_play_loop(bgmTransformationTheme); break; }
                    
                    /* ZONE TRACKS START*/
                    case 10: { music_play_loop(bgmZoneEmeraldHill, 153236); break; }
                    /* ZONE TRACKS END*/
                    
                    /* TOP SECRET MUSIC MODIFIERS */
                    case 99: { music_set_pitch(objMusic.pitch_target + 0.06); break; } // Go up pitch
                    case 98: { music_reset_pitch(); break; } // Normal pitch
                    case 97: { music_set_pitch(objMusic.pitch_target - 0.06); break; } // Go down pitch
                    case 96: { music_set_volume_all(objData.volume_music, 24 * 3); break; } // Fade out volume
                    case 95: { music_set_volume_all(0, 24 * 3); break; } // Fade in volume
                    case 94: { music_stop_all(); break; } // Stop
                    
                    default:
                    {
                        if (sound_index > music_count) and (sound_index < 94)
                        {
                            if not (((sound_index - (music_count + 1)) < 0))
                            {
                                if not (is_undefined(audio_get_name(sound_index - (music_count + 1))))
                                {
                                    if not ((sound_index - (music_count + 1)) > (array_length(sound_entry) - 1))
                                    {
                                        if (audio_exists(sound_entry[sound_index - (music_count + 1)]))
                                        {
                                            if (string_copy(audio_get_name(sound_entry[sound_index - (music_count + 1)]), 0, 3) == "snd")
                                            {
                                                if (audio_is_playing(reserved_sound)) { audio_stop_sound(reserved_sound); }
                                                reserved_sound = audio_play_normal(sound_entry[sound_index - (music_count + 1)], false, 0);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        break;
                    }
                }
            }
            else
            {
                menu_state = 3;
                global.is_levelselect = true;
            }
        }
        break;
    }
}