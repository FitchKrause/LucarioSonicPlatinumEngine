function player_reaction_ring(argument0) {
	// player_reaction_ring(local_id)

	// abort if ...
	if (state == player_is_dead) return false; // we're dead
	if ignore_rings return false; // ignoring
	if objData.player_cpu[player_id] return false; // if CPU

	// play chime
	audio_stop_sound(sndRing);
	audio_play_stereo(sndRing, argument0.x, argument0.y, false, 0);

	// collect ring
	player_get_rings(1);

	// particles and effects
	part_particles_create(objGame.particles, argument0.x, argument0.y, objResources.part_sparkle, 1);

	// destroy ring
	instance_destroy(argument0);
	return false;



}
