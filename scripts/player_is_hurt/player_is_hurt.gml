/// @description  player_is_hurt(step, facing, [vulnerability])
/// @param step
/// @param  facing
/// @param  [vulnerability]
function player_is_hurt()
{
	// State
	if (argument_count > 2) { vulnerability = argument[2]; }
	
	switch argument[0]
	{
	case -1: // starting
	    // animate
	    animation_new = "hurt";
	    animation_speed = 1;
	    image_angle = gravity_angle();

	    // states and flags
	    state = player_is_hurt;
	    spinning = false;
	    jumping = false;
	    spindashing = false;
	    peelouting = false;

	    // movement and collision
	    xspeed = argument[1] * 2;
	    yspeed = -4;
    
	    if (xspeed == 0) { xspeed = 2; }
		
	    if underwater
	    {
	        xspeed *= 0.5;
	        yspeed *= 0.5;
	    }

	    // counters and timers
	    ignore_rings = 64;

	    // set air state
	    player_in_air();

	    // character values
	    if (character_id == CHARACTER_KNUCKLES) { glide_falling = false; }
	    break;

	default: // main
	    // update position
	    if not player_move_air()
	    {
	        if not vulnerability { immunity = 120; }
	        return false;
	    }

	    // gravity
	    yspeed += hit_force * global.tempo;

	    // floating
	    if floating
	    {
	        player_is_floating(-1, facing);
        
	        // gain temporary invulnerability
	        if not vulnerability { immunity = 120; }
	    }
    
	    // landing
	    if floor_tag
	    {
	        player_is_standing(-1);

	        // freeze movement
	        xspeed = 0;
	        yspeed = 0;

	        // gain temporary invulnerability
	        if not vulnerability { immunity = 120; }
	    }
	}
}