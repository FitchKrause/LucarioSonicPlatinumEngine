/// @description  player_get_score(score, [player_id])
/// @param score
/// @param  [player_id]
function player_get_score()
{
	/*
	Increase's the calling player instance's score total. (Will also add lives for every 50000 points)

	> score: amount of points to add

	< return value: n/a
	*/

	var player = player_id;
	if (argument_count > 1) { player = argument[1]; }
	if (objData.player_score[player] + (argument[0] < MAX_SCORE)) // give lives
	{
	    var change = (objData.player_score[player] mod CHANGE_SCORE) + argument[0];
	    if (change >= CHANGE_SCORE) { player_get_lives(change div CHANGE_SCORE); }
	}
	objData.player_score[player] = min((objData.player_score[player] + argument[0]), MAX_SCORE); // give points
}