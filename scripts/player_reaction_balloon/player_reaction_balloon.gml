function player_reaction_balloon(argument0) {
	// player_reaction_balloon(local_id)

	// ignore if...
	if (path_index > -1) return false; // pathing
	if (not argument0.visible) return false; // invisible

	// speed
	yspeed = -6;

	// particles and effects
	part_particles_create(objGame.particles, argument0.x, argument0.y, objResources.part_balloon_explode, 1);

	// set state
	argument0.timer = 60;
	argument0.visible = false;

	// sound
	audio_play_stereo(sndBalloonPop, argument0.x, argument0.y, false, 0);
	return true;



}
