/// @description  player_reaction_collapsing_platform(local_id)
/// @param local_id
function player_reaction_collapsing_platform(argument0, argument1)
{

	// abort if ...
	if (argument1 <> DIRECTION_BOTTOM) or (mask_rotation <> 0) return false; // not flat on top
	if (argument0.timer > 0) return false; // already triggered

	// trigger platform
	argument0.timer = 64;
	argument0.deletion_method = 2;
	return false;
}