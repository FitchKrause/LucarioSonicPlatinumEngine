function player_is_running(argument0) {
	// player_is_running()
	switch argument0
	{
	case -1: // starting
	    // states
	    state = player_is_running;
	    spinning = false;
	    jumping = false;
	    jump_action = true;
	    spindashing = false;
	    peelouting = false;
    
	    // flags
	    toggleflags &= ~(PLAYERSTATE_NOROTATE);
    
	    // counters
	    chain_multiplier = 0;
    
	    // camera
	    camera.vertical_lock = true;
	    break;

	default: // main
	    // motion direction
		var motion_direction = 0;
	    if (input & INPUT_LEFT) { motion_direction = -1; } else if (input & INPUT_RIGHT) { motion_direction = 1; }
	    if reverse_control and (motion_direction <> 0) { motion_direction *= -1; }
	    if (motion_direction <> 0) // ground motion
	    {
	        if (xspeed <> 0) and (sign(xspeed) <> motion_direction) // moving in opposite direction
	        {
	            if not force_sliding // ignore if sliding
	            {
	                if (abs(xspeed) > brake_threshold) and (mask_rotation == gravity_angle()) // braking
	                {
	                    animation_new = "brake";
	                    animation_speed = 1;
	                    facing = facing * select((facing == motion_direction), 1, -1);
						audio_stop_sound(reserved_sound);
						reserved_sound = audio_play_emitter(audio_emitter, sndBrake, false, 0);
	                }

	                // decelerate and reverse direction
	                xspeed += (deceleration * motion_direction) * global.tempo;
	                if (sign(xspeed) == motion_direction) { xspeed = (deceleration * motion_direction) * global.tempo; }
	            }
	        } 
	        else
	        {
	            // accelerate
	            if (abs(xspeed) < speed_cap)
	            {
	                xspeed += (acceleration * motion_direction) * global.tempo;
	                if (abs(xspeed) > speed_cap) { xspeed = (speed_cap * motion_direction) * global.tempo; }
	            }
	        }
	    }
	    else
	    {
	        // decelerate
	        xspeed -= min(abs(xspeed), ground_friction) * sign(xspeed) * global.tempo;
	    }
    
	    if not player_move_floor() { return false; } // update position
	    if not floor_tag { return player_is_falling(-1); } // falling
	    if player_is_slipping() { return false; } // slip off slopes

	    // slope friction
	    if (abs(xspeed) > speed_cap) { player_set_slope_friction(slope_friction_cap, ground_friction); } else { player_set_slope_friction(slope_friction, ground_friction); }
	    if (motion_direction == 0) and (xspeed == 0) { return player_is_standing(-1); } // standing
	
		// jumping
	    if (input_pressed & INPUT_ACTION) and not player_get_collision_ceiling(offset_y + 5) { if not (toggleflags & PLAYERSTATE_NOJUMPING) { return player_is_falling(-2); } } 
    
	    // rolling (ignore if holding forward/backward)
	    if not (toggleflags & PLAYERSTATE_NOROLLING)
	    {
	        if (input & INPUT_DOWN)
	        {
	            if (abs(xspeed) >= roll_threshold) and not (uncurl == 1)
	            {
	                audio_play_emitter(audio_emitter, sndSpinAttack, false, 0);
	                return player_is_rolling(-1);
	            }
	        }
	        else { uncurl = 0; }
	    }

    
	    image_angle = angle; // angle
	    if instance_exists(floor_id) { if (floor_id.surface_angle & ANGLEFLAG_COLLISION) and not (floor_id.surface_angle & ANGLEFLAG_ROTATE) { image_angle = gravity_angle(); } }
    
	    // animate
	    if not (floor_tag & 8) and not (((animation_new == "push") and (facing == motion_direction)) or ((animation_new == "brake") and (facing <> motion_direction)))
	    {
	        if (abs(xspeed) >= (base_speed_cap + 4)) and ((character_id == CHARACTER_TAILS) or (character_id == CHARACTER_SONIC)) { animation_new = "sprint";  }
	        else if (abs(xspeed) >= base_speed_cap) { animation_new = "run"; } else { animation_new = "walk"; }
	        animation_speed = (1 / max(10 - abs(xspeed), 1));
	    }

	    // set facing
	    if (motion_direction <> 0) and (sign(xspeed) == motion_direction) and (facing <> sign(xspeed)) { animation_reset = true; facing = motion_direction; }
	}


}
