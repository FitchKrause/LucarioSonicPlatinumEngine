/// @description  hsv_to_hex(Hue, Saturation, Value)
/// @param Hue
/// @param  Saturation
/// @param  Value
function hsv_to_hex(argument0, argument1, argument2) {

	// Turn HSV into RGB and turn RGB into Hex, then return the Hex
	var rgb = hsv_to_rgb(argument0, argument1, argument2);
	var hexstring = rgb_to_hex(rgb[0], rgb[1], rgb[2]);
	return hexstring;



}
