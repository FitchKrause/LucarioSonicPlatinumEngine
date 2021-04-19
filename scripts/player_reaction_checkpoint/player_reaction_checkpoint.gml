function player_reaction_checkpoint(argument0) {
	// player_reaction_checkpoint(local_id)

	// ignore if ...
	if (path_index > -1) return false;
	if (argument0 == objGame.temp_spawn_id) return false; // already activated
	if (argument0.priority > -1) and (objGame.temp_spawn_priority >= argument0.priority) return false; // lower priority

	// setup checkpoint
	argument0.animation_running = true;
	objGame.temp_spawn_id = argument0;
	objGame.temp_spawn_time = objZone.timer;
	objGame.temp_spawn_priority = argument0.priority;

	// sound
	audio_stop_sound(sndCheckpoint);
	audio_play_stereo(sndCheckpoint, argument0.x, argument0.y, false, 0);
	return false;



}
