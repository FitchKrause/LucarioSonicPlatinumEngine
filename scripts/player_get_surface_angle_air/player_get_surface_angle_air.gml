/// @description  player_get_surface_angle_air(default, [radius])
/// @param default
/// @param  [radius]
function player_get_surface_angle_air()
{
	/*
	Checks a 180 degree arc around a fixed focal point by sweeping a ray from the calling
	player instance's center point. Returns the combined angle formed from each collision zone.

	> default: base angle to evaluate

	< return value: the angle formed within the arc, or default on failure
	*/

	var total_locals = ds_list_size(local_list);
	var radius = 17;
	var ox = 0;
	var oy = 0;
	var detected = false;
	var angle_collide = power(2, ((mask_rotation / 90) + 1));
	var ray_direction; //, j;
	if (argument_count > 1) { radius = argument[1]; }
	for (j = 0; j < total_locals; j += 1)
	{
		for (var i = (argument[0] - 90); i < (argument[0] + 90); i += 1)
		{
			ray_direction = angle_wrap(i);
			if local_list[|j].flat_surface { continue; } // abort on flat surface
	        if local_list[|j].angle_sides { if not (local_list[|j].angle_sides & angle_collide) { continue; } } // abort if collider don't support that side
	        if local_list[|j].skip_sensor { continue; } // abort if collider skip sensor
	        if collision_line(x, y, x + sine[ray_direction] * radius, y + cosine[ray_direction] * radius, local_list[|j], true, true) // check collision
	        {
	            ox += sine[ray_direction];
	            oy += cosine[ray_direction];
	            detected = true;
	            break;
	        }
		}
	}
	
	/*for (var i = (argument[0] - 90); i < (argument[0] + 90); i += 1)
	{*/
		/*if floor_id.flat_surface { continue; } // abort on flat surface
	    if floor_id.angle_sides { if not (floor_id.angle_sides & angle_collide) { continue; } } // abort if collider don't support that side
	    if floor_id.skip_sensor { continue; } // abort if collider skip sensor
	    if collision_line(x, y, x + sine[ray_direction] * radius, y + cosine[ray_direction] * radius, floor_id, true, true) // check collision
	    {
	        ox += sine[ray_direction];
	        oy += cosine[ray_direction];
	        detected = true;
	        break;
	    }*/
		
		/*ray_direction = angle_wrap(i);
	    for (j = 0; j < total_locals; j += 1)
	    {
	        if local_list[|j].flat_surface { continue; } // abort on flat surface
	        if local_list[|j].angle_sides { if not (local_list[|j].angle_sides & angle_collide) { continue; } } // abort if collider don't support that side
	        if local_list[|j].skip_sensor { continue; } // abort if collider skip sensor
	        if collision_line(x, y, x + sine[ray_direction] * radius, y + cosine[ray_direction] * radius, local_list[|j], true, true) // check collision
	        {
	            ox += sine[ray_direction];
	            oy += cosine[ray_direction];
	            detected = true;
	            break;
	        }
	    }
	}*/

	// return angle if detected; otherwise, return default
	//if detected { return angle_wrap(round(point_direction(0, 0, ox, oy) + 90)); }
	return detected ? angle_wrap(round(point_direction(0, 0, ox, oy) + 90)) : argument[0];
}