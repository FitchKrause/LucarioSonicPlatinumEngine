/// @description  player_get_rings(rings, [player_id])
/// @param rings
/// @param  [player_id]
function player_get_rings() {
	/*
	Increase's the calling player instance's ring total. (Will also add lives for every 100 rings)

	> rings: amount of rings to add

	< return value: n/a
	*/

	var player = 0;
	if (argument_count > 1) { player = argument[1]; } else { player = player_id; }

	// give lives
	if (objData.player_rings[player] + argument[0] < MAX_RINGS)
	{
	    var change = (objData.player_rings[player] mod CHANGE_RINGS) + argument[0];
	    if (change >= CHANGE_RINGS) { player_get_lives(change div CHANGE_RINGS); }
	}

	// give rings
	objData.player_rings[player] = min(objData.player_rings[player] + argument[0], MAX_RINGS);



}
