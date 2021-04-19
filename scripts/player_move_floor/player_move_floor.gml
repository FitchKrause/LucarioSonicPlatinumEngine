function player_move_floor()
{
	//return player_move_handle();
	
	var step, hit_wall, hit_floor;	
	if (floor_tag & 1) // double-check floor availability, moving platforms
	{
		if instance_exists(floor_id) 
		{
			if ((floor_id.x - floor_id.xprevious) <> 0) { x += (floor_id.x - floor_id.xprevious); }
			if ((floor_id.y - floor_id.yprevious) <> 0) { y += (floor_id.y - floor_id.yprevious); }
		}
		else { floor_id = noone; floor_tag &= ~1; } // release floor data
	}
	wall_id = noone; // reset collision data

	// prepare for segmentation
	var distance = min(abs(xspeed), max_xspeed) * sign(xspeed); 
	var total_steps = 1 + (abs(distance) div segment_width);
	if limit_xspeed { xspeed = distance; } // clamp if applicable
	repeat total_steps // segmentation and create movement step, then apply movement step
	//for (var i = 0; i < total_steps; i += 1)
	{
		step = min(abs(distance), segment_width) * sign(distance);
		if (abs(distance) > 0) { distance -= step; }
		x += (cosine[angle] * step) * global.tempo;
		y -= (sine[angle] * step) * global.tempo;
		
		//show_debug_message("total_steps: " + string(total_steps));
		//show_debug_message("step: " + string(step));
		//show_debug_message("distance: " + string(distance));

		if not player_update_bounds() { return false; } // stay in camera boundary
		floor_tag &= ~254; // reset floor tag (keep terrain tag)
		if player_get_collision_soft() { return false; } // get soft collisions
		player_update_air(); // refresh air related states
		if player_set_local_list() // get hard collision list
		{
			hit_wall = player_get_collision_wall(0); // wall collision
			if hit_wall // evaluate
			{
				if hit_wall.crush and collision_point(x, y, hit_wall, true, true) { return player_is_dead(-1); } // get crushed, if applicable
				player_set_wall(hit_wall, player_get_wall_offset(hit_wall)); // update wall data and react
				if player_react(hit_wall, wall_facing) { return false; }
				if (sign(xspeed) == wall_facing) and not hit_wall.sticky { xspeed = 0; if (facing == wall_facing) { player_wall_push(hit_wall, wall_facing); } } // stop if moving towards wall, and try to push if we're facing the wall
				if hit_wall.sticky
				{
					mask_rotation = angle_wrap(mask_rotation + 90 * sign(wall_facing)); // get floor data
					player_set_floor(hit_wall, true);
					player_set_floor_height();
					floor_tag |= 1;
					
					if (relative_angle > 45) and (relative_angle < 315)
					{
						if not player_set_mask_rotation()
						{
							mask_rotation = angle_wrap(mask_rotation + 90 * sign(distance_to_angle(mask_rotation, angle)));
						}
					}
					break; // exit loop
				}
			}

			if (floor_tag & 4) { hit_floor = player_get_collision_floor(offset_y, mask_rotation); }
			else { hit_floor = player_get_collision_floor(offset_y * 2, mask_rotation); }
			if hit_floor // floor collision, ignore if it's a wall
			{
				if player_react(hit_floor, 2) { return false; } // react
				player_set_floor(hit_floor, false); // get floor data
				player_set_floor_height();
				floor_tag |= 1;
			}
			else { floor_tag &= ~1; } // release floor data
			player_set_mask_rotation(); // handle mask rotation
		}
		else // reset collision data
		{
			floor_id = noone;
			floor_tag &= ~1;
		}
		player_update_water_running(); // update water running
	}
	if (floor_tag & 1) { player_set_cliff_facing(); } // update cliff facing
	return true; // success
}