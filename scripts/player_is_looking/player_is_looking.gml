function player_is_looking(argument0) {
	// player_is_looking()
	switch argument0
	{
	case -1: // starting
	    // animate
	    animation_new = "look";
	    animation_speed = 1;
    
	    // states and flags
	    state = player_is_looking;
    
	    // camera
	    if (camera.offset_y == 0) { timer = 120; }
	    break;

	default: // main
	    // friction
	    xspeed -= min(abs(xspeed), ground_friction) * sign(xspeed);

	    // update position
	    if not player_move_floor() { return false; }

	    // update panning
	    if not timer { if (camera.offset_y > camera_pan_up) { camera.offset_y -= 2; } }

	    // falling
	    if not floor_tag { return player_is_falling(-1); }

	    // slip off slopes
	    if player_is_slipping() { return false; }

	    // slope friction
	    if (abs(xspeed) > speed_cap) { player_set_slope_friction(slope_friction_cap, ground_friction); } else { player_set_slope_friction(slope_friction, ground_friction); }

	    // abort on movement or releasing up
	    if (not (input & INPUT_UP)) or (input & INPUT_LEFT) or (input & INPUT_RIGHT) or (xspeed <> 0) { return player_is_running(-1); }

	    // input
	    if (input_pressed & INPUT_A) { if not (toggleflags & PLAYERSTATE_NOPEELOUT) { return player_is_peelouting(-1); } }
    
	    // jumping
	    if ((input_pressed & INPUT_B) or (input_pressed & INPUT_C)) and not player_get_collision_ceiling(offset_y + 5)
	    {
	        if not (toggleflags & PLAYERSTATE_NOJUMPING) { return player_is_falling(-2); }
	    }
	}




}
