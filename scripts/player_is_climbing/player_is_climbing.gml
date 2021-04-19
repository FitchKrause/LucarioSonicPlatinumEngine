function player_is_climbing(argument0) {
	// player_is_climbing()
	switch argument0
	{
	case -1: // starting
	    // animate
	    animation_new = "climb";
    
	    // states and flags
	    state = player_is_climbing;
    
	    // movement and collision
	    xspeed = 0;
	    yspeed = 0;
	    y = floor(y);
    
	    // sound
	    audio_play_emitter(audio_emitter, sndGlide, false, 0);
    
	    break;

	default: // main
	    var hit_floor;

	    // speed
	    if (input & INPUT_UP) { yspeed = -climb_speed; }
	    else if (input & INPUT_DOWN) { yspeed = climb_speed; }
	    else { yspeed = 0; }
    
	    // handle terrain movement
	    if instance_exists(wall_id)
	    {
	        // horizontal terrain motion
	        if (wall_id.hspeed <> 0) { x += wall_id.hspeed; }
	        else if (wall_id.x - wall_id.xprevious <> 0) { x += wall_id.x - wall_id.xprevious; }
    
	        // vertical terrain motion
	        if (wall_id.vspeed <> 0) { y += wall_id.vspeed; }
	        else if (wall_id.y - wall_id.yprevious <> 0) { y += wall_id.y - wall_id.yprevious; }
	    }
	    else
	    {
	        // fall
	        return player_is_glide_falling(-1);
	    }

	    // apply movement step
	    x += (sine[angle] * yspeed) * global.tempo;
	    y += (cosine[angle] * yspeed) * global.tempo;

	    // keep in bounds
	    if not player_update_bounds() { return false; }
		
	    // refresh air state
	    player_update_air();

	    // get soft collisions
	    if player_get_collision_soft() { return false; }

	    // get hard collision list
	    if not player_set_local_list() { player_is_glide_falling(-1); }

	    // collide based on velocity
	    if (yspeed >= 0)
	    {
	        // floor collision
	        hit_floor = player_get_collision_floor(offset_y, mask_rotation);

	        // evaluate
	        if hit_floor { if player_react(hit_floor, 2) { return false; } }
	    }
	    else
	    {
	        // ceiling collision
	        hit_floor = player_get_collision_ceiling(offset_y + 1);

	        // evaluate
	        if hit_floor
	        {
	            // execute reaction
	            if player_react(hit_floor, -2) { return false; }

	            // move outside collision
	            while collision_box(offset_x, offset_y, mask_rotation mod 180, hit_floor)
	            {
	                x += sine[angle];
	                y += cosine[angle];
	            }

	            // don't land on this
	            hit_floor = noone;

	            // stop rising
	            yspeed = 0;
	        }
	    }

	    // evaluate collision
	    if hit_floor
	    {
	        // get floor data
	        player_set_floor(hit_floor, false);
	        floor_tag |= 1;

	        // update mask rotation
	        if relative_angle > 45 and relative_angle < 315
	        {
	            if not player_set_mask_rotation()
	            {
	                mask_rotation = angle_wrap(mask_rotation + 90 * sign(angle_difference(mask_rotation, angle)));
	            }
	        }

	        // calculate landing speed
	        if (relative_angle >= 22.5) and (relative_angle <= 337.5)
	        {
	            // scale speed to incline
	            xspeed = -yspeed * sign(sine[relative_angle]);
	            if (relative_angle < 45 or relative_angle > 315) { xspeed *= 0.5; }
	        }

	        // stop falling
	        yspeed = 0;

	        // slip off steep slants (cannot fall at this time)
	        if abs(xspeed) < slide_threshold and (relative_angle >= 45) and (relative_angle <= 315)
	        {
	            force_sliding = 32;
	        }
	    }

	    // evaluate wall collision
	    //wall_id = player_get_collision_wall(1);
	    wall_id = noone;
    
	    var total_locals = ds_list_size(local_list);
	    for (var i = 0; i < total_locals; i ++)
	    {
	        if (instance_exists(local_list[|i]))
	        {
	            if collision_ray_vertical((offset_wall + 1) * facing, 2, mask_rotation, local_list[|i])
	            {
	                wall_id = local_list[|i];
	                break;
	            }
	        }
	    }
            

	    // clamber at ledge; otherwise, fall if no wall or cannot climb wall
	    if (wall_id < 0)
	    {
	        if (yspeed < 0)
	        {
	            return player_is_clambering(-1);
	        }
	        else if (yspeed > 0)
	        {
	            return player_is_glide_falling(-1);
	        }
	    }
	    else
	    {
	        if (not wall_id.can_climb)
	        {
	            return player_is_glide_falling(-1);
	        }
	        else if not (((wall_id.climb_direction <> 0) and (wall_id.climb_direction == glide_direction)) or (wall_id.climb_direction == 0))
	        {
	            return player_is_glide_falling(-1);
	        }
	    }

	    // landing
	    if floor_tag
	    {
	        return player_is_standing(-1);
	    }

	    // jumping
	    if (input_pressed & INPUT_ACTION)
	    {
	        if not (toggleflags & PLAYERSTATE_NOJUMPING)
	        {
	            player_is_falling(-2);
            
	            facing = -facing;
	            xspeed = 4 * facing;
	            yspeed = -4;
            
	            return false;
	        }
	    }

	    // animate
	    if (input & INPUT_UP) { animation_speed = sign(-yspeed); }
	    else if (input & INPUT_DOWN) { animation_speed = sign(yspeed); }
	    else { animation_speed = 0; }
	}



}
