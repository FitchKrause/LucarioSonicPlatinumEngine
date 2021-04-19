function player_move_air()
{
	//return player_move_handle();
	
	var step, hit_wall, hit_floor, ceiling_angle;
	
	// reset collision data
	wall_id = noone; 
	wall_facing = 0;
	
	// prepare for segmentation
	var distance = min(abs(xspeed), max_xspeed) * sign(xspeed);
	var total_steps = 1 + (abs(distance) div segment_width)
	if limit_xspeed { xspeed = distance; } // clamp if applicable
	repeat total_steps // segmentation and create segment, then apply segment
	//for (var i = 0; i < total_steps; i += 1)
	{
		step = min(abs(distance), segment_width) * sign(distance);
		if (abs(distance) > 0) { distance -= step; }
		x += (cosine[angle] * step) * global.tempo;
		y -= (sine[angle] * step) * global.tempo;

		if not player_update_bounds() { return false; } // keep in bounds
		if player_get_collision_soft() { return false; } // get soft collisions
		player_update_air(); // refresh air related states
		if not player_set_local_list() { continue; } // get hard collision list
		hit_wall = player_get_collision_wall(0); // wall collision
		if hit_wall // evaluate
		{
			if collision_point(x, y, hit_wall, true, true) and hit_wall.crush { return player_is_dead(-1); } // get crushed, if applicable
			player_set_wall(hit_wall, player_get_wall_offset(hit_wall)); // get wall data
			if player_react(hit_wall, wall_facing) { return false; } // execute reaction
			if (sign(xspeed) == wall_facing) and not hit_wall.sticky { xspeed = 0; } // stop if moving towards wall
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
	}
		
	distance = min(abs(yspeed), max_yspeed) * sign(yspeed); // prepare for segmentation
	total_steps = 1 + (abs(distance) div segment_height);
	if limit_yspeed { yspeed = distance; }
	//repeat total_steps // segmentation and create movement step, then  apply movement step
	for (var i = 0; i < total_steps; i += 1)
	{
		step = min(abs(distance), segment_height) * sign(distance);
		if (abs(distance) > 0) { distance -= step; }
		x += (sine[angle] * step) * global.tempo;
		y += (cosine[angle] * step) * global.tempo;

		if not player_update_bounds() { return false; } // keep in bounds
		if player_get_collision_soft() { return false; } // get soft collisions
		player_update_air(); // refresh air related states
		if not player_set_local_list() { continue; } // get hard collision list
		if (yspeed >= 0) // collide based on velocity
		{
			hit_floor = player_get_collision_floor(offset_y, mask_rotation); // floor collision and evaluate
			if hit_floor { if player_react(hit_floor, 2) { return false; } }
		}
		else
		{
			hit_floor = player_get_collision_ceiling(offset_y); // ceiling collision and evaluate
			if hit_floor // calculate ceiling angle, cancel if rising too slowly or angle is too flat, otherwise slide against ceiling
			{
			    if player_react(hit_floor, -2) { return false; } // execute reaction
			    while collision_box(offset_x, offset_y, (mask_rotation mod 180), hit_floor) { x += sine[mask_rotation]; y += cosine[mask_rotation]; } // move outside collision
			    mask_rotation = angle_wrap(mask_rotation + 180); // rotate mask to ceiling
			    if (hit_floor.surface_angle & ANGLEFLAG_COLLISION) { ceiling_angle = angle_wrap(player_get_surface_angle_air(mask_rotation) - gravity_angle()); }
				else { ceiling_angle = mask_rotation }
			    if ((yspeed > ceiling_threshold) or ((ceiling_angle > 135) and (ceiling_angle < 225))) and not hit_floor.sticky
			    {
			        xspeed = (xspeed * cosine[ceiling_angle]) + (yspeed * -sine[ceiling_angle]);
			        yspeed = xspeed * -sine[ceiling_angle];
			        xspeed = xspeed * cosine[ceiling_angle];
			        if (character_id == CHARACTER_TAILS) { flight_force = 0.03125; } // reset flight gravity, if applicable
			        mask_rotation = gravity_angle(); // revert mask rotation
			        break; // exit loop
			    }
            
			    if hit_floor.sticky
			    {
			        player_set_floor(hit_floor, true); // get floor data
					player_set_floor_height();
			        floor_tag |= 1;
			        yspeed = 0; // stop falling
			        break; // exit loop
			    }
			}
		}

		if hit_floor // evaluate collision
		{
			player_set_floor(hit_floor, true); // get floor data and update mask rotation
			floor_tag |= 1;
			if (relative_angle > 45) and (relative_angle < 315) { if not player_set_mask_rotation() { mask_rotation = angle_wrap(mask_rotation + 90 * sign(distance_to_angle(mask_rotation, angle))); } }
			if ((abs(xspeed) <= abs(yspeed)) and (relative_angle >= 22.5) and (relative_angle <= 337.5)) and not hit_floor.sticky // calculate landing speed and scale speed to incline
			{
			    xspeed = -yspeed * sign(sine[relative_angle]);
			    if (relative_angle < 45) or (relative_angle > 315) { xspeed *= 0.5; }
			}
        
			yspeed = 0; // stop falling
			if (abs(xspeed) < slide_threshold) and (relative_angle >= 45) and (relative_angle <= 315) and not hit_floor.sticky { force_sliding = 32; } // slip off steep slants (cannot fall at this time)
			//if (sign(xspeed) <> 0) { facing = sign(xspeed); }
			break; // exit loop
		}
			
		hit_wall = player_get_collision_wall(0); // wall collision and handle wall collision
		if hit_wall
		{
			offset = player_get_wall_offset(hit_wall);
			x -= (cosine[mask_rotation] * offset) * global.tempo;
			y += (sine[mask_rotation] * offset) * global.tempo;
		}
	}
	return true; // success
}