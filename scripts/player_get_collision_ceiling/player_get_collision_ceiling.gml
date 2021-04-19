/// @description  player_get_collision_ceiling(offset)
/// @param offset
function player_get_collision_ceiling()
{
	/*
	Evaluates if any locals are colliding with the upper half of the calling player instance's bounding box.

	> offset: pixel height from the player's center point

	< return value: first matching instance id, or noone on failure.
	*/

	var total_locals = ds_list_size(local_list);
	for (var i = 0; i < argument[0]; i += 1)
	{
		for (var j = 0; j < total_locals; j += 1)
		{
			if collision_ray(offset_x, -i, mask_rotation, local_list[|j]) and not local_list[|j].top_only
			{
				return local_list[|j];
			}
		}
	}
	return noone;
}