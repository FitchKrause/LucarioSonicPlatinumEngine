/// @description  player_is_peelouting(step)
/// @param step
function player_is_peelouting(argument0) {
	switch argument0
	{
	    case -1: // starting
	    {
	        // animate
	        animation_new = "peelout";
	        animation_speed = 1;
    
	        // states and flags
	        state = player_is_peelouting;
	        spinning = false;
	        jumping = false;
	        jump_action = false;
	        spindashing = false;
	        peelouting = true;
	        peelout_charge = 0;
	        camera.vertical_lock = true;
        
	        // sound
	        if (audio_is_playing(reserved_sound)) { audio_stop_sound(reserved_sound); }
	        reserved_sound = audio_play_emitter(audio_emitter, sndPeeloutCharge, false, 0);
	        break;
	    }

	    default: // main
	    {
	        // update position
	        if not player_move_floor() return false;
    
	        // abort if ...
	        if not floor_tag { return player_is_falling(-1); } // falling
	        if player_is_slipping() { return false; } // slipping
	        if (xspeed <> 0) { return player_is_running(-1); } // already moving
        
	        // charge
	        peelout_charge = min(peelout_charge + 0.5, peelout_charge_max);
        
	        // loop
	        if not audio_is_playing(reserved_sound) { reserved_sound = audio_play_emitter(audio_emitter, sndPeeloutLoop, true, 0); }
        
	        // dash smoke
	        if (peelout_charge >= ((peelout_charge_max / 2) + (peelout_charge_max / 4)))
	        {
	            if not smoke or not instance_exists(smoke)
	            {
	                smoke = instance_create_depth(x, y, depth - 1, objDashSmoke)
	                with smoke
	                {
	                    player_id = other.id;
	                    image_xscale = other.facing;
	                    image_angle = other.mask_rotation;
	                }
	            }
	        }
        
	        // run on releasing up
	        if not (input & INPUT_UP)
	        {
	            // release charge
	            xspeed = facing * (peelout_charge / 2);
            
	            // camera
	            camera.timer = floor(peelout_charge_max - abs(xspeed));
    
	            // release
	            if audio_is_playing(reserved_sound) { audio_stop_sound(reserved_sound); }
	            audio_play_emitter(audio_emitter, sndPeeloutRelease, false, 0);
	            return player_is_running(-1);
	        }
	    }
	}



}
