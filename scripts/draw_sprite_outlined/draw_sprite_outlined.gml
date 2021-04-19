/// @description draw_sprite_outlined(sprite, subimg, x, y, xscale, yscale, angle, colour, alpha, outline_colour, outline_alpha)
/// @param sprite
/// @param  subimg
/// @param  x
/// @param  y
/// @param  xscale
/// @param  yscale
/// @param  angle
/// @param  colour
/// @param  alpha
/// @param  outline_colour
/// @param  outline_alpha
function draw_sprite_outlined() {
	var spr = argument[0];
	var img = argument[1];
	var xx = argument[2];
	var yy = argument[3];
	var xs = argument[4];
	var ys = argument[5];
	var ang = argument[6];
	var col = argument[7];
	var alp = argument[8]
	var ocol = argument[9];
	var oalp = argument[10]
	gpu_set_fog(true, ocol, 0, 1);
	draw_sprite_ext(spr, img, xx-xs, yy, xs, ys, ang, c_white, oalp);
	draw_sprite_ext(spr, img, xx+xs, yy, xs, ys, ang, c_white, oalp);
	draw_sprite_ext(spr, img, xx, yy-ys, xs, ys, ang, c_white, oalp);
	draw_sprite_ext(spr, img, xx, yy+ys, xs, ys, ang, c_white, oalp);
	gpu_set_fog(0, 0, 0, 0);
	draw_sprite_ext(spr, img, xx, yy, xs, ys, ang, col, alp);




}
