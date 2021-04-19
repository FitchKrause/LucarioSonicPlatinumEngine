/// @description  retro_palette_clear()

function retro_palette_clear()
{
	if not global.shaders_active { exit; }
	if palette_applied { shader_reset(); }
	palette_applied = false;
}