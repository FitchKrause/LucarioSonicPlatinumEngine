/// @description  Menu logic

if objZone.is_paused
{
    if input_check_pressed(0, INPUT_UP)
    {
        if (current == 0) { current = 2; } else { current -= 1; }
        if (current == 1) and not ((objGame.player_id[0].state <> player_is_dead) and (objData.player_lives[0] > 1)) { current -= 1; }
		audio_play_normal(sndBeep, false, 0, objData.volume_sfx);
    }
    
    if input_check_pressed(0, INPUT_DOWN)
    {    
        if (current == 2) { current = 0; } else { current += 1; }
        if (current == 1) and not ((objGame.player_id[0].state <> player_is_dead) and (objData.player_lives[0] > 1)) { current += 1; }
		audio_play_normal(sndBeep, false, 0, objData.volume_sfx);
    }

    if input_check_pressed(0, INPUT_B)
	{
		game_set_active(true);
		objGame.paused = false;
		objZone.is_paused = false;
		if (objGame.player_id[0].state <> player_is_dead) { global.tempo = global.tempo_base; }
		instance_destroy();
	}
    
    if input_check_pressed(0, INPUT_A) or input_check_pressed(0, INPUT_START)
    {
		switch current
		{
			case 0:
			case 1:
			{
				if (current == 0) or (objGame.player_id[0].state <> player_is_dead) and (objData.player_lives[0] > 1)
				{
					game_set_active(true);
			        objGame.paused = false;
			        objZone.is_paused = false;
					if (current == 1) { with objGame.player_id[0] { player_is_dead(-1); } }
			        if (objGame.player_id[0].state <> player_is_dead) { global.tempo = global.tempo_base; }
			        instance_destroy();
				}
				break;
			}
			
			case 2:
			{
				global.tempo = 0;
				audio_stop_all();
	            game_set_active(true);
	            objGame.paused = false;
	            objZone.is_paused = false;            
	            with objTitleCard { instance_destroy(); }
	            with objHud { instance_destroy(); }
            
	            engine_reset_data();
	            transition_to(gameMenu, objFade, 24);
				instance_destroy();
				break;
			}
		}
    }
}