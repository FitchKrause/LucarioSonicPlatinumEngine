/// @description string_ends_with(needle, haystack)
/// @param needle
/// @param  haystack
function string_ends_with() {

	var needle = argument[0];
	var haystack = argument[1];

	if (string_char_at(haystack, string_length(haystack)) == needle)
	{
	    return true;
	}

	return false;




}
