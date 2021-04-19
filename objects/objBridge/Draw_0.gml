/// @description  Render bridge nodes

if (image_xscale >= 1)
{
    var height;
    var offset = ratio * sprite_width;
    for (var i = 0; i < sprite_width; i += node_width) // Get relative tension
    {
        if (i < offset) { height = tension_interpolated * sine[floor((i / offset) * 90)]; }
        else if (i > offset)
        {
            height = tension_interpolated * sine[floor(((sprite_width - i) / (sprite_width - offset)) * 90)];
        }
        else { height = tension; }
        draw_sprite(sprite_index, image_index, bbox_left + i, ystart + height);
    }
}