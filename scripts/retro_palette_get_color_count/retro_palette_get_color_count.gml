/// @description  retro_palette_get_color_count(palette sprite)
/// @param palette sprite

function retro_palette_get_color_count()
{
	if not global.shaders_active { exit; }
	return sprite_get_height(argument[0]);
}