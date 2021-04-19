/// @description  player_get_collision_floor(offset, angle)
/// @param offset
/// @param  angle
function player_get_collision_floor()
{
	/*
	Evaluates if any locals are colliding with the lower half of the calling player instance's bounding box.

	> offset: pixel height from the player's center point
	> angle: rotation of the player's bounding box

	< return value: first matching instance id, or noone on failure.
	*/
	
	/*var total_locals = instance_nearest_list(x, y, objColliderHard); //ds_list_size(local_list);
	for (var i = 0; i < argument[0]; i += 1)
	{
		for (var j = 0; j < ds_list_size(total_locals); j += 1)
		{
			var local_id = collision_ray(offset_x, i, argument[1], total_locals[|j]);
			if local_id
			{
				if not (zlayer & local_id.zlayer) { continue; } // zlayer mismatch; pass for current terrain
				if local_id.top_only and collision_ray(offset_wall, 0, mask_rotation, local_id) { continue; } // passing through
				if not local_id.can_collide { continue; } // colliding isn't enabled
				return total_locals[|j];
			}
		}
	}*/
	
	var total_locals = ds_list_size(local_list);
	for (var i = 0; i < argument[0]; i += 1)
	{
		for (var j = 0; j < total_locals; j += 1)
		{
			if collision_ray(offset_x, i, argument[1], local_list[|j])
			{
				return local_list[|j];
			}
		}
	}
	return noone;
}