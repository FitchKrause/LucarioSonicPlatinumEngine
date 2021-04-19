/// @description  Draw console
/*
// Console visible
if (con_visible) {

    // Background surface
    if (surface_exists(con_surf)) {
        draw_surface(con_surf,0,0);
    }
    
    // Dim screen
    draw_set_alpha(con_dim);
    draw_set_color(c_black);
    var sw = surface_get_width(con_surf);
    var sh = surface_get_height(con_surf);
    draw_rectangle(0,0,sw,sh,false);

    // Fill
    draw_set_alpha(fill_a);
    draw_set_color(fill_c);
    draw_rectangle(textbox_x,textbox_y,textbox_x+width,textbox_y+height, false);
    
    if (!active) {
    
        // Border
        draw_set_alpha(border_a);
        draw_set_color(border_c);
        draw_rectangle_width(textbox_x, textbox_y, textbox_x+width, textbox_y+height, border_w);
        
    } else {
    
        // Active border
        draw_set_alpha(active_a);
        draw_set_colour(active_c);
        draw_rectangle_width(textbox_x, textbox_y, textbox_x+width, textbox_y+height, active_w);
    
    }
    
    // Text area size
    var x1 = textbox_x+padding;
    var y1 = textbox_y+padding;
    var x2 = (textbox_x+width)-padding;
    
    // Textbox surface
    surface_set_target(surf);
        
        // Ready surface for drawing
        
        
        // Draw text
        draw_set_alpha(fnt_a);
        draw_set_color(fnt_c);
        //draw_set_font(fnt);
        draw_text(-scroll, 0, value);
        
        // If textbox active
        if (active) {
        
            // Highlighting
            if (cursor_pos1 != cursor_pos2) {
            
                // Size
                var minpos = min(cursor_pos1, cursor_pos2);
                var maxpos = max(cursor_pos1, cursor_pos2);
                var curx1 = string_width(string_copy(value, 0, minpos))-scroll;
                var curx2 = string_width(string_copy(value, 0, maxpos))-scroll;
            
                // Background
                draw_set_alpha(select_bg_a);
                draw_set_color(select_bg_c);
                draw_rectangle(curx1, 0, curx2, string_height("Wp"), 0);
                
                // Text
                var sel = string_copy(value, minpos+1, (maxpos-minpos));
                
                draw_set_alpha(select_fnt_a);
                draw_set_color(select_fnt_c);
                draw_text(curx1, 0, sel);
            
            }
            
        }
        
    surface_reset_target();
    
    // Cursor
    if (active && cursor_pos1 = cursor_pos2 && cursor_flash) {
        
        var curx = clamp(x1+string_width(string_copy(value, 0, cursor_pos1))-scroll, x1, x2);
        
        draw_set_alpha(cursor_a);
        draw_set_color(cursor_c);
        draw_line_width(curx, y1, curx, y1+string_height("Wp"), cursor_w);
        
    }
    
    // Draw textbox surface
    draw_surface(surf, x1, y1);
    draw_set_alpha(1);
    
    // Suggestions
    if (con_sug_enabled && !ds_list_empty(con_sug)) {
    
        // Position
        var sx = textbox_x + con_sug_pad;
        var sy = textbox_y + height; 
        var lh = string_height("Wp");
        
        // Suggestions
        for (var i=0;i<ds_list_size(con_sug);i++) {
        
            // Get command
            var index = con_sug[| i];
            var cmd = con_cmds[| index];
            var args = con_cmds[| index+2];
            var typs = con_cmds[| index+3];
            
            // Background
            if (con_sug_sel == i) then
            draw_set_color(con_sug_sel_c) else
            draw_set_color(con_sug_bg_c);
            draw_rectangle(textbox_x-border_w,sy,textbox_x+width,sy+lh+(con_sug_pad*2),false);
            
            // Command
            draw_set_color(con_sug_cmd_c);
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            
            if (is_array(args)) then cmd += con_sep;
            draw_text(sx,sy+con_sug_pad,cmd);
            
            // Arguments
            if (is_array(args)) {
            
                // Position
                sx += string_width(cmd);
            
                // For each argument
                for (a=0; a<array_length(args); a++) {
                
                    draw_set_color(con_sug_arg_c);
                    draw_text(sx,sy+con_sug_pad,args[a]);
                    sx += string_width(args[a]);
                
                    // Check if type is set
                    if (is_array(typs) && !is_undefined(typs[a])) {
                    
                        draw_set_color(con_sug_typ_c);
                        var typ = "["+typs[a]+"]";
                        draw_text(sx,sy+con_sug_pad,typ);
                        sx += string_width(typ);
                    
                    }
                    
                    draw_set_color(con_sug_arg_c);
                    draw_text(sx,sy+con_sug_pad,con_sep);
                    sx += string_width(con_sep);
                
                }
            
            }
            
            // Next row
            sx = textbox_x + con_sug_pad;
            sy += lh+(con_sug_pad*2);
        
        }
    
    }
    
}

