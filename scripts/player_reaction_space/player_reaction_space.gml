/// @description  player_reaction_water(local_id, code)
/// @param local_id
/// @param  code
function player_reaction_space(argument0) {

	// ignore if ...
	if (path_index > -1) return false; // pathing
	if (not collision_point(floor(x), floor(y), argument0, false, true)) { return false; } // not actually inside

	// ignore if already outspace
	if (outspace) { return false; }

	// set timer
	outspace = true;
	air_count = 721;

	// modify stats
	player_reset_physics();

	// abort state if in the air
	return (not floor_tag);



}
