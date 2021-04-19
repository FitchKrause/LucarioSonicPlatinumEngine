/// @description  Animation state

if (((priority < 0) and (objGame.temp_spawn_id <> id)) or ((priority > -1) and (objGame.temp_spawn_priority < priority))) and animation_running
{
    image_index = 0;
    animation_tick = 0;
    animation_running = false;
}
else if (((priority < 0) and (objGame.temp_spawn_id == id)) or ((priority > -1) and (objGame.temp_spawn_priority >= priority))) and not animation_running
{
    animation_running = true;
    animation_tick = 31;
    image_index = 15;
}