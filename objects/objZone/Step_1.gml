/// @description  Timers
if objGame.paused or objGame.lost_focus exit;

// Zone timer
if timer_enabled and not (levelflags & LEVELFLAG_INFINITETIME)
{ 
    if timer { timer -= (1 * global.tempo); }
	if (timer == 690)
	{
		music_reset_pitch();
		music_play_single(bgmDrowning);
		objMusic.music_flags |= MUSFLAG_NOCHANGE;
	}
}

// Timeout
if not timer and not time_over
{
	objMusic.music_flags &= ~(MUSFLAG_NOCHANGE);
    objGame.spawn_time = 36000;
    time_over = true;
    if (objGame.mode == GAMETYPE_SINGLEPLAYER)
    {
        for (i = 0; i < (global.players - 1); i += 1)
        {
            if instance_exists(objGame.player_id[i])
            {
                if (objGame.player_id[i].state <> player_is_dead) { with objGame.player_id[i] { player_is_dead(-1); } }
            }
        }
    }
}

// zone reset
if reseting
{ 
    reseting -= 1;
    if not reseting
    {
        if not (levelflags & LEVELFLAG_NORELOAD) { transition_to(room, objTitleCard, 24, not objData.level_restart); }
        else
        {
            if (script_end <> noone) { script_execute(script_end); }
            else
            {
                var spawn_id = objGame.spawn_id;
				timer = 36000;
				if (objGame.temp_spawn_id > -1) and instance_exists(objGame.temp_spawn_id)
				{
				    timer = objGame.temp_spawn_time;
				    spawn_id = objGame.temp_spawn_id;
				}
                
                for (i = 0; i < (global.players - 1); i += 1)
                {
                    if instance_exists(objGame.player_id[i])
                    {
                        if (objGame.player_id[i].state == player_is_dead)
                        {
                            with objGame.player_id[i]
                            {
                                xspeed = 0;
                                yspeed = 0;
                                facing = 1;
                                
                                player_teleport(spawn_id.x, spawn_id.y + 1, false);
                                player_is_standing(-1);
                                player_reset_physics();
                                player_actions(true, true);
                                camera_set_values(-1, -1, -1, -1, true, -1);
                            }
                        }
                    }
                }
                
                global.tempo = 1;
                timer_enabled = true;
                music_play_loop(objZone.music, objZone.looppoint, objMusic.music_position[0], MUSPLAYFLAG_FADING|MUSPLAYFLAG_NOFORCE);
            }
        }
    }
} 