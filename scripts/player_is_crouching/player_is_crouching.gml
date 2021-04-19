/// @description  player_is_crouching(step)
/// @param step
function player_is_crouching(argument0) {
	switch argument0
	{
	case -1: // starting
	    animation_new = "crouch";
	    animation_speed = 1;
	    state = player_is_crouching;
	    if (camera.offset_y == 0) { timer = 120; }
	    break;

	default: // main
	    // movement
	    if (xspeed != 0) { xspeed -= min(abs(xspeed), ground_friction) * sign(xspeed); }
	    if not player_move_floor() return false;

	    // abort if ...
	    if (not floor_tag) { return player_is_falling(-1); } // falling
	    if (player_is_slipping()) { return false; } // slipping

	    // slope friction
	    player_set_slope_friction(slope_friction, ground_friction);

	    // input
	    if (not (input & INPUT_DOWN)) or (input & INPUT_LEFT) or (input & INPUT_RIGHT) or (xspeed <> 0)
	    {
	        return player_is_running(-1);
	    }
    
	    if (input_pressed & INPUT_ACTION)
	    {
	        if not (toggleflags & PLAYERSTATE_NOSPINDASH)
	        {
	            return player_is_spindashing(-1);
	        }
	        else if (toggleflags & PLAYERSTATE_NOSPINDASH)
	        {
	            if (not (toggleflags & PLAYERSTATE_NOJUMPING))
	            {
	                return player_is_falling(-2);
	            }
	        }
	    }

	    // camera panning
	    if (not timer) and (camera.offset_y < camera_pan_down) { camera.offset_y += 2; }
	}



}
