function player_reaction_gravity_set(argument0) {
	// player_reaction_gravity_set(local_id)

	if (gravity_direction == (90 + (180 * not argument0.gravity_reverse))) return false;

	// Apply
	gravity_direction = 90 + (180 * not argument0.gravity_reverse);
	reverse_control = argument0.gravity_reverse;
	return false;



}
