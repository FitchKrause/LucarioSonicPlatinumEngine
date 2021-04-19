/// @description  Handler

switch state
{
    case -1:
    {
        if (fade_alpha >= 1)
        {
            state = 0;
            music_play_single(bgmContinueScreen);
            break;
        }    
        fade_alpha += (1 / 24);
        break;
    }

    case 0:
    {
        title_offset -= 32;
        timer_offset -= 32;
        if not timer_offset and not title_offset { state = 1; }
        break;
    }

    case 1:
    {
        if continue_timer
        {
            continue_timer -= 1;
            if not continue_timer { state = 2; }
            if input_check_pressed(0, INPUT_A) or input_check_pressed(0, INPUT_START)
            {
                objData.continues = max(objData.continues - 1, 0);
                objData.player_score[0] = 0;
                objData.player_rings[0] = 0;
                objData.player_lives[0] = 3;

                objGame.temp_spawn_id = noone;
                objGame.temp_spawn_time = -1;
                objGame.temp_spawn_priority = -1;

                state = -9;
                transition_to(room, objTitleCard, 24);
            }
        }
        break;
    }
    
    case 2:
    {
        state = -9;
        transition_to(gameMenu, objFade, 24);
        break;
    }
}