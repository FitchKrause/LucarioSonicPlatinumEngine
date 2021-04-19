/// @description  rgb_to_cmy(Red, Green, Blue)
/// @param Red
/// @param  Green
/// @param  Blue
function rgb_to_cmy(argument0, argument1, argument2) {

	// Set the CMY to 1 minus the rgb value devided by 255
	// RGB values are turned from 255-0 values to 1-0 values
	var C = 1 - ( argument0 / 255 );
	var M = 1 - ( argument1 / 255 );
	var Y = 1 - ( argument2 / 255 );

	// Set the CMY array
	cmy[0] = C;
	cmy[1] = M;
	cmy[2] = Y;

	// Return the CMY array
	return cmy;



}
