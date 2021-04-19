/// @description  Render

// Custom alpha & blending (colour)
draw_set_alpha(alpha);
draw_set_colour(colour);

// Default Render sized sprite box
// draw_sprite_rectangle(sprite, subimg, xpos, ypos, xpos + width, ypos + height, pixels, pixels, pixels, pixels);

// Custom draw
if (draw_script <> noone)
{
    if (script_exists(draw_script)) 
    {
        script_execute(draw_script);
    }
}

// Reset
draw_set_alpha(1);
draw_set_colour(c_white);

