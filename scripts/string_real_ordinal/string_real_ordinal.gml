/// @description  string_real_ordinal(real)
/// @param real
function string_real_ordinal() {

	// Zero or negatives doesn't supported
	if (argument[0] <= 0) { return argument[0]; }

	// Return if more or equals that 11 and less or equals that 13
	if (((argument[0] mod 100) >= 11) and ((argument[0] mod 100) <= 13)) { return string(argument[0]) + "th"; }

	// Return depending number
	switch(argument[0] mod 10)
	{
	    case 1: { return string(argument[0]) + "st"; } // One
	    case 2: { return string(argument[0]) + "nd"; } // Two
	    case 3: { return string(argument[0]) + "rd"; } // Three
	    default: { return string(argument[0]) + "th"; } // Four or more
	}  



}
