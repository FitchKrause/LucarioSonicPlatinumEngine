/// @description  Draw the cursor
//draw_box_sprite(sprite, image_index, x, y, x + width, y + height, c_white, 1);

// Custom draw script
if (draw_script <> noone)
{
    if (script_exists(draw_script))
    {
        script_execute(draw_script);
    }
}

