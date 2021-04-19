/// @description  player_get_collision_wall(offset)
/// @param offset
function player_get_collision_wall()
{
	/*
	Evaluates if any locals are colliding with the wall sensor of the calling player instance's bounding box.

	> offset: pixel width from the player's center point

	< return value: first matching instance id, or noone on failure.
	*/
	
	var total_locals = ds_list_size(local_list);
	for (var i = 0; i < total_locals; i += 1)
	{
		if collision_ray(offset_wall + argument[0], 0, mask_rotation, local_list[|i])
		{
			return local_list[|i];
		}
	}
	return noone;
}