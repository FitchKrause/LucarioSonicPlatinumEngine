/// @description  player_set_cliff_facing()
function player_set_cliff_facing()
{
	/*
	Evaluates the direction (x-sign) of nearest cliff edge from the calling player instance's
	position.

	< return value: n/a
	*/

	if (xspeed <> 0) { cliff_facing = 0; return false; } // Moving ignores cliffs

	var total_locals = ds_list_size(local_list); // Prepare for evaluation
	var edges = 0;
	for (var i = 0; i < total_locals; i += 1)
	{
	    if collision_ray_vertical(-offset_x, offset_y * 2, mask_rotation, local_list[|i]) { edges |= 4; } // Left
	    if collision_ray_vertical(offset_x, offset_y * 2, mask_rotation, local_list[|i]) { edges |= 1; } // Right
	    if collision_ray_vertical(0, offset_y * 2, mask_rotation, local_list[|i]) { edges |= 2; } // Center
	}

	switch edges // Check if only one is colliding
	{
	    case 1: { cliff_facing = -1; break; } // Left
	    case 4: { cliff_facing = 1; break; } // Right
	    default: { cliff_facing = 0; break; } // None
	}
}