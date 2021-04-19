/// @description  Title Screen

// Fade
gpu_set_colorwriteenable(true, true, false, true);
draw_set_color(c_black);
draw_set_alpha(fade * 2);
draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
gpu_set_colorwriteenable(true, true, true, true);
draw_set_alpha(fade);
draw_rectangle(0, 0, objScreen.gui_width, objScreen.gui_height, false);
draw_set_alpha(1);

// Pieces
//draw_rectangle_color(0, 0, objScreen.gui_width, objScreen.gui_height, c_black, c_black, c_black, c_black, false);
draw_set_color(c_white);
draw_sprite_ext(sprTitleScreen, 0, (objScreen.gui_width / 2), ((objScreen.gui_height / 2) - 140) + 20 - 40, 2, 2, 0, c_white, 1);
if image_offset { draw_sprite_part_ext(sprite_frame, image_frame, 0, 0, sprite_get_width(sprite_frame), sprite_get_height(sprite_frame) - image_offset, (objScreen.gui_width / 2) - (sprite_get_xoffset(sprite_frame) * 2) - 16, ((objScreen.gui_height / 2) + 15) - (sprite_get_yoffset(sprite_frame) * 2) + (image_offset * 2) + 20 - 40, 2, 2, c_white, 1); }
else { draw_sprite_ext(sprite_frame, image_frame, (objScreen.gui_width / 2) - 16, ((objScreen.gui_height / 2) + 15) + (image_offset * 2) + 20 - 40, 2, 2, 0, c_white, 1); }
draw_sprite_ext(sprTitleScreenMask, 0, (objScreen.gui_width / 2), (objScreen.gui_height / 2) + 20 - 40, 2, 2, 0, c_white, 1);
if (objMenuMain.menu_state == 0) { draw_sprite_ext(sprTitleScreenButton, 0, (objScreen.gui_width / 2), (objScreen.gui_height / 2) + 220 - 40, 2, 2, 0, c_white, (objScreen.image_index div 8) mod 2); }