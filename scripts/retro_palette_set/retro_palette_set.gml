/// @description  retro_palette_set(palette_sprite_index, palette_index, surface)
/// @param palette_sprite_index
/// @param  palette_index
/// @param  surface
function retro_palette_set()
{
	if not global.shaders_active { exit; }
	var _pal_sprite = argument[0];
	var _pal_index = argument[1];
	if (_pal_index == 0) { exit; }
	shader_set(palette_shader);
	palette_applied = true;
	var tex = argument[2] ? surface_get_texture(_pal_sprite) : sprite_get_texture(_pal_sprite, 0);
	texture_set_stage(palette_texture, tex);
	var texel_x = texture_get_texel_width(tex);
	var texel_y = texture_get_texel_height(tex);
	var texel_hx = texel_x * 0.5;
	var texel_hy = texel_y * 0.5;
	shader_set_uniform_f(palette_pixel_size, texel_x, texel_y);
	shader_set_uniform_f(palette_id, _pal_index);
	if not argument[2] // Using a sprite based palette
	{
		var UVs = sprite_get_uvs(_pal_sprite, 0);
		shader_set_uniform_f(palette_uvs, UVs[0] + texel_hx, UVs[1] + texel_hy, UVs[2] + texel_hx, UVs[3] + texel_hy);
	}
	else // Using a surface based palette
	{
		shader_set_uniform_f(palette_uvs, texel_hx, texel_hy, 1.0 + texel_hx, 1.0 + texel_hy);
	}
}