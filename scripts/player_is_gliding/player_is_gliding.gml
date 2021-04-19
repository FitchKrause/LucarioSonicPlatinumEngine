function player_is_gliding(argument0) {
	// player_is_gliding()
	switch argument0
	{
	case -1: // starting
	    // animate
	    animation_new = "glide";
	    animation_speed = 1;
    
	    // angle
	    image_angle = angle;
	    if instance_exists(floor_id)
		{
			var angleflag = floor_id.surface_angle;
			if (angleflag & ANGLEFLAG_COLLISION) and not (angleflag & ANGLEFLAG_ROTATE) { image_angle = gravity_angle(); }
		}
    
	    // states and flags
	    state = player_is_gliding;
	    spinning = false;
	    jumping = false;
	    jump_action = false;

	    // movement and collision
	    if (yspeed <= -8) { yspeed *= 0.35; } else if (yspeed < 0) { yspeed = 0; }
    
	    // set air state
	    player_in_air();
    
	    // character values
	    glide_speed = abs(xspeed);
	    glide_direction = facing;
	    glide_angle = 180 * not facing;
	    glide_force = 0.5;
	    break;

	default: // main
	    // acceleration
	    if not (abs(glide_angle) mod 180) and (glide_speed < 12)
	    {
	        glide_speed += glide_acceleration;
	        if (glide_speed > glide_speed_cap) { glide_speed = glide_speed_cap; }
	    }
    
	    // motion direction
	    if (input & INPUT_LEFT) { glide_direction = -1; } else if (input & INPUT_RIGHT) { glide_direction = 1; }
    
	    // turning
	    glide_angle = median(glide_angle - (2.8125 * glide_direction), 0, 180);
    
	    // speed
	    xspeed = glide_speed * cosine[glide_angle];
    
	    // update position
	    if not player_move_air() { return false; }
    
	    // glide pressure
	    if (glide_force < 0.5)
	    {
	        glide_force += 0.125;
	        if (glide_force > 0.5) { glide_force = 0.5; }
	    }
    
	    // gravity
	    if (abs(glide_force - yspeed) > 0) { yspeed += min(abs(glide_force - yspeed), 0.125) * sign(glide_force - yspeed); }
    
	    // falling
	    if not (input & INPUT_ACTION) { return player_is_glide_falling(-1); }
    
	    // landing
	    if floor_tag
	    {
	        // slide if moving too slow
	        if (relative_angle >= 45) and (relative_angle <= 315)
	        {
	            if (xspeed <> 0)
	            {
	                animation_new = "glide_end";
	                return player_is_running(-1);
	            }
	            else
	            {
	                animation_new = "glide_end";
	                return player_is_standing(-1);
	            }
	        }
	        else { return player_is_glide_sliding(-1); }
	    }

	    // climbing
	    if (wall_id > -1)
	    {
	        if (wall_id.can_climb) and (wall_facing == glide_direction)
	        {
	            if (((wall_id.climb_direction <> 0) and (wall_id.climb_direction == glide_direction)) or (wall_id.climb_direction == 0))
	            {
	                return player_is_climbing(-1);
	            }
	            else { glide_speed = 0; }
	        }
	        else { glide_speed = 0; }
	    }
    
	    // facing
	    if (((-glide_angle) + 90) <> 0) { facing = sign((-glide_angle) + 90); }
    
	    // animate
	    if (abs(glide_angle - 90) > 67.5) { image_index = 0; }
		else if (abs(glide_angle - 90) > 22.5) { image_index = 1; }
	    else { image_index = 2; }
	}



}
