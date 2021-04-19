/// @description  player_reaction_corkscrew(local_id)
/// @param local_id
function player_reaction_corkscrew(argument0) {

	// if already colliding to other corkscrew
	if (argument0.last_collision & (player_id + 1)) { floor_tag |= 8; }

	// abort if ...
	if (path_index > -1) { return false; } // pathing
	if jumping { return false; } // not correct state
	if (abs(xspeed) < argument0.threshold) { return false; } // too slow
	if (x < argument0.bbox_left) or (x > argument0.bbox_right) { return false; } // not in range
	if not (argument0.last_collision & (player_id + 1)) // not already colliding and ...
	{
	    if not (floor_tag & 1) // not grounded and ...
	    {
	        if not (floor_tag & 8) { return false; } // not in other corkscrew
	    }
		if (xprevious >= argument0.bbox_left) and (xprevious <= argument0.bbox_right) { return false; } // too far in
	}

	// collide
	argument0.collision |= (player_id + 1);
	floor_tag |= 8;
	angle = gravity_angle();

	// adjust height
	var ox = (x - argument0.bbox_left) / argument0.sprite_width;
	var oy = (argument0.sprite_height * 0.5) - 8 - offset_y;
	y = argument0.bbox_top + (argument0.sprite_height * 0.5) + cosine[angle_wrap(ox * 360)] * oy;

	// animate player
	if (animation_new <> "corkscrew") and (animation_new <> "spin") { animation_new = "corkscrew"; }
	if (animation_new == "corkscrew") { if facing { image_index = ox * 12; } else { image_index = 12 - (ox * 12); } }
	return false;
}