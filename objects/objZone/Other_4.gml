/// @description Start zone

var spawn_id = objGame.spawn_id;
if (objGame.temp_spawn_id > -1) and instance_exists(objGame.temp_spawn_id)
{
    timer = objGame.temp_spawn_time;
    spawn_id = objGame.temp_spawn_id;
}

if (script_start <> noone) { script_execute(script_start); }
else
{
    instance_create_depth(0, 0, -1024, objHud)
    for (i = 0; i < (array_length(objGame.player_id) - 1); i += 1)
	{
		if objData.player_character_id[i]
		{
			objGame.player_id[i] = instance_create_depth(spawn_id.x - (i * 8), spawn_id.y, 0, objPlayer);
		}
	}
	
    if (music <> noone)
    {
		music_play_loop(music, looppoint, 0, objData.level_restart ? MUSPLAYFLAG_NOFORCE : 0);
		music_set_volume_all(objData.volume_music);
        music_set_pitch(pitch);
    }
    else { music_stop_all(); }
}