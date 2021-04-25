/// @description  Render all

// Background
/*if effect_started
{*/
    // Fade
	gpu_set_colorwriteenable(true, true, false, true);
	draw_set_color(c_black);
	draw_set_alpha((effect_alpha * 2) / 4);
	draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
	gpu_set_colorwriteenable(true, true, true, true);
	draw_set_alpha(effect_alpha / 4);
	draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
	draw_set_alpha(1);
    
    // Lines
    /*for (i = 0; i < (ceil(objScreen.gui_height / (sprite_get_height(sprTitleCardBorder) * 2))) + 1; i += 1)
    {
        draw_sprite_ext(sprTitleCardBorder, 1, -200 + ((sprite_get_height(sprTitleCardBorder) * 2) * i) * cosine[45] + effect_line_offset - effect_line_move, (objScreen.gui_height - 196) + ((sprite_get_height(sprTitleCardBorder) * 2) * i) * sine[45] + effect_line_offset + effect_line_move, 2, 2, 45, c_red, 1);
    }
    
    for (i = 0; i < (ceil(objScreen.gui_height / (sprite_get_height(sprTitleCardBorder) * 2))) + 1; i += 1)
    {
        draw_sprite_ext(sprTitleCardBorder, 1, (objScreen.gui_width + 200) + ((sprite_get_height(sprTitleCardBorder) * 2) * i) * cosine[225] - effect_line_offset + effect_line_move, 196 + ((sprite_get_height(sprTitleCardBorder) * 2) * i) * sine[225] - effect_line_offset - effect_line_move, 2, 2, 225, c_red, 1);
    }*/
	
	// Lines
    for (i = 0; i < (ceil(objScreen.gui_height / (sprite_get_height(sprTitleCardBorder) * 2))) + 1; i += 1)
    {
        draw_sprite_ext(sprTitleCardBorder, 1, -effect_line_move, ((sprite_get_height(sprTitleCardBorder) * 2) * i) + effect_line_offset, 2, 2, 0, c_red, 1);
    }
    
    for (i = 0; i < (ceil(objScreen.gui_height / (sprite_get_height(sprTitleCardBorder) * 2))) + 1; i += 1)
    {
        draw_sprite_ext(sprTitleCardBorder, 1, objScreen.gui_width + effect_line_move, ((sprite_get_height(sprTitleCardBorder) * 2) * i) - (sprite_get_height(sprTitleCardBorder) * 2) - effect_line_offset, -2, 2, 0, c_red, 1);
    }
    
    draw_set_alpha(effect_alpha * 0.35);
    draw_set_color(c_black);
    draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
    draw_set_alpha(1);
//}

// Background
/*draw_set_alpha((menu_state <> 0) ? 0.35 : 0);
draw_set_color(c_black);
draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
draw_set_alpha(1);*/

