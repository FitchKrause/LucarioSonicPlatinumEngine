/// @description  player_get_lives(lives, [player_id])
/// @param lives
/// @param  [player_id]
function player_get_lives() {
	/*
	Increases the calling player instance's life total. (Maximum of 999)

	> lives: amount of lives to increase

	< return value: n/a
	*/

	var player = 0;
	if (argument_count > 1) { player = argument[1]; } else { player = player_id; }

	music_play_overlay(bgmExtraLife);
	objData.player_lives[player] = min((objData.player_lives[player] + argument0), MAX_LIVES);



}
