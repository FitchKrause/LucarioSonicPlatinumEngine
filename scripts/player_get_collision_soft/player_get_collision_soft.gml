/// @description  player_get_collision_soft()
function player_get_collision_soft()
{
	/*
	Evaluates collision with any soft colliders and executes their reaction scripts.

	< return value: boolean; whether to abort the calling player instance's current state or not.
	*/

	var total_locals = instance_number(objColliderSoft);
	var local_id = noone;
	var code = 0;
	var results = false;
	for (var i = 0; i < total_locals; i ++)
	{
	    local_id = instance_find(objColliderSoft, i);

	    // continue if ...
	    if not collision_box(offset_x, offset_y, mask_rotation, local_id) { continue; } // no collision or on different layers
	    if (local_id.reaction_script < 0) { continue; } // no reaction

	    // get collision code
	    if collision_ray(offset_wall, 0, mask_rotation, local_id) { code = sign(player_get_wall_offset(local_id)); } // wall
	    else if collision_box_vertical(offset_x, offset_y, mask_rotation, local_id) { code = DIRECTION_BOTTOM; } // floor
	    else if collision_box_vertical(offset_x, -offset_y, mask_rotation, local_id) { code = DIRECTION_TOP; } // ceiling
	    else { code = 0; }

	    // execute reaction
	    results |= player_react(local_id, code);
	}
	return results;



}
