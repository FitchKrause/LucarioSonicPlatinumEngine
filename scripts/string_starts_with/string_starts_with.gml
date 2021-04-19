/// @description  string_starts_with(string, prefix)
/// @param string
/// @param  prefix
function string_starts_with() {

	/***************************************************
	  Checks if string starts with a prefix
	    argument[0] - source string
	    argument[1] - prefix
	    return - true if source starts with prefix, flase otherwise
	****************************************************/


	if (string_length(argument[0]) < string_length(argument[1]))
	{
	    // Source is shorter than prefix
	    return false;
	}

	for (i = 1; i <= string_length(argument[1]); i++)
	{
	    if (string_char_at(argument[0], i) <> string_char_at(argument[1], i))
	    {
	        return false;
	    }
	}

	return true;




}
