/// @description  gm_color_to_rgb(c_color);
/// @param c_color
function gm_color_to_rgb(argument0) {

	// Get the red green and blue of the color
	rgb[0] = colour_get_red(argument0);
	rgb[1] = colour_get_green(argument0);
	rgb[2] = color_get_blue(argument0);

	// Return the RGB Array
	return rgb;



}
