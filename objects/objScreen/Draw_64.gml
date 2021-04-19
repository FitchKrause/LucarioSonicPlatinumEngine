/// @description GUI

// Version
draw_set_alpha(1);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_font(objResources.font_menu);
draw_set_colour(c_white);
draw_text_transformed(gui_width, gui_height, VERSION, 2, 2, 0);

// FPS
if objData.show_fps
{
    draw_set_alpha(1);
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);
    draw_set_font(objResources.font_menu);
    draw_set_colour(c_yellow);
    draw_text_transformed(gui_width - 112, gui_height - 18, "FPS: ", 2, 2, 0);
    draw_set_colour(c_white);
    draw_text_transformed(gui_width, gui_height - 18, string_real_character(string(round(fps_real)), 2, 0) + "/" + string_real_character(string(fps), 2, 0), 2, 2, 0);
}

// Reset
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

