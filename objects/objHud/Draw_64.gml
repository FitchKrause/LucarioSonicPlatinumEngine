/// @description  Display HUD

if (player_number < 0) { exit; } // Invalid player
if not objData.hud_visible { exit; }
if not instance_exists(objGame.player_id[player_number]) { exit; }

// HUD sprite
var hud_sprite = sprHud;
if (objZone.levelstyle & STYLETYPE_SONIC1) { hud_sprite = sprHudAlt;}

// Singleplayer
if (objGame.mode == GAMETYPE_SINGLEPLAYER)
{            
    // Setup
    var alpha = objData.hud_translucency;
    draw_set_colour(c_white);
    draw_set_alpha(alpha);
    draw_set_valign(fa_top);
    draw_set_halign(fa_right);
    draw_set_font(objResources.font_hud_numbers2);
    if (objZone.levelstyle == STYLETYPE_SONIC1) { draw_set_font(objResources.font_hud_numbers); }
    
    // Score
    var score_colour = c_yellow;
    draw_set_halign(fa_right);
    draw_sprite_ext(hud_sprite, 0, 16, 18, 2, 2, 0, score_colour, alpha);
	//draw_sprite_ext(sprHudIcon, 0, 4, 18, 2, 2, 0, c_white, alpha);
    if objData.zeroes_display { draw_text_transformed_colour(256, 18, string_real_character(0, 9, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
    draw_text_transformed(256, 18, objData.player_score[player_number], 2, 2, 0);
    
    // Time
    if not (objZone.levelflags & LEVELFLAG_INFINITETIME)
    {
        var time_colour = c_yellow;
        if (objZone.timer <= 3600) and (image_index mod 2) { time_colour = c_red; }
        draw_set_halign(fa_left);
        draw_sprite_ext(hud_sprite, 1, 16 + select(objScreen.splitscreen_on, 0, 288), 50 + select(objScreen.splitscreen_on, 0, (objScreen.gui_height / 2) - 62), 2, 2, 0, time_colour, alpha - select((objZone.timer <= 690) and not (image_index mod 2), 0, 1));
		//draw_sprite_ext(sprHudIcon, 1, 4, 50, 2, 2, 0, c_white, alpha);
        if objData.zeroes_display { draw_text_transformed_colour(96 + select(objScreen.splitscreen_on, 0, 288), 50 + select(objScreen.splitscreen_on, 0, (objScreen.gui_height / 2) - 62), "0:00.00", 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
		draw_set_alpha(select(not (objZone.timer > 690) and (image_index mod 2), 1, 0));
        draw_text_transformed(96 + select(objScreen.splitscreen_on, 0, 288), 50 + select(objScreen.splitscreen_on, 0, (objScreen.gui_height / 2) - 62), time_stamp, 2, 2, 0);
		draw_set_alpha(1);
    }
    
    // Rings
    var rings_colour = c_yellow;
    if (not objData.player_rings[player_number] or objGame.player_id[player_number].super_form and (objData.player_rings[player_number] < 20)) and (image_index mod 2) { rings_colour = c_red; }
    else if objGame.player_id[player_number].super_form and objData.player_rings[player_number] and not (image_index mod 2) { rings_colour = c_orange; }
    draw_set_halign(fa_right);
    draw_sprite_ext(hud_sprite, 2, 16 + select(objScreen.splitscreen_on, 0, 640), 82 - select(sign((objZone.levelflags & LEVELFLAG_INFINITETIME)), 0, 32) - select(objScreen.splitscreen_on, 0, 64), 2, 2, 0, rings_colour, alpha - select((objGame.player_id[player_number].super_form and (objData.player_rings[player_number] < 10)) and not (image_index mod 2), 0, 1));
	//draw_sprite_ext(sprHudIcon, 2, 4, 82, 2, 2, 0, c_white, alpha);
    if objData.zeroes_display { draw_text_transformed_colour(176 + select(objScreen.splitscreen_on, 0, 640), 82 - select(sign((objZone.levelflags & LEVELFLAG_INFINITETIME)), 0, 32) - select(objScreen.splitscreen_on, 0, 64), string_real_character(0, 4, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
	draw_set_colour(select(objGame.player_id[player_number].super_form and (objData.player_rings[player_number] < 10) and not (image_index mod 2), c_white, c_red));
	draw_set_alpha(alpha - select(objGame.player_id[player_number].super_form and (objData.player_rings[player_number] < 10) and (image_index mod 2), 0, 1));
    draw_text_transformed(176 + select(objScreen.splitscreen_on, 0, 640), 82 - select(sign((objZone.levelflags & LEVELFLAG_INFINITETIME)), 0, 32) - select(objScreen.splitscreen_on, 0, 64), objData.player_rings[player_number], 2, 2, 0);
	draw_set_colour(c_white);
	draw_set_alpha(alpha);

    // Total rings
    //draw_set_halign(fa_right);
    //if objData.zeroes_display { draw_text_transformed_colour(176, 256, string_real_character(0, 4, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
    //draw_text_transformed(256, 82, max(objZone.total_rings, 0), 2, 2, 0);

    // Lives
    draw_set_valign(fa_top);
    draw_sprite_ext(sprLivesHud, objData.player_character_id[player_number] - 1, 16, objScreen.gui_height - 44 - select(objScreen.splitscreen_on, 0, objScreen.gui_height / 2), 2, 2, 0, c_white, alpha);
    if instance_exists(objGame.player_id[player_number]) and (objGame.player_id[player_number].palette_sprite > -1) and surface_exists(objGame.player_id[player_number].palette_surface) { retro_palette_set(objGame.player_id[player_number].palette_surface, 1, true); }
    draw_sprite_ext(sprLivesHud, objData.player_character_id[player_number] - 1, 16, objScreen.gui_height - 44 - select(objScreen.splitscreen_on, 0, objScreen.gui_height / 2), 2, 2, 0, c_white, alpha);
    if instance_exists(objGame.player_id[player_number])  and (objGame.player_id[player_number].palette_sprite > -1) and surface_exists(objGame.player_id[player_number].palette_surface) { retro_palette_clear(); }
    draw_sprite_ext(sprLivesXHud, 0, 54, objScreen.gui_height - 32 - select(objScreen.splitscreen_on, 0, objScreen.gui_height / 2), 2, 2, 0, c_white, alpha);
    draw_set_halign(fa_right);
    if not (objZone.levelflags & LEVELFLAG_INFINITELIVES)
    {
        draw_set_font(objResources.font_hud_lives);
        if objData.zeroes_display { draw_text_transformed_colour(142, objScreen.gui_height - 30 - select(objScreen.splitscreen_on, 0, objScreen.gui_height / 2), string_real_character(0, 4, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
        draw_text_transformed(142, objScreen.gui_height - 30 - select(objScreen.splitscreen_on, 0, objScreen.gui_height / 2), objData.player_lives[player_number], 2, 2, 0);
    }
    else
    {
        draw_set_font(objResources.font_menu);
        draw_text_transformed(142, objScreen.gui_height - 32 - select(objScreen.splitscreen_on, 0, objScreen.gui_height / 2), "INF", 2, 2, 0);
    }
    
    if objScreen.splitscreen_on and instance_exists(objGame.player_id[player_number + 1])
    {
            // Setup
            var alpha = objData.hud_translucency;
            draw_set_colour(c_white);
            draw_set_alpha(alpha);
            draw_set_valign(fa_top);
            draw_set_halign(fa_right);
            draw_set_font(objResources.font_hud_numbers2);
            if (objZone.levelstyle == STYLETYPE_SONIC1) { draw_set_font(objResources.font_hud_numbers); }
            
            // Score
            var score_colour = c_yellow;
            draw_set_halign(fa_right);
            draw_sprite_ext(hud_sprite, 0, 16, 18+ (objScreen.gui_height / 2), 2, 2, 0, score_colour, alpha);
            if objData.zeroes_display { draw_text_transformed_colour(256, 18 + (objScreen.gui_height / 2), string_real_character(0, 9, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
            draw_text_transformed(256, 18 + (objScreen.gui_height / 2), objData.player_score[player_number + 1], 2, 2, 0);
            
            // Rings
            var rings_colour = c_yellow;
            if (not objData.player_rings[player_number + 1] or objGame.player_id[player_number + 1].super_form and (objData.player_rings[player_number + 1] < 20)) and (image_index mod 2) { rings_colour = c_red; }
            else if objGame.player_id[player_number + 1].super_form and objData.player_rings[player_number + 1] and not (image_index mod 2) { rings_colour = c_orange; }
            draw_set_halign(fa_right);
            draw_sprite_ext(hud_sprite, 2, 16 + select(objScreen.splitscreen_on, 0, 640), 82 - select(sign((objZone.levelflags & LEVELFLAG_INFINITETIME)), 0, 32) + (objScreen.gui_height / 2) - select(objScreen.splitscreen_on, 0, 64), 2, 2, 0, rings_colour, alpha);
            if objData.zeroes_display { draw_text_transformed_colour(176 + select(objScreen.splitscreen_on, 0, 640), 82 - select(sign((objZone.levelflags & LEVELFLAG_INFINITETIME)), 0, 32) + (objScreen.gui_height / 2) - select(objScreen.splitscreen_on, 0, 64), string_real_character(0, 4, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
            draw_text_transformed(176 + select(objScreen.splitscreen_on, 0, 640), 82 - select(sign((objZone.levelflags & LEVELFLAG_INFINITETIME)), 0, 32) + (objScreen.gui_height / 2)  - select(objScreen.splitscreen_on, 0, 64), objData.player_rings[player_number + 1], 2, 2, 0);
            
            // Lives
            draw_set_valign(fa_top);
            draw_sprite_ext(sprLivesHud, objData.player_character_id[player_number + 1] - 1, 16, objScreen.gui_height - 44, 2, 2, 0, c_white, alpha);
            if instance_exists(objGame.player_id[player_number + 1]) and (objGame.player_id[player_number + 1].palette_sprite > -1) and surface_exists(objGame.player_id[player_number + 1].palette_surface) { retro_palette_set(objGame.player_id[player_number + 1].palette_surface, 1, true); }
            draw_sprite_ext(sprLivesHud, objData.player_character_id[player_number + 1] - 1, 16, objScreen.gui_height - 44, 2, 2, 0, c_white, alpha);
            if instance_exists(objGame.player_id[player_number + 1])  and (objGame.player_id[player_number + 1].palette_sprite > -1) and surface_exists(objGame.player_id[player_number + 1].palette_surface) { retro_palette_clear(); }
            draw_sprite_ext(sprLivesXHud, 0, 54, objScreen.gui_height - 32, 2, 2, 0, c_white, alpha);
            draw_set_halign(fa_right);
            if not (objZone.levelflags & LEVELFLAG_INFINITELIVES)
            {
                draw_set_font(objResources.font_hud_lives);
                if objData.zeroes_display { draw_text_transformed_colour(142, objScreen.gui_height - 30, string_real_character(0, 4, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
                draw_text_transformed(142, objScreen.gui_height - 30, objData.player_lives[player_number + 1], 2, 2, 0);
            }
            else
            {
                draw_set_font(objResources.font_menu);
                draw_text_transformed(142, objScreen.gui_height - 32, "INF", 2, 2, 0);
            }
    }
    
    // Continues
    if (objData.continues_display == 2) and not objScreen.splitscreen_on
    {
        draw_sprite_ext(select(objData.player_character_id[player_number] - 1, sprContinueTokenSonic, sprContinueTokenTails, sprContinueTokenKnuckles), (image_index mod 2), 32, (objScreen.gui_height - 78), 2, 2, 0, c_white, alpha);
        draw_sprite_ext(sprLivesXHud, 0, 54, (objScreen.gui_height - 68), 2, 2, 0, c_white, alpha);
        
        // continues counter
        draw_set_valign(fa_top);
        draw_set_halign(fa_right);
        draw_set_font(objResources.font_hud_lives);
        if objData.zeroes_display { draw_text_transformed_colour(142, (objScreen.gui_height - 68), string_real_character(0, 4, 0), 2, 2, 0, c_gray, c_gray, c_gray, c_gray, alpha); }
        draw_text_transformed_colour(142, (objScreen.gui_height - 68), objData.continues, 2, 2, 0, c_white, c_white, c_white,c_white, alpha);
    }
    
    // Modifiers
    if instance_exists(objGame.player_id[player_number])
    {
        if objData.powerup_display
        {
            // Setup
            draw_set_halign(fa_left);
            draw_set_valign(fa_center);
            draw_set_font(objResources.font_hud_numbers2);
			if (objZone.levelstyle == STYLETYPE_SONIC1) { draw_set_font(objResources.font_hud_numbers); }
            
            // Shields
            var offset_x = 24;
            var offset_y = (objScreen.gui_height / 2) + 30;
            if objGame.player_id[player_number].shield_type
            {
                switch (objGame.player_id[player_number].shield_type)
                {
                    case SHIELD_BUBBLE: { draw_sprite_ext(sprMonitorIcon, 4, offset_x, offset_y, 2, 2, 0, c_white, alpha); break; }
                    case SHIELD_LIGHTNING: { draw_sprite_ext(sprMonitorIcon, 5, offset_x, offset_y, 2, 2, 0, c_white, alpha); break; }
                    case SHIELD_FIRE: { draw_sprite_ext(sprMonitorIcon, 6, offset_x, offset_y, 2, 2, 0, c_white, alpha); break; }
                    case SHIELD_NORMAL: { draw_sprite_ext(sprMonitorIcon, 3, offset_x, offset_y, 2, 2, 0, c_white, alpha); break; }
                }
                if not (objGame.player_id[player_number].shield_type == SHIELD_INSTASHIELD) { offset_y += 36; }
            }
			
            // Super speed
            if objGame.player_id[player_number].superspeed
            {            
                var superspeed_colour = c_white;
                if (objGame.player_id[player_number].superspeed < 300) and (image_index mod 2) { superspeed_colour = c_red; }
                draw_sprite_ext(sprMonitorIcon, 2, offset_x, offset_y, 2, 2, 0, c_white, alpha - (1 * ((objGame.player_id[player_number].superspeed < 300) and (image_index mod 2))));
                draw_set_color(superspeed_colour);
                draw_text_transformed(offset_x + 24, offset_y, ":" + string(floor((objGame.player_id[player_number].superspeed / 60))), 2, 2, 0);    
                offset_y += 36;
            }
            
            // Invincibility
            if objGame.player_id[player_number].invincible
            {
                var invincible_colour = c_white;
                if (objGame.player_id[player_number].invincible < 300) and (image_index mod 2) { invincible_colour = c_red; }
                draw_sprite_ext(sprMonitorIcon, 7, offset_x, offset_y, 2, 2, 0, c_white, alpha - (1 * ((objGame.player_id[player_number].invincible < 300) and (image_index mod 2))));
                draw_set_color(invincible_colour);
                draw_text_transformed(offset_x + 24, offset_y, ":" + string(floor((objGame.player_id[player_number].invincible / 60))), 2, 2, 0);
                offset_y += 36;
            }
            
            // Air count / drowning
            if objGame.player_id[player_number].underwater or objGame.player_id[player_number].outspace
            {
                if (objGame.player_id[player_number].air_count <= 720)
                {
                    if (objGame.player_id[player_number].drown_count > 0) and (objGame.player_id[player_number].drown_count.sprite_index == sprDrownPopup)
                    {
                        var drown_counter = (objGame.player_id[player_number].air_count div 120);
                        var drown_visible = alpha - ((objGame.player_id[player_number].drown_count.timer[1] div 8) mod 2);
                        draw_sprite_ext(sprDrownPopup, drown_counter, 162, objScreen.gui_height - 34, 2, 2, 0, c_white, drown_visible);
                    }
                }
            }
        }
        
        // Debug mode
        if (objGame.player_id[player_number].state = player_is_debugging)
        {
            // Setup
            draw_set_alpha(alpha);
            draw_set_halign(fa_right);
            draw_set_valign(fa_top);
            draw_set_font(objResources.font_menu);
            
            // Header
            draw_set_colour(c_yellow);
            draw_text_transformed(objScreen.gui_width - 16, 18, "DEBUG MODE", 2, 2, 0);
            
            // Keycodes
            draw_set_colour(c_white);
            draw_text_transformed(objScreen.gui_width - 16, 36, string_keycode(objGame.controller[0].code_keyboard[7]) + ": Exit Debug Mode", 2, 2, 0);
            draw_text_transformed(objScreen.gui_width - 16, 54, string_keycode(objGame.controller[0].code_keyboard[8]) + "/" + string_keycode(objGame.controller[0].code_keyboard[9]) + ": Cycle object", 2, 2, 0);
            draw_text_transformed(objScreen.gui_width - 16, 72, string_keycode(objGame.controller[0].code_keyboard[5]) + "/" + string_keycode(objGame.controller[0].code_keyboard[6]) + ": Cycle object type", 2, 2, 0);
            draw_text_transformed(objScreen.gui_width - 16, 90, string_keycode(objGame.controller[0].code_keyboard[4]) + ": Place object", 2, 2, 0);
            
            // Selected
            draw_text_transformed(objScreen.gui_width - 16, 126, "(" + string(objGame.player_id[player_number].debug_object) + ") " + string_replace(object_get_name(objGame.player_id[player_number].debug_object), "obj", ""), 2, 2, 0);
            draw_text_transformed(objScreen.gui_width - 16, 144, "Type " + string(objGame.player_id[player_number].debug_type), 2, 2, 0);
            
            // Stats
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_text_transformed(16, 118, "INSTANCES: " + string(instance_count), 2, 2, 0);
            draw_text_transformed(16, 136, "X: " + string(floor(objGame.player_id[player_number].x)), 2, 2, 0);
            draw_text_transformed(16, 154, "Y: " + string(floor(objGame.player_id[player_number].y)), 2, 2, 0);
        }
    }
}