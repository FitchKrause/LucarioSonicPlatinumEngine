/// @description  Render

// Water
draw_set_alpha(1);
draw_set_colour(c_white);
if flash { draw_sprite_ext(sprWaterMask, 0, x, y, image_xscale, image_yscale, 0, c_white, 1); }
else
{
	gpu_set_blendmode_ext(bm_inv_src_alpha, bm_src_color);
    draw_sprite_ext(water_index, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
	gpu_set_blendmode(bm_normal);
}
flash = false;

// Horizon
var total_length = ceil((sprite_get_width(water_index) * image_xscale) / sprite_get_width(horizon_index));
if horizon
{
    for (i = 0; i < total_length; i += 1)
    {
        var subtract = (i == (total_length - 1)) ? frac((sprite_get_width(water_index) * image_xscale) / sprite_get_width(horizon_index)) : 1;
        draw_sprite_part_ext(horizon_index, (objScreen.image_index * 0.34), 0, 0, sprite_get_width(horizon_index) * subtract, sprite_get_height(horizon_index), x + (32 * i), y - (sprite_get_height(horizon_index) / 2), 1, 1, c_white, 1);
    }
}

