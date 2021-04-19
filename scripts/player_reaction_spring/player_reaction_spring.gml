function player_reaction_spring(argument0, argument1) {
	// player_reaction_spring(local_id, code)

	// get angle relative to current rotation
	var rotation_offset = angle_wrap((floor(argument0.image_angle / 90) * 90) - mask_rotation);

	// check collision code
	if (argument1 == DIRECTION_RIGHT) and (rotation_offset <> 90) return false;
	if (argument1 == DIRECTION_LEFT) and (rotation_offset <> 270) return false;
	if (argument1 == DIRECTION_BOTTOM) and (rotation_offset <> 0) return false;
	if (argument1 == DIRECTION_TOP) and (rotation_offset <> 180) return false;

	// trigger spring
	argument0.collision |= (player_id + 1);
	if (argument0.last_collision & argument0.collision) return false; // ignore if already triggered

	// get spring vectors
	var spring_hspeed = -sine[rotation_offset] * argument0.force;
	var spring_vspeed = -cosine[rotation_offset] * argument0.force;

	// bubble shield
	if (shield) and (shield_type == SHIELD_BUBBLE) { with shield { if (action) { action = false; } } }

	// horizontal spring
	if (spring_hspeed <> 0)
	{
	    // movement and collision
	    xspeed = spring_hspeed;
	    facing = sign(xspeed);

	    // cancel glide sliding / standing
	    if (state == player_is_glide_sliding or state == player_is_glide_standing)
	    {
	        player_is_running(-1);
	    }

	    // cancel gliding
	    if (state == player_is_gliding)
	    {
	        // states and flags
	        state = player_is_falling;
	        jump_action = false;

	        // set air state
	        player_in_air();

	        // character values
	        glide_falling = false;
	    }
	}

	// vertical spring
	if (spring_vspeed == 0)
	{
	    if (floor_tag)
	    {
	        force_sliding = 16;
	    }
	}
	else
	{
	    // states and flags
	    state = player_is_falling;
	    spinning = false;
	    jump_action = false;
	    jumping = false;

	    // movement and collision
	    yspeed = spring_vspeed;

	    // set air state
	    player_in_air();

	    // character values
	    if (character_id == CHARACTER_KNUCKLES) { glide_falling = false; }
	    if (character_id == CHARACTER_SONIC) { dropdasing = false; }

	    // animate player
	    if (argument0.animation)
	    {
	        animation_new = "flip";
	        animation_tick = 0;
	    } 
	    else
	    {
	        animation_new = "rise";
	    }
    
	    animation_speed = 1;
	    image_angle = gravity_angle();
	}

	// animate spring
	argument0.animation_running = true;

	// sound
	audio_play_stereo(sndSpring, argument0.x, argument0.y, false, 0);
	return true;



}
