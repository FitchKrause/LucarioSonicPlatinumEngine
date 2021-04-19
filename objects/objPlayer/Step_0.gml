/// @description State machine and extended camera

try
{
	// State machine
	switch state
	{
	    case player_is_waiting: { if not (toggleflags & PLAYERSTATE_NOSTATE) { player_is_waiting(); } break; } // Transition
	    case player_is_dead: { if not (toggleflags & PLAYERSTATE_NOSTATE) { player_is_dead(0); } break; } // Death
	    default: // Other
	    {        
	        // Update last position table
	        ds_list_add(xtable, floor(x));
	        if (ds_list_size(xtable) > table_size) { ds_list_delete(xtable, 0); }
			ds_list_add(ytable, floor(y));
	        if (ds_list_size(ytable) > table_size) { ds_list_delete(ytable, 0); }
		
	        if not (toggleflags & PLAYERSTATE_NOSTATE) and not objGame.paused { if state { if script_exists(state) { script_execute(state, 0); } } } // Execute state
	        if camera_follow { camera.x = floor(x); camera.y = floor(y); } // Set camera to current position
	        if (state <> player_is_looking) and (state <> player_is_crouching) { camera.offset_y -= 2 * sign(camera.offset_y); } // Reset vertical panning
	        audio_emitter_position(audio_emitter, floor(x), floor(y), 0); // Update emitter position
			if (player_id == 0) { audio_listener_position(floor(x), floor(y), 0); }
	    }
	}

	// Extended camera
	if objData.cd_camera
	{
	    if (state <> player_is_spindashing) and (state <> player_is_peelouting) and (state <> player_is_debugging) and (state <> player_is_floating)
	    {
	        if (xspeed >= base_speed_cap) and not (mask_rotation mod 180) and not camera.timer { if (camera.offset_x > camera_pan_left) { camera.offset_x -= 2; } }
	        else if (xspeed <= -base_speed_cap) and not (mask_rotation mod 180) and not camera.timer { if (camera.offset_x < camera_pan_right) { camera.offset_x += 2; } }
	        else if (xspeed >= base_speed_cap) and (mask_rotation mod 180) and not camera.timer { if (camera.offset_x < camera_pan_right) { camera.offset_x += 2; } }
	        else if (xspeed <= -base_speed_cap) and (mask_rotation mod 180) and not camera.timer { if (camera.offset_x > camera_pan_left) { camera.offset_x -= 2; } }
	        else { camera.offset_x -= 2 * sign(camera.offset_x); }
	    }
	    else if (state == player_is_spindashing) or (state == player_is_peelouting)
	    {
	        if (facing == 1) { if (camera.offset_x > camera_pan_left) { camera.offset_x -= 2; } } else if (facing == -1) { if (camera.offset_x < camera_pan_right) { camera.offset_x += 2; } }
	    }
	    else { camera.offset_x -= 2 * sign(camera.offset_x); }
	}
}
catch(error) { engine_error(error); }