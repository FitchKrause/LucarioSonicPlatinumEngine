/// @description  Render card

// Tinted color & solid color
draw_set_alpha(1);
gpu_set_colorwriteenable(true, true, false, true);
draw_set_color(fill_colour);
draw_set_alpha(fade_alpha * 2);
draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
gpu_set_colorwriteenable(true, true, true, true);
draw_set_alpha(fade_alpha);
draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
draw_set_alpha(1);

// Begin long styles code
if not instance_exists(objZone) { exit; } // Fail-safe
switch style
{
    case STYLETYPE_ENGINE: // Engine
    {
        // Triangles
        draw_set_alpha(1);
        draw_set_colour(c_dkgray);
        draw_triangle(0 - engine_triangles_offset, 0, 0 - engine_triangles_offset, objScreen.gui_height, objScreen.gui_width - engine_triangles_offset, objScreen.gui_height, false);
        draw_set_colour(c_gray);
        draw_triangle(0 + engine_triangles_offset, 0, objScreen.gui_width + engine_triangles_offset, 0, objScreen.gui_width + engine_triangles_offset, objScreen.gui_height, false);
    
        // Lines
        draw_set_alpha(1);
        draw_set_colour(c_white);
        draw_rectangle(0 - engine_lines_offset, 48, objScreen.gui_width - engine_lines_offset, 96, false);
        draw_rectangle(0 + engine_lines_offset, objScreen.gui_height - 96, objScreen.gui_width + engine_lines_offset, objScreen.gui_height - 48, false);
    
        // Borders
        if (effect_line_offset > -round(sprite_get_height(sprTitleCardBorder) * 2) * sine[45]) { effect_line_offset -= 1; }
        else { effect_line_offset = -2; }
        for (i = 0; i < (ceil(objScreen.gui_height / (sprite_get_height(sprTitleCardBorder) * 2))) + 1; i += 1)
        {
            draw_sprite_ext(sprTitleCardBorder, 1, (objScreen.gui_width + 200) + ((sprite_get_height(sprTitleCardBorder) * 2) * i) * cosine[135] - effect_line_offset + engine_borders_offset, (objScreen.gui_height - 128) + ((sprite_get_height(sprTitleCardBorder) * 2) * i) * sine[135] + effect_line_offset + engine_borders_offset, 2, 2, 135, c_ltgray, 1);
        }
        
        for (i = 0; i < (ceil(objScreen.gui_height / (sprite_get_height(sprTitleCardBorder) * 2))) + 1; i += 1)
        {
            draw_sprite_ext(sprTitleCardBorder, 1, -200 + ((sprite_get_height(sprTitleCardBorder) * 2) * i) * cosine[315] + effect_line_offset - engine_borders_offset, 128 + ((sprite_get_height(sprTitleCardBorder) * 2) * i) * sine[315] - effect_line_offset - engine_borders_offset, 2, 2, 315, c_ltgray, 1);
        }
        
        // Text
        draw_set_color(c_white);
        draw_set_valign(fa_bottom);
        draw_set_halign(fa_right);
        draw_set_font(objResources.font_title_text2);
        draw_text_transformed(engine_title_ox, (objScreen.gui_height / 2) + engine_title_offset, name, 2, 2, 0);
        draw_set_valign(fa_top);
        if not (objZone.levelflags & LEVELFLAG_NOZONE) { draw_text_transformed(engine_title_ox, (objScreen.gui_height / 2) - engine_title_offset, "Zone", 2, 2, 0); }
        
        // Act
        if (act > -1) and not (objZone.levelflags & LEVELFLAG_NOACT)
        {
            draw_set_color(c_white);
            draw_set_valign(fa_middle);
            draw_set_halign(fa_left);
            draw_set_font(objResources.font_title_act2);
            draw_text_transformed(engine_act_ox - engine_act_offset, (objScreen.gui_height / 2), string(act), 2, 2, 0);
            draw_sprite_ext(sprTitleCardAct, 0, engine_act_ox + 48 - engine_act_offset, (objScreen.gui_height / 2) + 40, 2, 2, 0, c_white, 1);
        }
        break;
    }
	
    case STYLETYPE_SONIC1: // Sonic 1
    {
        // Oval
        draw_sprite_ext(sprTitleCardOval, 0, sonic1_oval_ox + sonic1_oval_offset, 200, 2, 2, 0, c_white, 1);
        
        // Act
        if (act > -1) and not (objZone.levelflags & LEVELFLAG_NOACT)
        {
            draw_set_color(c_white);
            draw_set_valign(fa_top);
            draw_set_halign(fa_left);
            draw_set_font(objResources.font_title_act);
            draw_text_transformed(sonic1_act_ox + sonic1_act_offset, 208, string(act), 2, 2, 0);
            draw_sprite_ext(sprTitleCardAct, 0, sonic1_act_sprite_ox + sonic1_act_offset, 244, 2, 2, 0, c_white, 1);
        }
        
        // Text
        draw_set_color(c_white);
        draw_set_valign(fa_top);
        draw_set_halign(fa_right);
        draw_set_font(objResources.font_title_text);
        draw_text_transformed(sonic1_title_ox1 - sonic1_title_offset, 172, name, 2, 2, 0);
        if not (objZone.levelflags & LEVELFLAG_NOZONE) { draw_text_transformed((sonic1_title_ox2 - sonic1_title_offset2) + (29 * (objZone.levelflags & LEVELFLAG_NOACT)), 208, "Zone", 2, 2, 0); }
        break;
    }
    
    default: // Sonic 2
    {
        // Blue backdrop
        if (sonic2_backdrop_offset > 0)
        {
            draw_set_color(bg_color);
            draw_rectangle(0, 0, objScreen.gui_width, 0 + sonic2_backdrop_offset, false);
        }
        
        // Set pieces
        draw_set_color(c_white);
        draw_sprite_ext(sprTitleCardGame, 0, sonic2_border_offset1, objScreen.gui_height - 128, 2, 2, 0, c_white, 1);
        
        // Border
        for (i = 0; i < (ceil(objScreen.gui_height / (sprite_get_height(sprTitleCardBorder) * 2))); i += 1)
        {
            draw_sprite_ext(sprTitleCardBorder, 0, sonic2_border_offset2, ((sprite_get_height(sprTitleCardBorder) * 2) * i), 2, 2, 0, c_white, 1);
        }
        
        
        // Act
        if (act > -1) and not (objZone.levelflags & LEVELFLAG_NOACT)
        {
            draw_set_valign(fa_top);
            draw_set_halign(fa_left);
            draw_set_font(objResources.font_title_act2);
            draw_text_transformed(sonic2_act_ox - sonic2_title_offset, 160, string(act), 2, 2, 0);
        }
        
        // Text
        draw_set_valign(fa_top);
        draw_set_halign(fa_right);
        draw_set_font(objResources.font_title_text2);
        draw_text_transformed(sonic2_title_ox1 + sonic2_title_offset, 112, name, 2, 2, 0);
        if not (objZone.levelflags & LEVELFLAG_NOZONE) { draw_text_transformed((sonic2_title_ox2 - sonic2_title_offset) + (16 * (objZone.levelflags & LEVELFLAG_NOACT)), 160, "Zone", 2, 2, 0); }
        break;
    }
}

// Reset
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);