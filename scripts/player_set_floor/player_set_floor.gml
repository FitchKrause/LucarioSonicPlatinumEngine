/// @description  player_set_floor(local_id, in_air?)
/// @param local_id
/// @param  in_air?
function player_set_floor()
{
	/*
	Assigns the given local as the calling player instance's current terrain.

	> local_id: instance id to assign.
	> in_air?: boolean; whether the player is in an aerial state or not.

	< return value: n/a
	*/
	
	// calculate angle
	var new_angle = mask_rotation;
	floor_id = argument[0];
	if (floor_id.surface_angle & ANGLEFLAG_COLLISION)
	{
		new_angle = player_get_surface_angle(floor_id.sticky ? (offset_y * 3) : (offset_y * 2), angle);
	}
	if (new_angle < 0)
	{
		if argument[1] { new_angle = player_get_surface_angle_air(mask_rotation); } else { new_angle = angle; }
	}

	// apply new angle
	angle = new_angle;
	relative_angle = angle_wrap(new_angle - gravity_angle());
}