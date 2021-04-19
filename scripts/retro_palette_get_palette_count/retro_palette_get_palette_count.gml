/// @description  retro_palette_get_palette_count(palette sprite)
/// @param palette sprite

function retro_palette_get_palette_count()
{
	if not global.shaders_active { exit; }
	return sprite_get_width(argument[0]);
}