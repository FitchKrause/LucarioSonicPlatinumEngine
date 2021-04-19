/// @description  retro_palette_initialize(shader)
/// @param shader

function retro_palette_initialize()
{
	globalvar palette_shader, palette_pixel_size, palette_uvs, palette_id, palette_texture, palette_applied;
	palette_shader = argument[0];
	palette_pixel_size = shader_get_uniform(palette_shader, "u_pixelSize");
	palette_uvs = shader_get_uniform(palette_shader, "u_Uvs");
	palette_id = shader_get_uniform(palette_shader, "u_paletteId");
	palette_texture = shader_get_sampler_index(palette_shader, "u_palTexture");
	palette_applied = false;
}