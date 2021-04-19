/// @description  Get transition mode
switch mode
{
    case 1: // fade out
    {
        if (fade_alpha >= 1) 
        { 
           if (next_room > -1)  
           {
                room_goto(next_room);
                state_timer = 2;
                mode = 0;
                break;
           }
        }
        fade_alpha += image_speed;
        break;
    }
    
    case -1: // fade in
    {
        if (fade_alpha <= 0)
        {
            objZone.timer_enabled = true;
            objZone.started = true;
            objGame.can_pause = true;
            instance_destroy();
            break;
        }
        fade_alpha -= image_speed;
        break;
    }
    
    case 0: // no titlecard flags
    {
        if state_timer
        {
            if (objZone.levelflags & LEVELFLAG_SKIPTITLECARD) or (objZone.levelflags & LEVELFLAG_SPECIALSTAGE)
            {
                mode = -1;
            }
        }
        else { mode = 2; }
		break;
    }
}

// TitleCard sequence
if not (mode == 2) { exit; }
switch style
{
    case STYLETYPE_ENGINE: // Engine
    {
        switch style_mode
        {
            case 0: // Enter triangles and lines
            {
                if engine_lines_offset { engine_lines_offset -= 32; }
                if engine_triangles_offset { engine_triangles_offset -= 32; }
                if not engine_lines_offset and not engine_triangles_offset { style_mode = 1; }
                break;
            }
            
            case 1:
            {
                if engine_borders_offset { engine_borders_offset -= 8; }
                if engine_title_offset { engine_title_offset -= 24; }
                if engine_act_offset { engine_act_offset -= 32; }
                if not engine_borders_offset and not engine_title_offset and not engine_act_offset { style_mode = 2; state_timer = 70; }
                break;
            }
            
            case 2:
            {
                if not state_timer
                {
                    if (fade_alpha > 0) { fade_alpha = 0; }
                    if (engine_lines_offset < (objScreen.gui_width + 16)) { engine_lines_offset += 64; }
                    if (engine_triangles_offset < (objScreen.gui_width + 16)) { engine_triangles_offset += 64; }
                    if (engine_borders_offset < 256) { engine_borders_offset += 64; }
                    if not (engine_lines_offset < (objScreen.gui_width + 16))
                    {
                        objZone.timer_enabled = true;
                        objZone.started = true;
                        objGame.can_pause = true;
                        style_mode = 3;
                        state_timer = 45;
                    }
                }
                break;
            }
            
            case 3:
            {
                if not state_timer
                {
                    if (engine_title_offset < engine_title_ox) { engine_title_offset += 48; }
                    if (engine_act_offset < (engine_act_ox + 32 + 16)) { engine_act_offset += 64; }
                    if not (engine_act_offset < (engine_act_ox + 32 + 16)) { instance_destroy(); }
                }
                break;
            }
        }
        break;
    }

    case STYLETYPE_SONIC1: // Sonic 1
    {
        switch style_mode
        {
            case 0: // enter oval and texts
            {
                if (sonic1_oval_offset > 0) { sonic1_oval_offset -= 26; }
                if (sonic1_title_offset > 0) and (sonic1_oval_offset <= 0) { sonic1_title_offset -= 26; }
                if (sonic1_title_offset2 > 0) and (sonic1_title_offset <= 0) { sonic1_title_offset2 -= 26; }
                if (sonic1_act_offset > 0) and (sonic1_title_offset2 <= 0) { sonic1_act_offset -= 26; }
                
                if (sonic1_act_offset <= 0)
                {
                   style_mode = 1;
                   state_timer = 70;
                }
                break;
            }
            
            case 1:
            {
                if not state_timer
                {
                    if (fade_alpha <= 0)
                    {
                        objZone.timer_enabled = true;
                        objZone.started = true;
                        objGame.can_pause = true;
                        style_mode = 2;
                        state_timer = 45;
                        break;
                    }
                    fade_alpha -= image_speed;
                }
                break;
            }
            
            case 2:
            {
                if not state_timer
                {
                    sonic1_oval_offset += 48;
                    sonic1_title_offset += 48;
                    sonic1_title_offset2 += 48;
                    sonic1_act_offset += 48; 
                    if (sonic1_title_offset >= (objScreen.gui_width * 1.5)) { instance_destroy(); }
                }
                break;
            }
        }
        break;
    }
    
    default: // Sonic 2
    {
        switch style_mode
        {
            case 0: // enter blue backdrop
            {
                if (sonic2_backdrop_offset < objScreen.gui_height) { sonic2_backdrop_offset += 32; }
                if (sonic2_backdrop_offset >= objScreen.gui_height) { style_mode = 1; }
                break;
            }
            
            case 1: // enter borders
            {
                if (sonic2_border_offset1 > 0)
                {
                    sonic2_border_offset1 -= 48;
                    sonic2_border_offset2 += 48;
                } 
                if (sonic2_border_offset1 == 0) { style_mode = 2; }
                break;
            }
            
            case 2: // enter name tag
            {
                if (sonic2_title_offset > 0) { sonic2_title_offset -= 32; }
                else
                {
                    style_mode = 3;
                    state_timer = 70;
                }
                break;
            }
            
            case 3: // exit red border
            {
                if not state_timer
                {
                    sonic2_border_offset2 -= 64;
                    if (sonic2_border_offset2 <= -200) { style_mode = 4; }
                }
                break;
            }
            
            case 4: // exit yellow border
            {
                sonic2_border_offset1 += 64;
                if (sonic2_border_offset1 >= objScreen.gui_width)
                {
                    fade_alpha = 0;
                    style_mode = 5;
                }
                break;
            }
                
            case 5: // exit blue backdrop
            {
                sonic2_backdrop_offset -= 64;
                if (sonic2_backdrop_offset <= 0)
                {
                    objZone.timer_enabled = true;
                    objZone.started = true;
                    objGame.can_pause = true;
                    style_mode = 6;
                    state_timer = 45;
                }
                break;
            }
            
            case 6: // exit name tag
            {
                if not state_timer
                {
                    sonic2_title_offset += 64; 
                    if (sonic2_title_offset >= objScreen.gui_width) { instance_destroy(); }
                }
                break;
            }
        }
        break;
    }
}