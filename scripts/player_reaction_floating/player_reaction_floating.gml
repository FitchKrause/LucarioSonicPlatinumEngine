function player_reaction_floating(argument0) {
	// player_reaction_floating(local_id)

	// abort if already floating
	if (state == player_is_floating) return false;

	// change
	player_is_floating(-1, argument0.facing);
	return true;



}
