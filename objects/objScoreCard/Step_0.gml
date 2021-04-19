/// @description  Handle state

image_index = objScreen.image_index div 8;
switch state
{
    case 0: // Introduction
    {    
        if (objZone.levelstyle == STYLETYPE_SONIC1)
        {
            state = 1;
            state_timer = 0;
        }
        else { if not state_timer { state = 1; } }
        break;
    }
    
    case 1: // Move offsets (message)
    {
        if (objZone.levelstyle == STYLETYPE_SONIC1)
        {
            if (oval_offset > 0) { oval_offset -= 32; }
            if (title_offset1 > 0) and (oval_offset <= 0) { title_offset1 -= 32; }
            if (title_offset2 > 0) and (title_offset1 <= 0) { title_offset2 -= 32; }
            if (act_offset > 0) and (title_offset2 <= 0) { act_offset -= 32; }
            
            if (act_offset <= 0)
            {
                state = 2;
                state_timer = 176;
            }
        }
        else
        {
            if title_offset1 { title_offset1 -= 32; }
            if title_offset2 { title_offset2 -= 32; }
            if not title_offset1 and not title_offset2 and not state_timer
            {
                state = 2;
                state_timer = 176;
            }
        }
        break;
    }

    case 2: // Move offsets (scores)
    {
        if score_offset1 { score_offset1 -= 32; }
        if score_offset2 { score_offset2 -= 32; }
        if score_offset3 { score_offset3 -= 32; }
        if score_offset4 { score_offset4 -= 32; }
        if score_offset5 { score_offset5 -= 32; }
        if continues_offset { continues_offset -= 32; }
        if not state_timer { state = 3; }
        break;
    }

    case 3: // Scores
    {
        if not (objZone.levelflags & LEVELFLAG_NOBONUES)
        {
            if input_check_pressed(0, INPUT_ACTION) { count_speed = 9999999; }
            
            if time_bonus
            {
                change = min(time_bonus, count_speed);
                time_bonus -= change;
                total_bonus += change;
                player_get_score(change, player_id);
            }
        
            if rings_bonus
            {
                change = min(rings_bonus, count_speed);
                rings_bonus -= change;
                total_bonus += change;
                player_get_score(change, player_id);
            }
            
            if perfect_bonus
            {
                change = min(perfect_bonus, count_speed);
                perfect_bonus -= change;
                total_bonus += change;
                player_get_score(change, player_id);
            }
        }
       
        if not (time_bonus or rings_bonus or perfect_bonus) or (objZone.levelflags & LEVELFLAG_NOBONUES)
        {
            if not (objZone.levelflags & LEVELFLAG_NOBONUES)
            {
                audio_stop_sound(sndBeep);
                audio_play_normal(sndChing, false, 0);
            }
			
            state = 4;
            state_timer = 90;
        }
        else if ((objScreen.image_index mod 4) == 0)
        {
            audio_stop_sound(sndBeep);
            audio_play_normal(sndBeep, false, 0);
        }
        break;
    }
    
    case 4: // Token
    {
        if not state_timer
        {
            if (total_bonus >= 10000) and not continue_token
            {
                continue_token = true;
                objData.continues = min(objData.continues + 1, 999);
                audio_play_normal(sndContinueToken, false, 0);
            }
			
			state = 5;
            state_timer = 300;
        }
        break;
    }
    
    case 5: // Transition
    {
        if not state_timer
        {        
            state = 6;
            if not global.is_demomode and not global.is_levelselect
            {
                if (objZone.script_end == noone)
                {
                    engine_reset_spawn();
                    stage_goto_next(objTitleCard, not objData.level_restart); 
                } 
                else { script_execute(script_end); }
            }
            else
            {
                engine_reset_data();
                transition_to(gameMenu, objFade, 24);
            }
			music_reset_pitch();
			objMusic.music_flags &= ~(MUSFLAG_NOCHANGE);
        }
        break;
    }
}