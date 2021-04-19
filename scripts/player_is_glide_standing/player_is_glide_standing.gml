/// @description player_is_glide_standing(state)
function player_is_glide_standing() {
	switch argument[0]
	{
		case -2: // starting (slide)
		{
		    // animate
		    animation_new = "glide_stand_2";
    
		    // states and flags
		    state = player_is_glide_standing;
    
		    // movement and collision
			glide_speed = 0;
		    xspeed = 0;
		    break;
		}

		case -1: // starting
		{
		    // animate
		    animation_new = "glide_stand_1";
    
		    // states and flags
		    state = player_is_glide_standing;
    
		    // movement and collision
			glide_speed = 0;
    
		    // character values
		    glide_falling = false;
    
		    // camera
		    camera.vertical_lock = true;
    
		    // sound
		    audio_play_emitter(audio_emitter, sndGlideStand, false, 0);
		    break;
		}

		default: // main
		{
		    // update position
		    if not player_move_floor() { return false; }
    
		    // falling
		    if not floor_tag { return player_is_glide_falling(-1); }

		    // get up
		    if (animation_new <> "glide_stand_1") and (animation_new <> "glide_stand_2") { return player_is_standing(-1); }
	
			// momentum
			if (xspeed <> 0) { return player_is_running(-1); }
	
		    // run on steep terrain
		    if (relative_angle >= 45) and (relative_angle <= 315)
		    {
		        // if not at gravity angle, fall; otherwise, slide
		        if (relative_angle >= 90) and (relative_angle <= 270) { return player_is_glide_falling(-1); } else { sliding = 32; return player_is_running(-1); }
		    }

		    // jumping
		    if (input_pressed & INPUT_ACTION) and not (player_get_collision_ceiling(offset_y + 5))
		    {
		        if not (toggleflags & PLAYERSTATE_NOJUMPING) { return player_is_falling(-2); }
		    }
		}
	}


}
