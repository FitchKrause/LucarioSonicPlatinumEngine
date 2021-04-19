function player_is_rolling(argument0) {
	// player_is_rolling()
	switch argument0
	{
	case -1: // starting
	    // animate
	    animation_new = "spin";
	    animation_speed = (1 / max(5 - abs(xspeed), 1));
	    image_angle = 0;
    
	    // states and flags
	    state = player_is_rolling;
	    spinning = true;
	    spindashing = false;
	    peelouting = false;
    
	    // counters
	    chain_multiplier = 0;
	    uncurl = -1;
	    break;

	default: // main
	    // ground motion
	    if not force_sliding
	    {
	        // decelerate if moving in opposite direction
	        if (input & INPUT_LEFT) and (xspeed > 0)
	        {
	            xspeed -= roll_deceleration;
	            if (xspeed < 0)
	            {
	               xspeed = 0;
	            }
	        } 
        
	        if (input & INPUT_RIGHT) and (xspeed < 0)
	        {
	            xspeed += roll_deceleration;
	            if (xspeed > 0)
	            {
	                xspeed = 0;
	            }
	        }
	    }

	    // friction
	    xspeed -= min(abs(xspeed), roll_friction) * sign(xspeed);

	    // update position
	    if not player_move_floor() { return false; }

	    // falling
	    if not floor_tag { return player_is_falling(-1); }

	    // slip off slopes
	    if player_is_slipping() { return false; }

	    // slope friction
	    if (sign(sine[relative_angle]) == sign(xspeed)) { player_set_slope_friction(slope_friction_up, roll_friction); }
	    else { player_set_slope_friction(slope_friction_down, roll_friction); }

	    // jumping
	    if (input_pressed & INPUT_ACTION) and (not player_get_collision_ceiling(offset_y + 5)) { if not (toggleflags & PLAYERSTATE_NOJUMPING) { return player_is_falling(-2); } }

	    // manual uncurl
	    if not (toggleflags & PLAYERSTATE_NOUNCURL) { if (input & INPUT_DOWN) { if not (uncurl == -1) { uncurl = 1; } } else { uncurl = 0; } }
    
	    // auto uncurl
	    if (abs(xspeed) < unroll_threshold) or (uncurl == 1) { return player_is_running(-1); }

	    // animate
	    animation_speed = (1 / max(5 - abs(xspeed), 1));

	    // set facing
	    facing = sign(xspeed);
	}



}
