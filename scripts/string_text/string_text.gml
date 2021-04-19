/// @description string_text()
/// @param ...
function string_text()
{
	var text = "";
	for (var n = 0; n < argument_count; n += 1)
	{
	    var current_argument = argument[n];
	    if is_array(current_argument) && (array_length(current_argument) == 1) { text += "[" + string_join(current_argument, ", ") + "]"; }
		else { text += string(current_argument); }
	}
	return text;
}