// Menu
var cursor_colour = make_colour_rgb(148, 0, 0);
var normal_colour = make_colour_rgb(255, 255, 255);
var selected_colour = make_colour_rgb(255, 255, 0);
var selected2_colour = make_colour_rgb(0, 255, 0);
switch menu_state
{
	case 1: // Main menu
	{
		// Title
		draw_set_font(objResources.font_title_text);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text_transformed_colour(objScreen.gui_width / 2, 48 - effect_menu_move, "Main Menu", 2, 2, 0, c_white, c_white, c_white, c_white, 1);

		// Menu
		var xpos = objScreen.gui_width / 2;
		var ypos = 256;
		draw_set_font(objResources.font_menu);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_set_alpha(1);
		for (i = 0; i <= (array_length(main_menu) - 1); i += 1)
		{
			var colour_offset = cos(objScreen.image_index * 0.0625);
			var menu_colour = (i == main_item) ? merge_colour(normal_colour, selected_colour, abs(colour_offset)) : normal_colour; //select((i == main_item), normal_colour, selected_colour);
			var menu_alpha = 1;
			//draw_set_alpha(menu_alpha);
			//draw_set_colour(menu_colour);
			draw_text_transformed_colour(xpos, ypos + (16 * (i - 1)) + effect_menu_move, main_menu[i], 2, 2, 0, merge_colour(menu_colour, normal_colour, 0.75), merge_colour(menu_colour, normal_colour, 0.5), merge_colour(menu_colour, normal_colour, 0.25), menu_colour, menu_alpha);
		}
		break;
	}
	
	case 2: // Settings menu
	{
		switch menu_substate
		{
			case 0: // Main settings
			{
				// Title
		        draw_set_font(objResources.font_title_text);
		        draw_set_halign(fa_center);
		        draw_set_valign(fa_middle);
		        draw_text_transformed_colour(objScreen.gui_width / 2, 48, "Settings", 2, 2, 0, c_white, c_white, c_white, c_white, 1);

		        // Menu
		        var xpos = 32;
		        var ypos = 128;
		        draw_set_font(objResources.font_menu);
				draw_set_alpha(1);
				for (i = 0; i <= (array_length(options_menu) - 1); i += 1)
				{
					var menu_colour = (i == options_item) ? selected_colour : normal_colour; //select((i == options_item), normal_colour, selected_colour);
					var menu_alpha = (i == 16) ? 0.6 : 1; //select((i == 16), 1, 0.6);
					draw_set_halign(fa_left);
					draw_set_valign(fa_top);
					draw_set_alpha(menu_alpha);
					draw_set_colour(menu_colour);
					draw_text_transformed(xpos, ypos + (16 * (i - 1)), options_menu[i][0], 2, 2, 0);
					if (array_length(options_menu[i]) > 1)
					{
						draw_set_halign(fa_right);
						draw_set_valign(fa_top);
						draw_text_transformed(objScreen.gui_width - xpos, ypos + (16 * (i - 1)), options_menu[i][1], 2, 2, 0);
					}
				}
				break;
			}
			
			case 3: // Resolution
			{
				// Title
				draw_set_font(objResources.font_title_text);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_text_transformed_colour(objScreen.gui_width / 2, 48, "Resolution", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
				
				// Menu
				var xpos = objScreen.gui_width / 2;
				var ypos = 96;
				draw_set_font(objResources.font_menu);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_alpha(1);
				for (i = 0; i <= (array_length(resolution_menu) - 1); i += 1)
				{
					//var menu_selected = (2 * (objData.resolution == (6 - (0.25 * i)))) * (i <> resolution_item);
					var menu_colour = (i == resolution_item) ? selected_colour : normal_colour; //(objData.resolution == (6 - (0.25 * i))) and (i <> resolution_item) ? selected2_colour : ((i == resolution_item) ? selected_colour : normal_colour);  //select((i == resolution_item) + menu_selected, normal_colour, selected_colour, selected2_colour);
					var menu_alpha = 1; //engine_supported_resolution(6 - (0.25 * i)) or ((resolution_item == 21) and (i == 21)) ? 1 : 0.6; //select(engine_supported_resolution(6 - (0.25 * i)) or ((resolution_item == 21) and (i == 21)), 0.6, 1);
					draw_set_alpha(menu_alpha);
					draw_set_colour(menu_colour);
					draw_text_transformed(xpos, ypos + (16 * (i - 1)), resolution_menu[i], 2, 2, 0);
				}
				
				draw_set_halign(fa_left);
				draw_set_valign(fa_bottom);
				draw_set_alpha(1);
				draw_set_colour(c_white);
				draw_text_transformed(0, objScreen.gui_height, "Current resolution: " + string(objScreen.width * objData.resolution) + "x" + string(objScreen.height * objData.resolution) + " (x" + string(objData.resolution) + ")", 2, 2, 0);
				break;
			}
		}
		break;
	}
	
	case 3: // Character Select
	{
		// Title
		draw_set_font(objResources.font_title_text);
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
		draw_text_transformed_colour(objScreen.gui_width / 2, 48, "Character Select", 2, 2, 0, c_white, c_white, c_white, c_white, 1);
    
		// Sonic animation
		var sonic_frame = 3;
		if (((objScreen.image_index mod 40) >= 20)) and (((objScreen.image_index mod 40) < 40)) { sonic_frame = 4; }
    
		// Tails animation
		var tails_frame = 0;
		var tailsoverlay_frame = (objScreen.image_index div 8)
		if (((objScreen.image_index mod 96) >= 80)) and (((objScreen.image_index mod 96) < 88)) { tails_frame = 1; }
		else if (((objScreen.image_index mod 96) >= 88)) and (((objScreen.image_index mod 96) < 96)) { tails_frame = 2; }
    
		// Knuckles animation
		var knuckles_frame = 5;
		if (((objScreen.image_index mod 24) >= 8)) and (((objScreen.image_index mod 24) < 12)) { knuckles_frame = 6; }
		else if (((objScreen.image_index mod 24) >= 12)) and (((objScreen.image_index mod 24) < 18)) { knuckles_frame = 7; }
		else if (((objScreen.image_index mod 24) >= 18)) and (((objScreen.image_index mod 24) < 24)) { knuckles_frame = 8; }
    
		// Menu
		var arrow_offset = floor((16 - (cos(objScreen.image_index * 0.25) * 8)));
		var normal_colour = make_colour_rgb(255, 255, 255);
		var cursor_colour = make_colour_rgb(148, 0, 0);
		var selected_colour = make_colour_rgb(255, 255, 0);
		var selected2_colour = make_colour_rgb(0, 255, 0);
		draw_set_halign(fa_center);
		draw_set_valign(fa_top);
		draw_set_font(objResources.font_menu);
		draw_set_colour(normal_colour);
		switch character_item
		{
		    case 0: // Sonic
		    {
		        var colour = normal_colour;
		        var text = "Sonic";
		        draw_set_colour(colour);
		        draw_text_transformed((objScreen.gui_width / 2), (objScreen.gui_height / 2) + 60, text, 2, 2, 0);
		        draw_sprite_ext(sprSonicIdle, sonic_frame, (objScreen.gui_width / 2), (objScreen.gui_height / 2), 2, 2, 0, c_white, 1);
		        break;
		    }
        
		    case 1: // Tails
		    {
		        var colour = normal_colour;
		        var text = "Tails";
		        draw_set_colour(colour);
		        draw_text_transformed((objScreen.gui_width / 2), (objScreen.gui_height / 2) + 60, text, 2, 2, 0);
		        draw_sprite_ext(sprTailsEffect1, tailsoverlay_frame, (objScreen.gui_width / 2), (objScreen.gui_height / 2), 2, 2, 0, c_white, 1);
		        draw_sprite_ext(sprTailsIdle, tails_frame, (objScreen.gui_width / 2), (objScreen.gui_height / 2), 2, 2, 0, c_white, 1);
		        break;
		    }
        
		    case 2: // Knuckles
		    {
		        var colour = normal_colour;
		        var text = "Knuckles";
		        draw_set_colour(colour);
		        draw_text_transformed((objScreen.gui_width / 2), (objScreen.gui_height / 2) + 60, text, 2, 2, 0);
		        draw_sprite_ext(sprKnucklesIdle, knuckles_frame, (objScreen.gui_width / 2), (objScreen.gui_height / 2), 2, 2, 0, c_white, 1);
		        break;
		    }
		}
		draw_sprite_ext(sprMenuArrowUp, 0, (objScreen.gui_width / 2), (objScreen.gui_height / 2) - 90 - arrow_offset - character_anim_arrowup, 4, 4, 0, selected_colour, (character_select == 0));
		draw_sprite_ext(sprMenuArrowDown, 0, (objScreen.gui_width / 2), (objScreen.gui_height / 2) + 110 + arrow_offset + character_anim_arrowdown, 4, 4, 0, selected_colour, (character_select == 0));
		break;
	}
	
	case 4:
	{
		// Menu
		var zone = 0;
		var act = 1;
		var ypos = 32;
		var xpos = 32;
		draw_set_font(objResources.font_menu_levelselect);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		repeat array_length(zones)
		{
		    // Zones
		    draw_set_colour(select((level_zone == zone), $FFFFDB, $00FFFF));
		    draw_set_halign(fa_left);
		    draw_text_transformed(xpos, ypos, zones[zone, 0], 2, 2, 0);
        
		    // Acts
		    act = 1;
		    if (zones[zone, 1] > 1)
		    {
		        repeat zones[zone, 1]
		        {
		            draw_set_colour(select((level_zone == zone) and (level_act == act), $FFFFDB, $00FFFF));
		            draw_set_halign(fa_right);
		            draw_text_transformed(xpos + ((objScreen.gui_width) - 64), ypos + (act - 1), "ACT " + string(act), 2, 2, 0);
		            if (act <> zones[zone, 1]) { ypos += 16; }
		            act += 1;
		        }
		    }
		    ypos += 16;
		    zone += 1;
		}
    
		// Sound test
		draw_set_colour(select((level_zone == array_length(zones)), $FFFFDB, $00FFFF));
		draw_set_halign(fa_left);
		draw_text_transformed(xpos, objScreen.gui_height - 64, "SOUND TEST " + string_real_character(sound_index, 2, 0), 2, 2, 0);
    
		var soundtext = "";
		if (sound_index > music_count) and (sound_index < 94) 
		{
		    if not ((sound_index - (music_count + 1)) < 0) and ((sound_index - (music_count + 1)) < 94)
		    {
		        if not is_undefined(audio_get_name((sound_index - (music_count + 1))))
		        {
		            if not ((sound_index - (music_count + 1)) > (array_length(sound_entry) - 1))
		            {
		                if audio_exists(sound_entry[(sound_index - (music_count + 1))])
						{
							if (string_copy(audio_get_name(sound_entry[sound_index - (music_count + 1)]), 0, 3) == "snd")
							{
								soundtext = string_upper(audio_get_name(sound_entry[(sound_index - (music_count + 1))]));
							}
						}
		            }
		        }
		    }
		}
		else
		{
		    switch sound_index
		    {
				default: { soundtext = "EMPTY"; break; }
				case 0: { soundtext = "NULL"; break; }
				case 1: { soundtext = "MAIN MENU"; break; }
				//case 2: { soundtext = "MAIN MENU FULL"; break; }
				case 2: { soundtext = "EXTRA LIFE JINGLE"; break; }
				case 3: { soundtext = "LEVEL COMPLETED"; break; }
				case 4: { soundtext = "DROWNING"; break; }
				case 5: { soundtext = "GAME OVER"; break; }
				case 6: { soundtext = "CONTINUE"; break; }
				case 7: { soundtext = "INVINCIBILITY"; break; }
				case 8: { soundtext = "SUPER FORM THEME"; break; }
				case 9: { soundtext = "EMERALD HILL"; break; }
				case 94: { soundtext = "STOP MUSIC"; break; }
		        case 95: { soundtext = "FADE IN MUSIC"; break; }
				case 96: { soundtext = "FADE OUT MUSIC"; break; }
		        case 98: { soundtext = "NORMAL PITCH MUSIC"; break; }
		        case 97: { soundtext = "DOWN PITCH MUSIC"; break; }
				case 99: { soundtext = "UP PITCH MUSIC"; break; }
		    }
		}
		draw_text_transformed(xpos, objScreen.gui_height - 48, soundtext, 2, 2, 0);
	}
}

// Discord
/*draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(objResources.font_menu);
draw_text_transformed(0, objScreen.gui_height - 16, "Discord Server: SPANISH ONLY!", 2, 2, 0);
draw_text_transformed(0, objScreen.gui_height, "https://discord.gg/j6b2x96", 2, 2, 0);*/

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);