/// @description  multi_chance(value1, chance1, value2, chance2, ..., [default_value])
/// @param value1
/// @param  chance1
/// @param  value2
/// @param  chance2
/// @param  ...
/// @param  [default_value]
function multi_chance() {
	/*
	 * a different chance of returning each value
	 * Example use:
	 * value = set_chance(a, 10, b, 20, c, 40, d);
	 * // ^ has a certain chance of returning a, b or c, and if not it returns d
	 * (the final argument, default value, is optional)
	 */

	//get the number of arguments
	var count = argument_count; 

	// Loop through the arguments, adding values and chances to an array,
	// add to the number of values, remove 2 from the total argument count (2 arguments per value)
	var value, chance;
	var i = 0;
	while (count > 1)
	{
	    value[i] = argument[i * 2];
	    chance[i] = argument[i * 2 + 1];
	    i += 1;
	    count -= 2;
	}

	// Find out if there's a default value, if there's 1 argument left, that is the default value
	var default_value = 0;
	if (count == 1) { default_value = argument[i * 2]; }

	// Get a random value
	// Default the final value to the default value (which is 0 if there's no default value)
	var final_value = default_value;
	var rand = irandom(100);
	var current = 0;

	// Loop through the values, checking if the random value satisfies that value
	// Return the final value
	var total = i;
	for (var i = 0; i < total; i += 1)
	{
	    current += chance[i];
	    if (rand < current) { final_value = value[i]; break; }
	}
	return final_value;


}
