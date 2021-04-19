/// @description  player_is_floating(step, direction)
/// @param step
/// @param  direction
function player_is_floating() {

	switch argument[0]
	{
	    case -1: // starting
	    {
	        // animate
	        animation_new = "float";
	        animation_speed = 1;
	        image_angle = gravity_angle();
        
	        // speed
	        xspeed = 4 * argument[1];
	        facing = argument[1];
        
	        // states and flags
	        state = player_is_floating;
	        jumping = false;
	        spinning = false;
	        floating = true;
        
	        // set air state
	        player_in_air();
	        break;
	    }
    
	    default: // main
	    {
	        // movement
	        if not player_move_air() { return false; }
        
	        // constant speed
	        xspeed = 4 * facing;
            
	        // move up and down
	        if (input & INPUT_UP) { yspeed = -2; }
	        else if (input & INPUT_DOWN) { yspeed = 2; }
	        else { yspeed = 0; }
        
	        // animate
	        animation_new = "float";
	        animation_speed = 1;
	        image_angle = gravity_angle();
        
	        break;
	    }
	}




}
