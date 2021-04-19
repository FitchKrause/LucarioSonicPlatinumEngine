function player_reaction_floating_end() {
	// player_reaction_floating_end(local_id)

	// abort if already floating
	if (state <> player_is_floating) return false;

	// change
	player_is_falling(-1);
	return true;



}
