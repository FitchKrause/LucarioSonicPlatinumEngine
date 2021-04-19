/// @description  player_reset()
function player_reset() {
	/*
	Evaluates the game status after a player instance dies.

	< return value: n/a
	*/

	// handle lives based on mode
	switch objGame.mode
	{
	    case GAMETYPE_SINGLEPLAYER: // single player
	    {
	        if not (objZone.levelflags & LEVELFLAG_SPECIALSTAGE)
	        {
	            // player 1 only
	            if (player_id == 0)
	            {
	                objZone.timer_enabled = false;
	                objZone.finished = false;
	                if not (objZone.levelflags & LEVELFLAG_INFINITELIVES) { objData.player_lives[player_id] -= 1; }
	                objData.player_rings[player_id] = 0;
                
	                if not objData.player_lives[player_id] // game over
	                {
	                    objGame.can_pause = false;
						objZone.time_over = false;
						instance_create_depth(0, 0, -1048, objGameOver);
	                }
	                else if objZone.time_over // time over
	                {
	                    objGame.can_pause = false;
	                    objGame.temp_spawn_id = noone;
	                    objGame.temp_spawn_time = -1;
	                    objGame.temp_spawn_priority = -1;
						instance_create_depth(0, 0, -1048, objGameOver);
	                }
	                else { objZone.reseting = 60; } // respawn
	            }
				player_actions(false, false);
	        }
			break;
	    }
	    case 2: // multiplayer
	    {
	        player_is_reset(-1);
	        break;
	    }
	}



}
