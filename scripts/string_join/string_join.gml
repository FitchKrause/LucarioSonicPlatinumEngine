/// @description string_join(array, [joiner = ""])
/// @param array
/// @param  [joiner = ""]

//params: array, [string]
//returns: string with items in `array` joined by `joiner`

function string_join()
{
	var array = argument[0];
	var joiner = "";
	if (argument_count == 2) { joiner = argument[1]; }
	var length = array_length(array);
	var joined = "";
	for (var n = 0; n < length; n += 1)
	{
		if (n <> 0) { joined += joiner; }
		joined += string(array[@n]);
	}
	return joined;
}