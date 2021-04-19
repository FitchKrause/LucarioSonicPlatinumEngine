/// @description  Animation, particles and pallette system

try
{
	// Animation system
	if not (toggleflags & PLAYERSTATE_NOANIMATE) and not objGame.paused
	{
	    if (animation_table > -1) 
	    {
	        if ((animation_current <> animation_new) or animation_reset) and not animation_locked
	        {            
	            animation_previous = animation_current;
	            animation_current = animation_new;
	            animation_reset = false;

	            var get_animation = ds_map_find_value(animation_table, animation_new)
	            if not is_undefined(get_animation)
	            {
	                if script_exists(get_animation)
	                {
	                    animation_script = get_animation;
	                    animation_tick = 0;
	                    animation_running = true;
	                }
	            }
	        }
	        if animation_running { if (animation_speed <> 0) { if script_exists(animation_script) { script_execute(animation_script, floor(animation_tick)); animation_tick += (animation_speed * global.tempo); } } }
	    }
	}

	// Flashing
	if not (toggleflags & PLAYERSTATE_NOUPDATEVISIBLE) and not objGame.paused { image_alpha = 1 - (0.5 * ((immunity div 4) mod 2)); }

	// Brake particles
	if ((animation_current == "brake") or ((animation_current == "glide_slide") and (floor_tag & 1))) and not (objScreen.image_index mod 4) { part_particles_create(objGame.particles, x, y + (offset_y - 7), objResources.part_dust, 1); }

	// Bubbles
	if (shield_type <> SHIELD_BUBBLE) and not super_form
	{
	    if underwater or outspace // Are we close to drowning?
	    {
	        if ((air_count mod 60) == 0) // Create drown popup
	        {
	            if (air_count <= 720) and (drown_count < 0)
	            {
	                drown_count = instance_create_depth(floor(x) + (facing * 8), floor(y) - 8, depth - 1, objDrownPopup);
	                drown_count.player_id = id;
	                drown_count.offset = 180 * (facing < 1);
	            }
	        }

	        if underwater // Create normal bubble
	        {
	            if ((air_count mod irandom_range(10, 20)) == 0)
	            {
	                with instance_create_depth(floor(x) + (facing * 8), floor(y) - 8, depth - 1, objBubble)
	                {
	                    size = irandom_range(0, 3);
	                    offset = 180 * (other.facing < 1);
	                    yspeed = -(random_range(0.5, 2));
	                }
	            }
	        }
	    }
	}

	// Pallette animation
	if palette_enabled { if palette_anim_running { if (palette_anim_speed <> 0) { if script_exists(palette_anim_script) { script_execute(palette_anim_script, floor(palette_anim_tick)) palette_anim_tick += palette_anim_speed; } } } }
}
catch(error) { engine_error(error); }