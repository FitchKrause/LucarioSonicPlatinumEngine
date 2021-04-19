/// @description  player_teleport(x, y, [move_camera])
/// @param x
/// @param  y
/// @param  [move_camera]
function player_teleport()
{
	/*
	Move the player and camera to x/y coodinates

	> xpos: Move player in X
	  ypos: Move player in Y
	  [move_camera]: Move camera

	< return value: n/a
	*/
	
	x = argument[0];
	y = argument[1] + 1;

	// Move camera
	var move_camera = false;
	if (argument_count > 2) { move_camera = argument[2]; }
	if move_camera { camera_set_position(xpos, ypos, true); }
}