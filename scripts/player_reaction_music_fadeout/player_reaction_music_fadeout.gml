/// @description  player_reaction_music_fadeout(time)
/// @param time
function player_reaction_music_fadeout(argument0) {

	// fade music
	music_set_volume_all(1, argument0.time * 1000 / 60);

	return false;



}
