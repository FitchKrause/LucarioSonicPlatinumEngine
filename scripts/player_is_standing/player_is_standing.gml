/// @description  player_is_standing(step)
/// @param step
function player_is_standing()
{
	switch argument[0]
	{
		case -1: // starting
		{
		    // states
		    state = player_is_standing;
		    spinning = false;
		    jumping = false;
		    jump_action = true;
		    spindashing = false;
		    peelouting = false;

		    // flags
		    toggleflags &= ~(PLAYERSTATE_NOROTATE);
    
		    // counters
		    chain_multiplier = 0;
		    uncurl = 0;

		    // camera
		    camera.vertical_lock = true;
    
		    // local list
		    player_set_local_list();
    
		    // cliff
		    player_set_cliff_facing();

		    // animate
		    animation_new = "idle";
		    switch (character_id)
		    {
		        case CHARACTER_SONIC:
		        {
		            switch cliff_facing
		            {
		                case -1:
		                {
		                    if (facing == 1) { animation_new = "cliff_b"; } else if (facing == -1) { animation_new = "cliff"; }
		                    break;
		                }
                
		                case 1:
		                {
		                    if (facing == 1) { animation_new = "cliff"; } else if (facing == -1) { animation_new = "cliff_b"; }
		                    break;
		                }
		            }
		            break;
		        }
        
		        case CHARACTER_TAILS:
		        case CHARACTER_KNUCKLES:
		        {
		            if (cliff_facing <> 0) { animation_new = "cliff"; }
		            break;
		        }
		    }
    
		    animation_speed = 1;
		    image_angle = gravity_angle();
		    if instance_exists(floor_id) { if floor_id.sticky { image_angle = angle; } }
		    break;
		}

		default: // main
		{
		    // update position
		    if not player_move_floor() return false;

		    // abort if ...
		    if not floor_tag return player_is_falling(-1); // falling
		    if player_is_slipping() return false; // slipping

		    // input
		    // running
		    if (input & INPUT_LEFT) or (input & INPUT_RIGHT) or (xspeed <> 0) or force_sliding
		    {
		        return player_is_running(-1);
		    }
    
		    // jumping
		    if (input_pressed & INPUT_ACTION) and not player_get_collision_ceiling(offset_y + 5)
		    {
		        if not (toggleflags & PLAYERSTATE_NOJUMPING) { return player_is_falling(-2); }
		    }

		    // looking / crouching (if not at cliff)
		    if (cliff_facing == 0)
		    {
		        if (mask_rotation == gravity_angle()) or instance_exists(floor_id) and floor_id.sticky
		        {
		            if (input & INPUT_UP) { if (not (toggleflags & PLAYERSTATE_NOLOOKING)) { return player_is_looking(-1); } }
		            if (input & INPUT_DOWN) { if (not (toggleflags & PLAYERSTATE_NOCROUCHING)) { return player_is_crouching(-1); } }
		        }
		    }
    
		    // cliff
		    player_set_cliff_facing();
    
		    // animation
		    animation_new = "idle";
		    if (character_id == CHARACTER_SONIC)
		    {
		        switch (cliff_facing)
		        {
		            case -1: { if (facing == 1) { animation_new = "cliff_b"; } else if (facing == -1) { animation_new = "cliff"; } break; }
		            case 1: { if (facing == 1) { animation_new = "cliff"; } else if (facing == -1) { animation_new = "cliff_b"; } break; }
		        }
		    }
		    else if (character_id == CHARACTER_TAILS) { if (cliff_facing <> 0) { animation_new = "cliff"; } }
		    else if (character_id == CHARACTER_KNUCKLES) { if (cliff_facing <> 0) { animation_new = "cliff"; } }
    
		    animation_speed = 1;
		    image_angle = gravity_angle();
		    if instance_exists(floor_id) { if floor_id.sticky { image_angle = angle; } }
		}
	}
}