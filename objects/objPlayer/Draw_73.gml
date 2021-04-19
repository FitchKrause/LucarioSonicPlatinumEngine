/// @description Debug functions

try
{
    /*var total_locals = ds_list_size(local_list);
	for (var i = 0; i < total_locals; i ++)
	{
	    if instance_exists(local_list[|i])
	    {
			if (local_list[|i].mask_index > -1) { draw_sprite_outlined(local_list[|i].mask_index, local_list[|i].image_index, local_list[|i].x, local_list[|i].y, local_list[|i].image_xscale, local_list[|i].image_yscale, local_list[|i].image_angle, c_black, 0.5, c_white, 1); }
	        else if (local_list[|i].sprite_index > -1) { draw_sprite_outlined(local_list[|i].sprite_index, local_list[|i].image_index, local_list[|i].x, local_list[|i].y, local_list[|i].image_xscale, local_list[|i].image_yscale, local_list[|i].image_angle, c_black, 0.5, c_white, 1); }
		}
		
		// Reset
	    draw_set_alpha(1);
	    draw_set_colour(c_white);
	}*/
	
	//300
		
	// Palette debug draw
	if global.debug_paletteview and (palette_sprite > -1) and surface_exists(palette_surface)
	{
	    var _pal_scale = 4;
	    var _yoff = -18 * _pal_scale
	    var _xoff = (retro_palette_get_palette_count(palette_sprite) * 0.5) * _pal_scale;
	    draw_sprite_ext(palette_sprite, 0, floor(x) + 20 - _xoff, floor(y) + _yoff, _pal_scale, _pal_scale, 0, c_white, 1);
	    draw_surface_part_ext(palette_surface, 1, 0, 1, surface_get_height(palette_surface), floor(x) + 24 + (1 * _pal_scale) - _xoff, floor(y) + _yoff, _pal_scale, _pal_scale, c_white, 1);
	}
	
	// Debug mode
	if (state == player_is_debugging)
	{
	    if (debug_sprite > -1)
	    { 
	        draw_sprite_ext(debug_sprite, 0, floor(x), floor(y), 1, 1, debug_angle, c_white, 1); 
	        if (debug_object == objMonitor)
	        { 
	            if ((objScreen.image_index mod 4) < 3)
	            {
	                if (debug_type > -1) and (debug_type < 1)
	                {
	                    if (palette_sprite > -1) and surface_exists(palette_surface) { retro_palette_set(palette_surface, 1, true); }
	                    draw_sprite_ext(sprMonitorIconCharacter, (character_id - 1), floor(x), floor(y) - 2, 1, 1, 0, c_white, 1);
	                    if (palette_sprite > -1) and surface_exists(palette_surface) { retro_palette_clear(); }
	                }
	                else { draw_sprite_ext(sprMonitorIcon, (debug_type - 1), floor(x), floor(y) - 2, 1, 1, 0, c_white, 1);  }
	            }
	            else { draw_sprite(sprMonitorStatic, objScreen.image_index div 4, floor(x), floor(y) - image_yscale * 2); }
	        }
	    }
	}

	// Position line
	if global.debug_positionlineview
	{
	    draw_set_alpha(1);
	    draw_set_color(c_white);
	    //for (i = 1; i < table_size; i += 1) { draw_line(floor(real(ds_list_find_value(xtable, table_size - i))), floor(real(ds_list_find_value(ytable, table_size - i))), floor(real(ds_list_find_value(xtable, (table_size - i) - 1))), floor(real(ds_list_find_value(ytable, (table_size - i) - 1)))); }
	}

	// Hitbox
	if global.debug_hitboxview
	{
	    // Normal Bounding box 
	    draw_set_color(c_lime);
	    draw_set_alpha(image_alpha);
		if (mask_rotation mod 180) { draw_rectangle(floor(x) - offset_y, (floor(y) - offset_x) - 2, floor(x) + offset_y, (floor(y) + offset_x) + 2, true); }
		else { draw_rectangle((floor(x) - offset_x) - 2, floor(y) - offset_y, (floor(x) + offset_x) + 2, floor(y) + offset_y, true); }
    
	    // Wall sensor
	    draw_set_color(c_white);
	    if (mask_rotation mod 180) { draw_line(floor(x), (floor(y) - offset_wall - 1), floor(x), (floor(y) + offset_wall)); } // Vertical
	    else { draw_line((floor(x) - offset_wall - 1), floor(y), (floor(x) + offset_wall), floor(y)); } // Horizontal
    
	    // Reset
	    draw_set_alpha(1);
	    draw_set_colour(c_white);
	}

	/*if global.debug_collidersview
	{
	    draw_set_alpha(1);
	    draw_set_font(objResources.font_menu);
	    draw_set_colour(c_white);
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_middle);
    
	    var total_locals = ds_list_size(local_list);
	    for (var i = 0; i < total_locals; i ++)
	    {
	        if instance_exists(local_list[|i])
	        {
	            if collision_ray_vertical((offset_wall + 1) * facing, 2, mask_rotation, local_list[|i])
	            {
	                if (local_list[|i].mask_index > -1) { draw_sprite_outlined(local_list[|i].mask_index, local_list[|i].image_index, local_list[|i].x, local_list[|i].y, local_list[|i].image_xscale, local_list[|i].image_yscale, local_list[|i].image_angle, local_list[|i].image_blend, 1, c_white, 1); }
	                else { draw_sprite_outlined(local_list[|i].sprite_index, local_list[|i].image_index, local_list[|i].x, local_list[|i].y, local_list[|i].image_xscale, local_list[|i].image_yscale, local_list[|i].image_angle, local_list[|i].image_blend, 1, c_white, 1); }
	            }
	        }
	    }
    
	    var x1 = floor(x) + (cosine[mask_rotation] * (offset_wall + 1) * facing) - (sine[mask_rotation] * 2);
	    var y1 = floor(y) - (sine[mask_rotation] * (offset_wall + 1) * facing) - (cosine[mask_rotation] * 2);
	    var x2 = floor(x) + (cosine[mask_rotation] * (offset_wall + 1) * facing) + (sine[mask_rotation] * 2);
	    var y2 = floor(y) - (sine[mask_rotation] * (offset_wall + 1) * facing) + (cosine[mask_rotation] * 2);
	    draw_line(x1, y1, x2, y2);
	}*/

	// 
	if global.debug_anglesensorsview
	{
		draw_set_alpha(image_alpha);
		draw_set_colour(c_red);
		draw_line(x - offset_x, y + offset_y, debug_angle_x1, debug_angle_y1);
		draw_circle(debug_angle_x1, debug_angle_y1, 2, false);
		draw_set_colour(c_blue);
		draw_line(x + offset_x, y + offset_y, debug_angle_x2, debug_angle_y2);
		draw_circle(debug_angle_x2, debug_angle_y2, 2, false);
				
		// Reset
	    draw_set_alpha(1);
	    draw_set_colour(c_white);
	}

	// Angles
	if global.debug_anglesview
	{
	    draw_set_alpha(image_alpha);
	    draw_set_colour(c_white);
	    draw_circle(floor(x), floor(y), 24, true);
	    draw_set_colour(c_orange);
	    draw_line(floor(x), floor(y), floor(x) + lengthdir_x(24, gravity_direction), floor(y) + lengthdir_y(24, gravity_direction))
	    draw_set_colour(c_purple);
	    draw_line(floor(x), floor(y), floor(x) + lengthdir_x(24, mask_rotation - gravity_angle()), floor(y) + lengthdir_y(24, mask_rotation - gravity_angle()))
	    draw_set_colour(c_blue);
	    draw_line(floor(x), floor(y), floor(x) + lengthdir_x(24, relative_angle), floor(y) + lengthdir_y(24, relative_angle))
	    draw_set_colour(c_red);
	    draw_line(floor(x), floor(y), floor(x) + (lengthdir_x(24, angle) * facing), floor(y) + (lengthdir_y(24, angle) * facing))
    
	    // Reset
	    draw_set_alpha(1);
	    draw_set_colour(c_white);
	}
}
catch(error) { engine_error(error); }