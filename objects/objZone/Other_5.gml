/// @description  End zone
time_over = false;
audio_listener_position(0, 0, 0);

if finished
{
    objGame.spawn_id = objPlayerSpawn;
    objGame.spawn_time = 36000;
    
    objGame.temp_spawn_id = noone;
    objGame.temp_spawn_time = -1;
    
    for (i = 0; i < (array_length(objGame.player_id) - 1); i += 1)
    {
        objData.player_rings[i] = 0;
    }
}

