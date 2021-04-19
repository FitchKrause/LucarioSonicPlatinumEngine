/// @description  player_set_local_list()
function player_set_local_list()
{
	/*
	Generates a list of valid local ids to evaluate in every other player script.

	< return value: boolean; whether the list has at least one local or not.
	*/
	
	ds_list_clear(local_list);
	var total_locals = instance_number(objColliderHard);
	var local_id = noone;
	for (var i = 0; i < total_locals; i += 1)
	{
	    local_id = instance_find(objColliderHard, i);
	    if (local_id <> floor_id) and not (zlayer & local_id.zlayer) { continue; } // zlayer mismatch; pass for current terrain
		if not collision_box(offset_wall * 2, offset_y * 2, mask_rotation, local_id) { continue; } // not within realm of possible collisions
	    if local_id.top_only and collision_ray(offset_wall, 0, mask_rotation, local_id) { continue; } // passing through
	    if not local_id.can_collide { continue; } // colliding isn't enabled
	    ds_list_add(local_list, local_id);
	}
	return not ds_list_empty(local_list);
}