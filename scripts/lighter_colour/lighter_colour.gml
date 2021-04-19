/// @description  lighter_colour(colour, percent)
/// @param colour
/// @param  percent
function lighter_colour(argument0, argument1) {

	// argument0 = color rgb
	// argument1 = percent

	var hue = colour_get_hue(argument0);
	var sat = colour_get_saturation(argument0);
	var val = colour_get_value(argument0);

	val += argument1 * 255 / 100;

	var hsv = make_colour_hsv(hue, sat, val);

	var red = colour_get_red(hsv);
	var green = colour_get_green(hsv);
	var blue = colour_get_blue(hsv);

	return make_colour_rgb(red, green, blue);




}
