/// @description  Render

var times = ceil(height / 16)
for (var i = 0; i < times; i += 1)
{
    draw_sprite(sprExampleChainLink, 0, xstart + cosine[objScreen.image_index mod 360] * (i * 16), ystart - sine[objScreen.image_index mod 360] * (i * 16));
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

