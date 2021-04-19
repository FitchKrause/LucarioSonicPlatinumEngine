/// @description Pallete render
/*
if palette_enabled
{
	if (palette_sprite > -1)
	{
	    if not is_undefined(pallete_color) // Stored
	    {
	        if surface_exists(palette_surface)
	        {
	            surface_set_target(palette_surface);
	            draw_sprite(palette_sprite, 0, 0, 0); // Base palette
	            retro_palette_draw_palette(palette_sprite, 0, 1, 0); // Dummy palette
	            for (var index = 0; index < (array_length(pallete_color[palette_index])); index += 1)
	            {
	                var new_color = string_extract(pallete_color[palette_index, index], " | ", 0);
	                var new_position = real(string_extract(pallete_color[palette_index, index], " | ", 1));
	                var new_colour_transformed = hex_to_color(new_color);
	                draw_set_colour(new_colour_transformed);
	                draw_point(1, new_position);
	            }
	            surface_reset_target();
	        }
	        else { palette_surface = surface_create(2, sprite_get_height(palette_sprite)); }
	    }
	}
}*/