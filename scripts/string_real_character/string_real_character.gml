/// @description  string_real_character(value, count, [character])
/// @param value
/// @param count
/// @param [character]
function string_real_character()
{
	/********************************************************************************************************************
	Returns argument[0] as a string with specified character by argument[2] if it has fewer than argument[1] characters.
	(only one character supported, and real numbers are converted to string)

	If argument[2] isn't supplied returns to space character by default.

	Examples: 
	- string_real_character(150, 6) > returns "   150"
	- string_real_character(mins, 2, "a") + ":" + string_real_character(secs, 2, "a") > returns "21:a2"
	*********************************************************************************************************************/

	var new_string = "";
	var character = " ";
	if (argument_count > 2) { character = string_copy(string(argument[2]), 1, 1); }

	if (string_length(string(argument[0])) < argument[1]) { repeat(argument[1] - string_length(string(argument[0]))) { new_string += character; } }
	new_string += string(argument[0]);
	return new_string;
}