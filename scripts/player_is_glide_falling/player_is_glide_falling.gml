/// @description  player_is_glide_falling(step)
/// @param step
function player_is_glide_falling(argument0) {
	switch argument0
	{
	case -1: // starting
	    // animate
	    animation_new = "glide_end";
	    animation_speed = 1;
    
	    // states and flags
	    state = player_is_glide_falling;
    
	    // movement and collision
	    xspeed *= 0.25;
    
	    // set air state
	    player_in_air();
	    break;

	default: // main
	    // aerial acceleration
	    if (input & INPUT_LEFT)
	    {
	        facing = -1;
	        if (xspeed > -speed_cap) { xspeed = max(xspeed - air_acceleration, -speed_cap); }
	    }
    
	    if (input & INPUT_RIGHT)
	    {
	        facing = 1;
	        if (xspeed < speed_cap) { xspeed = min(xspeed + air_acceleration, speed_cap); }
	    }

	    // update position
	    if not player_move_air() { return false; }

	    // gravity
	    yspeed += gravity_force;

	    // landing
	    if floor_tag
	    {
	        // run or stand immediately on steep terrain; otherwise, stand gradually
	        if (relative_angle >= 45) and (relative_angle <= 315)
	        {
	            if (xspeed <> 0) { return player_is_running(-1); } else { return player_is_standing(-1); }
	        }
	        else { return player_is_glide_standing(-1); }
	    }
	}




}
