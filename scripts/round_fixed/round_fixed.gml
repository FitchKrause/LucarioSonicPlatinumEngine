/// @description  round_fixed(number,places)
/// @param number
/// @param places
function round_fixed(argument0, argument1) {
	//
	//  Returns the given number rounded to the a number of places.
	//
	//      number      number to round, real
	//      places      decimal places to round to, real
	//
	/// GMLscripts.com/license
	{
	    return round(argument0*power(10,argument1))/power(10,argument1);
	}



}
