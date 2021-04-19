/// @description  player_set_wall(local_id, offset)
/// @param local_id
/// @param  offset
function player_set_wall()
{
	/*
	Assigns the given local as a wall the calling player instance is colliding with.

	> local_id: instance id to assign
	> offset: amount in pixels to move the player horizontally (to get out of collision)

	< return value: n/a
	*/
	
	wall_id = argument[0];
	x -= cosine[mask_rotation] * argument[1];
	y += sine[mask_rotation] * argument[1];
	wall_facing = sign(argument[1]);
}