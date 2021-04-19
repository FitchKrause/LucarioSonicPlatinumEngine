/// @description log(message, ...)
/// @param message
/// @param  ...
function log()
{
	//params: value...
	//results: shorthand for `show_debug_message`

	if not argument_count { show_debug_message(""); exit; }

	var array = 0;
	for (var i = 0; i < argument_count; i += 1) { array[i] = argument[i]; }
	show_debug_message(string_join(array));
}