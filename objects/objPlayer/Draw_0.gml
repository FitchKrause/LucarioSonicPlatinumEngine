/// @description  Render Player

try
{
	// Character
	if (sprite_index > -1) 
	{
	    if (palette_sprite > -1) and surface_exists(palette_surface) { retro_palette_set(palette_surface, 1, true); }
	    draw_sprite_ext(sprite_index, image_index, floor(x), floor(y), (offset_size * facing), offset_size, select(objData.classic_rotation, image_angle, round(image_angle / 45) * 45), image_blend, image_alpha - (0.5 * (state == player_is_debugging)));
	    if (palette_sprite > -1) and surface_exists(palette_surface) { retro_palette_clear(); }
	}
}
catch(error) { engine_error(error); }