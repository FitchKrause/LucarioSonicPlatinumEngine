function player_reaction_path() {
	// player_reaction_path(local_id)
	/*
	// abort if already on path
	if (path_index > -1) return false;

	// set path
	path_start(argument0.path, argument0.path_force, argument0.path_finish, argument0.path_absolute);

	// animate
	animation_new = "spin";
	animation_speed = 0.2;
	image_angle = 0;

	// update player
	state = player_is_pathing;
	rolling_jump = false;
	xspeed = 0;
	yspeed = 0;
	if (character_id == CHARACTER_KNUCKLES) { glide_falling = false; }

	// sound
	audio_play_emitter(audio_emitter, sndSpinAttack, false, 0);
	return true;


/* end player_reaction_path */
}
