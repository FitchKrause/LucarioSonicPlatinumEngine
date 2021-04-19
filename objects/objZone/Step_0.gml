/// @description  Pausing

if no_pause { no_pause = false; exit; }
if not is_paused
{
    with objGame 
    { 
        if can_pause
        {
            if input_check_pressed(0, INPUT_START)
            {
                global.tempo = 0;
                paused = true;
                other.is_paused = paused;
                game_set_active(not paused);
                instance_create_depth(0, 0, -1030, objMenuPause);
            }
        }
    }
}

