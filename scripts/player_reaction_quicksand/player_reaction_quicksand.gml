function player_reaction_quicksand(argument0) {
	// player_reaction_quicksand(local_id)

	// abort if ...
	if (path_index > -1) return false;
	if (floor_tag & 3) or yspeed < 0 return false; // ground or moving upward

	// confirm and fall
	floor_tag |= 4;
	x += sine[relative_angle] * argument0.force;
	y += cosine[relative_angle] * argument0.force;
	return false;



}
