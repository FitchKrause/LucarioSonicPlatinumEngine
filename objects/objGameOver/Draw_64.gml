/// @description  Game Over

var color = c_white;
draw_sprite_ext(sprGameOver, image_index, (objScreen.gui_width * 0.5) - max(offset * 32, 0) - 80, objScreen.gui_height * 0.5, 2, 2, 0, color, 1);
draw_sprite_ext(sprGameOver, 2, (objScreen.gui_width * 0.5) + max(offset * 32, 0) + 80, objScreen.gui_height * 0.5, 2, 2, 0, color, 1);

