/// @description Tinted color & solid color

draw_set_alpha(1);
gpu_set_colorwriteenable(true, true, false, true);
draw_set_color(fill_colour);
draw_set_alpha(fade_alpha * 2);
draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
gpu_set_colorwriteenable(true, true, true, true);
draw_set_alpha(fade_alpha);
draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
draw_set_alpha(1);