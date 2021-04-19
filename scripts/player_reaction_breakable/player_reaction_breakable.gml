function player_reaction_breakable(argument0, argument1) {
	// player_reaction_breakable(local_id, code)

	// ignore if ...
	if (path_index > -1) { return false; } // pathing
	if not (spinning or (character_id == CHARACTER_KNUCKLES)) { return false; } // neither spinning nor knuckles
	if (abs(argument1) == DIRECTION_BOTTOM) // colliding vertically and ...
	{
	    // not in the air
	    if floor_tag { return false; }

	    // bounce if top collision
	    if (argument1 == DIRECTION_BOTTOM) { yspeed = -3; }
	}

	// give score
	player_chain_multiplier(player_id, argument0.x + (argument0.sprite_width / 2), argument0.y + (argument0.sprite_height / 2));

	// destroy object
	with argument0 instance_destroy();
	return true;



}
