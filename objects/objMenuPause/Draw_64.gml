/// @description  Pause

// Pause
draw_set_alpha(0.3);
draw_set_colour(c_black);
draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(objResources.font_title_text);
draw_text_transformed(objScreen.gui_width / 2, 48, "Game Paused", 2, 2, 0);

// Menu
var normal_colour = make_colour_rgb(255, 255, 255);
var selected_colour = make_colour_rgb(255, 255, 0);
draw_set_alpha(1);
draw_set_font(objResources.font_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
for (var i = 0; i < array_length(menu); i += 1)
{
	var alpha = select((i == 1) and ((objGame.player_id[0].state == player_is_dead) or (objData.player_lives[0] < 2)), 1, 0.5);
	var colour = select((current == i), normal_colour, selected_colour);
	draw_set_alpha(alpha);
	draw_set_colour(colour);
	draw_text_transformed(xpos, ypos + 14 + (i * 16), menu[i], 2, 2, 0);
}

// Reset
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);