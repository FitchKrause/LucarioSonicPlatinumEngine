/// @description  player_chain_multiplier(player_id, x, y)
/// @param player_id
/// @param  x
/// @param  y
function player_chain_multiplier()
{
	var popup = instance_create_depth(argument[1], argument[2], -1, objScorePopup)
	var bonus_score = 10; // 10 points
	if (chain_multiplier > 100) { popup.image_index = 15; bonus_score = 1000000; } // 1.000.000 points
	else if (chain_multiplier > 84) { popup.image_index = 14; bonus_score = 500000; } // 500.000 points
	else if (chain_multiplier > 70) { popup.image_index = 13; bonus_score = 200000; } // 200.000 points
	else if (chain_multiplier > 58) { popup.image_index = 12; bonus_score = 100000; } // 100.000 points
	else if (chain_multiplier > 46) { popup.image_index = 11; bonus_score = 50000; } // 50.000 points
	else if (chain_multiplier > 36) { popup.image_index = 10; bonus_score = 20000; } // 20.000 points
	else if (chain_multiplier > 28) { popup.image_index = 9; bonus_score = 10000; } // 10.000 points
	else if (chain_multiplier > 20) { popup.image_index = 8; bonus_score = 5000; } // 5.000 points
	else if (chain_multiplier > 16) { popup.image_index = 7; bonus_score = 2000; } // 2.000 points
	else if (chain_multiplier > 12) { popup.image_index = 6; bonus_score = 1000; } // 1.000 points
	else if (chain_multiplier > 9) { popup.image_index = 5; bonus_score = 500; } // 500 points
	else if (chain_multiplier > 6) { popup.image_index = 4; bonus_score = 200; } // 200 points
	else if (chain_multiplier > 3) { popup.image_index = 3; bonus_score = 100; } // 100 points
	else if (chain_multiplier > 2) { popup.image_index = 2; bonus_score = 50; } // 50 points
	else if (chain_multiplier > 1) { popup.image_index = 1; bonus_score = 20; } // 20 points
	chain_multiplier += 1;
	player_get_score(bonus_score, argument[0]);
}