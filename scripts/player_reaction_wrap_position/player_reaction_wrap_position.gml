/// @description  player_reaction_wrap_position(local_id, code)
/// @param local_id
/// @param code
function player_reaction_wrap_position(local_id, code)
{
	if (state == player_is_dead) { return false; }
	if (local_id.min_x > -1) and (local_id.max_x > -1)
	{
		if (code == DIRECTION_LEFT) and not (local_id.min_x > local_id.max_x) { player_teleport(floor(local_id.max_x), floor(y), local_id.move_camera); }
		if (code == DIRECTION_RIGHT) and not (local_id.max_x < local_id.min_x) { player_teleport(floor(local_id.min_x), floor(y), local_id.move_camera); }
	}
	
	if (local_id.min_y > -1) and (local_id.max_y > -1)
	{
		if (code == DIRECTION_TOP) and not (local_id.min_y > local_id.max_y) { player_teleport(floor(x), floor(local_id.max_x), local_id.move_camera); }
		if (code == DIRECTION_BOTTOM) and not (local_id.max_y < local_id.min_y) { player_teleport(floor(x), floor(local_id.min_y), local_id.move_camera); }
	}
	return false;
}