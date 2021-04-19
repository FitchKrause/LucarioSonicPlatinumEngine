/// @description  player_drop_rings(rings, x, y)
/// @param rings
/// @param  x
/// @param  y
function player_drop_rings()
{
	/*
	Spawns a circle(s) of dropped rings at the given coordinates

	> rings: number of dropped rings to create
	> x, y: center position from which the circle(s) is formed

	< return value: n/a
	*/

	if not argument[0] { return false; } // abort if no rings

	var offset = 0;
	for (var rings = min(argument[0], 32); rings > 0; rings -= 1) // loop until no rings remain
	{
	    // increase direction
	    if (rings mod 2) { offset += 22.5; }
	    if (offset > 180) { offset -= 180; }
	    with instance_create_depth(argument[1], argument[2], 0, objRing) // create dropped ring
	    {
	        deletion_method = 2;
	        timer = 256;
	        state = 2;
	        animation_speed = 0.5;

	        gravity = 0.09375;
	        speed = 4 - (2 * (rings > 16));
	        direction = gravity_direction + 180;
	        if (rings mod 2) { direction -= offset; } else { direction += offset; }
	    }
	}
}