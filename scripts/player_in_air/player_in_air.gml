/// @description  player_in_air()
function player_in_air()
{
	/*
	Sets the calling player instance into an aerial state.

	< return value: n/a
	*/

	angle = gravity_angle();
	relative_angle = 0;
	mask_rotation = angle;
	floor_id = noone;
	floor_tag = 0;
	cliff_facing = 0;
	camera.vertical_lock = false;
}