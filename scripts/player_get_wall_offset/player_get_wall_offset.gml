/// @description  player_get_wall_offset(local_id)
/// @param local_id
function player_get_wall_offset()
{
	/*
	Calculates the exact distance to escape collision on the calling player instance's wall sensor
	with the given local.

	> local_id: instance id to evaluate

	< return value: amount in pixels to move the calling player instance, or 0 on failure.
	*/
	
	// get collision offset
	var i = 0;
	for (i = offset_wall; i > -1; i -= 1) { if not collision_ray(i, 0, mask_rotation, argument[0]) { break; } }
	if (i < 0)
	{
	    for (i = offset_wall; i < offset_wall * 2; i += 1) // we're inside; find closest edge outside of collision
	    {
	        if not collision_ray_vertical(i, 0, mask_rotation, argument[0]) { return -(offset_wall + i); } // right side
	        if not collision_ray_vertical(-i, 0, mask_rotation, argument[0]) { return (offset_wall + i); } // left size
	    }
	}
	else if collision_ray_vertical(i + 1, 0, mask_rotation, argument[0]) { return (offset_wall - i); } // right wall only
	else if collision_ray_vertical(-(i + 1), 0, mask_rotation, argument[0]) { return -(offset_wall - i); } // left wall only
	return 0;
}