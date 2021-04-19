/// @description  Console

if is_active
{
    draw_set_alpha(1);
    draw_set_font(objResources.font_menu);
    draw_set_colour(c_white);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    
    var xdraw = 8;
    var ydraw = objScreen.gui_height - 96;
    var listdraw = render_start;
    
    // Box
    draw_set_alpha(0.5);
    draw_rectangle_colour(6, ydraw - 2 - 176, objScreen.gui_width - 6, ydraw + 8, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(0.5);
    
    // Header
    draw_set_alpha(1);
    draw_text_transformed(8, ydraw - 176, "Developer Console (NOT FINISHED)", 1, 1, 0);
    draw_line_width_colour(6, ydraw + 11 - 176, objScreen.gui_width - 6, ydraw + 11 - 176, 2, c_white, c_white);
    
    // Input
    var cursor_x = clamp(24 + string_width(string_copy(input_text, 0, cursor_position)), 24, objScreen.gui_width - 8);
    draw_set_alpha(0.5);
    draw_rectangle_colour(6, ydraw - 2 + 13, objScreen.gui_width - 6, ydraw + 8 + 13, c_black, c_black, c_black, c_black, false);
    draw_set_alpha(1);
    draw_text_transformed(8, ydraw + 13, "> ", 1, 1, 0);
    draw_text_transformed(24, ydraw + 13, input_text, 1, 1, 0);
    if ((image_index div 16) mod 2) { draw_text_transformed(cursor_x, ydraw + 15, "_", 1, 1, 0); }
    
    while ds_list_size(log_text)
    {
        if (listdraw > (ds_list_size(log_text) - 1)) or (listdraw > render_end) { exit; }
        if (ds_list_find_value(log_text, listdraw) <> undefined)
        {
            draw_text_coloured(xdraw, ydraw, ds_list_find_value(log_text, listdraw), 1, 1, 1);
            ydraw -= 11;
            listdraw += 1;
        }
        else { continue; }
    }
}

/// Pop-out messages

if not is_active
{
    draw_set_alpha(1);
    draw_set_font(objResources.font_menu);
    draw_set_colour(c_white);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    
    var xdraw = 8;
    var ydraw = objScreen.gui_height - 96;
    var listdraw = 0;
    while ds_list_size(message_text)
    {
        if (listdraw > (ds_list_size(message_text) - 1)) { exit; }
        if (ds_list_find_value(message_text, listdraw) <> undefined)
        {
            draw_set_alpha(0.5);
            draw_rectangle_colour(6, ydraw - 2, objScreen.gui_width - 6, ydraw + 8, c_black, c_black, c_black, c_black, false);
            draw_set_alpha(1);
            draw_text_coloured(xdraw, ydraw, ds_list_find_value(message_text, listdraw), 1, 1, 1);
            ds_list_replace(message_timer, listdraw, ds_list_find_value(message_timer, listdraw) - 1)
            if not ds_list_find_value(message_timer, listdraw)
            {
                ds_list_delete(message_text, listdraw);
                ds_list_delete(message_timer, listdraw);
                listdraw += 1;
                continue;
            }
            ydraw -= 11;
            listdraw += 1;
        }
        else
        {
            ds_list_delete(message_text, listdraw);
            ds_list_delete(message_timer, listdraw);
            log("ENGINE MESSAGE ERROR: <undefined> message!")
            continue;
        }
    }
}

