/// @description  wavelength_to_hue(nano)
/// @param nano
function wavelength_to_hue(argument0) {
	//
	//  Returns the approximate HSV color hue [0..255] of a given wavelength.
	//  Human color perception is a subjective phenomenon. It is not possible
	//  to exactly map an RGB color on a monitor to a specific wavelength.
	//  In particular, colors in the purple range will produce spurious results.
	//
	//      nano        wavelength in nanometers, real
	//
	/// GMLscripts.com/license
	{
	    return (sqrt((argument0 - 650) / 0.0072) + 156.75);
	}



}
