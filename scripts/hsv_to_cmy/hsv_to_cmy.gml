/// @description  hsv_to_cmy(Hue, Saturation, Value)
/// @param Hue
/// @param  Saturation
/// @param  Value
function hsv_to_cmy(argument0, argument1, argument2) {

	// Turn the HSV values into rgb values
	hsv_to_rgb(argument0, argument1, argument2);
	// Turn the RGB values into cmy values
	rgb_to_cmy(rgb[0],rgb[1],rgb[2]);

	// Return the cmy array
	return cmy;



}
