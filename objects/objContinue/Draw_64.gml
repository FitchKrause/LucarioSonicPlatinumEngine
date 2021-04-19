/// @description  Continue

// Fill screen
// Tinted blue layer
gpu_set_colorwriteenable(true, true, false, true);
draw_set_color(c_black);
draw_set_alpha(fade_alpha * 1.5);
draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
draw_set_alpha(1);

// Black layer
gpu_set_colorwriteenable(true, true, true, true);
draw_set_color(c_black);
draw_set_alpha(fade_alpha);
draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
draw_set_alpha(1);

// Title
draw_set_font(objResources.font_title_text);
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed((objScreen.gui_width / 2), (title_ox - title_offset), "CONTINUE", 2, 2, 0);

// Timer
draw_set_font(objResources.font_hud_numbers);
draw_text_transformed((objScreen.gui_width / 2), (timer_ox - timer_offset), string_real_character(string(round(continue_timer / 60)), 2, 0), 2, 2, 0);

// Timer sprites
draw_sprite_ext(sprContinueStar, 0, ((objScreen.gui_width / 2) - 50), (timer_ox - timer_offset) - 14, 2, 2, 0, c_white, 1);
draw_sprite_ext(sprContinueStar, 0, ((objScreen.gui_width / 2) + 30), (timer_ox - timer_offset) - 14, 2, 2, 0, c_white, 1);

// Character
draw_sprite_ext(sprContinueOval, 0, (objScreen.gui_width / 2), (title_ox + timer_offset) + 220, 2, 2, 0, c_white, 1);
switch (objData.player_character_id[0])
{
    case CHARACTER_SONIC:
    {
        draw_sprite_ext(sprContinueTokenSonic, ((image_index div 8) mod 2), 32 - timer_offset, (objScreen.gui_height - 78), 2, 2, 0, c_white, 1);
        draw_sprite_ext(sprContinueSonic, (image_index / 8), (objScreen.gui_width / 2), (title_ox + timer_offset) + 230, 2, 2, 0, c_white, 1);
        break;
    }
    
    case CHARACTER_TAILS:
    {
        draw_sprite_ext(sprContinueTokenTails, ((image_index div 8) mod 2), 32 - timer_offset, (objScreen.gui_height - 78), 2, 2, 0, c_white, 1);
        draw_sprite_ext(sprContinueTails, (image_index / 8), (objScreen.gui_width / 2), (title_ox + timer_offset) + 230, 2, 2, 0, c_white, 1);
        break;
    }
    
    case CHARACTER_KNUCKLES:
    {
        draw_sprite_ext(sprContinueTokenKnuckles, ((image_index div 8) mod 2), 32 - timer_offset, (objScreen.gui_height - 78), 2, 2, 0, c_white, 1);
        draw_sprite_ext(sprContinueKnuckles, (image_index / 8), (objScreen.gui_width / 2), (title_ox + timer_offset) + 230, 2, 2, 0, c_white, 1);
        break;
    }
}

// Continues
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_set_font(objResources.font_hud_lives);
draw_sprite_ext(sprLivesXHud, 0, 54 - timer_offset, (objScreen.gui_height - 68), 2, 2, 0, c_white, 1);
if objData.zeroes_display { draw_text_transformed_colour(142, (objScreen.gui_height - 68), string_real_character(0, 4, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
draw_text_transformed_colour(142 - timer_offset, (objScreen.gui_height - 68), objData.continues, 2, 2, 0, c_white, c_white, c_white,c_white, 1);

// Reset
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

