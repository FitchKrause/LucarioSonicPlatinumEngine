/// @description  player_reaction_water(local_id, code)
/// @param local_id
/// @param  code
function player_reaction_water(argument0) {

	// ignore if ...
	if (path_index > -1) return false; // pathing
	if (not collision_point(floor(x), floor(y), argument0, false, true)) { return false; } // not actually inside

	// ignore if already underwater
	if (underwater) { return false; }

	// animate player
	if (state == player_is_flying) { if (timer) { animation_new = "swim"; } else { animation_new = "swim_end"; } }

	// set timer
	underwater = true;
	air_count = 1800;

	// cut fall speed
	yspeed *= 0.25;

	// modify stats
	player_reset_physics();

	// particles and effects
	if (yprevious < argument0.bbox_top) { part_particles_create(objGame.particles, x, argument0.bbox_top, objResources.part_splash, 1); }

	// sound
	audio_play_stereo(sndSplash, floor(x), floor(y), false, 0);

	// abort state if in the air
	return (not floor_tag);



}
