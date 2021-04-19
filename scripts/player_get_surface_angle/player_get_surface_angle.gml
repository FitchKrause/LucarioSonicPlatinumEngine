/// @description  player_get_surface_angle(offset, default)
/// @param offset
/// @param  default
function player_get_surface_angle()
{
	/*
	Extends two points along the calling player instances's side edges downward until collision
	is found, and returns the angle between the two points.

	> offset: amount in pixels to extend from the bottom of the player's bounding box.
	> default: base angle to evaluate

	< return value: the angle beneath the two points, -1 on failure, or default if they're identical in height
	*/

	var total_locals = ds_list_size(local_list);
	var angle_collide = power(2, ((mask_rotation / 90) + 1));
	var dist1 = -1;
	var dist2 = -1;
	for (var i = offset_y; i < (offset_y + argument[0]); i += 1)
	{
		for (var j = 0; j < total_locals; j += 1)
		{
			if not collision_ray(offset_x, i, argument[1], local_list[|j]) { continue; } // if no collision
	        if local_list[|j].angle_sides { if not (local_list[|j].angle_sides & angle_collide) { continue; } } // if collider don't support that side
	        if local_list[|j].skip_sensor { continue; } // if skip sensor
	        if (dist1 < 0) and collision_ray_vertical(-offset_x, i, argument[1], local_list[|j]) { dist1 = i; }
	        if (dist2 < 0) and collision_ray_vertical(offset_x, i, argument[1], local_list[|j]) { dist2 = i; }
		}
	}
	/*for (var i = offset_y; i < (offset_y + argument[0]); i += 1)
	{    
		/*if not collision_ray(offset_x, i, argument[1], floor_id) { continue; } // if no collision
	    if floor_id.angle_sides { if not (floor_id.angle_sides & angle_collide) { continue; } } // if collider don't support that side
	    if floor_id.skip_sensor { continue; } // if skip sensor
	    if (dist1 < 0) and collision_ray_vertical(-offset_x, i, argument[1], floor_id) { dist1 = i; }
	    if (dist2 < 0) and collision_ray_vertical(offset_x, i, argument[1], floor_id) { dist2 = i; }*/
		
	    /*for (var j = 0; j < total_locals; j += 1)
	    {
	        if not collision_ray(offset_x, i, argument[1], local_list[|j]) { continue; } // if no collision
	        if local_list[|j].angle_sides { if not (local_list[|j].angle_sides & angle_collide) { continue; } } // if collider don't support that side
	        if local_list[|j].skip_sensor { continue; } // if skip sensor
	        if (dist1 < 0) and collision_ray_vertical(-offset_x, i, argument[1], local_list[|j]) { dist1 = i; }
	        if (dist2 < 0) and collision_ray_vertical(offset_x, i, argument[1], local_list[|j]) { dist2 = i; }
	    }
	    if (dist1 > -1) and (dist2 > -1) { break; }
	}*/
	if (dist1 < 0) or (dist2 < 0) { return -1; } // sensor failure

	// calculate angle from sensors
	x1 = floor(x) - (cosine[argument[1]] * offset_x) + (sine[argument[1]] * dist1);
	y1 = floor(y) + (sine[argument[1]] * offset_x) + (cosine[argument[1]] * dist1);
	x2 = floor(x) + (cosine[argument[1]] * offset_x) + (sine[argument[1]] * dist2);
	y2 = floor(y) - (sine[argument[1]] * offset_x) + (cosine[argument[1]] * dist2);
	
	// debug
	debug_angle_x1 = x1;
	debug_angle_y1 = y1;
	debug_angle_x2 = x2;
	debug_angle_y2 = y2;
	
	return angle_wrap(round(point_direction(x1, y1, x2, y2)));
}