/// @description  engine_reset_data([states?])
/// @param [states?]

var states = true;
if (argument_count > 0) { states = argument[0]; }

with objData
{
	for (i = 0; i < (array_length(objGame.player_id) - 1); i += 1)
	{
		player_character_id[i] = 0;
		player_lives[i] = 3;
		player_score[i] = 0;
		player_rings[i] = 0;
		player_cpu[i] = false;
	}
	chaos_emerald = 0;
	continues = 0;
}

with objGame
{
	stage_id = -1;
	stage_index = -1;
	ds_list_clear(stage_list);
	ds_list_add(stage_list, zoneEmeraldHillAct1); // Emerald Hill Act 1
	ds_list_add(stage_list, zoneEmeraldHillAct2); // Emerald Hill Act 2 (Unfinished)
    
	temp_spawn_id = noone;
	temp_spawn_time = -1;
	temp_spawn_priority = -1;
}
if states { global.is_levelselect = false; }