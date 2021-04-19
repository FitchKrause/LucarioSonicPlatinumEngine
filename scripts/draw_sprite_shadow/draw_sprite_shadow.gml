/// @description draw_sprite_shadow(direction, distance, xscale, yscale, colour, rotation, alpha);
/// @param direction
/// @param  distance
/// @param  xscale
/// @param  yscale
/// @param  colour
/// @param  rotation
/// @param  alpha
///Draws the shadow of a sprite
///Using the calling object's x, y, image_angle, sprite_index & image_index
function draw_sprite_shadow() {
	/*
	 * Example use:
	 * draw_sprite_shadow(270, 3, 1, c_black, 0.5);
	 * draw_self();
	 */
	var dir = argument[0];
	var len = argument[1];
	var scax = argument[2];
	var scay = argument[3];
	var col = argument[4];
	var rot = argument[5];
	var alp = argument[6];
	var xx = x + lengthdir_x(len, dir);
	var yy = y + lengthdir_y(len, dir);
	gpu_set_fog(true, col, 0, 1);
	draw_sprite_ext(sprite_index, image_index, xx, yy, scax, scay, rot, c_white, alp);
	gpu_set_fog(0, 0, 0, 0);




}
