/// @description  player_reaction_music_set(local_id)
/// @param local_id
function player_reaction_music_set(argument0) {

	objZone.music = argument0.music;
	objZone.looppoint = argument0.looppoint;
	music_play_loop(objZone.music, objZone.looppoint, argument0.position, argument0.flags);

	return false;



}
