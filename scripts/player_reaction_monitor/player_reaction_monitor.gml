function player_reaction_monitor(argument0, argument1) {
	// player_reaction_monitor(local_id, code)

	// ignore if falling/AI player
	if (argument0.gravity > 0) { return false; }
	if (objData.player_cpu[player_id] == true) { return false; }

	// handle bottom collision differently
	if (argument1 == DIRECTION_TOP)
	{
	    // cut vertical speed
	    yspeed = 0;

	    // knock down
	    argument0.speed = 2;
	    argument0.gravity = gravity_force;
	    argument0.gravity_direction = gravity_direction;
	    argument0.direction = gravity_direction + 180;
	    argument0.jump_hit = true;

	    // hard collision found
	    return true;
	}
	else
	{
	    // ignore if not spinning
	    if not (spinning or ((state == player_is_gliding) or (state == player_is_glide_sliding))) return false;

	    // check collision code
	    if (floor_tag or ((state == player_is_gliding) or (state == player_is_glide_sliding))) { if (xspeed == 0) or (abs(argument1) <> DIRECTION_RIGHT) { return false; } }
	    else if (argument1 <> DIRECTION_BOTTOM) { return false; }

	    // bubble shield
	    if (shield) and (shield_type == SHIELD_BUBBLE) { with shield { if (action) { action = false; } } }
    
	    // dropdash
	    if (character_id == CHARACTER_SONIC) { dropdasing = false; }
    
	    // create icon
	    with instance_create_depth(argument0.x, argument0.y + (argument0.image_yscale * 2), -1, objMonitorIcon)
	    {   
	        if (argument0.icon == MONITOR_RANDOM)
	        {
	            argument0.icon = irandom_range(MONITOR_EXTRALIFE, (MONITOR_RANDOM - 1));
	        }
             
	        if (argument0.icon < MONITOR_EGGMAN)
	        {
	            sprite_index = sprMonitorIconCharacter;
	            image_index = (other.character_id - 1);
	        }
	        else
	        {
	            sprite_index = sprMonitorIcon;
	            image_index = (argument0.icon - 1);
	        }
        
	        item = argument0.icon;
	        player_id = other.id;
	    }

	    // sound
	    audio_play_stereo(sndPop, argument0.x, argument0.y, false, 0);
    
	    // break item
	    with argument0 { instance_destroy(); }

	    // bounce if top collision
	    if (not floor_tag) and (argument1 == DIRECTION_BOTTOM)
	    {
	        // increase force if holding jump
	        if (input & INPUT_ACTION)
	        {
	            yspeed = -yspeed; 
	        } 
	        else 
	        { 
	            yspeed = max(-jump_release, -yspeed); 
	        }
	    }
	}
	return true;



}
