/// @description Pause & Error

// Force paused
if global.force_paused
{
    // Fill black
    draw_set_alpha(1);
    draw_rectangle_colour(0, 0, objScreen.gui_width, objScreen.gui_height, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    
    // Pause
    draw_set_alpha(1);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(objResources.font_title_text);
    draw_text_transformed((objScreen.gui_width / 2), (objScreen.gui_height / 2), "Engine Paused", 2, 2, 0);
}

// Error handler
if global.error
{
    // Title
    /*draw_set_alpha(1);
    draw_set_colour(c_white); //$FFFFDB
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_font(objResources.font_title_text);
    draw_text_transformed(objScreen.gui_width / 2, 26, "ILLEGAL INSTRUCTION", 1, 1, 0);*/

    // Error
	draw_set_alpha(1);
    draw_set_colour(c_black);
	draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
    draw_set_colour(c_white);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    draw_set_font(objResources.font_menu);
    draw_text_ext_transformed(16, 64, global.error_message, 12, objScreen.gui_width - 16, 1, 1, 0);
}

// Reset
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);