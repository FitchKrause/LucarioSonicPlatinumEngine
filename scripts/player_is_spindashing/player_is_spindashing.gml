/// @description  player_is_spindashing(step)
/// @param step
function player_is_spindashing() {
	switch argument[0]
	{
	case -1: // starting
	    // counters
	    if (not spindashing) { spindash_charge = 0; }

	    // states and flags
	    state = player_is_spindashing;
	    spinning = false;
	    jumping = false;
	    jump_action = true;
	    spindashing = true;
	    peelouting = false;
    
	    // camera
	    camera.vertical_lock = true;

	    // dash smoke
	    smoke = instance_create_depth(x, y, depth - 1, objDashSmoke)
	    with smoke
	    {
	        player_id = other.id;
	        image_xscale = other.facing;
	        image_angle = other.mask_rotation;
	    }
    
	    // sound
	    if (audio_is_playing(reserved_sound)) { audio_stop_sound(reserved_sound); }
	    if objData.spindash_mode { reserved_sound = audio_play_emitter(audio_emitter, sndPeeloutCharge, false, 0); } else { reserved_sound = audio_play_emitter(audio_emitter, sndSpinDashCharge, false, 0); }
	    spindash_pitch = 0;
	    break;

	default: // main
	    // update position
	    if not player_move_floor() { return false; }

	    // abort if ...
	    if not floor_tag { return player_is_falling(-1); } // falling
	    if player_is_slipping() { return false; } // slipping
	    if (xspeed <> 0) { return player_is_rolling(-1); } // already moving
    
	    // dash on releasing down
	    if not (input & INPUT_DOWN)
	    {    
	        // release charge
	        xspeed = facing * (spindash_charge_max + spindash_charge);
	        spindash_charge = 0;
    
	        // camera
	        camera.timer = floor(24 - abs(xspeed));

	        // sound
	        spindash_pitch = 0;
	        if audio_is_playing(reserved_sound) { audio_stop_sound(reserved_sound); }
	        if objData.spindash_mode { audio_play_emitter(audio_emitter, sndPeeloutRelease, false, 0); } else { audio_play_emitter(audio_emitter, sndSpinDashRelease, false, 0); }
        
	        // roll
	        return player_is_rolling(-1);
	    }
    
	    // charging
	    if objData.spindash_mode
	    {
	        // increase charge
	        spindash_charge = min(spindash_charge + 0.1, spindash_charge_max);
        
	        // animation
	        animation_new = "spin";
	        animation_speed = 1 / max(spindash_charge_max - abs(spindash_charge * 2), 1);
	        with smoke { image_speed = 0.5 / (max(other.spindash_charge_max - abs(other.spindash_charge * 2), 1) / 2); }

	        // spindash sound
	        spindash_pitch = 0;
	        if not audio_is_playing(reserved_sound) { reserved_sound = audio_play_emitter(audio_emitter, sndPeeloutLoop, true, 0); }
	    }
	    else
	    {
	        // animation
	        animation_new = "spindash";
	        animation_speed = 1 / max(((spindash_charge_max / 2) - (spindash_charge_max / 4)) - abs(spindash_charge), 1);
	        with smoke { image_speed = 0.5 / (max(((other.spindash_charge_max / 2) - (other.spindash_charge_max / 4)) - abs(other.spindash_charge), 1) / 2); }
        
	        if (input_pressed & INPUT_ACTION) and (spindash_charge < spindash_charge_max)
	        {
	            // increase charge
	            spindash_charge = min(spindash_charge + 2, spindash_charge_max);
            
	            // spindash pitch bending
	            if not audio_is_playing(reserved_sound) { spindash_pitch = 0; }
	            else if (spindash_pitch < (spindash_charge_max + 3)) { spindash_pitch += 1; }
    
	            // spindash sound
	            if audio_is_playing(reserved_sound) { audio_stop_sound(reserved_sound); }
	            reserved_sound = audio_play_emitter(audio_emitter, sndSpinDashCharge, false, 0);
	            audio_sound_pitch(reserved_sound, 1 + spindash_pitch * 0.075);
	        }
	    }
    
	    // atrophy
	    if (spindash_charge > 0) { spindash_charge *= spindash_friction; }
	}



}
