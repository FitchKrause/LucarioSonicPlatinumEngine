/// @description  Input, counter and timers system

try
{
	if not objData.player_cpu[player_id] and not global.is_demomode
	{
	    if not (toggleflags & PLAYERSTATE_NOINPUT) and not input_lock and not input_lock2
	    {        
	        input = input_get(input_id);
	        input_pressed = input_get_pressed(input_id);
	        input_released = input_get_released(input_id);
	    }
	}

	// Debug input
	if (input_pressed & INPUT_SELECT)
	{
	    if global.debug_debugmode and not (objZone.levelflags & LEVELFLAG_SPECIALSTAGE) and not objData.player_cpu[player_id]
	    {
	        if (state == player_is_debugging)
	        {            
	            // Stop speed
	            xspeed = 0;
	            yspeed = 0;
            
	            // Shield, invincibility and effects
	            if shield and not invincibility and not super_form { shield.visible = true; }
	            if invincibility and not super_form { invincibility.visible = true; }
	            if (character_id == CHARACTER_TAILS) { tails_effect.visible = true; }
                        
	            // Falling state
	            player_is_falling(-1);
	        }
	        else { player_is_debugging(-1); } // Debug
	    }
	}

	// Counters and timers
	if timer { timer -= (1 * global.tempo); }

	// null counters
	if not (state == player_is_debugging) { if force_sliding { force_sliding -= (1 * global.tempo); } }
	if not (state == player_is_debugging) { if immunity { immunity -= (1 * global.tempo); } }
	if not (state == player_is_debugging) { if ignore_rings { ignore_rings -= (1 * global.tempo); } }
	if not (state == player_is_debugging) { if dead_timer { dead_timer -= 1; } }

	// Super form
	if (state <> player_is_debugging) and (state <> player_is_dead)
	{
	    if super_form
	    {
	        if not audio_is_playing(bgmTransformationTheme) { music_play_loop(bgmTransformationTheme); }
        
	        ring_drain += 1;
	        if ((ring_drain mod 60) == 0)
	        {
	            objData.player_rings[player_id] -= 1;
	            if (objData.player_rings[player_id] < 20) and objData.player_rings[player_id] { audio_play_normal(sndRingDrain, false, 0); }
	            if not objData.player_rings[player_id]
	            {
	                music_play_loop(objZone.music, objZone.looppoint, objMusic.music_position[0], MUSPLAYFLAG_FADING|MUSPLAYFLAG_NOFORCE);
	                player_trasformation(true);
	                super_form = false;            
                
	                switch character_id
	                {
	                    case CHARACTER_SONIC: { animation_table = objResources.anim_sonic; break; }
	                }
	                player_reset_physics();
	                animation_reset = true;
	            }
	        }
	    }
	}

	// invincibility
	if not (state == player_is_debugging)
	{
	    if invincible
	    {
	        invincible -= (1 * global.tempo);
	        if not invincible
	        {
	            if (invincibility <> noone) { instance_destroy(invincibility); invincibility = noone; }
	            if (shield <> noone) and not super_form { shield.visible = true; }
	            if super_form { music_play_loop(bgmTransformationTheme, 0, objMusic.music_position[0]); } else { music_play_loop(objZone.music, objZone.looppoint, objMusic.music_position[0], MUSPLAYFLAG_FADING|MUSPLAYFLAG_NOFORCE); }
	        }
	    }
	}

	// superspeed
	if not (state == player_is_debugging) { if superspeed { superspeed -= (1 * global.tempo); if not superspeed { player_reset_physics(); music_reset_pitch(); } } }

	// underwater and outspace
	if underwater or outspace
	{
	    if (shield_type <> SHIELD_BUBBLE) and not super_form
	    {
	        air_count -= (1 * global.tempo);
	        switch air_count
	        {
	            case 1500: // First
	            case 1200: // Second
				case 1155:
	            case 900: // Third
				case 855:
				case 810: { audio_play_emitter(audio_emitter, sndDrownWarning, false, 0); break; } // drown warning
	            case 720: // drown music
	            {
	                if (player_id == 0) 
	                {
	                    objMusic.music_position[0] = (audio_sound_get_track_position(objMusic.music_playing) * objMusic.sample_rate);
	                    music_reset_pitch();
	                    music_play_single(bgmDrowning);
	                }
	                break;
	            }
	            case 0:  { player_is_dead(-2); break; } // drown
	        }
	    }
	    else
	    {
	        if (air_count <> 1800)
	        {
				air_count = 1800;
				music_reset_pitch();
				music_play_loop(objZone.music, objZone.looppoint, objMusic.music_position[0], MUSPLAYFLAG_FADING|MUSPLAYFLAG_NOFORCE);
	            if superspeed { music_set_pitch(1.12); }
	            if invincible { music_play_loop(bgmInvincibility, 39513, 0, MUSPLAYFLAG_FADING|MUSPLAYFLAG_NOFORCE); }
	            if super_form { music_play_loop(bgmTransformationTheme, 0, objMusic.music_position[0]); }
	        }
	    }   
	}
}
catch(error) { engine_error(error); }