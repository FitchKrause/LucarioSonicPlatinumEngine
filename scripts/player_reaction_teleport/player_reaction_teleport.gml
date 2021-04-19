/// @description  player_reaction_teleport(local_id)
/// @param local_id
function player_reaction_teleport(argument0) {

	// abort if ...
	if (state == player_is_dead) return false; // we're dead
	if objData.player_cpu[player_id] return false; // if CPU

	// move player
	player_teleport(argument0.to_x, argument0.to_y, argument0.move_cam);
	return false;



}
