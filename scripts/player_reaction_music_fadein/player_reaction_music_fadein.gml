/// @description  player_reaction_music_fadein(time)
/// @param time
function player_reaction_music_fadein(argument0) {

	// fade music
	music_set_volume_all(0, argument0.time * 1000 / 60);

	return false;



}
